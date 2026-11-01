# Week 1 MCU Guide — 주윤찬

- Working branch: `feat/mcu-control`
- Scope: STM32 Stopwatch, Digital Clock, SPI master command, UART log, evidence
- Excluded: FPGA ADC/DAC/DSP implementation
- Current gate: `WAIT_FOR_STM32_WORKSPACE_CONFIRMATION`

실제 STM32 board/workspace/CubeMX template/timer resource를 확인하기 전 임의의
완성 project를 만들거나 LAB source를 덮어쓰지 않는다.

## MCU W1-0. 시작 전 workspace 확인

**[파일 작업]** KEEP / DO NOT MODIFY

**[원본]** 실제 팀 STM32 workspace; 미확정이면 NONE

**[대상]** confirmed workspace on `feat/mcu-control`

**[이 단계의 목적]** 잘못된 MCU/handle/pin/template 가정으로 기존 환경을
대체하지 않는다.

**[필요 개념]** CubeMX generated 영역, user-code 영역, timer/SPI/UART resource
ownership.

**[해야 할 작업]** MCU board/model, `.ioc`, project root, `hspi1`, UART handle,
timer allocation, clock tree와 current build command를 기록한다.

**[작성/수정할 코드]** workspace 미확정이면 없음.

**[실행 명령 또는 실행 방법]** `git status`, IDE project information, `.ioc`
review. `feat/mcu-control`인지 확인.

**[예상 결과]** 실제 edit target이 한 곳으로 확정되거나 상태가 계속
`WAIT_FOR_STM32_WORKSPACE_CONFIRMATION`.

**[Evidence]** workspace path, MCU/board, tool version, branch/HEAD.

**[Evidence target]** `project_evidence/week1/mcu/build/`

**[Git checkpoint]** 확인 전 source commit 금지.

**[PASS 조건]** 어떤 파일을 수정하고 어떤 generated file을 보존할지 설명 가능.

## MCU W1-1. LAB7 SPI reference 확인

**[파일 작업]** KEEP / DO NOT MODIFY

**[원본]** `LAB7/STM32/common/ece2_474_spi_master_sequence.c`

**[대상]** confirmed STM32 workspace의 project-owned user source; 현재 미정

**[이 단계의 목적]** 검증된 Mode 0 transmit/CS pattern을 이해하고 재사용 범위를
정한다.

**[필요 개념]** CS active low, MSB-first byte, `HAL_SPI_Transmit`, timeout,
non-blocking scheduler와 blocking peripheral call의 차이.

**[해야 할 작업]** reference의 SPI handle, CS GPIO, 1 s scheduling과 return code
log를 읽는다. 원본은 복사/수정하지 않는다.

**[작성/수정할 코드]** 이 단계에서는 없음.

**[실행 명령 또는 실행 방법]** source review와 LAB7 evidence 확인.

**[예상 결과]** 기존 byte sequence와 새 PROPOSED command의 차이를 설명 가능.

**[Evidence]** review note.

**[Evidence target]** `project_evidence/week1/mcu/debug/`

**[Git checkpoint]** commit 불필요.

**[PASS 조건]** LAB7 원본이 unchanged이고 reuse plan이 문서화됨.

## MCU W1-2. Stopwatch

**[파일 작업]** CREATE / EDIT

**[원본]** confirmed workspace의 timer/HAL tick pattern

**[대상]** confirmed project-owned user source; workspace 확인 후 정확한 경로 기록

**[이 단계의 목적]** audio/SPI control을 멈추지 않는 start/stop/reset/elapsed
time을 구현한다.

**[필요 개념]** monotonic tick, state machine, unsigned elapsed subtraction,
non-blocking scheduling.

**[해야 할 작업]** `running`, accumulated time, last-start tick을 분리한다.
button debounce/ISR는 event flag만 만들고 계산과 log는 main loop에서 한다.

