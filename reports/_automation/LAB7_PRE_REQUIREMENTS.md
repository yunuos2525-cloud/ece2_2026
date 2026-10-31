# LAB7 PRE 요구사항 및 준비 계획

작성일: 2026-10-31  
범위: STM32_3 Task 8~12, 총 5개  
현재 단계: 요구사항/폴더/draft simulation 설정 준비  
실행 상태: simulation NOT_PERFORMED, MCU Build NOT_PERFORMED, Vivado NOT_PERFORMED, board NOT_PERFORMED

## 1. 기준 자료와 형식 권한

### 확인한 자료

| 자료 | 존재 | 적용 |
|---|---|---|
| `C:/Users/yunji/ece2/stm32_lab/docs/STM32_3.md` | YES | Task 8~12의 직접 요구, SPI 조건, 제공 MCU 코드 |
| `C:/Users/yunji/ece2/stm32_lab/docs/index.md` | YES | 4주 범위, 장비 조 편성, source 전환 절차 |
| `C:/Users/yunji/ece2/stm32_lab/docs/STM32_4week_plan.pdf` | YES | 공통 안내 슬라이드; 11쪽 LAB7 범위, 12쪽 보고서 지침 |
| `reports/_automation/REPORT_WORKFLOW.md` | YES | 내부 검증/evidence 권장 workflow |
| `reports/_automation/templates/PRE_REPORT_TEMPLATE.md` | YES | 내부 동적 PRE 골격 |
| `reports/_automation/references/COURSE_REPORT_FORMAT.md` | YES | 형식 권한 구분 및 참고 목차 |
| `reports/pre/LAB6_pre_report.md` | YES | 이전 제출의 문체/증거 밀도 참고; LAB7 요구 출처 아님 |

두 저장소에서 LAB7 전용 PPT/PPTX/ZIP은 발견하지 못했다. 공통 슬라이드는 위 12쪽 PDF 하나이며, Markdown 교안이 상세 요구를 제공한다. `FPGA_additional.md`는 별도 FPGA 실습 자료이지만 `STM32_3.md`, `index.md`, 공통 슬라이드가 모두 LAB7에서 별도 FPGA 실습을 제외하므로 이 LAB 범위에 포함하지 않는다.

### 교안 직접 요구와 내부 workflow 권장 구분

| 구분 | 교안 직접 요구(COURSE_MATERIAL) | 내부 workflow 권장(INTERNAL) |
|---|---|---|
| 범위 | Task 8~12만 수행, I2C 및 별도 FPGA 추가 실습 제외 | 각 task의 source/run/evidence를 경로로 분리 |
| SPI | Mode 0, 8-bit, MSB-first, SCK idle LOW, rising sample, falling update, first-MSB preload, CS LOW, MISO 미사용 | edge별 assertion과 self-checking TB 사용 |
| 데이터 | `0x55`, `0xA5`, `0x00`, `0xFF` 비교 | 네 값을 같은 regression에 포함하고 expected bit 열을 표로 작성 |
| Task 8 | MCU 송신 예제 실행, scope로 SCK/MOSI/CS와 주파수 확인 | Build log, serial log, scope 원본과 report용 캡처 분리 |
| Task 9 | 두 MCU 연결, VCP RX 일치, 역할 교대 | master/slave source snapshot과 각 역할 evidence 분리 |
| Task 10 | FPGA receiver 직접 작성, FPGA UART 출력, 먼저 TB에서 bit order와 CS 해제 후 다음 byte 확인 | async input synchronization, byte-valid, partial-frame abort를 TB assertion으로 검사 |
| Task 11 | FPGA master 직접 작성, SCK <=1 MHz, 1초마다 byte, scope 후 MCU RX 확인 | divider 식/실제 parameter를 manifest에 기록하고 unit TB에서 edge timing 검사 |
| Task 12 | Task 11 master + Task 10 receiver 재사용, FPGA UART 확인, 역할 교대 | 공통 RTL을 단일 source of truth로 두고 end-to-end TB 수행 |
| 보고서 | 표지 이름/학번, 본문 2단, PDF, 설계 목표/방법/핵심 코드/회로/검증, 예상-실제 비교, 문제해결/결론, GitHub 주소/제출 tag/commit, 전체 source/시연 링크, 허용 출처 1개 이상 | source state, run ID, hash, gate, evidence 무결성, user waveform observation 상태 추적 |
| 결과 진술 | 실제 결과를 확인해야 함 | 미수행은 NOT_PERFORMED/NOT_VERIFIED로 유지; PASS와 waveform/board를 구분 |

