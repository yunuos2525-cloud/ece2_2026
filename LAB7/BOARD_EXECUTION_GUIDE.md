# LAB7 board execution guide

Date prepared: 2026-10-31  
Lab date: 2026-11-02  
Board state: **Tasks 8–12 are BOARD_READY; every physical result remains NOT_VERIFIED.**

Task 10 and Task 11 final bitstreams were generated from the reviewed RTL and
final F8/E8/A7 XDC. UCIO-1 count is zero and bitstream precondition DRC reports
0 Errors. Before programming or wiring, physically verify the BDIO header
positions, switch/jumper paths, common ground, and 3.3 V compatibility on the
specific boards. Do not treat implementation success as that verification.

## Prepared programs

| Role | Program source | Ready executable |
|---|---|---|
| MCU master, Tasks 8/9/10 | `LAB7/STM32/common/ece2_474_spi_master_sequence.c` | `stm32_evidence/build/LAB7/task8_master`, `task9_master`, or `task10_master` |
| MCU slave, Tasks 9/11 | `LAB7/STM32/common/ece2_474_spi_slave_uart.c` | `stm32_evidence/build/LAB7/task9_slave` or `task11_slave` |
| Task 8 simple trigger option | `LAB7/STM32/common/ece2_474_spi_master_single_55.c` | source retained; the four-byte sequence build is the validated binary |
| FPGA slave, Tasks 10/12 | Task 10 top + `spi_slave_rx.v` + `uart.v` | `evidence/vivado/LAB7/task10/final_pinmap_implementation/task10_mcu_fpga_rx_top.bit` |
| FPGA master, Tasks 11/12 | Task 11 top + `spi_master_tx.v` | `evidence/vivado/LAB7/task11/final_pinmap_implementation/task11_fpga_mcu_tx_top.bit` |

Final bitstream identity:

| Role | Bytes | SHA-256 |
|---|---:|---|
| Task 10 slave | 3,687,025 | `310a4e554ee58d12f838e7de99cb1b7b84a04280e1894356c57d17db527f188a` |
| Task 11 master | 3,687,025 | `07aa7a67b13cf4dbea86d8a039bf4d4c7ab39ec3b6aed7b940bc00ec4dca97cc` |

Each MCU build directory contains `ece2_474.elf`, `.hex`, `.bin`, `build.log`,
and `build_metadata.json`. Use the artifact under the exact role name; do not
load the master artifact onto both MCU boards.

## Common electrical and terminal setup

- Use a common GND between every communicating board and the oscilloscope.
- Signals are 3.3 V logic. Confirm the exact board manual/schematic before
  moving any FPGA connector/bus switch.
- MISO is unused and should not be connected.
- Serial Monitor: the existing course VCP UART, 9600 baud, 8 data bits, no
  parity, one stop bit, no flow control.
- Expected sequence: `55`, `A5`, `00`, `FF`, repeated once per second.
- Expected Mode 0 samples on SCK rising edges:

| Byte | MOSI bits, MSB first |
|---|---|
| `0x55` | `0 1 0 1 0 1 0 1` |
| `0xA5` | `1 0 1 0 0 1 0 1` |
| `0x00` | `0 0 0 0 0 0 0 0` |
| `0xFF` | `1 1 1 1 1 1 1 1` |

## Task 8 — MCU SPI transmit and oscilloscope

Boards: one STM32.

1. Load `stm32_evidence/build/LAB7/task8_master/ece2_474.elf` (or its HEX/BIN
   form supported by the selected programmer) onto the STM32.
2. Connect the serial monitor and confirm lines such as `TX=55, result=0`, then
   `A5`, `00`, `FF`. `result=0` only proves the HAL transmit call completed.
3. Probe PB3 (SCK), PA7 (MOSI), and PB6 (CS); connect probe ground to board GND.
4. Trigger on CS falling. Confirm CS stays LOW for the byte, SCK is idle LOW,
   there are eight rising edges, and MOSI matches the table above.
5. Measure SCK period/frequency. The course template predicts approximately
   781.25 kHz; record the measured value rather than copying the prediction.
6. Save scope screenshots and the UART capture under
   `stm32_evidence/board/LAB7/task8/` and `stm32_evidence/debug/LAB7/task8/`.

Status before lab: build complete; upload, UART observation, and scope evidence
are `NOT_PERFORMED`.

## Task 9 — MCU to MCU

Boards: two STM32 boards, called A and B.

| Signal | Master STM32 | Slave STM32 |
|---|---|---|
| SCK | PB3 | PB3 |
| MOSI | PA7 | PA7 |
| CS/NSS | PB6 | PA4 |
| Ground | GND | GND |

First direction, A to B:

1. Load `task9_slave/ece2_474.elf` on B and start B's 9600-baud VCP monitor.
2. Load `task9_master/ece2_474.elf` on A.
3. Wire PB3–PB3, PA7–PA7, A PB6–B PA4, and GND–GND.
4. Reset/start the slave first, then the master. B should print `RX=55`,
   `RX=A5`, `RX=00`, `RX=FF`. A should print matching TX lines.
5. A slave timeout while the sender is absent is an expected wait result, not
   proof of a communication failure.

Role exchange, B to A:

1. Stop/reset both boards before rewiring.
2. Load the slave artifact on A and the master artifact on B.
3. Keep PB3–PB3 and PA7–PA7. Move CS so B PB6 connects to A PA4.
4. Start A (slave) first, then B (master), and repeat the four-byte check.
5. Save both directions separately under `stm32_evidence/debug/LAB7/task9/`
   and board photographs under `stm32_evidence/board/LAB7/task9/`.

