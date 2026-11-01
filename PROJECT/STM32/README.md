# STM32 project handoff

Status: `WAIT_FOR_STM32_WORKSPACE_CONFIRMATION`.

Do not create or replace a CubeMX/CubeIDE project until the team's actual
workspace, MCU board, generated files, timer allocation and UART/SPI handles
are confirmed. Preserve all LAB source.

Reference only:

```text
LAB7/STM32/common/ece2_474_spi_master_sequence.c
```

Week 1 MCU work belongs on `feat/mcu-control` and includes:

- non-blocking Stopwatch
- software or hardware-backed Digital Clock after resource confirmation
- PROPOSED `0x01` BYPASS / `0x02` FILTER command transmit
- UART logging outside interrupt handlers
- separate BUILD/DEBUG/BOARD evidence

`project_protocol.h` is a protocol draft, not a frozen or verified API.