공통 슬라이드 12쪽의 보고서 항목은 LAB7에 적용되는 명시적 GENERAL_GUIDANCE/REQUIRED_CONTENT로 취급한다. 단, 완전한 목차 순서가 강제되었다는 근거는 없으므로 전체 목차는 REQUIRED_FORMAT으로 승격하지 않는다.

## 2. 공통 설계 조건과 예상 bit pattern

| 항목 | 요구/예상 |
|---|---|
| CPOL/CPHA | Mode 0: idle LOW, 첫/rising edge에서 sample |
| data width/order | 8-bit, MSB-first |
| transmit timing | 첫 rising edge 전에 bit 7 준비, 각 falling edge에서 다음 bit 준비 |
| receive timing | CS LOW 동안 rising edge 8회에서 MOSI sample |
| chip select | active LOW; frame 밖은 선택 해제 |
| data line | MOSI만 사용, MISO 연결하지 않음 |
| MCU default SCK | 교안/IOC 기준 약 781.25 kHz; 계산 주기 1.28 us. 실제값은 Task 8에서 측정 전까지 NOT_VERIFIED |
| FPGA master SCK | 1 MHz 이하; `SCK = FPGA_CLK / (2 * HALF_PERIOD_CYCLES)`를 만족하도록 parameter 결정 |
| voltage/wiring | 3.3 V, SCK/MOSI/CS/GND; 공통 GND |

| byte | rising edge에서 읽을 MOSI(bit 7→0) |
|---:|---|
| `0x55` | `0 1 0 1 0 1 0 1` |
| `0xA5` | `1 0 1 0 0 1 0 1` |
| `0x00` | `0 0 0 0 0 0 0 0` |
| `0xFF` | `1 1 1 1 1 1 1 1` |

## 3. Task별 EXPERIMENT_REQUIREMENTS / PRE_REPORT_REQUIREMENTS

### Task 8 - MCU SPI 송신 및 scope 파형

1. 설계 기능
   - STM32 SPI1 master가 1초마다 한 byte를 전송한다.
   - GPIO PB6으로 CS를 LOW로 내린 뒤 `HAL_SPI_Transmit`을 호출하고 HIGH로 복구한다.
2. 제공 코드 / 학생 작업
   - 제공: master 설정이 포함된 기본 template, `polling_routine()` 송신 예제.
   - 학생: 이전 UART 코드를 정리하고 예제를 적용/이해하며 네 시험값을 실행하는 방법을 정한다. 값 변경을 여러 build로 할지 순차 송신으로 확장할지는 아직 UNKNOWN이며, 선택 시 source와 evidence가 어떤 byte인지 식별해야 한다.
3. 시험 입력
   - `0x55`, `0xA5`, `0x00`, `0xFF`; SCK/MOSI/CS/GND, 3.3 V.
4. 예상 출력/파형
   - CS LOW 안에서 SCK rising edge 8회, idle LOW, MOSI는 위 bit pattern, 반환값 0은 HAL 송신 함수 종료만 의미한다.
   - 약 781.25 kHz/1.28 us는 예상값이며 실제 측정 전에는 관찰값으로 쓰지 않는다.
5. simulation 가능 범위
   - Icarus FPGA simulation 대상 아님. 소프트웨어 source review와 MCU Build만 사전 확인 가능하며 scope 동작을 대체하지 않는다.
6. board-only 범위
   - 실제 SCK 주파수/주기, MOSI bit 순서, CS 구간, 전기적 파형.
7. PRE 핵심 코드/그림
   - CS 제어 + `HAL_SPI_Transmit` 핵심 block, Mode 0 timing diagram 또는 예상 bit 표, 실제 수행 후 scope 캡처.
8. Evidence
   - Build: `stm32_evidence/build/LAB7/01_task8_spi_tx_scope/`
   - Debug: `stm32_evidence/debug/LAB7/01_task8_spi_tx_scope/`
   - Scope/board: `stm32_evidence/board/LAB7/01_task8_spi_tx_scope/`

현재 observed result: NOT_PERFORMED.

### Task 9 - MCU to MCU SPI 수신

