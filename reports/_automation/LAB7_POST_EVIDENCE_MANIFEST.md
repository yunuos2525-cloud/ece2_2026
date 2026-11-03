# LAB7 post-lab evidence manifest

Date checked: 2026-11-02

Scope: LAB7 Tasks 8–12 board evidence plus existing VS Code/Icarus and Vivado evidence

Repository: `C:/Users/yunji/ece2/ece2_2026`

Branch observed before edits: `project-dev` tracking `origin/project-dev`

## 1. Evidence rules used

- `FILE_CONFIRMED`: the referenced repository file exists and its visible or
  textual content supports the stated claim.
- `USER_CONFIRMED`: the user explicitly reported the physical observation, but
  the repository has no independent capture of that exact result.
- `NOT_FOUND_LOCALLY`: the specifically requested artifact was not found in the
  repository. This does not mean the experiment was not performed.
- Wiring photographs prove the recorded setup, not data reception by themselves.
- Simulation PASS, implementation/bitstream generation, and physical board
  operation are separate verification stages.
- The old preparation snapshots
  [`LAB7_BOARD_PREP_STATUS.md`](LAB7_BOARD_PREP_STATUS.md) and
  [`LAB7_pre_manifest.md`](LAB7_pre_manifest.md) are preserved as historical
  pre-experiment records; their earlier `NOT_PERFORMED` statements were not
  rewritten.

## 2. Git state before this cleanup

- `git status --short --branch`: `project-dev...origin/project-dev`.
- Tracked modifications: 0.
- Git reported 48 untracked status entries. They included the LAB7 board,
  Vivado implementation, STM32 build, and backup material as well as unrelated
  LAB5/LAB6/report files.
- No file was staged, committed, pushed, tagged, deleted, moved, rebuilt, or
  resimulated during this cleanup.

## 3. Expected-to-actual path mapping

The user's existing `evidence/board/LAB7/taskN/` organization was retained.
Files absent only at an older expected location are mapped to their actual file
and are not counted as missing evidence.