## FPGA pin map and mandatory pre-power checklist

| Logical port | Board signal | PACKAGE_PIN | Task 10 | Task 11 |
|---|---|---|---|---|
| `spi_sck` | BDIO00 | F8 | input | output |
| `spi_mosi` | BDIO01 | E8 | input | output |
| `spi_cs_n` | BDIO02 | A7 | input | output |

Vivado identifies all three as bonded general-purpose I/O in Bank 36 and the
final I/O reports apply `LVCMOS33`. The package mapping is implementation-ready,
but the public pin table does not establish the exact physical header positions,
switch/jumper paths, or measured VCCO. Before programming or wiring:

Each final DRC has 0 Errors and no UCIO-1/NSTD-1. One unsuppressed CFGBVS-1
warning remains because configuration-bank voltage properties are not proven by
the inspected board sources; do not silence it or infer physical 3.3 V from it.

1. identify BDIO00/01/02 on the actual COMBO II-DLD board/manual;
2. verify every switch/jumper/mux path and onboard-peripheral conflict;
3. verify the specific board revision exposes these lines as 3.3 V-compatible;
4. confirm common ground; and
5. stop if any physical fact disagrees with the documented map.

## Task 10 — MCU master to FPGA slave

Boards: one STM32 and one FPGA. Preparation status: **BOARD_READY**; physical
result: **NOT_VERIFIED**.

1. Complete the mandatory pre-power checklist above, then program the FPGA with
   the exact Task 10 slave bitstream and connect its USB UART.
2. Load `stm32_evidence/build/LAB7/task10_master/ece2_474.elf` on the STM32.
3. Connect STM32 PB3 to FPGA BDIO00/F8 (`spi_sck`), PA7 to BDIO01/E8
   (`spi_mosi`), PB6 to BDIO02/A7 (`spi_cs_n`), and GND to GND using the
   physically confirmed header positions.
4. Reset the FPGA receiver first, then start/reset the STM32 master.
5. Expect FPGA UART bytes `55 A5 00 FF` and the LED debug value to follow the
   most recently completed byte.
6. Capture wiring, serial output, and optional scope data under
   `evidence/board/LAB7/task10/`.

## Task 11 — FPGA master to MCU slave

Boards: one FPGA and one STM32. Preparation status: **BOARD_READY**; physical
result: **NOT_VERIFIED**.

1. Load `stm32_evidence/build/LAB7/task11_slave/ece2_474.elf` on the STM32 and
   open its 9600-baud VCP monitor.
2. Complete the mandatory pre-power checklist, then program the FPGA with the
   exact Task 11 master bitstream while its reset is held.
3. Connect FPGA BDIO00/F8 (`spi_sck`) to STM32 PB3, BDIO01/E8 (`spi_mosi`) to
   PA7, BDIO02/A7 (`spi_cs_n`) to PA4, and GND to GND using only the physically
   confirmed header positions.
4. Release/reset the STM32 slave first, then release FPGA reset.
5. Expect `RX=55`, `RX=A5`, `RX=00`, `RX=FF` at one-second start intervals.
6. Scope-check SCK at 1.000 MHz nominal (50 MHz / 50), eight rising edges per
   byte, Mode 0, and correct frame boundaries.
7. Save MCU serial evidence under `stm32_evidence/debug/LAB7/task11/` and FPGA
   wiring/scope evidence under `evidence/board/LAB7/task11/`.

## Task 12 — FPGA to FPGA and role exchange

Boards: two identical FPGA boards, called A and B. Preparation status:
**BOARD_READY**; physical result: **NOT_VERIFIED**.

No Task 12-specific RTL/bitstream is needed. Use the finalized Task 11 master
bitstream on the transmitting board and the finalized Task 10 slave bitstream
on the receiving board.

1. Complete the mandatory pre-power checklist on both boards.
2. Program B with the exact Task 10 slave bitstream; connect B's 9600-baud USB
   UART.
3. Program A with the exact Task 11 master bitstream while reset is asserted.
4. Connect A BDIO00/F8–B BDIO00/F8 (SCK), A BDIO01/E8–B BDIO01/E8 (MOSI),
   A BDIO02/A7–B BDIO02/A7 (CS), and GND–GND at the physically confirmed
   connector positions.
5. Release the receiver first and the transmitter second. Expect B UART and
   LEDs to show `55 A5 00 FF` repeatedly.
6. For role exchange, power/reset safely, program A as Task 10 slave and B as
   Task 11 master, then repeat. Signal wires remain name-to-name if both boards
   use the same confirmed connector mapping.
7. Save each direction separately under `evidence/board/LAB7/task12/A_to_B/`
   and `B_to_A/`.

## First-response troubleshooting

1. Confirm common GND and 3.3 V logic before changing software.
2. Confirm the receiver/slave program is on the receiving board and the
   master program is on the transmitting board.
3. Confirm CS goes from the current master's output to the slave NSS input
   (MCU slave uses PA4, not PB6).
4. Check CS LOW, then SCK, then MOSI. If CS never falls, check program/reset.
5. If SCK is present but bits are reversed, re-check rising-edge sampling and
   MSB-first interpretation.
6. Treat UART text, simulation PASS, bitstream generation, and physical board
   operation as separate evidence stages.

## Evidence to capture

- Exact source/binary/bitstream identity and SHA-256.
- Full wiring photograph showing both signal endpoints and common GND.
- Serial capture with all four bytes and direction/board labels.
- Scope capture including CS, SCK, MOSI, eight rising edges, time scale, and
  measured frequency.
- For Task 9 and Task 12, both role directions.
- Do not copy Icarus/XSim plots into board evidence as if they were measured.
