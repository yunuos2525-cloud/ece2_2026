# LAB4 PRE 요구사항 및 근거

## 1. 적용 기준

LAB4는 STM32 polling 실습과 FPGA 조합회로 추가 실습을 한 보고서에서 다룬다. 공통 작성 원칙은 `REPORT_WORKFLOW.md`와 `templates/PRE_REPORT_TEMPLATE.md`를 따르되, 세부 기능은 다음 수업자료를 우선한다.

- `C:/Users/yunji/ece2/stm32_lab/docs/STM32_0.md`
- `C:/Users/yunji/ece2/stm32_lab/docs/index.md`
- `C:/Users/yunji/ece2/stm32_lab/docs/C_basics.md`
- `C:/Users/yunji/ece2/stm32_lab/docs/FPGA_additional.md`
- `reports/_automation/STM32_PRE_REPORT_POLICY.md`

## 2. STM32 요구사항

### 2.1 확인된 source와 Build evidence

| 구분 | Source snapshot | Build evidence | 확인 범위 |
|---|---|---|---|
| Example 1 | `LAB4/STM32/01_led_polling/ece2_474_routine.c` | `stm32_evidence/build/LAB4/01_led_polling/build.log` | compile, link, `ece2_474.elf` 출력 명령 |
| Example 2 | `LAB4/STM32/02_button_polling/ece2_474_routine.c` | `stm32_evidence/build/LAB4/02_button_polling/build.log` | compile, link, `ece2_474.elf` 출력 명령 |
| Task 1 | `LAB4/STM32/03_task1_interval/ece2_474_routine.c` | `stm32_evidence/build/LAB4/03_task1_interval/build.log` | compile, link, `ece2_474.elf` 출력 명령 |
| Task 2 | `LAB4/STM32/04_task2_external_led/ece2_474_routine.c` | `stm32_evidence/build/LAB4/04_task2_external_led/build.log` | compile, link, `ece2_474.elf` 출력 명령 |

네 source snapshot과 네 `build.log`는 모두 저장소에 존재한다. 로그에는 GNU Arm toolchain의 compile 단계, link 단계, `-o ece2_474.elf`, memory usage 출력이 있다. 이 evidence는 Build 성공만 뒷받침하며 실제 LED 또는 버튼 동작을 뒷받침하지 않는다.

### 2.2 Example 1 — LED polling

요구 및 구현 확인:

- `HAL_GetTick()`으로 현재 millisecond 시간을 읽는다.
- `static uint32_t last_ms`가 마지막 상태 변경 시각을 유지한다.
- `static GPIO_PinState led_state`가 LED 출력 상태를 유지한다.
- `now_ms - last_ms >= 1000U`일 때 상태를 반전한다.
- `HAL_GPIO_WritePin(LED_ece2_GPIO_Port, LED_ece2_Pin, led_state)`로 onboard LED를 구동한다.
- LED의 ON과 OFF가 각각 약 1 s 유지되므로 한 ON/OFF cycle은 약 2 s이다.

Build 상태: SUCCESS — compile/link와 ELF 출력 명령을 `build.log`에서 확인했다.

실제 LED 동작: NOT_VERIFIED — board evidence가 없다.

### 2.3 Example 2 — Button polling

요구 및 구현 확인:

- `HAL_GPIO_ReadPin()`으로 `BUTTON_ece2` 입력을 읽는다.
- `previous`와 `current`를 비교하여 `RESET → SET` rising edge를 검출한다.
- `now_ms - last_press_ms >= 200U`로 debounce 간격을 적용한다.
- 유효한 edge에서 `HAL_GPIO_TogglePin()`으로 onboard LED를 한 번 반전한다.
- 매 호출 마지막에 `previous = current`를 수행하므로 버튼을 계속 누른 동안 새 rising edge가 생기지 않아 한 번만 처리된다.

Build 상태: SUCCESS — compile/link와 ELF 출력 명령을 `build.log`에서 확인했다.

실제 button/LED 동작: NOT_VERIFIED — board evidence가 없다.

### 2.4 Task 1 — Blink interval control

Task 1은 STM32 부분의 핵심 설계 과제이며 다음 내용을 보고서에서 가장 자세히 설명한다.

#### 기능 요구

- Onboard LED는 버튼 입력과 무관하게 계속 blink한다.
- 초기 상태 변경 interval은 1000 ms이다.
- 유효한 button press마다 interval이 `1000 → 2000 → 4000 → 8000 → 1000 ms`로 순환한다.
- Button press는 rising edge로 검출하고 200 ms debounce를 적용한다.
- 버튼을 길게 눌러도 interval은 한 번만 변경한다.
- `HAL_Delay()`를 사용하지 않고 `HAL_GetTick()` 기반 non-blocking polling으로 구현한다.
- 버튼 처리와 LED timing 처리는 독립된 두 `if` 문으로 실행한다.