| Task | Expected path or pattern | Actual repository path | Result |
|---|---|---|---|
| 8 | `stm32_evidence/debug/LAB7/task8/uart_tx.png` | [`evidence/board/LAB7/task8/uart_tx.png`](../../evidence/board/LAB7/task8/uart_tx.png) | MAPPED |
| 8 | `stm32_evidence/board/LAB7/task8/scope_spi_cs_sck.png` | [`evidence/board/LAB7/task8/scope_spi_cs_sck.png`](../../evidence/board/LAB7/task8/scope_spi_cs_sck.png) | MAPPED |
| 8 | `stm32_evidence/board/LAB7/task8/scope_spi_cs_mosi.png` | [`evidence/board/LAB7/task8/scope_spi_cs_mosi.png`](../../evidence/board/LAB7/task8/scope_spi_cs_mosi.png) | MAPPED |
| 9 | `stm32_evidence/board/LAB7/task9/our_group_rx_overview.jpg` | [`evidence/board/LAB7/task9/our_group_rx_overview.jpg`](../../evidence/board/LAB7/task9/our_group_rx_overview.jpg) | MAPPED |
| 9 | `stm32_evidence/board/LAB7/task9/our_group_rx_wiring.jpg` | [`evidence/board/LAB7/task9/our_group_rx_wiring.jpg`](../../evidence/board/LAB7/task9/our_group_rx_wiring.jpg) | MAPPED |
| 9 | `stm32_evidence/debug/LAB7/task9/our_group_rx_uart.png` | [`evidence/board/LAB7/task9/our_group_rx_uart.png`](../../evidence/board/LAB7/task9/our_group_rx_uart.png) | MAPPED |
| 9 | `stm32_evidence/board/LAB7/task9/our_group_tx_wiring.jpg` | [`evidence/board/LAB7/task9/our_group_tx_wiring.jpg`](../../evidence/board/LAB7/task9/our_group_tx_wiring.jpg) | MAPPED |
| 9 | `stm32_evidence/board/LAB7/task9/our_group_tx_overview.jpg` | [`evidence/board/LAB7/task9/our_group_tx_overview.jpg`](../../evidence/board/LAB7/task9/our_group_tx_overview.jpg) | MAPPED |
| 10 | `evidence/board/LAB7/task10/wiring_closeup.png` | [`evidence/board/LAB7/task10/wiring_closeup.jpg`](../../evidence/board/LAB7/task10/wiring_closeup.jpg) | MAPPED; extension differs |
| 10 | `evidence/board/LAB7/task10/wiring_overview.png` | [`evidence/board/LAB7/task10/wiring_overview.jpg`](../../evidence/board/LAB7/task10/wiring_overview.jpg) | MAPPED; extension differs |
| 10 | `stm32_evidence/debug/LAB7/task10/mcu_tx_uart.png` | [`evidence/board/LAB7/task10/mcu_tx_uart.png`](../../evidence/board/LAB7/task10/mcu_tx_uart.png) | MAPPED |
| 11 | `evidence/board/LAB7/task11/scope_cs_sck.png` | [`evidence/board/LAB7/task11/scope_cs_sck.jpg`](../../evidence/board/LAB7/task11/scope_cs_sck.jpg) | MAPPED; extension differs |
| 11 | `evidence/board/LAB7/task11/scope_cs_mosi.png` | [`evidence/board/LAB7/task11/scope_cs_mosi.jpg`](../../evidence/board/LAB7/task11/scope_cs_mosi.jpg) | MAPPED; extension differs |
| 11 | `stm32_evidence/debug/LAB7/task11/uart_rx.png` | [`evidence/board/LAB7/task11/uart_rx.png`](../../evidence/board/LAB7/task11/uart_rx.png) | MAPPED |
| 12 | `evidence/board/LAB7/task12/wiring.jpg` | [`evidence/board/LAB7/task12/wiring.jpg`](../../evidence/board/LAB7/task12/wiring.jpg) | FOUND |
| 12 RX | `task12/our_group_rx/dip_to_spi_rx.mp4` | [`task12/our_group_rx_dip_to_spi_rx.mp4`](../../evidence/board/LAB7/task12/our_group_rx_dip_to_spi_rx.mp4) | MAPPED; filename prefix used |
| 12 RX | `task12/our_group_rx/uart_rx_changed.jpg` | [`task12/our_group_rx_uart_rx_changed.png`](../../evidence/board/LAB7/task12/our_group_rx_uart_rx_changed.png) | MAPPED; flat name and extension differ |
| 12 TX | `task12/our_group_tx/spi_tx_to_other_group.mp4` | [`task12/our_group_tx_spi_tx_to_other_group.mp4`](../../evidence/board/LAB7/task12/our_group_tx_spi_tx_to_other_group.mp4) | MAPPED; filename prefix used |
| 12 TX | `task12/our_group_tx/receiver_uart_video_frame.jpg` | [`task12/our_group_tx_receiver_uart_video_frame.png`](../../evidence/board/LAB7/task12/our_group_tx_receiver_uart_video_frame.png) | MAPPED; flat name and extension differ |

## 4. Task 8–12 board evidence check

| Task | Roles and execution status | File-supported observation | Boundary / missing evidence |
|---|---|---|---|
| 8 — STM32 SPI master | Our STM32 acted as SPI master; performed | UART capture shows repeating `TX=55`, `TX=A5`, `TX=00`, `TX=FF`, each with `result=0`. Scope captures show CS/SCK and CS/MOSI activity, including eight SCK pulses while CS is active. | `result=0` supports transmit-call success, not a receiver result. No receiver is required for this scope task. |
| 9 — STM32 ↔ STM32 | Our group performed both receiver and transmitter roles | Receiver UART capture shows repeating `RX=55`, `RX=A5`, `RX=00`, `RX=FF`; receiver and transmitter wiring/overview photographs exist. | Our-group transmitter execution is supported by setup photographs and the user's explicit statement. A counterpart-group receiver UART log for that direction is `NOT_FOUND_LOCALLY`. |
| 10 — STM32 → FPGA | MCU master to FPGA slave; performed and communication success `USER_CONFIRMED` | MCU UART capture shows repeating `TX=55`, `TX=A5`, `TX=00`, `TX=FF`, each with `result=0`; close-up and overview wiring photographs exist. | A separate FPGA RX capture is `NOT_FOUND_LOCALLY`. Do not change this to `NOT_PERFORMED`; FPGA reception is `USER_CONFIRMED`. LED evidence is not required. |
| 11 — FPGA → STM32 | FPGA master to STM32 slave; performed | Scope capture shows CS active during eight SCK pulses; the paired capture shows MOSI transitions. STM32 UART shows repeated `RX=55`, `RX=A5`, `RX=00`, `RX=FF`. | The 1 MHz SCK value is a design value, not recorded here as a separately measured physical frequency. |
| 12 — FPGA ↔ FPGA | Our group performed both receive and transmit roles; common wiring retained across role exchange | Receive-direction video/frame supports changes through `55`, `A5`, and `00`. Transmit-direction video/frame shows the other group's receiver UART repeating `55`, `A5`, `00`, `FF`. | Do not claim `FF` for our-group receive direction. The DIP control belonged to the other-group master; it is not our-group implementation evidence. |

