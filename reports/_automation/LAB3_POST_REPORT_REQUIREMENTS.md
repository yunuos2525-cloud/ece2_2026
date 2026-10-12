# LAB3 EXPERIMENT / POST REPORT REQUIREMENTS

> 내부 요구사항 추출 문서. 결과보고서 본문이 아니다. 매뉴얼 원문 요구, repository evidence, 사용자 확인 사실을 서로 구분한다.

## 0. 출처와 형식 권한

- 원문 archive: `C:\Users\yunji\Downloads\06.LAB3_0928_MANUALS.zip`
- archive SHA-256: `3AD0480369F46CEA6A4C0F8EE1AF653928B4575497211377860618E2CD5E2BDD`
- 작성일 표기: 2026-09-21
- 공통 원문:
  - `06.LAB3_00_CONTENTS.pdf`, pp. 3-4: 실험 19-25 목록
  - `06.LAB3_00_START.pdf`, p. 3: 필수 실험·design top
  - 같은 문서 pp. 4, 9-12: 공통 실행 순서, Icarus/XSim, 구현 단계 구분, Vivado 조건
  - 같은 문서 p. 15: 공통 실험 후 레포트 및 GitHub 요구
- 실험별 원문: `06.LAB3_01_LED_PWM_VIVADO.pdf`부터 `06.LAB3_07_UART_ECHO_VIVADO.pdf`
- 원문은 실험 목표, 검증 조건, Vivado/board 수행 및 POST 포함 항목을 명시하므로 아래 항목의 권한은 `COURSE_MATERIAL / REQUIRED_CONTENT`로 관리한다. 별도 제출 문서의 고정 목차 전체를 강제하는 `REQUIRED_FORMAT` 여부는 확인되지 않았다.

## 1. COMMON EXPERIMENT_REQUIREMENTS

출처: `06.LAB3_00_START.pdf`, pp. 3-13.

1. 실험 19-25의 RTL, TB, XDC, `simulation.json`을 작성하고 각 design top과 simulation top을 구분한다.
2. 50 MHz 단일 clock과 counter 기반 clock-enable를 사용한다.
3. VS Code/Icarus에서 PASS marker와 waveform을 확인하고, 같은 RTL/TB를 Vivado XSim에서 교차 확인한다.
4. XSim waveform에는 clock, reset, 입력, 필요한 내부 counter/state, 출력을 포함하고 유효 edge 전후를 설명한다.
5. FPGA part는 `xc7s75fgga484-1`이다.
6. 모든 top port의 `PACKAGE_PIN`, `LVCMOS33`, `clk_50mhz`의 `create_clock -period 20.000`을 확인한다.
7. Run Synthesis -> Run Implementation -> Generate Bitstream을 수행한다.
8. DRC error 0, timing WNS 0 이상, bitstream 완료를 확인·기록한다.
9. 기능 simulation, implementation/DRC/timing/bitstream, Program Device, board 물리 관찰을 서로 다른 검증 단계로 취급한다.
10. 외부 부품은 전원·공통 GND·전압·극성·driver 조건을 지킨다.

## 2. COMMON POST_REPORT_REQUIREMENTS

출처: `06.LAB3_00_START.pdf`, p. 15 및 각 실험 PDF의 "실험 후 레포트와 제출" 페이지.

1. XSim PASS와 waveform을 기록한다.
2. DRC, timing, bitstream 결과를 기록한다.
3. 실제 board 관찰과 계산값/예상값의 차이 및 원인을 설명한다.
4. 결선이 보이는 사진과 입력부터 출력 변화까지 보이는 동작 영상 링크를 첨부한다.
5. GitHub repository URL과 최종 commit hash를 기록한다.
6. `src`, `sim`, `constraints`, `simulation.json`을 최종 원본으로 관리하고 생성된 build/Vivado 파일을 source처럼 commit하지 않는다.
7. 로컬 원본이 없는 팀원 PC 수행 단계는 수행 사실과 local evidence 부재를 분리한다. 세부 값은 원본 없이 추정하지 않는다.

## 3. 실험별 EXPERIMENT_REQUIREMENTS / POST_REPORT_REQUIREMENTS

### 19 LED PWM

- 원문: `06.LAB3_01_LED_PWM_VIVADO.pdf`
- EXPERIMENT_REQUIREMENTS:
  - p. 3: 버튼 1회마다 duty 10% 변경, 8개 LED에 같은 PWM 출력; PASS `LAB3_LED_PWM_PASS checks=4`.
  - p. 5: 0%, 30%, 100%, 100% 다음 0%의 한 주기 HIGH clock 수 검사.
  - p. 25: 위 네 조건의 waveform과 입력 시점·유효 edge·상태 갱신을 설명.
  - p. 26: `LEVELS 10 -> 5` 수정, HIGH 폭 비교, 복구; 정상/변경/복구 3행 비교.
