# LAB2 02_clock_divider — EXPERIMENT_REQUIREMENTS

상태: COURSE_EXTRACTED. 이 문서는 실행 결과가 아니다. 출처는 `C:\Users\yunji\Downloads\05.LAB2_0921_VIVADO_8plus1.zip`의 `05.LAB2_02_CLOCK_DIVIDER_VIVADO.pdf` 전체 1~80쪽이다. 아래 시각은 교안과 TB에서 도출한 **예상 simulation 시각**이며 실제 실행 시각이 아니다.

## 1. 파일·top·도구

| 항목 | 상태 | 교안 근거 | 요구 내용 |
|---|---|---|---|
| 템플릿 | REQUIRED | 3~9쪽 | `fpga-lab-template` v2.0.1, `LAB1.code-workspace`; placeholder를 교안 코드로 교체 |
| RTL | REQUIRED | 10쪽, 16~22쪽 | `src/clock_divider.v`, `src/input_frontend.v`, `src/lab2_clock_divider.v` |
| TB | REQUIRED | 10쪽, 25~27쪽 | `sim/tb_clock_divider.sv` |
| XDC | REQUIRED | 10쪽, 28~31쪽 | `constraints/lab2_clock_divider.xdc`; 포트 `clk`, `rst`, `button`, `sw[7:0]`, `led[7:0]`에 대한 교안 핀·I/O·클록 제약 |
| design module/top | REQUIRED | 21~22쪽, 46쪽, 61쪽 | `lab2_clock_divider` |
| simulation module/top | REQUIRED | 11~12쪽, 25쪽, 46쪽, 60~61쪽 | `tb_clock_divider` |
| `simulation.json` | REQUIRED | 11~12쪽 | `sources=["src/clock_divider.v","src/input_frontend.v","src/lab2_clock_divider.v"]`; `testbench="sim/tb_clock_divider.sv"`; `simulation_top="tb_clock_divider"` |
| 실행 도구 | REQUIRED | 7~8쪽, 32~33쪽 | VS Code `02 Simulate`는 Icarus; Vivado GUI `Run Behavioral Simulation`은 XSim. `01 Check tools`로 도구 확인 |

## 2. 핵심 동작과 계산

| 항목 | 상태 | 교안 근거 | 요구 내용 |
|---|---|---|---|
| 분주 코어 | REQUIRED | 13~17쪽 | `DIVISOR`는 짝수이며 2 이상. `count`는 0~`DIVISOR-1`을 순환한다. `divided`는 `count==DIVISOR/2-1`을 읽은 주 클록 에지에서 1, `count==DIVISOR-1`을 읽은 에지에서 0이 된다. |
| tick | REQUIRED | 13~17쪽 | `tick = !rst && (count == DIVISOR-1)`. 종료 count 동안 주 클록 한 주기 폭으로 1이며 다음 상승 에지에서 enable로 소비한다. `divided`를 다른 `always`의 클록으로 사용하지 않는다. |
| 리셋 | REQUIRED | 16~17쪽, 43쪽 | 코어의 `count`와 `divided`는 상승 에지에서 리셋된다. `tick`은 `!rst` 조건으로 리셋 입력 즉시 0으로 마스킹된다. 첫 동기 리셋 에지 전 0~5 ns의 X는 미정 상태다. |
| 보드 입력 처리 | REQUIRED | 18~22쪽 | `input_frontend`가 리셋 해제·버튼·스위치를 처리하지만 이 분주비는 버튼/N8 및 DIP 스위치로 바뀌지 않는다. 보드 top은 2·10·50·`DIVISOR=1000` 분주와 tick을 LED에 배치한다. |
| 계산식 | REQUIRED | 13~15쪽, 23쪽, 45쪽 | 주기 `T_out=DIVISOR×T_clk`, 주파수 `f_out=f_clk/DIVISOR`; 짝수 분주에서 High/Low 각각 `DIVISOR/2×T_clk`이므로 duty 50%. tick 폭은 `T_clk`. |

`DIVISOR=10`의 에지 뒤 상태는 교안 14쪽 기준으로 `count=0~4`일 때 `divided=0,tick=0`, `count=5~8`일 때 `divided=1,tick=0`, `count=9`일 때 `divided=1,tick=1`, 다음 에지에서 `count=0,divided=0,tick=0`이다. 오른쪽 항은 에지 **직전** count를 읽는다.

| 조건 | 입력 주기 | divided 주기 | High/Low | tick |
|---|---:|---:|---:|---|
| TB `DIVISOR=10` | 10 ns | 100 ns | 50 ns / 50 ns | 10 ns 폭, 100 ns 간격 |
| 보드 `DIVISOR=10` | 1 ms (1 kHz) | 10 ms (100 Hz) | 5 ms / 5 ms | 1 ms 폭, 10 ms 간격 |
| 보드 `DIVISOR=1000` | 1 ms (1 kHz) | 1 s (1 Hz) | 0.5 s / 0.5 s | 1 ms 폭, 1 s 간격 |

교안 근거: 13~15쪽, 23쪽. TB의 100 MHz는 빠른 기능 검사 조건이며 실제 보드 클록은 1 kHz이다.

## 3. 정상 TB와 필수 파형