1. 설계 기능
   - master MCU가 byte를 보내고 slave MCU가 SPI1 hardware NSS로 수신하여 VCP UART에 `RX=%02X`를 출력한다.
   - 지정 조끼리 연결하고 두 보드 모두 master/slave 역할을 수행한다.
2. 제공 코드 / 학생 작업
   - 제공: Task 8 master 예제, slave용 PA4 NSS 정의, `ece2_474_init()`의 SPI1 slave 재초기화, blocking receive/timeout routine.
   - 학생: 두 role source를 구분해 적용/검토하고 역할 교대 때 프로그램과 CS 배선을 모두 바꾼다.
3. 시험 입력
   - 네 byte; master PB3→slave PB3, master PA7→slave PA7, master PB6→slave PA4, GND→GND.
4. 예상 출력/파형
   - 각 성공 frame에서 slave VCP UART 값이 송신 byte와 일치한다. 송신이 없을 때 2초 timeout은 정상 대기 결과일 수 있다.
5. simulation 가능 범위
   - Icarus 대상 아님. 두 C source의 Build와 설정 review만 가능.
6. board-only 범위
   - 실제 두 MCU 간 수신값 일치, timeout/배선 영향, 역할 교대 성공.
7. PRE 핵심 코드/그림
   - slave 재초기화 block, receive/timeout block, MCU-MCU wiring diagram, 송수신 예상표. 실제 결과는 수행 후에만 삽입.
8. Evidence
   - Build: `stm32_evidence/build/LAB7/02_task9_mcu_to_mcu/{master,slave}/`
   - Debug: `stm32_evidence/debug/LAB7/02_task9_mcu_to_mcu/{role_a_master,role_b_master}/`
   - Board: `stm32_evidence/board/LAB7/02_task9_mcu_to_mcu/`

현재 observed result: NOT_PERFORMED.

### Task 10 - MCU to FPGA SPI receiver

1. 설계 기능
   - FPGA에서 CS 확인, SCK rising edge 검출, MOSI 8-bit MSB-first shift, bit count, receive-complete 처리.
   - 받은 byte를 FPGA UART로 PC에 출력한다.
2. 제공 코드 / 학생 작업
   - 제공: MCU master example과 SPI timing/기능 요구. FPGA Verilog 정답은 제공하지 않음.
   - 학생 직접 작성: `spi_slave_rx.v`, Task 10 top wrapper, self-checking TB. FPGA UART module은 기존 LAB6 `uart.v` 재사용 후보이나 교수 제공 코드라고 분류하지 않으며, 복사 전 source provenance/review 상태를 확인한다.
3. 시험 입력
   - Mode 0 SCK/MOSI/CS로 네 byte. CS HIGH idle, 각 frame 사이 해제 구간, partial frame 후 CS 해제 보조 검사 권장.
4. 예상 출력/파형
   - 각 CS LOW frame의 8번째 rising edge 후 received byte와 one-cycle valid가 예상값과 일치한다. CS HIGH 후 count/state가 다음 byte를 받을 준비가 된다.
5. simulation 검증 범위
   - REQUIRED: four-byte bit order, CS gating, rising-edge sampling, 8-bit completion, CS HIGH 후 다음 byte, valid pulse.
   - INTERNAL 권장: SCK/CS/MOSI가 FPGA system clock에 비동기라는 조건을 반영한 위상 변화와 partial frame abort.
   - UART serial waveform 전체 재검증은 기존 UART module을 그대로 재사용하고 provenance가 확인되면 OPTIONAL; SPI byte→UART launch handshake는 top integration에서 확인 권장.
6. board-only 범위
   - MCU와 FPGA 실제 배선, FPGA UART가 PC에서 같은 값으로 보이는지, 전압/신호 integrity.
7. PRE 핵심 코드/그림
   - synchronizer/edge detector, shift/count/valid 핵심 RTL 1~2 block, receiver block diagram, four-byte expected table, 실제 simulation PASS/waveform(실행 후).
8. Evidence
   - VS Code: `evidence/vscode/LAB7/03_task10_mcu_to_fpga_rx/`
   - Vivado: `evidence/vivado/LAB7/03_task10_mcu_to_fpga_rx/`
   - FPGA board: `evidence/board/LAB7/03_task10_mcu_to_fpga_rx/`
   - MCU build/debug/board: 대응하는 `stm32_evidence/*/LAB7/03_task10_mcu_to_fpga/`

현재 RTL/TB/result: NOT_CREATED / NOT_PERFORMED.

