# FPGA-MCU 기반 실시간 음향 간섭 검출·억제 시스템

## 목적

COMBO II-DLD S75의 ADC/DAC와 FPGA, STM32를 이용해 알려진 단일 음향
간섭을 검출하고 notch filter로 억제한다. FPGA는 16 kHz mono signal/data
path를, STM32는 Stopwatch/Digital Clock과 mode·threshold·status control을
담당한다.

현재 baseline은 8-bit, known 1 kHz interference, `BYPASS`/`FILTER` 두
mode이다. Stage 1의 고정 1 kHz 검출·억제가 필수 목표이며 다중 간섭과
제한된 후보 주파수 자동 선택은 확장 목표다.

## Architecture

```text
Function Generator -> ADC -> FPGA sample/DSP -> DAC -> Oscilloscope
                              ^
                              | SPI control/status
                              v
                 STM32 Stopwatch / Clock / Control
```

- FPGA: Signal / Data Path
- STM32: Control / Decision Path
- Raw audio sample은 MCU를 거치지 않는다.

상세 구조는 [docs/architecture.md](docs/architecture.md)를 참고한다.

## 담당

- 김윤지: FPGA / DSP / RTL / Testbench / Vivado
- 주윤찬: STM32 / SPI / Control / UART logging
- 공동: Board wiring / integration / measurements / demo

## 폴더

```text
PROJECT/
  docs/                 architecture, interface, pin map, test plan, guides
  FPGA/                 project-owned RTL, TB, XDC, simulation tools
  STM32/                protocol draft and workspace handoff notes
  tools/                future shared integration tools
project_evidence/       project-only measured/generated evidence
```

`project_evidence/`는 기존 수업 `evidence/` 및 `stm32_evidence/`와 섞지
않는다. LAB evidence와 project evidence의 source/commit/run 조건이 다르기
때문이며, 이전 LAB 결과를 새 project 실행의 증거로 재사용하지 않는다.

## Reused source provenance

원본 LAB 파일은 변경하지 않았고 PROJECT 아래로 byte-identical copy했다.

| Original | Project copy | Copy-time SHA-256 |
|---|---|---|
| `LAB5/FPGA/03_adc/src/adc_command.v` | `PROJECT/FPGA/src/io/adc_command.v` | `292f3a038ecdc066785d7b955ac2bc3cc7ce66dde22b227384c465d4c770a6c1` |
| `LAB5/FPGA/03_adc/src/serial_frame16.v` | `PROJECT/FPGA/src/io/serial_frame16.v` | `60fbac5d163d8844660360cebb4f4ed74c4d9951b2ef63e8c90d79ed0df4827a` |
| `LAB6/FPGA/03_dac/src/dac_parallel8.v` | `PROJECT/FPGA/src/io/dac_parallel8.v` | `98cd51ee080bd2164920948ff2376f59066934eafd15dbf33f76876d99ab3c73` |
| `LAB7/FPGA/common/src/spi_slave_rx.v` | `PROJECT/FPGA/src/control/spi_slave_rx.v` | `7da172d7c8c3d83162f39f051cd3e7cae1609f38b64bc4211d677f6ae1126ea5` |

복사 후 PROJECT version을 수정할 수 있지만 LAB 원본은 계속 보존한다.
`LAB5 adc.v/adc_board_top.v`, `LAB6 dac.v/ramp8.v`는 project timing 목적에
맞지 않아 복사하지 않았다. STM32는
`LAB7/STM32/common/ece2_474_spi_master_sequence.c`를 reference로만 사용한다.

## Week 1 guides

- [FPGA guide](docs/guides/WEEK1_FPGA_GUIDE.md) — branch `feat/fpga-audio`
- [MCU guide](docs/guides/WEEK1_MCU_GUIDE.md) — branch `feat/mcu-control`
- [Integration guide](docs/guides/WEEK1_INTEGRATION_GUIDE.md) — branch `project-dev`

## Git branches

```text
main
└─ project-dev
   ├─ feat/fpga-audio
   └─ feat/mcu-control
```

`main`에는 통합 검증된 milestone만 반영한다. 담당 feature branch는 최신
`project-dev`에서 시작하고, 통합은 `project-dev`에서 수행한다.

## Current status

- Copied LAB low-level modules: source identity verified by SHA-256
- New Week 1 RTL/TB: `GENERATED_DRAFT`
- `sample_tick`: `SIMULATED`
- digital modeled ADC-to-DAC BYPASS: `SIMULATED`
- Vivado synthesis/implementation/bitstream: `NOT_PERFORMED`
- physical ADC/DAC/SPI wiring and board operation: `NOT_PERFORMED`
- STM32 workspace: `WAIT_FOR_STM32_WORKSPACE_CONFIRMATION`

Simulation:

```powershell
python PROJECT/FPGA/tools/fpga_project.py all
```

Icarus log만으로 analog ADC/DAC 또는 board 동작이 검증된 것은 아니다.