| 항목 | 상태 | 교안 근거 | 요구 내용 |
|---|---|---|---|
| TB clock/검사 | REQUIRED | 24~27쪽 | `always #5 clk=~clk` → 10 ns 주기; `step`은 `@(posedge clk); #1`. `DIVISOR=10`과 최소값 2를 함께 인스턴스화하고 30클록 동안 `divided`, `tick`, `div2`, `tick2`를 매번 비교한다. |
| tick 소비 | REQUIRED | 24쪽, 26~27쪽, 42쪽 | 10분주 tick을 다음 상승 에지에서 소비한 횟수 `pulses===3` 확인. |
| 동작 중 리셋 | REQUIRED | 24쪽, 27쪽, 43쪽 | tick 즉시 마스킹, 다음 상승 에지의 `count/divided` 초기화, 해제 후 low half와 첫 전환을 검사. |
| 정상 PASS | REQUIRED | 27쪽, 35~36쪽 | 정상 예상 `LAB2_PASS clock_divider checks=129`, 436000 ps = 436 ns 종료. 검산: 리셋 1 + 30×4 + 소비 횟수 1 + tick 마스킹 1 + 중간 리셋 1 + 재시작 low 4 + 첫 전환 1 = 129. 실제 PASS는 실행 전 미확인. |
| 정상 waveform 신호 | REQUIRED | 39~41쪽 | VaporView `tb_clock_divider`에서 `clk`, `rst`, `divided`, `tick`, `div2`, `tick2`; 이름 열 확대, ns 시간축, Zoom Fit 전체 파형. `count`는 보고서 계산 대상이지만 40쪽의 필수 추가 신호에는 없음. |
| 확대 관찰 | REQUIRED | 42~45쪽 | duty/위상·tick·동작 중 리셋을 확대하고 해석. 교안은 각각의 확대 시작/끝 시각이나 screenshot 개수를 고정하지 않는다. 아래 시점이 판단 기준이다. |

예상 관찰 시점: 첫 `divided` 상승 55 ns, 하강 105 ns, 재상승 155 ns; High/Low 각 50 ns. `tick=1`은 95~105, 195~205, 295~305 ns이며 다음 상승 에지에서 소비된다(42쪽). 376 ns `rst=1`에 tick 즉시 0, 385 ns 에지에 `count/divided` 초기화, 435 ns에 divided 재상승, 436 ns 마지막 검사·종료. 0~5 ns의 X는 첫 동기 리셋 전 상태(43쪽).

## 4. 수정·실패·복구 실험

| 항목 | 상태 | 교안 근거 | 요구 내용 |
|---|---|---|---|
| 수정 실험 | REQUIRED | 44~45쪽 | 정상 로그와 VCD를 먼저 별도 보관하고 `src/clock_divider.v`의 **상승 조건 한 줄만** `if (count == DIVISOR/2 - 1) divided <= 1'b1;` → `if (count == DIVISOR/2) divided <= 1'b1;`로 변경. TB expected는 그대로 둔다. |
| 예상 첫 실패 | REQUIRED | 27쪽 36행, 44쪽 | `DIVISOR=2`의 첫 리셋 해제 후 에지(15 ns)는 직전 `count=0`이다. 정상 조건 `0==2/2-1`은 참이라 `div2=1`이어야 한다. 변경 조건 `0==2/2`는 거짓이라 실제 `div2=0`; TB의 `minimum divisor duty` 검사가 **16 ns**에 실패할 것으로 예상한다. `tick2`는 이때 1이며 첫 불일치 비교 신호는 `div2`이다. |
| 복구 | REQUIRED | 44~46쪽 | 원래 한 줄로 되돌린 뒤 새 실행에서 `checks=129` PASS를 확인. 정상/변경/원복 로그를 구분해 보존한다. 이전 정상 VCD/로그를 새로운 실행의 증거로 재사용하지 않는다. |

## 5. Vivado·보드 준비와 검증 범위

| 항목 | 상태 | 교안 근거 | 요구 내용 |
|---|---|---|---|
| Vivado 준비 | REQUIRED | 46~64쪽 | 정상·변경·원복 절차 후 같은 학생 폴더 원본 RTL 3개, TB, XDC를 Copy 옵션 해제 상태로 등록. `xc7s75fgga484-1`, design top `lab2_clock_divider`, simulation top `tb_clock_divider`. 동일 TB 129개 검사/436 ns와 waveform을 비교할 계획. |
| 보드 클록/관찰 계획 | REQUIRED | 15쪽, 23쪽, 45쪽, 79쪽 | B6 주 클록 1 kHz 확인. LED[0]=500 Hz, LED[1]=100 Hz, LED[2]=20 Hz, LED[3]=1 Hz(0.5 s High/Low), LED[4]=1 ms tick(1 s마다), LED[7:5]=0 예상. K4 초기화 후 관찰; 빠른 신호는 눈으로 주파수를 단정하지 않고 파형·측정 장비를 사용. N8·DIP 스위치는 분주비를 바꾸지 않음. |
| XDC와 VS Code | REQUIRED | 28~31쪽 | 교안 XDC는 `clk=B6`, `rst=K4`, `button=N8`, `LVCMOS33`, 1 kHz `create_clock -period 1000000.000` 등을 지정. Icarus는 XDC를 읽지 않으므로 정상 PASS는 코어 기능 검사이며 핀·보드·타이밍 검증이 아니다. |
| 개인 설정/오류 기록 | REQUIRED | 7~8쪽, 34~37쪽 | 실제 Python 경로 수정, WindowsApps/9009 또는 slang 오류가 발생하면 변경·해결 내용을 기록. **발생 여부 자체는 UNKNOWN**이며 존재하지 않은 오류를 만들지 않음. 교안 화면의 다른 사람 절대 경로는 복사하지 않음. |

현재 `LAB2/02_clock_divider`에 교안 RTL/TB/XDC와 v2.0.1 공통 파일을 전사·배치한 상태는 `GENERATED_DRAFT`이다. 학생 source review, 정상/수정/원복 simulation, VaporView 관찰, Vivado/보드 결과는 아직 NOT_PERFORMED/UNKNOWN이다. 교안 XDC가 인용하는 `evidence/board-pin-provenance.json` 원본 제공 여부도 아직 UNKNOWN이다.