### Task 11 - FPGA to MCU SPI master

1. 설계 기능
   - FPGA가 1초마다 한 byte의 CS/SCK/MOSI frame을 출력한다.
   - SCK 1 MHz 이하, Mode 0, first-MSB preload, falling-edge next-bit update.
2. 제공 코드 / 학생 작업
   - 제공: timing/속도/주기/시험 요구와 MCU slave code. FPGA Verilog 정답은 제공하지 않음.
   - 학생 직접 작성: `spi_master_tx.v`, one-second trigger/board wrapper, self-checking TB.
3. 시험 입력
   - 네 byte, parameterized FPGA clock/divider, transfer trigger. 실제 MCU는 PA4 NSS/PB3 SCK/PA7 MOSI/GND.
4. 예상 출력/파형
   - idle에서 SCK LOW/CS HIGH. CS LOW 뒤 첫 rising edge 전 bit 7 valid, rising edge 8회, falling edge마다 다음 bit, 종료 후 SCK LOW/CS HIGH.
5. simulation 검증 범위
   - REQUIRED: Mode 0 idle, CS frame, bit order, edge count, preload/update timing, byte completion, inter-frame idle, selected parameters에서 SCK <=1 MHz.
   - 1초 interval은 축소 parameter로 구조를 검사할 수 있으나 실제 board 1초와 혼동하지 않는다.
6. board-only 범위
   - 실제 SCK 주파수와 scope 파형, MCU VCP UART received byte, 실제 1초 frame 간격.
7. PRE 핵심 코드/그림
   - divider/phase 또는 state machine 핵심 RTL, divider calculation, expected Mode 0 waveform, 실제 simulation/실측 캡처(수행 후).
8. Evidence
   - VS Code: `evidence/vscode/LAB7/04_task11_fpga_to_mcu_tx/`
   - Vivado: `evidence/vivado/LAB7/04_task11_fpga_to_mcu_tx/`
   - FPGA board: `evidence/board/LAB7/04_task11_fpga_to_mcu_tx/`
   - MCU build/debug/board: 대응하는 `stm32_evidence/*/LAB7/04_task11_fpga_to_mcu/`

현재 RTL/TB/result: NOT_CREATED / NOT_PERFORMED.

### Task 12 - FPGA to FPGA SPI

1. 설계 기능
   - 한 FPGA는 reviewed Task 11 master, 다른 FPGA는 reviewed Task 10 receiver를 사용한다.
   - receiver FPGA가 받은 값을 UART로 PC에 출력하고 두 보드의 역할을 교대한다.
2. 제공 코드 / 학생 작업
   - 새 정답 RTL 제공 없음. Task 10/11 학생 작성 RTL을 그대로 재사용한다.
   - 학생 직접 작성: 두 core를 직접 연결하는 integration TB. 새 기능을 위해 master/receiver 복사본을 만들지 않는다.
3. 시험 입력
   - 네 byte, direct SCK/MOSI/CS/GND link, role swap.
4. 예상 출력/파형
   - master가 보낸 byte와 receiver byte/valid가 frame마다 일치한다. frame 사이 idle과 CS 해제 후 재수신이 유지된다.
5. simulation 검증 범위
   - REQUIRED: Task 11 output을 Task 10 input에 직접 연결한 end-to-end four-byte comparison, edge/frame count, multiple transfers.
   - board A/B의 물리적 역할 교대 자체는 simulation으로 증명할 수 없다.
6. board-only 범위
   - 두 FPGA 연결, receiver UART 출력, 역할 교대, 실제 connector/pin/ground.
7. PRE 핵심 코드/그림
   - master→receiver connection diagram, reused-source identity 표, end-to-end TB 핵심 connection/check, 실제 PASS/waveform(실행 후).
8. Evidence
   - VS Code: `evidence/vscode/LAB7/05_task12_fpga_to_fpga/`
   - Vivado: Task 10/11 project evidence와 Task 12 role mapping을 `evidence/vivado/LAB7/05_task12_fpga_to_fpga/`에 기록.
   - Board: `evidence/board/LAB7/05_task12_fpga_to_fpga/`

현재 RTL/TB/result: NOT_CREATED / NOT_PERFORMED.

## 4. 최종 권장 폴더 구조

