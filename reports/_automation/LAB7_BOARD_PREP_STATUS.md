# LAB7 board preparation status

Prepared: 2026-10-31  
Repository baseline: `2abe601493983e2d615ebe20593963e4e0d333fa`  
Scope: Tasks 8–12, no PRE report, no physical programming or measurement

## A. Task status

| Task | Preparation result | Classification | Reason |
|---|---|---|---|
| 8 MCU scope | MCU source, validated ELF/HEX/BIN, pins, and procedure ready | BOARD_READY | physical outcome remains NOT_VERIFIED |
| 9 MCU→MCU | separate master/slave builds, both-direction wiring, and procedure ready | BOARD_READY | physical outcome remains NOT_VERIFIED |
| 10 MCU→FPGA | MCU build, RTL/TB, Icarus, XSim, final XDC, implementation, bitstream | BOARD_READY | physical header and 3.3 V checks remain NOT_VERIFIED |
| 11 FPGA→MCU | MCU slave build, RTL/TB, Icarus, XSim, final XDC, implementation, bitstream | BOARD_READY | physical header and 3.3 V checks remain NOT_VERIFIED |
| 12 FPGA→FPGA | exact Task 10/11 integration PASS and both role bitstreams assigned | BOARD_READY | both physical boards still require pre-power checks |

No task is marked `BOARD_VERIFIED`. All Tasks 8–12 are `BOARD_READY` because
the required programs, role bitstreams, and procedures are available. Every
physical result remains `NOT_VERIFIED`.

## B. MCU deliverables

Canonical sources:

- Master sequence: `LAB7/STM32/common/ece2_474_spi_master_sequence.c`
- Course-style single `0x55`: `LAB7/STM32/common/ece2_474_spi_master_single_55.c`
- Slave + UART print: `LAB7/STM32/common/ece2_474_spi_slave_uart.c`

Actual Debug build artifacts:

| Role | BIN bytes | ELF bytes | Source identity |
|---|---:|---:|---|
| task8_master | 28,904 | 1,658,020 | master sequence |
| task9_master | 28,904 | 1,658,020 | master sequence |
| task9_slave | 30,736 | 1,658,292 | slave UART |
| task10_master | 28,904 | 1,658,020 | master sequence |
| task11_slave | 30,736 | 1,658,292 | slave UART |

Every role directory under `stm32_evidence/build/LAB7/` includes ELF/HEX/BIN,
build log, byte size, SHA-256, tool version, and source SHA-256. Identical roles
produce identical ELF hashes. The external working project source was restored
byte-for-byte from `LAB7/STM32/_workspace_backup/` and rebuilt afterward.

## C. FPGA deliverables and verification

Sources:

- `LAB7/FPGA/common/src/spi_slave_rx.v`
- `LAB7/FPGA/common/src/spi_master_tx.v`
- `LAB7/FPGA/common/src/uart.v` (LAB6 TX behavior reused)
- Task 10 top and self-checking TB
- Task 11 top and self-checking TB
- Task 12 integration TB with no duplicate hardware RTL

Icarus results in `evidence/vscode/LAB7/`:

- Task 10 PASS: CS-HIGH ignore, partial abort, four bytes, LED, UART.
- Task 11 PASS: Mode 0, SCK rate, eight edges, byte order, frame interval.
- Task 12 PASS: same Task 10/11 modules, four link bytes, UART.

Vivado results in `evidence/vivado/LAB7/`:

- XSim PASS for Tasks 10, 11, and 12.
- Final Task 10 synthesis/placement/route PASS; WNS 15.236 ns and WHS
  0.120 ns; zero unassigned ports; bitstream generated.
- Final Task 11 synthesis/placement/route PASS; WNS 15.479 ns and WHS
  0.163 ns; zero unassigned ports; bitstream generated.
- Both final DRC reports have 0 errors, no UCIO-1/NSTD-1, and one unsuppressed
  CFGBVS-1 warning about undocumented configuration-bank voltage properties.
- Task 10 bitstream: 3,687,025 bytes,
  SHA-256 `310a4e554ee58d12f838e7de99cb1b7b84a04280e1894356c57d17db527f188a`.
- Task 11 bitstream: 3,687,025 bytes,
  SHA-256 `07aa7a67b13cf4dbea86d8a039bf4d4c7ab39ec3b6aed7b940bc00ec4dca97cc`.

## D. FPGA pin map

| Function | Logical port | PACKAGE_PIN | Physical endpoint | Evidence |
|---|---|---|---|---|
| 50 MHz clock | `clk_50mhz` | B6 | onboard oscillator | prior verified LAB6 XDC/KOCW board material |
| active-high reset | `rst_p` | K4 | onboard key path | prior verified LAB6 XDC |
| FPGA USB UART TX | `uart_txd` | F6 | onboard USB-UART TX path | prior verified LAB6 XDC |
| LEDs 0–7 | `led[0:7]` | N5, M1, M3, M7, N7, M2, M4, L4 | onboard LEDs | prior verified LAB6 XDC |
| SPI clock | `spi_sck` | F8 | BDIO00; physical header position pending | public pin table + LAB2/LAB6 cross-check |
| SPI data | `spi_mosi` | E8 | BDIO01; physical header position pending | public pin table |
| SPI select | `spi_cs_n` | A7 | BDIO02; physical header position pending | public pin table + LAB2 cross-check |

MCU endpoints are confirmed by the course guide: master PB3/PA7/PB6 and slave
PB3/PA7/PA4. Vivado confirms all three FPGA pins are bonded general-purpose I/O
in Bank 36 and uses LVCMOS33. Physical header positions, bus-switch settings,
and actual 3.3 V board compatibility remain `NOT_VERIFIED`. See
`LAB7/FPGA/PINMAP_RESEARCH.md`.

## E. Lab execution material

`LAB7/BOARD_EXECUTION_GUIDE.md` records role-specific binaries, MCU wiring,
program order, serial/scope expectations, role exchange, blocker checks,
troubleshooting, and evidence destinations. `LAB7/VAPORVIEW_CHECKLIST.md`
separates automatic VCD checks from required human visual review.

## F. Required next input/action

At the physical boards, identify BDIO00/01/02 header positions, verify all
switch/jumper paths and 3.3 V compatibility, and confirm common ground before
programming. Then use the hashed Task 10 slave and Task 11 master bitstreams as
assigned in the execution guide.

Board programming, wiring, UART observation, oscilloscope measurement,
photographs, and videos remain `NOT_PERFORMED`.

## G. Git state

- Staged files: 0.
- Tracked-file staged/unstaged diff: 0; LAB7 work is currently untracked/new.
- `git status --short` reports 20 untracked path entries overall, including 10
  LAB7-scoped top-level directory/file entries. Git collapses untracked
  directories, so this is not a contained-file count.
- No add, commit, push, tag, reset, rebase, or branch change was performed.
- Existing unrelated untracked LAB5/LAB6/report files remain untouched and are
  not part of this LAB7 result.
- Previous pre-pin-map implementation Evidence remains in each task's
  `implementation/` directory; the final run was written separately to
  `final_pinmap_implementation/`.
