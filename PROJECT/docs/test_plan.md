# Test Plan

## Verification vocabulary

Use only: `SIMULATED`, `BUILD_VERIFIED`, `DEBUG_VERIFIED`,
`VIVADO_VERIFIED`, `BOARD_VERIFIED`, `USER_CONFIRMED`, `NOT_PERFORMED`,
`NEEDS_PHYSICAL_BOARD_CHECK`.

Simulation PASS, Vivado implementation, bitstream generation and board
operation are distinct stages.

## Signal progression

1. DC / low-frequency BYPASS
2. 500 Hz BYPASS
3. 1 kHz BYPASS
4. 1 kHz FILTER
5. 500 Hz desired tone + 1 kHz interference
6. multiple known tones
7. limited-candidate automatic selection
8. optional music/audio demonstration

Do not enter Stage 2/3 until Stage 1 is stable.

## Week 1 tests

| Test condition | Expected | Evidence target | Current status |
|---|---|---|---|
| 50 MHz, divisor 3125 | one-cycle tick every 3125 clocks | `project_evidence/week1/fpga/sim/` | reduced-parameter TB `SIMULATED` |
| modeled ADC frames | RX[11:4] preserved at DAC writes | same | `SIMULATED` |
| physical ADC/DAC | safe input and measured output | `project_evidence/week1/fpga/board/` | `NOT_PERFORMED` |
| MCU build/debug | Stopwatch, Clock, SPI command | MCU evidence folders | `NOT_PERFORMED` |
| concurrent system | no subsystem blocks another | integration folder | `NOT_PERFORMED` |

## Measurement targets — not guarantees

- interference reduction ≥ 10 dB target
- outside-notch gain error ≤ 1 dB target
- input/output latency ≤ 20 ms target
- 30 min: sample drop/overflow = 0 target
- 100 successful mode transitions target

Final reports compare actual measured results against these targets.