Additional Task 12 frame files retained without regeneration:

- [`our_group_rx_uart_rx_initial_55.png`](../../evidence/board/LAB7/task12/our_group_rx_uart_rx_initial_55.png)
- [`our_group_rx_dip_operation.png`](../../evidence/board/LAB7/task12/our_group_rx_dip_operation.png)

## 5. VS Code/Icarus, Vivado, and board-stage separation

| Stage | Task 10 | Task 11 | Task 12 | Meaning |
|---|---|---|---|---|
| VS Code / Icarus | PASS | PASS | PASS | Self-checking testbenches completed with exit code 0; input/run hashes are in each `result.json`. VaporView visual approval remains `NOT_VERIFIED`. |
| Vivado XSim | PASS text in batch log | PASS text in batch log | PASS text in batch log | Behavioral simulation only; each `status.txt` says XSim completed and keeps waveform visual review separate. |
| Final implementation | synthesis/route PASS | synthesis/route PASS | reuses Tasks 10/11 role builds | Task 10 and 11 have no unassigned ports, UCIO-1 count 0, and all user timing constraints met. |
| Final DRC | 0 errors; 1 CFGBVS-1 warning | 0 errors; 1 CFGBVS-1 warning | inherits role builds | Preserved warning concerns missing CFGBVS/CONFIG_VOLTAGE design properties. |
| Bitstream | GENERATED, 3,687,025 bytes | GENERATED, 3,687,025 bytes | uses Task 10 slave + Task 11 master | Generation is not physical-board proof. |
| Physical board | success `USER_CONFIRMED`; separate FPGA RX capture missing | UART plus scope evidence confirms communication | both directions performed with video/frame evidence | Physical results are classified independently from simulation and implementation. |

Primary existing simulation/implementation records:

- Task 10 XSim: [`xsim/status.txt`](../../evidence/vivado/LAB7/task10/xsim/status.txt),
  [`xsim/vivado_batch.log`](../../evidence/vivado/LAB7/task10/xsim/vivado_batch.log)
- Task 11 XSim: [`xsim/status.txt`](../../evidence/vivado/LAB7/task11/xsim/status.txt),
  [`xsim/vivado_batch.log`](../../evidence/vivado/LAB7/task11/xsim/vivado_batch.log)
- Task 12 XSim: [`xsim/status.txt`](../../evidence/vivado/LAB7/task12/xsim/status.txt),
  [`xsim/vivado_batch.log`](../../evidence/vivado/LAB7/task12/xsim/vivado_batch.log)
- Task 10 final implementation: [`status.txt`](../../evidence/vivado/LAB7/task10/final_pinmap_implementation/status.txt)
- Task 11 final implementation: [`status.txt`](../../evidence/vivado/LAB7/task11/final_pinmap_implementation/status.txt)
- Icarus summary: [`evidence/vscode/LAB7/VERIFICATION_SUMMARY.md`](../../evidence/vscode/LAB7/VERIFICATION_SUMMARY.md)
- Vivado summary: [`evidence/vivado/LAB7/VERIFICATION_SUMMARY.md`](../../evidence/vivado/LAB7/VERIFICATION_SUMMARY.md)

Verified bitstream identities:

- Task 10: `310a4e554ee58d12f838e7de99cb1b7b84a04280e1894356c57d17db527f188a`
- Task 11: `07aa7a67b13cf4dbea86d8a039bf4d4c7ab39ec3b6aed7b940bc00ec4dca97cc`