- POST_REPORT_REQUIREMENTS:
  - p. 29: 같은 RTL/TB로 XSim `checks=4`와 waveform 확인.
  - p. 31: pin/20 ns clock, synthesis/implementation/bitstream 확인.
  - p. 33: Program Device bit 기록; 버튼별 단계 이동과 0%/100%/중간 밝기 관찰; 사진에는 board/pin, 영상에는 입력과 출력 변화.
  - p. 35: 공통 POST 항목.

### 20 RGB PWM

- 원문: `06.LAB3_02_RGB_PWM_VIVADO.pdf`
- EXPERIMENT_REQUIREMENTS:
  - p. 3: R/G/B 독립 PWM, 네 RGB LED, 공통 주기·색 혼합; PASS `LAB3_RGB_PWM_PASS checks=2`.
  - pp. 5, 26: R/G/B 20/50/80% HIGH 폭과 R-only 한 단계 증가 조건.
  - p. 27: 한 색 초기 duty 수정, 혼합색·세 파형 비교 후 복구.
- POST_REPORT_REQUIREMENTS:
  - p. 30: 같은 RTL/TB로 XSim `checks=2`와 waveform 확인.
  - p. 32: pin/20 ns clock, synthesis/implementation/bitstream 확인.
  - p. 34: 각 버튼이 해당 색만 바꾸는지와 색 조합·밝기 변화를 관찰.
  - p. 36: 공통 POST 항목.
- 현재 수행 provenance: `PERFORMED_EXTERNALLY`; local implementation/DRC/timing/bitstream/Program Device evidence는 `NOT_AVAILABLE_LOCALLY`. 세부 값은 `UNKNOWN`.

### 21 Piezo

- 원문: `06.LAB3_03_PIEZO_VIVADO.pdf`
- EXPERIMENT_REQUIREMENTS:
  - p. 3: 50 MHz를 분주하여 294 Hz 사각파 출력; PASS `LAB3_PIEZO_PASS edges=5`.
  - pp. 5, 20: 가속 parameter에서 연속 출력 반전 간격 5 clocks 검사.
  - p. 21: `TONE_HZ` 변경, 분주값과 소리 변화 비교 후 복구.
- POST_REPORT_REQUIREMENTS:
  - p. 24: 같은 RTL/TB로 XSim `edges=5`와 waveform 확인.
  - p. 26: pin/20 ns clock, synthesis/implementation/bitstream 확인.
  - p. 28: Program Device bit 기록; 출력 주파수를 계산하고 실제 음 높이·음량을 관찰.
  - p. 30: 공통 POST 항목.

### 22 Stepper

- 원문: `06.LAB3_04_STEPPER_VIVADO.pdf`
- EXPERIMENT_REQUIREMENTS:
  - p. 3: clock-enable마다 4상 pattern 이동, 정·역회전과 정지 제어; PASS `LAB3_STEPPER_PASS checks=8`.
  - pp. 5, 21: 정방향 한 주기, 역방향 두 단계, `enable=0` 유지.
  - p. 22: `STEP_HZ`를 절반으로 변경, 단계 간격·회전 속도 비교 후 복구.
- POST_REPORT_REQUIREMENTS:
  - p. 25: 같은 RTL/TB로 XSim `checks=8`와 waveform 확인.
  - p. 27: pin/20 ns clock, synthesis/implementation/bitstream 확인.
  - p. 29: driver 연결 후 회전 방향·단계 속도·정지 유지·발열 관찰.
  - p. 31: 공통 POST 항목.
- 현재 수행 provenance: `PERFORMED_EXTERNALLY`; local implementation/DRC/timing/bitstream/Program Device evidence는 `NOT_AVAILABLE_LOCALLY`. 세부 값은 `UNKNOWN`.

### 23 MM:SS Clock

- 원문: `06.LAB3_05_MMSS_CLOCK_VIVADO.pdf`
- EXPERIMENT_REQUIREMENTS:
  - p. 3: 1초 enable로 00:00-59:59 계수, 4자리 7-segment scan; PASS `LAB3_MMSS_PASS checks=7`.
  - pp. 5, 26: 00:09->00:10, 00:59->01:00, 59:59->00:00, 전체 3600초 순환과 decoder 검사.
  - p. 27: TB `CLK_HZ` 변경, 자리올림 간격 비교 후 복구.
- POST_REPORT_REQUIREMENTS:
  - p. 30: 같은 RTL/TB로 XSim `checks=7`와 waveform 확인.
  - p. 32: pin/20 ns clock, synthesis/implementation/bitstream 확인.
  - p. 34: 자리 순서·극성·분초 구분점·1초 간격·59:59 순환을 board에서 확인.
  - p. 36: 공통 POST 항목.
