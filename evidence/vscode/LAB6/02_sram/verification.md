# SRAM verification

| Item | Result |
|---|---|
| Icarus compile output | `sim.vvp` generated, but compiler process exited `0xC0000005` |
| Existing workflow status | FAIL (`compiler_result.json`) |
| VVP execution | PASS, exit code 0 |
| Self-check | `LAB6_SRAM_PASS` |
| VCD | `wave.vcd`, SHA-256 `733A49AE2F7EFE58B162545F7A5CA130A74664EEC7C1CF9994C0D5C88B403E00` |
| Automated trace check | Values 15 through 0 alternate with released `Z` bus state |
| Visual waveform verification | NOT_VERIFIED; open the VCD in VaporView |

The digital memory model checks all 16 addresses, active-low controls, bus
release, and simultaneous read/write rejection. Physical SRAM timing is not
verified.