**[작성/수정할 코드]** `stopwatch_start`, `stopwatch_stop`,
`stopwatch_reset`, `stopwatch_elapsed_ms` 또는 팀 naming 규칙에 맞는 동등 함수.

**[실행 명령 또는 실행 방법]** debugger에서 start→stop→resume→reset sequence.

**[예상 결과]** stop 중 elapsed 고정; resume 후 누적; reset 0. SPI/UART task가
계속 실행됨.

**[Evidence]** build log, watch/debug captures, board observation.

**[Evidence target]** build=`project_evidence/week1/mcu/build/`,
debug=`project_evidence/week1/mcu/debug/`, board=`project_evidence/week1/mcu/board/`

**[Git checkpoint]** build와 debug 확인 뒤 `feat/mcu-control` commit.

**[PASS 조건]** `DEBUG_VERIFIED`; 실제 board를 관찰한 경우에만 `BOARD_VERIFIED`.

## MCU W1-3. Digital Clock

**[파일 작업]** CREATE / EDIT

**[원본]** confirmed timer/RTC resource; 없으면 NONE

**[대상]** confirmed project-owned user source

**[이 단계의 목적]** Stopwatch/SPI와 동시에 동작하는 calendar clock을 만든다.

**[필요 개념]** year/month/day/hour/minute/second/day-of-week, leap year,
month length, 1 s tick accumulation.

**[해야 할 작업]** RTC hardware 사용 여부를 먼저 결정한다. software clock이면
tick drift와 delayed main loop에도 1 s event를 잃지 않는 누적 방식을 사용한다.

**[작성/수정할 코드]** `is_leap_year`, `days_in_month`, `clock_tick_second`와
calendar state. Gregorian rule: 4의 배수 윤년, 100의 배수 제외, 400의 배수 포함.

**[실행 명령 또는 실행 방법]** 23:59:59, 월말, 2월 28/29, 연말 test vectors.

**[예상 결과]** 각 rollover 예상값과 일치하며 Stopwatch/SPI가 정지하지 않음.

**[Evidence]** test table, debugger/UART output, build log.

**[Evidence target]** `project_evidence/week1/mcu/debug/`

**[Git checkpoint]** boundary tests PASS 뒤 commit.

**[PASS 조건]** calendar boundary와 concurrent operation이 `DEBUG_VERIFIED`.

## MCU W1-4. SPI mode command

**[파일 작업]** CREATE / EDIT

**[원본]** LAB7 SPI reference and `PROJECT/STM32/project_protocol.h`

**[대상]** confirmed workspace protocol/control source

**[이 단계의 목적]** MCU→FPGA SCK/MOSI/CS 단방향 command를 먼저 안정화한다.

**[필요 개념]** PROPOSED `0x01=BYPASS`, `0x02=FILTER`; FILTER는 Week 1에
FPGA mode register/debug LED만 바꾸며 notch 동작을 의미하지 않는다.

**[해야 할 작업]** explicit CS low → one byte transmit → CS high → return code log.
command 전송을 긴 delay loop와 결합하지 않는다.

**[작성/수정할 코드]** `fpga_set_mode()`와 error counter/last status. 실제 header를
copy할 경우 provenance를 기록한다.

**[실행 명령 또는 실행 방법]** debugger 또는 button으로 0x01/0x02 반복 전송.

**[예상 결과]** logic-level transaction과 FPGA debug mode가 command와 일치.

**[Evidence]** SPI analyzer/scope 또는 FPGA LED, return codes, source commit.

**[Evidence target]** `project_evidence/week1/mcu/board/`

**[Git checkpoint]** protocol 수준 PASS 뒤 commit.

**[PASS 조건]** 0x01/0x02가 반복 전달되고 error handling이 기록됨.

## MCU W1-5. MISO 확장 준비

**[파일 작업]** KEEP / optional CREATE

**[원본]** NONE; candidate `FPGA G8 / BDIO03`