```text
LAB7/
├─ STM32/
│  ├─ 01_task8_spi_tx_scope/
│  ├─ 02_task9_mcu_to_mcu/
│  │  ├─ master/
│  │  └─ slave/
│  ├─ 03_task10_mcu_to_fpga/
│  └─ 04_task11_fpga_to_mcu/
└─ FPGA/
   ├─ common/src/
   ├─ 03_task10_mcu_to_fpga_rx/
   │  ├─ src/
   │  ├─ sim/
   │  └─ constraints/
   ├─ 04_task11_fpga_to_mcu_tx/
   │  ├─ src/
   │  ├─ sim/
   │  └─ constraints/
   └─ 05_task12_fpga_to_fpga/
      └─ sim/

evidence/vscode/LAB7/{03_task10_mcu_to_fpga_rx,04_task11_fpga_to_mcu_tx,05_task12_fpga_to_fpga}/
evidence/vivado/LAB7/{03_task10_mcu_to_fpga_rx,04_task11_fpga_to_mcu_tx,05_task12_fpga_to_fpga}/
evidence/board/LAB7/{01_task8_spi_tx_scope,02_task9_mcu_to_mcu,03_task10_mcu_to_fpga_rx,04_task11_fpga_to_mcu_tx,05_task12_fpga_to_fpga}/
stm32_evidence/build/LAB7/{01_task8_spi_tx_scope,02_task9_mcu_to_mcu,03_task10_mcu_to_fpga,04_task11_fpga_to_mcu}/
stm32_evidence/debug/LAB7/{01_task8_spi_tx_scope,02_task9_mcu_to_mcu,03_task10_mcu_to_fpga,04_task11_fpga_to_mcu}/
stm32_evidence/board/LAB7/{01_task8_spi_tx_scope,02_task9_mcu_to_mcu,03_task10_mcu_to_fpga,04_task11_fpga_to_mcu}/
```

Evidence task subfolders are created when real evidence exists; empty result directories are not treated as evidence.

## 5. Task별 구현 파일 목록

| Task | 파일 | 상태/출처 |
|---|---|---|
| 8 | `LAB7/STM32/01_task8_spi_tx_scope/ece2_474_routine.c` | 다음 단계에 course example 기반 생성; 학생 review 필요 |
| 9 | `LAB7/STM32/02_task9_mcu_to_mcu/master/ece2_474_routine.c` | Task 8 reviewed source reuse |
| 9 | `LAB7/STM32/02_task9_mcu_to_mcu/slave/ece2_474_routine.c` | course slave example 기반 생성; 학생 review 필요 |
| 10 | `LAB7/FPGA/common/src/spi_slave_rx.v` | 학생 직접 작성 예정 |
| 10 | `LAB7/FPGA/03_task10_mcu_to_fpga_rx/src/task10_mcu_fpga_rx_top.v` | 학생 직접 작성 예정; UART integration |
| 10 | `LAB7/FPGA/03_task10_mcu_to_fpga_rx/sim/tb_task10_spi_slave_rx.sv` | 학생/TB 직접 작성 예정 |
| 10 | `LAB7/FPGA/03_task10_mcu_to_fpga_rx/simulation.json` | draft 생성됨; RTL/TB 생성 전 실행 불가 |
| 10 | `LAB7/FPGA/03_task10_mcu_to_fpga_rx/constraints/task10_mcu_fpga_rx.xdc` | pin evidence 대기; 미생성 |
| 11 | `LAB7/FPGA/common/src/spi_master_tx.v` | 학생 직접 작성 예정 |
| 11 | `LAB7/FPGA/04_task11_fpga_to_mcu_tx/src/task11_fpga_mcu_tx_top.v` | 학생 직접 작성 예정 |
| 11 | `LAB7/FPGA/04_task11_fpga_to_mcu_tx/sim/tb_task11_spi_master_tx.sv` | 학생/TB 직접 작성 예정 |
| 11 | `LAB7/FPGA/04_task11_fpga_to_mcu_tx/simulation.json` | draft 생성됨; RTL/TB 생성 전 실행 불가 |
| 11 | `LAB7/FPGA/04_task11_fpga_to_mcu_tx/constraints/task11_fpga_mcu_tx.xdc` | pin evidence 대기; 미생성 |
| 12 | `LAB7/FPGA/05_task12_fpga_to_fpga/sim/tb_task12_fpga_spi_link.sv` | Task 10/11 cores를 연결해 직접 작성 예정 |
| 12 | `LAB7/FPGA/05_task12_fpga_to_fpga/simulation.json` | draft 생성됨; RTL/TB 생성 전 실행 불가 |

