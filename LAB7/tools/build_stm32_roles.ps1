param(
    [string]$Workspace = 'C:\Users\yunji\ece2\stm32_lab'
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$repoRoot = (Resolve-Path (Join-Path $PSScriptRoot '..\..')).Path
$workspaceRoot = (Resolve-Path -LiteralPath $Workspace).Path
$sourceTarget = Join-Path $workspaceRoot 'Core\Src\ece2_474_routine.c'
$buildDir = Join-Path $workspaceRoot 'build\Debug'
$elfSource = Join-Path $buildDir 'ece2_474.elf'
$ninja = 'C:\Users\yunji\AppData\Local\stm32cube\bundles\ninja\1.13.2+st.1\bin\ninja.exe'
$toolBin = 'C:\Users\yunji\AppData\Local\stm32cube\bundles\gnu-tools-for-stm32\14.3.1+st.2\bin'
$gcc = Join-Path $toolBin 'arm-none-eabi-gcc.exe'
$objcopy = Join-Path $toolBin 'arm-none-eabi-objcopy.exe'

foreach ($required in @($sourceTarget, $buildDir, $ninja, $gcc, $objcopy)) {
    if (-not (Test-Path -LiteralPath $required)) {
        throw "Required STM32 build input is missing: $required"
    }
}

$backupDir = Join-Path $repoRoot 'LAB7\STM32\_workspace_backup'
New-Item -ItemType Directory -Force -Path $backupDir | Out-Null
$backup = Join-Path $backupDir 'ece2_474_routine_before_LAB7.c'
if (-not (Test-Path -LiteralPath $backup)) {
    Copy-Item -LiteralPath $sourceTarget -Destination $backup
}
$originalHash = (Get-FileHash -Algorithm SHA256 -LiteralPath $sourceTarget).Hash
$backupHash = (Get-FileHash -Algorithm SHA256 -LiteralPath $backup).Hash
if ($originalHash -ne $backupHash) {
    throw 'Existing LAB7 workspace backup differs from the current source; refusing to overwrite it.'
}

$masterSource = Join-Path $repoRoot 'LAB7\STM32\common\ece2_474_spi_master_sequence.c'
$slaveSource = Join-Path $repoRoot 'LAB7\STM32\common\ece2_474_spi_slave_uart.c'
$roles = @(
    @{ Name = 'task8_master'; Source = $masterSource },
    @{ Name = 'task9_master'; Source = $masterSource },
    @{ Name = 'task9_slave'; Source = $slaveSource },
    @{ Name = 'task10_master'; Source = $masterSource },
    @{ Name = 'task11_slave'; Source = $slaveSource }
)

try {
    foreach ($role in $roles) {
        $roleName = $role.Name
        $roleSource = $role.Source
        if (-not (Test-Path -LiteralPath $roleSource)) {
            throw "Role source is missing: $roleSource"
        }

        $evidenceDir = Join-Path $repoRoot ("stm32_evidence\build\LAB7\" + $roleName)
        New-Item -ItemType Directory -Force -Path $evidenceDir | Out-Null
        Copy-Item -LiteralPath $roleSource -Destination $sourceTarget -Force
        # Copy-Item preserves the source timestamp; make the working copy newer
        # so Ninja recompiles even when switching between older snapshots.
        (Get-Item -LiteralPath $sourceTarget).LastWriteTime = Get-Date

        $buildLog = Join-Path $evidenceDir 'build.log'
        & $ninja -C $buildDir 2>&1 | Tee-Object -FilePath $buildLog
        if ($LASTEXITCODE -ne 0) {
            throw "STM32 build failed for $roleName (exit $LASTEXITCODE)"
        }
        if (-not (Test-Path -LiteralPath $elfSource)) {
            throw "Expected ELF was not produced for $roleName"
        }

        $elfDest = Join-Path $evidenceDir 'ece2_474.elf'
        $hexDest = Join-Path $evidenceDir 'ece2_474.hex'
        $binDest = Join-Path $evidenceDir 'ece2_474.bin'
        Copy-Item -LiteralPath $elfSource -Destination $elfDest -Force
        & $objcopy -O ihex $elfSource $hexDest
        if ($LASTEXITCODE -ne 0) { throw "HEX conversion failed for $roleName" }
        & $objcopy -O binary $elfSource $binDest
        if ($LASTEXITCODE -ne 0) { throw "BIN conversion failed for $roleName" }

        $metadata = [ordered]@{
            status = 'BUILD_SUCCEEDED'
            role = $roleName
            source = $roleSource.Substring($repoRoot.Length + 1).Replace('\', '/')
            source_sha256 = (Get-FileHash -Algorithm SHA256 -LiteralPath $roleSource).Hash.ToLowerInvariant()
            workspace = $workspaceRoot
            configuration = 'Debug'
            build_tool = (& $ninja --version | Select-Object -First 1)
            compiler = (& $gcc --version | Select-Object -First 1)
            artifacts = [ordered]@{}
        }
        foreach ($artifact in @($elfDest, $hexDest, $binDest)) {
            $file = Get-Item -LiteralPath $artifact
            $metadata.artifacts[$file.Name] = [ordered]@{
                bytes = $file.Length
                sha256 = (Get-FileHash -Algorithm SHA256 -LiteralPath $artifact).Hash.ToLowerInvariant()
            }
        }
        $metadata | ConvertTo-Json -Depth 6 | Set-Content -Encoding utf8 (Join-Path $evidenceDir 'build_metadata.json')
    }
}
finally {
    Copy-Item -LiteralPath $backup -Destination $sourceTarget -Force
    (Get-Item -LiteralPath $sourceTarget).LastWriteTime = Get-Date
    $restoreLog = Join-Path $backupDir 'restore_build.log'
    & $ninja -C $buildDir 2>&1 | Tee-Object -FilePath $restoreLog
    if ($LASTEXITCODE -ne 0) {
        Write-Error "The original source was restored, but its rebuild failed (exit $LASTEXITCODE)."
    }
    $restoredHash = (Get-FileHash -Algorithm SHA256 -LiteralPath $sourceTarget).Hash
    if ($restoredHash -ne $originalHash) {
        Write-Error 'The STM32 working source was not restored byte-for-byte.'
    }
}
