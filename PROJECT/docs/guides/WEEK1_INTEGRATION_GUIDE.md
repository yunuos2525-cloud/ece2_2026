# Week 1 Integration Guide — 김윤지 + 주윤찬

- Integration branch: `project-dev`
- Start only after each owner has individual test evidence.
- Core outcome: concurrent FPGA BYPASS + Stopwatch + Clock + MCU→FPGA command.

## Integration W1-0. 통합 전 조건

**[파일 작업]** KEEP

**[원본]** `feat/fpga-audio`, `feat/mcu-control`

**[대상]** `project-dev`

**[이 단계의 목적]** 두 기능의 실패를 통합 문제로 섞지 않는다.

**[필요 개념]** individual PASS, review, merge base, current evidence.

**[해야 할 작업]** FPGA simulation/Vivado status와 MCU build/debug status를
확인하고 각 branch가 최신 project-dev 기반인지 확인한다.

**[작성/수정할 코드]** 없음.

**[실행 명령 또는 실행 방법]** `git status`, `git log --graph --oneline --all`.

**[예상 결과]** merge 대상과 미검증 항목이 명확함.

**[Evidence]** branch/commit IDs와 individual status table.

**[Evidence target]** `project_evidence/week1/integration/`

**[Git checkpoint]** dirty files가 있으면 임의 merge/cleanup 금지.

**[PASS 조건]** FPGA/MCU individual prerequisites가 충족되거나 명시적으로 blocked.

## Integration W1-1. 실물 보드 확인

**[파일 작업]** KEEP / DO NOT MODIFY

**[원본]** COMBO II-DLD S75와 STM32 board

**[대상]** physical setup

**[이 단계의 목적]** 추측 wiring으로 장비를 손상시키지 않는다.

**[필요 개념]** signal/GND polarity, voltage compatibility, shared ground,
switch/jumper/mux.

**[해야 할 작업]** 전원 OFF에서 ADC IN signal/GND, ADC switch, DAC A/B,
common GND, BDIO00/01/02와 optional BDIO03를 확인한다.

**[작성/수정할 코드]** 없음.

**[실행 명령 또는 실행 방법]** board photo + DMM continuity.

**[예상 결과]** 실제 terminal/header와 미확정 항목 목록.

**[Evidence]** close-up photos, continuity table.

**[Evidence target]** `project_evidence/week1/board_check/`

**[Git checkpoint]** commit 불필요.

**[PASS 조건]** SCK/MOSI/CS/GND와 ADC/DAC 배선을 추측 없이 지정 가능.

## Integration W1-2. FPGA-MCU wiring

**[파일 작업]** KEEP

**[원본]** reviewed `docs/pinmap.md`

**[대상]** physical wiring

**[이 단계의 목적]** Week 1 one-way control link를 구성한다.

**[필요 개념]** common ground and 3.3 V logic; package pin alone is insufficient.

**[해야 할 작업]** 확인 후 다음을 연결한다.

```text
MCU SCK   ───────→ FPGA BDIO00 / F8
MCU MOSI  ───────→ FPGA BDIO01 / E8
MCU CS    ───────→ FPGA BDIO02 / A7
MCU GND   ──────── FPGA GND
```

MISO는 실물 확인 후에만 `MCU MISO ← FPGA BDIO03 / G8 candidate`를 추가한다.

**[작성/수정할 코드]** 없음; pin changes가 필요하면 docs/XDC를 함께 review.

**[실행 명령 또는 실행 방법]** power-off continuity → power-on idle voltage → SPI.

**[예상 결과]** no contention, correct idle levels, stable 0x01/0x02 transfer.

**[Evidence]** 전체 배선 사진과 pin table.

**[Evidence target]** `project_evidence/week1/integration/`

**[Git checkpoint]** confirmed mapping change는 project-dev 문서 commit.

**[PASS 조건]** FPGA debug mode가 MCU command와 일치.

## Integration W1-3. Audio BYPASS

**[파일 작업]** KEEP

**[원본]** reviewed FPGA bitstream

**[대상]** Function Generator → ADC IN → FPGA → DAC OUT → Scope

**[이 단계의 목적]** physical audio path를 독립적으로 확인한다.

**[필요 개념]** safe unipolar input, scope CH1/CH2 comparison.

**[해야 할 작업]** ADC/DAC polarity 확인 후 High-Z, safe offset 조건으로
500 Hz와 1 kHz BYPASS를 측정한다. CH1=ADC input, CH2=DAC output.

**[작성/수정할 코드]** DSP 없음; Week 1 transparent path 유지.

