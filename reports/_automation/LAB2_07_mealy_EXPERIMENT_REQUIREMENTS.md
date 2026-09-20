# LAB2 07_mealy — EXPERIMENT_REQUIREMENTS

상태: COURSE_EXTRACTED. 실행 결과가 아닌 교안 기반 요구사항이다. 출처: `C:\Users\yunji\Downloads\05.LAB2_0921_VIVADO_8plus1.zip` 내부 `05.LAB2_07_MEALY_VIVADO.pdf` 전체 1~71쪽. 아래 시각·값은 교안 및 TB 기준 **예상**이며 자기 실행 결과가 아니다.

## 1. 파일·module·설정

| 항목 | 판정 | 교안 근거 | 요구 내용 |
|---|---|---|---|
| 템플릿 | REQUIRED | 3~8쪽 | `fpga-lab-template` v2.0.1, `LAB1.code-workspace`; placeholder를 이번 실험 파일명으로 교체 |
| RTL | REQUIRED | 9쪽, 16~21쪽 | `src/mealy_toggle.v` (`mealy_toggle`), `src/input_frontend.v` (`input_frontend`), `src/lab2_mealy.v` (`lab2_mealy`) |
| TB | REQUIRED | 9쪽, 24~26쪽 | `sim/tb_mealy_toggle.sv`, module `tb_mealy_toggle` |
| XDC | REQUIRED | 9쪽, 27~30쪽 | `constraints/lab2_mealy.xdc`; top 포트 `clk`, `rst`, `button`, `sw[7:0]`, `led[7:0]`의 핀·I/O·클록 제약 |
| design top | REQUIRED | 20쪽, 44쪽, 53쪽 | `lab2_mealy` |
| simulation top | REQUIRED | 10~11쪽, 24쪽, 44쪽, 52쪽 | `tb_mealy_toggle` |
| `simulation.json` | REQUIRED | 10~11쪽 | `sources=["src/mealy_toggle.v","src/input_frontend.v","src/lab2_mealy.v"]`, `testbench="sim/tb_mealy_toggle.sv"`, `simulation_top="tb_mealy_toggle"` |
| 실행 도구 | REQUIRED | 6~7쪽, 31쪽 | `01 Check tools`로 Git/Python/Icarus 확인. VS Code `02 Simulate`=Icarus, Vivado `Run Behavioral Simulation`=XSim |

## 2. Mealy FSM의 실제 구조와 출력

| 항목 | 판정 | 교안 근거 | 요구 내용 |
|---|---|---|---|
| 상태 정의·의미 | REQUIRED | 13~16쪽 | 1비트 `state`: S0=`0`(reset 초기 상태), S1=`1`(첫 유효 toggle 뒤). 정상 전이는 S0↔S1. |
| 상태 전이 | REQUIRED | 13~16쪽 | `rst=1` 상승 에지에 `state=0` 우선. 그 외 `enable && bit_in=1`인 상승 에지마다 `state <= ~state`; `enable=0` 또는 `bit_in=0`이면 유지. |
| 조합 출력 | REQUIRED | 13~16쪽 | `value`는 `state`와 현재 `bit_in`에 의존. 교안 식 `assign value = !bit_in ? 2'b00 : (state ? 2'b01 : 2'b10);`. `bit_in=0`이면 어느 상태에서나 `00`; `bit_in=1`이면 S0→`10`, S1→`01`. 상태 에지 없이도 `bit_in` 변경으로 출력이 변할 수 있음. |
| reset과 출력 | REQUIRED | 15~16쪽, 23쪽 | reset은 **state만** 0으로 만든다. `value` 식에는 rst가 없음. `bit_in=1`인 reset 에지 뒤 정상 `{state,value}=3'b010`이며 출력이 전부 0일 필요는 없음. `bit_in=0`으로 내리면 조합 `value=00`. |
| always·대입 구조 | REQUIRED | 16쪽 | 순차 `always @(posedge clk)` 하나가 상태를 nonblocking `<=`로 갱신. 출력은 별도 **연속 `assign` 조합 논리**; 별도의 조합 `always`나 `next_state` 블록은 없음. RTL 상태 갱신에 blocking `=`을 사용하지 않음. |
| enable과 출력 구분 | REQUIRED | 13쪽, 40쪽 | `enable=0`은 상태 전이만 멈춤. `bit_in` 변화에 따른 조합 `value`까지 끄지 않음. |
| board front-end | REQUIRED | 12쪽, 20쪽, 58쪽 | `input_frontend`의 한 클록 `press`→`enable`; 동기화한 `switches[7]`(SW1)→`bit_in`; `led={5'b00000,state,value}`. 실제 스위치 변화는 동기화 지연 후 core 입력에 반영됨. |