- project provenance: 최종 source of truth 및 실제 사용 project는 `project3_55`; XSim과 implementation evidence도 `project3_55` 기준으로 연결한다. `project3_5`는 최종 source of truth로 사용하지 않는다. `project3_5`의 생성 이유 또는 `project3_55`로 변경된 이유는 `UNKNOWN`이며 추정하지 않는다.
- 현재 board 범위: 조교 지시에 따라 약 1분간 MM:SS 정상 counting 동작을 확인했으며 `VERIFIED / USER_CONFIRMED`이다. 1시간 관찰 및 59:59->00:00 board 관찰은 이 실제 지시 범위에 포함되지 않았으므로 evidence 부족이나 검증 실패로 판정하지 않는다. 00:09->00:10, 00:59->01:00, 59:59->00:00의 정확한 세 경계는 Vivado simulation에서 검증한 것으로 분리한다.

### 24 Character LCD

- 원문: `06.LAB3_06_CHARACTER_LCD_VIVADO.pdf`
- EXPERIMENT_REQUIREMENTS:
  - p. 3: HD44780 호환 LCD를 8-bit write-only 방식으로 초기화하고 두 줄 문자열 표시; PASS `LAB3_LCD_PASS bytes=40`.
  - pp. 5, 26: Enable 하강 edge에서 초기화 command와 두 줄 data 총 40 bytes 및 RS 검사.
  - p. 27: 둘째 줄 문자 한 글자 변경, ASCII/표시 결과 비교 후 복구.
- POST_REPORT_REQUIREMENTS:
  - p. 30: 같은 RTL/TB로 XSim `bytes=40`과 waveform 확인.
  - p. 32: pin/20 ns clock, synthesis/implementation/bitstream 확인.
  - p. 34: 전압·대비 확인 후 `FPGA LAB3` / `LCD CONTROLLER` 최종 문자열 확인.
  - p. 36: 공통 POST 항목.
- 현재 수행 provenance: `PERFORMED_EXTERNALLY`; local implementation/DRC/timing/bitstream/Program Device evidence는 `NOT_AVAILABLE_LOCALLY`. 세부 값은 `UNKNOWN`.

### 25 UART Echo

- 원문: `06.LAB3_07_UART_ECHO_VIVADO.pdf`
- EXPERIMENT_REQUIREMENTS:
  - p. 3: 9600 8N1 수신 byte를 재송신하고 LED에 마지막 수신값 표시; PASS `LAB3_UART_ECHO_PASS checks=3`.
  - pp. 5, 25: `0x41`, `0x5A`, `0x0A` echo, LED, framing error 부재 검사.
  - p. 26: BAUD 변경, bit 시간 비교 후 복구.
- POST_REPORT_REQUIREMENTS:
  - p. 29: 같은 RTL/TB로 XSim `checks=3`와 waveform 확인.
  - p. 31: pin/20 ns clock, synthesis/implementation/bitstream 확인.
  - p. 33: terminal을 9600 8N1, local echo off로 설정; 문자당 반환 문자 하나와 LED 값 확인; Program Device bit 기록.
  - p. 35: 공통 POST 항목.
- 실제 조교 시연: 25 UART Echo (`USER_CONFIRMED`).
- 현재 evidence 판정:
  - terminal에서 A 송신 후 A 표시: 확인됨.
  - board overview에서 LED2와 LED8 ON, 나머지 OFF: LED1-LED8이 MSB->LSB인 현재 mapping에서 `8'b0100_0001 = 8'h41`, ASCII `A`; `VERIFIED_BY_BOARD_PHOTO`.
  - Vivado waveform의 `0x41` RX -> LED 저장 -> TX echo: 확인됨.
  - 실제 시연 당시 terminal local echo OFF: `USER_CONFIRMED / VERIFIED`; terminal에 표시된 반환 A는 local echo가 아닌 FPGA echo 결과로 해석 가능.
  - COM9 open 화면과 A echo 화면의 동일 session 연속성: `UNKNOWN`.

## 4. 보고서 적용 규칙

- PRE representative case -> Vivado waveform -> board 물리 출력 -> 해석을 실험별로 연결한다.
- board 관찰은 duty/frequency/internal state/command timing을 증명하지 않는다.
- 20/22/24의 외부 수행 사실은 기록하되 local 원본이 없는 DRC/timing/warning/bitstream 수치를 작성하지 않는다.
- 요구는 충족 여부와 별개다. 미확인 요구는 `UNKNOWN` 또는 `NOT_VERIFIED`로 자연스럽게 제한을 설명한다.
- 결과보고서 작성은 `START_ALLOWED_WITH_OPEN_QA`; open QA가 있다는 이유로 확인된 결과까지 작성하지 못하는 상태는 아니다.