## 6. PRE simulation 및 evidence 수집 계획

### FPGA 실행 순서(Task 10~12)

1. 위 requirements와 file/module 이름을 학생이 검수한다.
2. RTL/TB를 GENERATED_DRAFT로 작성하고 `simulation.json` 경로와 module을 일치시킨다.
3. 학생이 목적, edge timing, shift/count, divider, TB expected를 설명해 REVIEWED로 전환한다.
4. tool check 후 Icarus normal run을 task별로 새로 실행한다.
5. actual `simulation.log`, PASS/check count, end time, VCD, run directory, source commit/dirty 상태를 기록한다.
6. 사용자가 VaporView에서 필수 신호/구간을 직접 확인하고 screenshot을 승인한다.
7. 교안에 intentional failure 요구가 없으므로 `MODIFICATION_REQUIRED = NOT_REQUIRED`; 임의 failure/recovery를 만들지 않는다.

### 필수 waveform 후보

| Task | 전체/대표 신호 | 대표 구간 |
|---|---|---|
| 10 | system clock, reset, CS sync, SCK sync/rise pulse, MOSI sync, bit count, shift register, rx_data, rx_valid | `0xA5`의 mixed-bit frame과 CS HIGH 후 다음 frame 시작 |
| 11 | system clock, trigger, CS, SCK, MOSI, bit index/state, busy/done | first-MSB preload부터 8번째 rising edge 및 idle 복귀 |
| 12 | master CS/SCK/MOSI, master byte/busy, slave count/data/valid | master byte와 slave received byte가 같은 end-to-end frame, 연속 두 frame |

이 표는 내부 capture plan이며, 실제 RTL/TB timing이 정해진 뒤 정확한 시간 구간을 계산한다. VCD 존재만으로 waveform visual verification을 완료 처리하지 않는다.

### MCU/physical evidence

- Build log는 compile/link 사실만 증명한다.
- Task 8 scope, Task 9 dual-MCU VCP, Task 10 FPGA UART, Task 11 scope+MCU VCP, Task 12 dual-FPGA UART/role swap은 실제 수행 전까지 NOT_PERFORMED이다.
- 각 physical evidence는 시험 byte, role, wiring, observed value를 함께 기록한다.
- HAL return 0, bitstream 생성, Program Device 화면은 상대 장치의 기능 성공을 단독으로 증명하지 않는다.

## 7. 부족한 자료 / 확인 queue

1. FPGA connector의 SCK/MOSI/CS package pin 근거가 없음. 이 세 신호의 XDC는 만들 수 없다.
2. Task 10/12 FPGA UART output에 사용할 board top port/pin은 LAB6 XDC에 후보가 있으나, LAB7 연결 자료로 재사용해도 되는지 확인이 필요하다.
3. FPGA board part와 50 MHz clock은 이전 LAB6 자료에 존재하지만 LAB7 project/device 설정의 직접 근거를 다시 확인해야 한다.
4. 네 시험 byte를 Task 8/11에서 한 source가 순환 송신할지, byte별 build/run으로 수행할지 교안은 고정하지 않는다. 구현 전에 학생 선택 필요.
5. Task 10 UART module은 LAB6 source 재사용 후보이다. source identity와 review/simulation 상태를 확인한 뒤 복사 또는 shared reuse 방식을 결정한다.
6. Task 10/11 top-level port names, design top, reset polarity는 RTL 작성 전 확정해야 한다.
7. Task 9/12 역할 교대의 실제 조 상대, COM port, 장비 식별자는 실험 당일 확인해야 한다.
8. PRE 제출 tag/commit 값은 아직 생성/승인되지 않았다. 공통 슬라이드는 기록을 요구하지만 이번 단계에서 값을 꾸미거나 Git 작업을 하지 않는다.
9. GitHub source/demo 링크의 최종 경로와 실제 제출용 media 수량은 아직 UNKNOWN이다.

## 8. 이번 단계의 금지/상태

- RTL/TB/C/XDC 실코드: NOT_CREATED
- Icarus simulation / MCU Build / Vivado: NOT_PERFORMED
- scope / UART / board observation: NOT_PERFORMED
- PRE Markdown/PDF 본문: NOT_CREATED
- Git add/commit/push/tag: NOT_PERFORMED
- 기존 LAB6/이전 제출물 변경: NONE

