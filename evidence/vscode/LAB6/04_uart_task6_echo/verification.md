# UART task 6 verification

| Item | Result |
|---|---|
| Icarus compile output | `sim.vvp` generated, but compiler process exited `0xC0000005` |
| Existing workflow status | FAIL (`compiler_result.json`) |
| VVP execution | PASS, exit code 0 |
| Self-check | `LAB6_UART_TASK6_PASS` |
| VCD | `wave.vcd`, SHA-256 `15FCA0607CB1ADFCD323CFB40EB46644190D237DBCB0C8416BC047EF8B092D0E` |
| Automated trace check | RX/LED values `0x31`, `0x41`, `0x61`; matching TX bytes checked by TB |
| Visual waveform verification | NOT_VERIFIED; open the VCD in VaporView |

MCU-to-FPGA board wiring and serial-terminal output were not performed.

