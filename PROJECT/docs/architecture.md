# Architecture

## Baseline

```text
                       STM32
        Stopwatch / Clock / Control / Status
                           ↕
                     SPI control/status
                           ↕
Function Generator → ADC → FPGA DSP → DAC → Oscilloscope
                            │
                            ├─ 16 kHz sample enable
                            ├─ AD7908 sample capture
                            ├─ interference detector
                            ├─ BYPASS mux
                            └─ fixed-point notch filter
```

FPGA가 raw sample의 유일한 data path다. STM32에는 mode, threshold,
detection/energy summary, clipping, sample drop, overflow/error만 전달한다.

## LAB reuse boundary

```text
LAB5 adc_command + serial_frame16 ──→ PROJECT ADC low-level interface
LAB6 dac_parallel8                 ──→ PROJECT DAC low-level interface
LAB7 spi_slave_rx                  ──→ PROJECT MCU-to-FPGA control
```

LAB top과 slow ramp generator는 재사용하지 않는다. PROJECT가 16 kHz enable,
sample ownership, error/status를 명시적으로 관리한다.

## Week 1 data path

```text
50 MHz clock ─→ sample_tick (1-cycle enable every 3125 clocks)
                    │
                    v
ADC serial frame ─→ RX[11:4] ─→ transparent BYPASS ─→ DAC write
```

`FILTER` command는 Week 1에 mode register만 바꾸며 data path는 아직
transparent하다. notch 동작을 했다고 기록해서는 안 된다.

## DSP stages

1. Stage 1 — required: known 1 kHz detector + fixed 1 kHz notch.
2. Stage 2 — optional: multiple known detectors and multiple notches.
3. Stage 3 — optional: predefined candidate energy comparison, strongest
   candidate selection, corresponding coefficient selection.

Stage 3의 automatic tracking은 연속 임의 주파수 추정이 아니라 제한된 후보
집합에서 선택하는 기능이다. Stage 2/3가 Stage 1 안정성을 해치면 후순위로
돌린다.
