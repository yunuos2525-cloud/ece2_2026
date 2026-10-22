# Servo verification

| Item | Result |
|---|---|
| Icarus compile output | `sim.vvp` generated, but compiler process exited `0xC0000005` |
| Existing workflow status | FAIL (`compiler_result.json`) |
| VVP execution | PASS, exit code 0 |
| Self-check | `LAB6_SERVO_PASS` |
| VCD | `wave.vcd`, SHA-256 `FCBD4B2783D6215FFEBE6E24FAF11AD78ADEA178237175F21EFBBBDBAF1BCB32` |
| Automated trace check | Stable frame interval 2000 clocks; stable high widths 100, 150, 200 clocks |
| Visual waveform verification | NOT_VERIFIED; open the VCD in VaporView |

The short reset/frame-boundary transitions in the raw VCD are excluded from
the stable-frame measurements. No physical servo observation was performed.