#### 확인된 state와 실행 흐름

- `last_ms`: 마지막 LED toggle 시각
- `interval_ms`: 현재 LED 상태 변경 간격, 초기값 1000 ms
- `led_state`: 현재 LED 출력 상태
- `previous`: 직전 button 입력 상태
- `last_press_ms`: 마지막으로 인정된 button press 시각
- Button `if`: rising edge이면서 200 ms 조건을 만족하면 interval을 두 배로 만들고, 8000 ms 이후에는 1000 ms로 되돌린다.
- LED `if`: 마지막 toggle 이후 현재 interval 이상이 지났을 때 LED를 반전한다.
- 두 조건을 독립적으로 검사하므로 button event가 없어도 LED timing 검사가 계속된다.

#### 현재 구현의 시간 의미

Interval을 변경할 때 `last_ms`를 초기화하지 않는다. 따라서 새 interval은 기존 마지막 LED toggle 시점을 기준으로 즉시 적용된다. 예를 들어 마지막 toggle 후 1.5 s가 지난 시점에 interval이 1 s에서 2 s로 바뀌면, 다음 toggle은 button press 2 s 후가 아니라 기존 toggle 시점으로부터 총 2 s가 되었을 때 예상된다. 수업자료가 interval 변경 순간의 timer reset을 따로 요구하지 않으므로 현재 구현을 오류로 판단하거나 수정하지 않는다.

Build 상태: SUCCESS — compile/link와 ELF 출력 명령을 `build.log`에서 확인했다.

실제 interval/long-press 동작: NOT_VERIFIED — board evidence가 없다.

### 2.5 Task 2 — External LED

Task 2는 Task 1의 interval, rising-edge, debounce, non-blocking 동작을 유지하고 LED 출력만 변경한다.

- Task 1: `LED_ece2_GPIO_Port`, `LED_ece2_Pin` → onboard LED PA5
- Task 2: `GPIO_OUT1_ece2_GPIO_Port`, `GPIO_OUT1_ece2_Pin` → external LED PB0
- `C:/Users/yunji/ece2/stm32_lab/Core/Inc/main.h`에서 다음 정의를 확인했다.
  - `GPIO_OUT1_ece2_GPIO_Port = GPIOB`
  - `GPIO_OUT1_ece2_Pin = GPIO_PIN_0`
- 배선 계획은 `PB0 → 330 Ω~1 kΩ resistor → LED anode`, `LED cathode → GND`이다.

Build 상태: SUCCESS — compile/link와 ELF 출력 명령을 `build.log`에서 확인했다.

실제 PB0 external LED 동작: NOT_VERIFIED — board evidence가 없다.

### 2.6 STM32 PRE/POST 경계

PRE 보고서에는 설계 원리, 핵심 코드, 예상 시간 동작, Build 결과, 보드 검증 계획을 쓴다. 다음 항목은 보드 확보 후 관찰할 항목이며 현재 결과로 쓰지 않는다.

- Example 1의 1 s 상태 변경
- Example 2의 1 press = 1 toggle 및 long press 동작
- Task 1의 1/2/4/8 s interval 순환과 지속 blink
- Task 2의 PB0 외부 LED interval 순환

## 3. FPGA 요구사항

### 3.1 범위와 modification 정책

이번 FPGA 범위는 `FPGA_additional.md`의 다음 두 실험이다.

| 실험 | 설계 top | Simulation top | MODIFICATION_REQUIRED |
|---|---|---|---|
| 4-bit multiplier | `mult_4bit` | `tb_mult_4bit` | `NOT_REQUIRED` |
| BCD to binary | `bcd_conv` | `tb_bcd_conv` | `NOT_REQUIRED` |

수업자료에 intentional modification, intentional failure, recovery 수행 요구가 없다. 따라서 예비보고서에는 의도적 코드 수정, failure log, recovery PASS, 정상/변경/복구 비교 절을 만들지 않는다.

### 3.2 4-bit multiplier

#### Source와 설계

- `LAB4/FPGA/01_multiplier_4bit/src/multiply_unsigned.v`
- `LAB4/FPGA/01_multiplier_4bit/src/mult_4bit.v`
- `LAB4/FPGA/01_multiplier_4bit/sim/tb_mult_4bit.sv`
- `LAB4/FPGA/01_multiplier_4bit/constraints/mult_4bit.xdc`
- `LAB4/FPGA/01_multiplier_4bit/simulation.json`

