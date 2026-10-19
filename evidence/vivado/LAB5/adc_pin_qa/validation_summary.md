# LAB5 ADC pin QA

- Run time: 2026-10-19 14:27 KST
- Tool: Vivado 2026.1 (64-bit), build 6511674
- Part: `xc7s75fgga484-1`
- Design top: `adc_board_top`
- Source baseline: Git HEAD `200e503f1963b2c33b002ea3b658b7b375f8b470` plus the uncommitted ADC wrapper and XDC pin assignment in this working tree
- Execution: non-project batch Tcl; synthesis, optimization, placement, routing, routed DRC, I/O report, and timing summary
- Process exit code: 0

## Result

- Wrapper elaboration and pin-constraint QA: PASS. All 17 top-level I/O bits have unique `PACKAGE_PIN` assignments and `LVCMOS33`.
- Synthesis: PASS, 0 errors / 0 critical warnings / 0 warnings.
- Implementation: PASS, fully routed with 0 failed and 0 unrouted nets.
- UCIO-1/NSTD-1: PASS, 0 violations.
- Routed timing for specified constraints: PASS. WNS 16.195 ns, TNS 0.000 ns, WHS 0.156 ns, THS 0.000 ns.

## Remaining limitations

- Routed DRC has one `CFGBVS-1` warning because `CFGBVS` and `CONFIG_VOLTAGE` are not set.
- `report_timing_summary` reports `no_input_delay` for 5 inputs and `no_output_delay` for 11 outputs. The passing timing result therefore covers the defined 50 MHz internal timing constraints, not AD7908 external-interface timing.
- Existing ADC RTL timing behavior was intentionally not changed. Passing elaboration, simulation, synthesis, and routing do not verify compliance with the physical AD7908 SPI timing requirements.
- The board's sensor-to-channel mapping remains unverified.
- Bitstream generation, device programming, and physical ADC/board observation were not performed.

