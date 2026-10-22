# DAC verification

| Item | Result |
|---|---|
| Icarus compile output | `sim.vvp` generated, but compiler process exited `0xC0000005` |
| Existing workflow status | FAIL (`compiler_result.json`) |
| VVP execution | PASS, exit code 0 |
| Self-check | `LAB6_DAC_PASS` |
| VCD | `wave.vcd`, SHA-256 `A970476865A19B5937D09C1A02FFB9BD133D68CB73AF1C504045A6EFE29974F5` |
| Automated trace check | WE low width 1 clock; data setup at least 1 clock; 254, 255, 0, 1 wrap observed |
| Visual waveform verification | NOT_VERIFIED; open the VCD in VaporView |

The testbench verifies 260 digital writes and channel change. Analog voltage
output and the physical DAC's device-specific timing remain NOT_VERIFIED.

