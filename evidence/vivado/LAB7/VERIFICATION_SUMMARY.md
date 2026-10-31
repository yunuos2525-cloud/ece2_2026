# LAB7 Vivado verification summary

Tool: Vivado 2026.1  
Part: `xc7s75fgga484-1`

| Task | XSim | Synthesis | Route | Post-route timing | DRC | Bitstream |
|---|---|---|---|---|---|---|
| 10 slave | PASS | PASS | PASS | WNS 15.236 ns, WHS 0.120 ns | 0 errors; 1 CFGBVS-1 warning | GENERATED |
| 11 master | PASS | PASS | PASS | WNS 15.479 ns, WHS 0.163 ns | 0 errors; 1 CFGBVS-1 warning | GENERATED |
| 12 link | PASS | reuse Tasks 10/11 | reuse Tasks 10/11 | inherits both role builds | inherits both role builds | use Task 11 master + Task 10 slave |

Final implementation evidence is under each task's
`final_pinmap_implementation/` directory. Both designs have zero unassigned
ports, UCIO-1 count zero, NSTD-1 absent, and all user timing constraints met.
The bitstream precondition DRC reported 0 Errors without any severity override.

The remaining CFGBVS-1 warning concerns undocumented configuration-bank
voltage properties and is preserved in the DRC report. Physical connector
positions, switch paths, 3.3 V board compatibility, FPGA programming, and
physical behavior remain `NOT_VERIFIED`.