**[대상]** future full-duplex/status source

**[이 단계의 목적]** 물리 경로 확인 전 status read를 필수 경로로 만들지 않는다.

**[필요 개념]** `PACKAGE_PIN_CANDIDATE`와 verified wiring의 차이.

**[해야 할 작업]** connector, bus switch/jumper, 3.3 V compatibility, common GND,
peripheral contention을 실물로 확인한다.

**[작성/수정할 코드]** 미확인 상태에서는 interface stub/comment만 허용.

**[실행 명령 또는 실행 방법]** physical inspection/continuity; 확인 후 separate
loopback/status test.

**[예상 결과]** 확인 전 `NEEDS_PHYSICAL_BOARD_CHECK`; 확인 후 Week 1 optional.

**[Evidence]** board photo, pin labels, measurement, optional transaction.

**[Evidence target]** `project_evidence/week1/board_check/` 및
`project_evidence/week1/integration/`

**[Git checkpoint]** 확인 전 final pin assignment commit 금지.

**[PASS 조건]** MISO가 optional 상태를 유지하거나 physical evidence가 있음.

## MCU W1-6. PC/UART log

**[파일 작업]** CREATE / EDIT

**[원본]** confirmed workspace UART pattern

**[대상]** confirmed project-owned log source

**[이 단계의 목적]** mode/time/status/error를 blocking side effect 없이 관찰한다.

**[필요 개념]** ISR latency, ring buffer/event flag, periodic rate limiting.

**[해야 할 작업]** ISR에서는 작은 flag/state만 갱신하고 main/polling context에서
다음을 출력한다.

```text
MODE: BYPASS
STOPWATCH: ...
CLOCK: ...
FPGA STATUS: ...
SPI ERROR: ...
```

**[작성/수정할 코드]** periodic log formatter와 UART error handling.

**[실행 명령 또는 실행 방법]** serial terminal에서 timestamped log 수집.

**[예상 결과]** log 중에도 Stopwatch/Clock/SPI event가 누락되지 않음.

**[Evidence]** UART log와 baud/tool settings.

**[Evidence target]** `project_evidence/week1/mcu/board/`

**[Git checkpoint]** log rate와 ISR boundary review 뒤 commit.

**[PASS 조건]** UART output과 concurrent tasks가 함께 동작.

## MCU W1-7. Evidence와 상태 판정

**[파일 작업]** CREATE

**[원본]** current run logs/photos; old LAB evidence 사용 금지

**[대상]** `project_evidence/week1/mcu/`

**[이 단계의 목적]** build/debug/board 검증을 혼동하지 않는다.

**[필요 개념]** `BUILD_VERIFIED ≠ DEBUG_VERIFIED ≠ BOARD_VERIFIED`.

**[해야 할 작업]** 각 artifact에 date, branch/commit, tool, test condition,
expected, observed, interpretation을 기록한다.

**[작성/수정할 코드]** 없음; evidence metadata만 작성.

**[실행 명령 또는 실행 방법]** clean build, debugger tests, actual board tests를
별도로 수행한다.

**[예상 결과]** 미수행 항목은 `NOT_PERFORMED`로 남음.

**[Evidence]** build=`build/`, debug=`debug/`, physical=`board/`.

**[Evidence target]** `project_evidence/week1/mcu/build/`, `debug/`, `board/`

**[Git checkpoint]** source commit과 evidence run을 연결; 대용량 binary는 정책 확인.

**[PASS 조건]** 모든 주장에 맞는 verification level이 붙음.

## MCU Week 1 exit checklist

- [ ] actual workspace/resource confirmation
- [ ] non-blocking Stopwatch
- [ ] calendar boundary tests
- [ ] PROPOSED BYPASS/FILTER command
- [ ] UART log outside ISR
- [ ] build/debug/board evidence separation
- [ ] MISO remains optional until physical confirmation