**[실행 명령 또는 실행 방법]** FPGA guide W1-12~14 순서 준수.

**[예상 결과]** input/output frequency 일치; gain/offset/clipping은 측정값 기록.

**[Evidence]** wiring, generator settings, CH1/CH2 captures.

**[Evidence target]** `project_evidence/week1/integration/`

**[Git checkpoint]** source commit과 bitstream hash 기록.

**[PASS 조건]** 500 Hz와 1 kHz BYPASS가 `BOARD_VERIFIED`.

## Integration W1-4. MCU mode control

**[파일 작업]** KEEP / EDIT only if reviewed

**[원본]** FPGA mode register and MCU command source

**[대상]** integrated system

**[이 단계의 목적]** control plane이 datapath와 독립적으로 동작함을 확인한다.

**[필요 개념]** Week 1 FILTER command is protocol/mode only, not notch verification.

**[해야 할 작업]** 0x01 BYPASS, 0x02 FILTER를 반복 전송하고 FPGA debug mode를
확인한다.

**[작성/수정할 코드]** bug가 있으면 담당 feature branch에서 수정·재검증 후 merge.

**[실행 명령 또는 실행 방법]** 최소 10회 alternating command before 100-transition target.

**[예상 결과]** every command changes expected mode without stopping audio.

**[Evidence]** UART/SPI log, FPGA LED/debug capture, audio continuity.

**[Evidence target]** `project_evidence/week1/integration/`

**[Git checkpoint]** integration fix를 project-dev에 직접 급히 넣지 말고 ownership review.

**[PASS 조건]** command/mode correspondence verified; notch claim 없음.

## Integration W1-5. 동시 실행

**[파일 작업]** KEEP

**[원본]** individually verified FPGA/MCU builds

**[대상]** integrated boards

**[이 단계의 목적]** 한 subsystem의 blocking이 다른 기능을 정지시키지 않는지 확인한다.

**[필요 개념]** concurrency, scheduling, ISR latency, continuous sample timing.

**[해야 할 작업]** 다음을 동시에 실행한다.

```text
ADC→FPGA→DAC BYPASS
+ Stopwatch
+ Digital Clock
+ MCU→FPGA SPI mode control
```

**[작성/수정할 코드]** 문제가 있으면 재현 조건부터 기록하고 담당 branch에서 수정.

**[실행 명령 또는 실행 방법]** Stopwatch start/stop/reset, clock rollover, mode
toggle 중 scope waveform과 error/drop flags 관찰.

**[예상 결과]** audio gap, sample drop, frozen time, SPI error 없음.

**[Evidence]** synchronized video/log/scope capture.

**[Evidence target]** `project_evidence/week1/integration/`

**[Git checkpoint]** tested source commit을 정확히 기록.

**[PASS 조건]** 모든 기능이 동시에 유지되고 관찰된 error가 0.

## Integration W1-6. 공동 evidence와 Week 1 판정

**[파일 작업]** CREATE

**[원본]** current integration run only

**[대상]** `project_evidence/week1/integration/`

**[이 단계의 목적]** Week 1 baseline을 재현 가능하게 만든다.

**[필요 개념]** condition → expected → observed → interpretation.

**[해야 할 작업]** 최소 전체 배선, CH1/CH2 BYPASS, MCU command, Stopwatch,
Clock, simultaneous run을 보존한다. video가 있으면 짧은 원본을 유지한다.

**[작성/수정할 코드]** 없음.

**[실행 명령 또는 실행 방법]** artifact마다 date, operator, branch/commit,
bitstream hash, instrument settings를 함께 기록.

**[예상 결과]** 미수행 항목은 `NOT_PERFORMED`; MISO는 optional.

**[Evidence]** 위 최소 evidence 전체.

**[Evidence target]** `project_evidence/week1/integration/`

**[Git checkpoint]** source와 evidence를 혼동하지 않고 repository policy에 따라 정리.

**[PASS 조건]** 아래 baseline 항목이 실제 evidence를 가짐.

## Week 1 baseline checklist

- [ ] PROJECT structure
- [ ] LAB5 ADC low-level copy
- [ ] LAB6 DAC low-level copy
- [ ] LAB7 SPI source/reference
- [ ] sample tick simulation
- [ ] digital BYPASS simulation
- [ ] ADC/DAC physical mapping
- [ ] safe ADC input and measured DAC output
- [ ] physical ADC→FPGA→DAC BYPASS
- [ ] Stopwatch and Digital Clock
- [ ] MCU→FPGA mode command
- [ ] concurrent operation
- [ ] Week 1 evidence

MISO status response remains `OPTIONAL_WEEK1_EXTENSION`.
