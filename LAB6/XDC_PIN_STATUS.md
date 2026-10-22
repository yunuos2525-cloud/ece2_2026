# LAB6 XDC pin status

| Project | PACKAGE_PIN status | Remaining uncertainty |
|---|---|---|
| Servo | Complete from `materials/pinmaps/servo_ctrl.xdc`; B6 clock and AA22 servo output | Physical wiring NOT_VERIFIED |
| SRAM | Complete from `materials/pinmaps/sram.xdc`; 18 address and 16 bidirectional data pins | Physical wiring NOT_VERIFIED |
| DAC | Complete from `materials/pinmaps/dac.xdc`; B6 clock and all DAC control/data pins | Physical wiring NOT_VERIFIED |
| UART task 6 | B6 clock, K4 reset, F6 USB-UART TX, 8 LEDs | Expansion GPIO RX connected to MCU PC10 |
| UART task 7 | B6 clock, K4 reset, F6 USB-UART TX, N5 LED | Expansion GPIO RX connected to MCU PC10 |

All Servo, SRAM, and DAC ports use `LVCMOS33`. Servo source signal `resetn`
is active-low, while `servo_ctrl` uses active-high `rst_p`. The board-only
`servo_board_top` wrapper performs the inversion. Existing RTL and testbench
files are unchanged.

The source SRAM XDC's nonexistent `sdram_cs` IOSTANDARD line was removed.
No clock port was added to SRAM. UART task 6/7 expansion GPIO pins remain
unassigned because they are not present in the supplied pin-map material.