| 현재 state | bit_in | 현재 value | `rst=0,enable=1` 상승 에지 뒤 state | enable=0일 때 state |
|---|---:|---:|---|---|
| S0 / `0` | 0 | `00` | S0 / `0` | S0 유지 |
| S0 / `0` | 1 | `10` | S1 / `1` | S0 유지 |
| S1 / `1` | 0 | `00` | S1 / `1` | S1 유지 |
| S1 / `1` | 1 | `01` | S0 / `0` | S1 유지 |

표의 `value`는 **현재** state·input 기준이다. `bit_in=1`로 에지를 지나 state가 toggle되면 같은 입력에서도 출력이 새 state 기준으로 다시 계산된다(14쪽). TB는 core에 `bit_in`을 직접 주므로 입력 변경 뒤 1 ns에 조합 반응을 검사한다. 물리 SW1→`input_frontend` 경로는 동기화 지연을 거친다(58쪽, 70쪽).

## 3. 정상 TB·파형

| 항목 | 판정 | 교안 근거 | 요구 내용 |
|---|---|---|
| TB clock·검사 | REQUIRED | 22~26쪽 | `always #5` → 10 ns 주기; `step`은 상승 에지 뒤 `#1`. 입력 변경 직후 `#1` 검사도 7/27/37/67 ns에 수행. `check`는 4상태 비교로 불일치 시 `LAB2_FAIL`·`$fatal`; TB 자극/카운터에는 blocking `=`. |
| 정상 PASS·종료 | REQUIRED | 22~26쪽, 33~34쪽 | 11개 검사 후 예상 `LAB2_PASS mealy_toggle checks=11`, `$finish` 67000 ps = **67 ns**. 실제 PASS/종료는 실행 전 미확인. |
| 필수 파형 신호/UI | REQUIRED | 32쪽, 37~39쪽, 43쪽 | VaporView `tb_mealy_toggle`에서 `Add All Variables in Scope (Shallow)`: `bit_in,checks,clk,enable,rst,state,value`. `checks`는 Decimal (Unsigned)로 표시. 핵심 설명 신호는 `clk,rst,enable,bit_in,state,value`. 전체 교안 화면은 ps 축. |
| 전체/출력 화면 | REQUIRED | 32쪽, 39쪽 | 전체 0~67 ns Zoom Fit에서 state의 에지 변화와 value의 비에지 변화 비교. 출력만 본 화면과 전체 파형 각각 저장. |
| 입력 직후 확대 | REQUIRED | 40쪽, 42~43쪽 | **6~16 ns**와 **26~37 ns**를 확대해 입력 변경 직후 출력 변화와 나중 상태 전이를 분리. 교안은 각 screenshot의 바깥 여백·파일명은 고정하지 않음. |
| reset/hold | REQUIRED | 15쪽, 22~23쪽, 32쪽, 40·43쪽 | `enable=0`에서 state 유지/조합 출력 반응, `bit_in=0`에서 state 유지, `bit_in=1`인 reset 후 state0/value10을 확인. 별도 reset 확대 screenshot 지정 없음. |

| 검사 시각 | 직전 조건/시점 | expected `{state,value}` | TB 설명 |
|---:|---|---:|---|
| 6 ns | 5 ns reset 에지, `bit_in=0` | `000` | `reset input zero` |
| 7 ns | 6 ns `bit_in=1`, 에지 없음/S0 | `010` | `S0 input changes between clocks` |
| 16 ns | 15 ns 에지, `enable=0`, 입력 1 | `010` | `disabled state still has Mealy output` |
| 26 ns | 25 ns 에지, `enable=1,bit_in=1`, S0→S1 | `101` | `transition to S1` |
| 27 ns | 26 ns `bit_in=0`, 에지 없음/S1 | `100` | `S1 input zero immediately` |
| 36 ns | 35 ns 에지, `bit_in=0`, S1 유지 | `100` | `input zero holds S1` |
| 37 ns | 36 ns `bit_in=1`, 에지 없음/S1 | `101` | `S1 pre-edge value` |
| 46 ns | 45 ns 에지, 입력 1, S1→S0 | `010` | `transition to S0` |
| 56 ns | 55 ns 에지, 입력 1, S0→S1 | `101` | `toggle again` |
| 66 ns | 65 ns reset 에지, 입력 1 | `010` | `reset state with input one` |
| 67 ns | 66 ns `bit_in=0`, 에지 없음/S0 | `000` | `clear combinational output` |