## 6. Representative evidence for the final report

| Task | Recommended representative material | Reason |
|---|---|---|
| 8 | [`uart_tx.png`](../../evidence/board/LAB7/task8/uart_tx.png), [`scope_spi_cs_sck.png`](../../evidence/board/LAB7/task8/scope_spi_cs_sck.png), [`scope_spi_cs_mosi.png`](../../evidence/board/LAB7/task8/scope_spi_cs_mosi.png) | Full MCU sequence/result and both required SPI signal relationships |
| 9 | [`our_group_rx_uart.png`](../../evidence/board/LAB7/task9/our_group_rx_uart.png), [`our_group_rx_overview.jpg`](../../evidence/board/LAB7/task9/our_group_rx_overview.jpg), [`our_group_tx_overview.jpg`](../../evidence/board/LAB7/task9/our_group_tx_overview.jpg) | Full receive sequence and both role setups; disclose missing counterpart RX log |
| 10 | [`wiring_overview.jpg`](../../evidence/board/LAB7/task10/wiring_overview.jpg), [`mcu_tx_uart.png`](../../evidence/board/LAB7/task10/mcu_tx_uart.png) | Physical setup and full MCU TX sequence; label FPGA reception `USER_CONFIRMED` |
| 11 | [`scope_cs_sck.jpg`](../../evidence/board/LAB7/task11/scope_cs_sck.jpg), [`scope_cs_mosi.jpg`](../../evidence/board/LAB7/task11/scope_cs_mosi.jpg), [`uart_rx.png`](../../evidence/board/LAB7/task11/uart_rx.png) | Eight-clock frame, MOSI changes, and full repeated STM32 RX sequence |
| 12 RX | [`wiring.jpg`](../../evidence/board/LAB7/task12/wiring.jpg), [`our_group_rx_dip_to_spi_rx.mp4`](../../evidence/board/LAB7/task12/our_group_rx_dip_to_spi_rx.mp4), [`our_group_rx_uart_rx_changed.png`](../../evidence/board/LAB7/task12/our_group_rx_uart_rx_changed.png) | Our receiver with other-group DIP-controlled master; claim only `55`, `A5`, `00` |
| 12 TX | [`our_group_tx_spi_tx_to_other_group.mp4`](../../evidence/board/LAB7/task12/our_group_tx_spi_tx_to_other_group.mp4), [`our_group_tx_receiver_uart_video_frame.png`](../../evidence/board/LAB7/task12/our_group_tx_receiver_uart_video_frame.png) | Our automatic-cycle master and counterpart UART showing `55`, `A5`, `00`, `FF` |

## 7. SHA-256 duplicate check

- All 21 board media files under `evidence/board/LAB7/task8` through `task12`
  have distinct SHA-256 values; no board photo, screenshot, or video is an exact
  duplicate of another board media file.
- Expected role-reuse duplicates were found in STM32 build evidence and retained:
  Task 8/9/10 master ELF, HEX, and BIN files are byte-identical; Task 9/11
  slave ELF, HEX, and BIN files are byte-identical. Their corresponding role
  build logs are also identical.
- The three zero-byte Icarus `compile.log` files share the standard empty-file
  SHA-256. This means no compiler diagnostics were emitted; it is not board evidence.
- No duplicate file was deleted or moved.

## 8. Remaining missing or limited evidence

1. Task 9, our-group transmit direction: counterpart-group receiver UART log —
   `NOT_FOUND_LOCALLY`.
2. Task 10: separate FPGA RX data capture — `NOT_FOUND_LOCALLY`; physical
   communication success remains `USER_CONFIRMED`.
3. Task 12, our-group receive direction: evidence supports `55`, `A5`, `00`;
   `FF` is not claimed.
4. VaporView human visual approval for the saved VS Code waveforms remains
   `NOT_VERIFIED` unless separately user-approved.

## 9. Cleanup scope

Only current-status README text and this manifest were changed. Existing LAB1–6
material, LAB7 PRE report/preparation records, RTL/C/XDC sources, simulations,
Vivado outputs, bitstreams, photographs, videos, and logs were not modified.
