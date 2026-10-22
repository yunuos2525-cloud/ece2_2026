"""Run the student's explicitly listed FPGA lab files with Icarus."""
import argparse
import hashlib
import json
import os
import re
import shutil
import subprocess
import sys
import uuid
from pathlib import Path

ROOT = Path(os.environ["FPGA_LAB_ROOT"]).resolve()
OUT = ROOT / "build/sim"


def digest(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def inputs():
    config = ROOT / "simulation.json"
    cfg = json.loads(config.read_text(encoding="utf-8-sig"))
    top = cfg["simulation_top"]
    if not isinstance(top, str) or not re.fullmatch(r"[A-Za-z_][A-Za-z0-9_$]*", top):
        raise ValueError("simulation_top must name a valid testbench module")
    if not isinstance(cfg["sources"], list) or not cfg["sources"]:
        raise ValueError("sources must list at least one RTL file")
    files = []
    for name, folder in [(s, "src") for s in cfg["sources"]] + [(cfg["testbench"], "sim")]:
        path = (ROOT / name).resolve()
        if not path.is_relative_to(ROOT / folder) or path.suffix not in (".v", ".sv"):
            raise ValueError(f"expected a .v or .sv file below {folder}/: {name}")
        if not path.is_file():
            raise ValueError(f"missing simulation input: {name}")
        files.append(path)
    hashes = {p.relative_to(ROOT).as_posix(): digest(p) for p in [config, *files]}
    for folder in (ROOT / "src", ROOT / "sim"):
        for path in folder.rglob("*"):
            if path.is_file():
                hashes[path.relative_to(ROOT).as_posix()] = digest(path)
    return top, files, hashes


def tool(name):
    path = shutil.which(name)
    if not path:
        raise RuntimeError(f"required tool not found on PATH: {name}")
    return path


def execute(argv, cwd, log, timeout):
    print("RUN", subprocess.list2cmdline([str(x) for x in argv]), flush=True)
    with log.open("w", encoding="utf-8") as output:
        try:
            result = subprocess.run(argv, cwd=cwd, stdout=output, stderr=subprocess.STDOUT,
                                    timeout=timeout, check=False)
        except subprocess.TimeoutExpired:
            output.write("\nTIMEOUT: check the testbench termination condition.\n")
            raise RuntimeError(f"execution timed out: {log}") from None
    print(log.read_text(encoding="utf-8", errors="replace"), flush=True)
    if result.returncode:
        raise RuntimeError(f"exit code {result.returncode}: {log}")


def check():
    out = ROOT / "build/check"
    out.mkdir(parents=True, exist_ok=True)
    print("Python", sys.version.split()[0])
    for name, flag in [("git", "--version"), ("iverilog", "-V"), ("vvp", "-V")]:
        execute([tool(name), flag], ROOT, out / (name + ".log"), 30)
    print("Tool check complete.")


def simulate(timeout):
    OUT.mkdir(parents=True, exist_ok=True)
    (OUT / "wave.vcd").unlink(missing_ok=True)
    run = OUT / ("run-" + uuid.uuid4().hex)
    run.mkdir()
    result = {"status": "RUNNING", "run": run.name, "functional_correctness": "NOT_ASSESSED"}

    def save():
        (OUT / "result.json").write_text(json.dumps(result, ensure_ascii=False, indent=2) + "\n",
                                         encoding="utf-8")

    save()
    try:
        top, files, hashes = inputs()
        result["inputs_sha256"] = hashes
        save()
        execute([tool("iverilog"), "-g2012", "-Wall", "-I", str(ROOT / "src"),
                 "-I", str(ROOT / "sim"), "-s", top, "-o", str(run / "sim.vvp"),
                 *map(str, files)], run, run / "compile.log", timeout)
        execute([tool("vvp"), "-N", str(run / "sim.vvp")], run,
                run / "simulation.log", timeout)
        wave = run / "wave.vcd"
        if not wave.is_file():
            raise RuntimeError("testbench did not create a new wave.vcd")
        wave_text = wave.read_text(encoding="utf-8", errors="replace")
        if "$enddefinitions" not in wave_text or "$var " not in wave_text:
            raise RuntimeError("VCD does not contain signal definitions")
        if not re.search(r"^#[1-9][0-9]*\s*$", wave_text, re.M):
            raise RuntimeError("VCD simulation time did not advance")
        if inputs()[2] != hashes:
            raise RuntimeError("simulation inputs changed during execution")
        shutil.copy2(wave, OUT / "wave.vcd")
        result.update(status="SIMULATED", wave_sha256=digest(wave))
        print("Simulation complete; inspect the self-checks and waveform.")
        print("WAVE", OUT / "wave.vcd")
    except Exception as exc:
        result.update(status="FAILED", error=str(exc))
        raise
    finally:
        save()


def current_wave():
    record = OUT / "result.json"
    if not record.is_file():
        raise RuntimeError("run simulate first")
    result = json.loads(record.read_text(encoding="utf-8"))
    wave = OUT / "wave.vcd"
    if result["status"] != "SIMULATED" or not wave.is_file():
        raise RuntimeError("the latest simulation is not complete")
    if result["inputs_sha256"] != inputs()[2] or result["wave_sha256"] != digest(wave):
        raise RuntimeError("source, configuration, or waveform changed; simulate again")
    return wave


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("action", choices=["check", "simulate", "wave"])
    parser.add_argument("--timeout", type=int, default=120)
    args = parser.parse_args()
    if args.timeout < 1:
        parser.error("--timeout must be positive")
    if args.action == "check":
        check()
    elif args.action == "simulate":
        simulate(args.timeout)
    else:
        wave = current_wave()
        subprocess.run([tool("code"), "--reuse-window", str(wave)], check=True)


if __name__ == "__main__":
    if hasattr(sys.stdout, "reconfigure"):
        sys.stdout.reconfigure(encoding="utf-8")
    try:
        main()
    except (OSError, ValueError, KeyError, TypeError, RuntimeError, subprocess.SubprocessError) as exc:
        print("ERROR:", exc, file=sys.stderr)
        sys.exit(1)