## 4. 수정·실패·복구 — MODIFICATION_REQUIRED = REQUIRED

| 항목 | 판정 | 교안 근거 | 요구 내용 |
|---|---|---|---|
| 정상 증거 보존 | REQUIRED | 41쪽 | 정상 로그와 파형/VCD를 변경 전에 보관. |
| 정확한 변경 | REQUIRED | 16쪽 12행, 41·43쪽 | `src/mealy_toggle.v`의 **출력 식 한 줄** `assign value = !bit_in ? 2'b00 : (state ? 2'b01 : 2'b10);` → `assign value = !bit_in ? 2'b00 : (state ? 2'b10 : 2'b01);`. 입력 1일 때 S0/S1의 `10`·`01` 출력을 교환. TB expected는 그대로 유지. |
| 첫 실패 예상 | REQUIRED | 22쪽, 25~26쪽, 43쪽 | 6 ns에 `bit_in=1`로 바꾼 뒤 **7 ns** `S0 input changes between clocks` 검사에서 FAIL 예상. state expected/변경 예상 모두 `0`; value expected `10`, 변경 예상 `01`; 결합 `{state,value}` expected `010`, 변경 예상 actual `001`. 실제 FAIL은 변경 실행 로그로 확인. |
| 복구 | REQUIRED | 41~43쪽 | 원래 출력 식으로 복구·저장 후 **새 실행**에서 PASS 11개/67 ns 확인. 정상/변경/복구 로그와 출력 시점 구분. |

## 5. Vivado·보드 준비와 제약 범위

| 항목 | 판정 | 교안 근거 | 요구 내용 |
|---|---|---|---|
| Vivado 준비 | REQUIRED | 44~53쪽 | 정상·변경·복구 검사/PRE 뒤 같은 학생 폴더의 RTL 3개, TB, XDC를 Copy 옵션 해제해 참조. 부품 `xc7s75fgga484-1`, design top `lab2_mealy`, simulation top `tb_mealy_toggle`. |
| XDC·clock | REQUIRED | 27~30쪽, 58~59쪽 | Combo II-DLD S75. B6=`clk` **1 kHz** / `create_clock -period 1000000.000` ns, K4=`rst`, N8=`button`, 19개 포트 LVCMOS33/비동기 입력 false path. 교안 핀 `sw[0:7]=U4,V4,W1,W4,T1,U2,W3,Y1`, `led[0:7]=N5,M1,M3,M7,N7,M2,M4,L4`. |
| 보드 입출력·순서 | REQUIRED | 12쪽, 20쪽, 42쪽 5항, 58쪽, 70쪽 | SW1=`sw[7]` bit_in, N8 press=enable, K4 reset. LED[2]=state, LED[1:0]=value, LED[7:3]=0. 계획 `000→010`(SW1만 1, 버튼 없음)→`101`(N8)→`100`(SW1만 0)→`100`(SW1=0에서 N8)→`010`(SW1=1 후 N8). 실제 SW1 변화는 동기화 뒤 출력 반영; 물리 즉시 동일 시각으로 주장하지 않음. |
| XDC와 VS Code | REQUIRED | 27쪽 | Icarus 기능 시뮬레이션은 XDC를 읽지 않음. PASS만으로 핀/보드 동작을 검증했다고 주장하지 않음. |
| Moore와 비교 절 | NOT_REQUIRED | 1~71쪽 | 07 교안에는 06 Moore 실험과 결과를 나란히 비교하는 보고서 지시가 없음. 이 회로의 Mealy 입력 직후 출력 반응 설명만 필수. |
| 설정 변경·오류 기록 | NOT_REQUIRED | 6~7쪽, 31쪽, 42쪽 | 도구 점검/오류 해결 안내는 있지만 07 실험 전 레포트 항목에 별도 환경 변경·오류 기록 지시는 없음. 실제 발생 여부는 UNKNOWN; 발생 시 내부 실행 기록. |

## 아직 미확인

- `LAB2/07_mealy`에 교안 RTL·TB·XDC와 v2.0.1 기반 공통 구조를 배치했다. 현재 상태는 `GENERATED_DRAFT`이며 학생 source review는 아직 확인되지 않았다.
- 학생 source review, 정상/변경/복구 simulation 로그·VCD, 사용자 VaporView 관찰, Vivado/보드 결과: NOT_PERFORMED 또는 UNKNOWN.
- XDC 주석이 가리키는 `evidence/board-pin-provenance.json` 제공 여부: UNKNOWN. 교안 XDC 코드 화면은 확인했다.
