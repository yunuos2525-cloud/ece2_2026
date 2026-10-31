# LAB7 pre-lab automation manifest

Date: 2026-10-31  
Repository baseline: `2abe601`  
Branch observed: `main`  
Scope: STM32_3 Task 8~12 only

## Verified inputs

- `C:/Users/yunji/ece2/stm32_lab/docs/STM32_3.md`
- `C:/Users/yunji/ece2/stm32_lab/docs/index.md`
- `C:/Users/yunji/ece2/stm32_lab/docs/STM32_4week_plan.pdf` (12 pages; LAB7 summary on page 11, report guidance on page 12)
- `reports/_automation/REPORT_WORKFLOW.md`
- `reports/_automation/templates/PRE_REPORT_TEMPLATE.md`
- `reports/_automation/references/COURSE_REPORT_FORMAT.md`
- `reports/pre/LAB6_pre_report.md` (reference only)
- existing LAB4~6 source/evidence directory naming patterns

All requested baseline files exist. No LAB7-specific PPT/PPTX/ZIP was found in the two inspected repositories. `FPGA_additional.md` exists but is outside LAB7 scope by explicit course guidance.

## Course facts

- SPI Mode 0, 8-bit, MSB-first, SCK idle LOW.
- Receiver samples on rising edges; transmitter prepares MSB before the first rising edge and updates on falling edges.
- CS active LOW; MISO unused.
- MCU default SCK is documented as approximately 781.25 kHz.
- FPGA master SCK must be at most 1 MHz.
- Test bytes: `0x55`, `0xA5`, `0x00`, `0xFF`.
- Task 10/11 FPGA Verilog must be written by the student; answer RTL is not provided.
- Task 10 TB must confirm bit order and receiving the next byte after CS deassertion.
- Task 9/12 require paired groups and role exchange; Task 10/11 use the team's own MCU/FPGA.

## Preparation status

| Item | Status |
|---|---|
| Requirements extracted | TOOL_VERIFIED |
| Folder naming plan | PREPARED |
| Task 10/11/12 `simulation.json` | SIMULATED |
| STM32 source | GENERATED_DRAFT; course snippets retained/reused |
| FPGA RTL/TB | GENERATED_DRAFT and SIMULATED; student review still required |
| XDC | FINAL for implementation; SCK/MOSI/CS = F8/E8/A7 |
| MCU Build | PASS for five role artifacts |
| Icarus simulation | PASS for Tasks 10~12 |
| User waveform observation | NOT_VERIFIED |
| Vivado | XSim PASS; final synth/route/timing PASS; Task 10/11 bitstreams GENERATED |
| Scope/board/serial | NOT_PERFORMED |
| PRE report/PDF | NOT_CREATED |
| Git commit/push/tag | NOT_PERFORMED |

## Source identity plan

- Task 10 reuses the reviewed Task 8 MCU master source unless a documented change is required.
- Task 11 reuses the reviewed Task 9 MCU slave source unless a documented change is required.
- Task 12 uses the exact reviewed Task 11 master RTL and Task 10 receiver RTL from `LAB7/FPGA/common/src/`.
- Any source difference between tasks or later Vivado use must be recorded; no silent copy modification.

## Remaining physical-board checks

1. Confirm BDIO00/01/02 physical connector positions and bus-switch routing.
2. Confirm the actual board revision's 3.3 V electrical compatibility before
   programming or external wiring.

Top/module/reset names, LAB6 UART TX reuse, and the four-byte sequence strategy
are now selected and verified by Icarus/XSim. F8/E8/A7 package assignments
also pass final Vivado implementation and mandatory bitstream DRC. See
`LAB7_BOARD_PREP_STATUS.md`.

This manifest contains no claimed experimental result.