`multiply_unsigned`는 `product = a * b`를 조합논리로 기술하고, `mult_4bit`가 WIDTH 4 instance를 연결해 `m[7:0]`을 출력한다.

#### TB와 evidence

- `a=0~15`, `b=0~15`의 256개 조합을 검사한다.
- 각 조합에서 `m !== x*y`이면 `$fatal`을 발생시킨다.
- 실제 PASS log: `evidence/vscode/LAB4/01_multiplier_4bit/pass.log`
- 확인된 최종 메시지: `PASS multiplier: 256 input pairs`
- 확인된 이미지:
  - `pass_log.png`
  - `waveform_overview.png`
  - `waveform_case.png`

#### 파형 설명 요구

- Overview는 `a`가 0부터 15까지 진행하고 각 `a`마다 `b`가 0부터 15까지 순회하는 전체 256-vector 구조를 보여 준다.
- 대표 시험 조건: `a=15`, `b=15`
- 예상 결과: `m=15×15=225`
- 관찰 결과: representative waveform에서 `m=225`
- 해석: 해당 대표 조합의 곱셈 출력이 예상과 일치한다. 전체 256조합의 자동 비교 통과는 PASS log가 담당하고, 대표 파형은 특정 조합의 시각적 근거이다.

### 3.3 BCD to binary

#### Source와 설계

- `LAB4/FPGA/02_bcd_to_binary/src/bcd_to_binary.v`
- `LAB4/FPGA/02_bcd_to_binary/src/bcd_conv.v`
- `LAB4/FPGA/02_bcd_to_binary/sim/tb_bcd_conv.sv`
- `LAB4/FPGA/02_bcd_to_binary/constraints/bcd_conv.xdc`
- `LAB4/FPGA/02_bcd_to_binary/simulation.json`

`bcd_to_binary`는 `binary = ten*10 + one`을 계산하고, `valid = (ten<=9)&&(one<=9)`로 두 digit이 BCD 범위인지 표시한다. `bcd_conv`가 `bin[6:0]`과 `valid`로 연결한다.

#### TB와 evidence

- `ten=0~15`, `one=0~15`의 총 256개 조합을 검사한다.
- Valid 100개와 invalid 156개에서 `valid`의 기대값을 검사한다.
- Valid 입력일 때만 `bin == ten*10+one`을 기능 검사한다.
- 실제 PASS log: `evidence/vscode/LAB4/02_bcd_to_binary/pass.log`
- 확인된 최종 메시지: `PASS BCD: 100 valid and 156 invalid inputs`
- 확인된 이미지:
  - `pass_log.png`
  - `waveform_overview.png`
  - `waveform_valid.png`
  - `waveform_invalid.png`

#### Valid 대표 파형

- 시험 조건: `ten=4`, `one=2`
- 예상 결과: `bin=42`, `valid=1`
- 관찰 결과: representative waveform에서 `bin=42`, `valid=1`
- 해석: 두 digit이 BCD 범위 안에 있고 계산 결과가 예상과 일치한다.

#### Invalid 대표 파형

- 시험 조건: `ten=10`, `one=2`
- 예상 결과: `valid=0`
- 관찰 결과: representative waveform에서 `valid=0`, `bin=102`
- 해석: `ten=10`은 BCD digit 범위를 벗어나므로 변환 결과는 유효하지 않다. 회로의 산술식은 계속 계산되어 `bin=102`가 보이지만 이를 정상 BCD 변환 결과로 해석하지 않는다. TB도 invalid 입력에서는 `bin` 값 자체를 기능 판정에 사용하지 않는다.

## 4. 보고서 구성 요구

1. 실험 목적 및 STM32/FPGA 실행 방식의 차이
2. STM32 기본 예제 — Task 이해에 필요한 범위로 압축
3. STM32 Task 1 — state, 두 `if`, non-blocking timing, interval sequence와 현재 구현의 시간 의미
4. STM32 Task 2 — PB0 변경과 배선 계획 중심
5. STM32 보드 검증 계획
6. FPGA multiplier — 설계, exhaustive TB PASS, overview와 대표 파형
7. FPGA BCD converter — valid 조건, exhaustive TB PASS, valid/invalid 대표 파형
8. 실험 당일 Vivado/FPGA board/STM32 board 검증 계획
9. 실제 사용한 수업자료

제출용 보고서에는 automation 상태 문자열, 빈 placeholder, 수행하지 않은 Vivado·bitstream·board 결과를 넣지 않는다.
