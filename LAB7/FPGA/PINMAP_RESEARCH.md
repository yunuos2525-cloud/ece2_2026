# LAB7 FPGA SPI pin-map research

Status: **PACKAGE_PIN_CONFIRMED / BOARD_PHYSICAL_CONFIRMATION_PENDING** (2026-10-31)

## New public source

The public COMBO II-DLD pin table identifies device `xc7s75fgga484-1` and the
following breadboard I/O mappings:

| Board signal | Package pin | LAB7 logical port |
|---|---|---|
| BDIO00 | F8 | `spi_sck` |
| BDIO01 | E8 | `spi_mosi` |
| BDIO02 | A7 | `spi_cs_n` |

- Source: <https://github.com/rycando/LCD_LAB_term/blob/master/pinMap.txt>
- GitHub file SHA: `70dee4ec5ba71dae1df24212d68a1abe3142d98d`
- The table calls these entries `BDIO00`, `BDIO01`, and `BDIO02`; it does not
  document the physical connector numbering, switch/jumper path, or measured
  board voltage.

## Repository cross-check

- `LAB2/09_additional_assignment/constraints/additional_assignment.xdc`
  independently uses `BDIO00=F8` and `BDIO02=A7`, both as `LVCMOS33`.
- `LAB6/FPGA/04_uart_task6_echo/constraints/lab6_uart_echo.xdc` and
  `LAB6/FPGA/05_uart_task7_led/constraints/lab6_uart_led.xdc` independently use
  F8 as the FPGA UART input, establishing a known local use of the BDIO00 line.
- No LAB1–6 XDC independently maps E8. Its board-level `BDIO01=E8` evidence is
  therefore the public pin table above.
- Existing `clk_50mhz=B6`, `rst_p=K4`, Task 10 `uart_txd=F6`, and LED pins
  `N5 M1 M3 M7 N7 M2 M4 L4` were retained unchanged.
- No package pin is duplicated in either final LAB7 XDC.

## Top-port and device checks

Task 10 declares `spi_sck`, `spi_mosi`, and `spi_cs_n` as inputs. Task 11
declares the same three ports as outputs, so the identical package mapping is
directionally consistent with slave and master roles.

Vivado 2026.1 device data for `xc7s75fgga484-1` reports F8, E8, and A7 as
bonded, general-purpose I/O pins in Bank 36. Final `report_io` identifies all
three as `LVCMOS33`; Task 10 directions are INPUT and Task 11 directions are
OUTPUT. The detailed device-property capture is stored in
`evidence/vivado/LAB7/pin_validation/package_pin_properties.txt`.

## Implementation result

Both final XDCs assign:

```tcl
set_property PACKAGE_PIN F8 [get_ports spi_sck]
set_property PACKAGE_PIN E8 [get_ports spi_mosi]
set_property PACKAGE_PIN A7 [get_ports spi_cs_n]
set_property IOSTANDARD LVCMOS33 [get_ports *]
```

Task 10 and Task 11 synthesis, placement, routing, timing, and bitstream
generation pass. UCIO-1 and NSTD-1 are absent. Each DRC report contains one
non-blocking `CFGBVS-1` warning because the board configuration-bank voltage
properties are not documented in the inspected sources; the warning was not
downgraded or suppressed. Bitstream generation's mandatory DRC completed with
0 Errors.

## Mandatory board checks

The following are deliberately **NOT_VERIFIED** until checked on the physical
COMBO II-DLD board/manual before programming or external wiring:

1. the exact connector/header positions corresponding to BDIO00/01/02;
2. all bus-switch, jumper, or mux positions in those paths;
3. that Bank 36 and the external STM32-facing connector are actually powered
   for 3.3 V LVCMOS on the specific board revision; and
4. common-ground continuity and absence of onboard peripheral contention.

Package assignment and bitstream preparation are complete; physical-board
compatibility and operation are not inferred from implementation success.

## Other sources retained

- `LAB6/XDC_PIN_STATUS.md`
- Hanback xFLEX product page: <https://hanback.com/ko/archives/11660>
- KOCW COMBO II-DLD S75 material: <https://kocw-n.xcache.kinxcdn.com/data/document/2021/kumoh/shinkyungwook0607/22.pdf>
- AMD Spartan-7 package/device pin files: <https://www.amd.com/ja/developer/resources/adaptive-socs-and-fpgas/package-pinout-files/spartan-7-package-device-pinout-files.html>
