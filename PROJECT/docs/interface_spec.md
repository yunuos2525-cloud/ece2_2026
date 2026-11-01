# FPGA-MCU Interface Specification

Status: `PROPOSED` unless explicitly stated otherwise.

## Audio baseline

| Item | Value |
|---|---|
| Sample rate | 16 kHz |
| Channel | mono |
| Initial sample width | 8 bit |
| Initial interference | known 1 kHz tone |
| Modes | `BYPASS`, `FILTER` |

## Ownership

- FPGA: ADC capture, sample timing, detector, filter, DAC output, datapath flags.
- STM32: Stopwatch, Digital Clock, user control, SPI command, UART logging.
- Raw audio samples are not transported through STM32.

## PROPOSED MCU → FPGA commands

| Byte | Meaning | Week 1 implementation |
|---|---|---|
| `0x01` | BYPASS | mode register cleared |
| `0x02` | FILTER_ON | mode register set; DSP still transparent |
| `0x03` | SET_THRESHOLD | reserved, payload format not frozen |
| `0x04` | READ_STATUS | reserved until MISO path is verified |
| `0x05` | CLEAR_ERROR | clears current sticky sample-drop debug flag |

These values are duplicated in `STM32/project_protocol.h` for discussion. They
are not a final protocol and can change only through a documented joint update.

## PROPOSED FPGA → MCU status

- interference detected
- energy/status summary
- clipping
- sample drop
- overflow/error flags

MISO candidate `G8 / BDIO03` is
`PACKAGE_PIN_CANDIDATE / NEEDS_PHYSICAL_BOARD_CHECK`. Until the physical path,
switches and 3.3 V compatibility are checked, status response is an optional
Week 1 extension and must not be marked verified.

## Timing and concurrency rules

- FPGA stays in the 50 MHz domain and uses one-cycle enables.
- MCU Stopwatch/Clock must be non-blocking.
- ISR stores small state/flags; UART formatting occurs outside the ISR.
- SPI errors and data-path errors have separate status/evidence.
