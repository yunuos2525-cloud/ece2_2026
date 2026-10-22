# LAB6 PRE source workspace

This directory contains generated LAB6 pre-lab drafts derived from the course
manuals in `C:/Users/yunji/ece2/stm32_lab/docs` and verified LAB3-LAB5 project
patterns. Board observations are not recorded here.

## Source provenance

| LAB6 target | Reused source | LAB6 change |
|---|---|---|
| STM32 tasks 5-7 | `stm32_lab/Core/Src/ece2_474_routine.c` project interface | Independent task-specific routine files |
| UART task 6 | `LAB3/25_uart_echo/src/uart.v` and echo structure | ASCII 1/A/a regression and partial XDC |
| UART task 7 | `LAB3/25_uart_echo/src/uart.v` | ASCII command decoder and regression |
| Servo | `FPGA_additional.md` section 5 | Unique TB top, VCD, stronger frame checks |
| SRAM | `FPGA_additional.md` section 6 | Unique TB top, VCD, explicit bus-direction checks |
| DAC | `FPGA_additional.md` section 8 | Data is registered one clock before active-low WE |

All FPGA projects use the established `simulation.json` schema and the same
`check`, `simulate`, and `wave` command interface as the LAB3-LAB5
`tools/fpga_lab.py` scripts.

## Verification states

Generated files begin as `GENERATED_DRAFT`. Successful Icarus execution moves
the corresponding FPGA design to `SIMULATED`; it does not establish Vivado or
board verification. The student must review the source before it is treated as
`REVIEWED` or `VERIFIED`.

