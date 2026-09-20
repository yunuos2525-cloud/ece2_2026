# LAB2 06_moore — EXPERIMENT_REQUIREMENTS

상태: COURSE_EXTRACTED. 실행 결과가 아닌 교안 기반 요구사항이다. 출처: `C:\Users\yunji\Downloads\05.LAB2_0921_VIVADO_8plus1.zip` 내부 `05.LAB2_06_MOORE_VIVADO.pdf` 전체 1~71쪽. 시각·값은 교안과 TB에 근거한 **예상**이며 자기 실행 결과가 아니다.

## 1. 파일·module·설정

| 항목 | 판정 | 교안 근거 | 요구 내용 |
|---|---|---|---|
| 시작 템플릿 | REQUIRED | 3~8쪽 | `fpga-lab-template` v2.0.1, `LAB1.code-workspace`; placeholder를 이번 실험 파일명으로 교체 |
| RTL | REQUIRED | 9쪽, 16~20쪽 | `src/moore_cycle.v` (`moore_cycle`), `src/input_frontend.v` (`input_frontend`), `src/lab2_moore.v` (`lab2_moore`) |
| TB | REQUIRED | 9쪽, 23~25쪽 | `sim/tb_moore_cycle.sv`, module `tb_moore_cycle` |
| XDC | REQUIRED | 9쪽, 26~29쪽 | `constraints/lab2_moore.xdc`; top 포트 `clk`, `rst`, `button`, `sw[7:0]`, `led[7:0]`의 핀·I/O·클록 제약 |
| design top | REQUIRED | 20쪽, 42쪽, 53쪽 | `lab2_moore` |
| simulation top | REQUIRED | 10~11쪽, 23쪽, 42쪽, 52쪽 | `tb_moore_cycle` |
| `simulation.json` | REQUIRED | 10~11쪽 | `sources=["src/moore_cycle.v","src/input_frontend.v","src/lab2_moore.v"]`, `testbench="sim/tb_moore_cycle.sv"`, `simulation_top="tb_moore_cycle"` |
| 실행 도구 | REQUIRED | 6~7쪽, 30쪽 | `01 Check tools`로 Git/Python/Icarus 확인. VS Code `02 Simulate`=Icarus, Vivado `Run Behavioral Simulation`=XSim |

## 2. Moore FSM의 실제 구조

| 항목 | 판정 | 교안 근거 | 요구 내용 |
|---|---|---|---|
| 상태 정의·의미 | REQUIRED | 13~16쪽 | `value[1:0]`가 상태 레지스터이자 출력. S0=`2'b00`(초기/순환 시작), S1=`2'b01`(첫 유효 전이 뒤), S2=`2'b10`(두 번째 유효 전이 뒤). 정상 상태 순환은 00→01→10→00이며 11은 정상 순환에 없음. |
| 다음 상태 | REQUIRED | 13~16쪽 | `rst=0`이고 `enable && advance=1`인 **상승 에지**에서만 S0→S1, S1→S2, S2→S0. 그 외에는 현재 상태 유지. `case`의 `default`는 S2(10)와 비정상 11을 00으로 보내지만, 두 제어가 모두 1일 때에만 실행. |
| 출력 의존성 | REQUIRED | 13~15쪽 | 출력 `value`는 현재 저장 상태 그 자체다. `advance`/`enable` 변경이 출력에 직접 연결되지 않으며, 유효 상승 에지 없이 입력만 바뀌면 `value`는 변하지 않음. |
| reset | REQUIRED | 14쪽, 16쪽 | `rst=1`인 상승 에지에 다른 조건보다 우선하여 S0=`00`으로 초기화. 비영 상태에서도 reset 검사를 수행. |
| always·대입 구조 | REQUIRED | 15~16쪽 | 교안 코드는 **하나의 `always @(posedge clk)` 순차 블록** 안에서 reset, `enable && advance`, `case(value)`를 처리한다. 별도의 `next_state` 레지스터나 조합 `always @*` 블록은 없음. 전이는 이전 `value`를 읽어 nonblocking `<=`로 예약. RTL 상태 갱신에 blocking `=`을 사용하지 않음. |
| 버튼과 FSM 입력 | REQUIRED | 12쪽, 20쪽, 58쪽 | `input_frontend`의 한 클록 `press`를 FSM `enable`에, 동기화된 `switches[7]`(보드 SW1)을 `advance`에 연결. N8 버튼은 clock이 아니라 유효 전이를 허용하는 pulse. `led={6'b000000,value}`. |

| 현재 상태 | `rst=1` | `rst=0`, `enable && advance=1` | 그 외 |
|---|---|---|---|
| S0 / `00` | S0 / `00` | S1 / `01` | S0 / `00` |
| S1 / `01` | S0 / `00` | S2 / `10` | S1 / `01` |
| S2 / `10` | S0 / `00` | S0 / `00` (`default`) | S2 / `10` |
| 비정상 `11` | S0 / `00` | S0 / `00` (`default`) | `11` 유지 |

정상 순환에서 `11`이 나오지 않는다는 설명은 교안 14~15쪽에 근거한다. overlap/패턴 중첩 검사는 이 세 상태 순환 실험에서 **NOT_REQUIRED**이다(13~15쪽, 21~22쪽, 40~41쪽).

## 3. 정상 TB·파형

| 항목 | 판정 | 교안 근거 | 요구 내용 |
|---|---|---|---|
| TB clock/검사 | REQUIRED | 21~25쪽 | `always #5`로 10 ns 주기. `step`은 `@(posedge clk); #1` 뒤 4상태 비교·`LAB2_FAIL`/`$fatal`; 입력만 바꾼 뒤 `#1`의 **7 ns 비에지 검사**도 수행. TB 자극과 검사 카운터에는 blocking `=`을 사용. |
| 검사 수·종료 | REQUIRED | 22~25쪽, 32~33쪽 | 첫 reset 1 + 입력만 변경 1 + 첫 순환 5개×4회 + 마지막 비영 상태 reset 1 = **23회**. 정상 예상 `LAB2_PASS moore_cycle checks=23`, `$finish` 226000 ps = **226 ns**. 실제 실행 결과는 미확인. |
| 파형 신호·UI | REQUIRED | 31쪽, 36~37쪽, 41쪽 | VaporView `tb_moore_cycle`에서 `Add All Variables in Scope (Shallow)`(Recursive와 구분). 핵심 `clk,rst,enable,advance,value`; `value` binary 표시. 교안 전체 화면은 ps 시간축(50000 ps=50 ns). |
| 전체/출력 화면 | REQUIRED | 31쪽, 37쪽 | 전체 0~226 ns Zoom Fit에서 00→01→10→00 네 순환, 유지, 마지막 reset 확인. 출력(`value`)만 본 화면과 전체 파형 각각 저장. |
| 첫 전이 확대 | REQUIRED | 38쪽, 40~41쪽 | 첫 순환의 7/16/26/36/46 ns 비교와 56 ns 00 복귀를 확대. 입력 변화, 에지 전 상태, 에지 후 상태를 구분. 교안은 확대 창의 정확한 시작/끝 ns를 고정하지 않음. |
| reset 관련 | REQUIRED | 22쪽, 25쪽, 31쪽 | 215 ns 에지 뒤 S1=`01`인 비영 상태에서 `rst=1`, 225 ns 에지 뒤 226 ns 검사에서 `00`. 별도 reset 확대 screenshot은 교안에 지정되지 않음. |

| TB 검사 | 입력/에지 | 예상 `value` | 검사 설명 |
|---:|---|---:|---|
| 6 ns | 5 ns 첫 reset 에지 | `00` | `reset` |
| 7 ns | 6 ns `advance=1`로만 변경, 유효 에지 없음 | `00` 유지 | `input alone cannot change output` |
| 16 ns | 15 ns `enable=advance=1`, S0→S1 | `01` | `S0 to S1` |
| 26 ns | 25 ns `advance=0` | `01` 유지 | `advance zero holds` |
| 36 ns | 35 ns `enable=0` | `01` 유지 | `disabled holds` |
| 46 ns | 45 ns 두 제어 1, S1→S2 | `10` | `S1 to S2` |
| 56 ns | 55 ns 두 제어 1, S2→S0 | `00` | `S2 to S0` |
| 206 ns | 네 번째 순환의 S2→S0 | `00` | 반복 마지막 검사 |
| 226 ns | 215 ns 에지 후 `01`; 225 ns reset 에지 | `00` | `reset from nonzero` |

교안 38쪽: 파형의 상태 변화 에지 5/15/25/35/45/55 ns와 TB의 6/16/26/36/46/56 ns 비교 시각은 1 ns 차이가 있다.

## 4. 수정·실패·복구 — MODIFICATION_REQUIRED = REQUIRED

| 항목 | 판정 | 교안 근거 | 요구 내용 |
|---|---|---|---|
| 정상 증거 보존 | REQUIRED | 39쪽 | 정상 로그와 파형/VCD를 변경 전에 보관. |
| 정확한 변경 | REQUIRED | 16쪽 11행, 39~41쪽 | `src/moore_cycle.v`의 S1 전이 한 줄 `2'b01: value <= 2'b10;` → `2'b01: value <= 2'b00;`. TB expected는 그대로 유지. |
| 최초 예상 실패 | REQUIRED | 21쪽, 23~25쪽, 41쪽 | 첫 S1에서 두 제어가 1인 45 ns 에지 뒤 **46 ns**의 `S1 to S2` 검사에서 FAIL 예상. expected `10`(S2), 변경 후 예상 actual `00`(S0). 실제 실패 로그로 시각·문구 재확인. |
| 원인/복구 | REQUIRED | 39~41쪽 | S1이 S2를 건너뛰고 S0로 돌아 정상 세 상태 순환을 깨뜨림. 원래 줄 복원·저장 후 **새 실행**에서 PASS 23개/226 ns 확인. 정상/변경/복구 실행 구분. |

## 5. Vivado·보드 준비와 제약 범위

| 항목 | 판정 | 교안 근거 | 요구 내용 |
|---|---|---|---|
| Vivado 준비 | REQUIRED | 42~53쪽 | 정상·변경·복구 검사와 PRE 뒤 같은 학생 폴더의 RTL 3개, TB, XDC를 Copy 옵션 해제해 참조. 부품 `xc7s75fgga484-1`, design top `lab2_moore`, simulation top `tb_moore_cycle`. 미수행 결과로 남김. |
| XDC·clock | REQUIRED | 26~29쪽, 58~59쪽 | Combo II-DLD S75. B6=`clk` **1 kHz** / `create_clock -period 1000000.000` ns, K4=`rst`, N8=`button`, 19개 포트 LVCMOS33 및 비동기 입력 false path. 교안 핀 `sw[0:7]=U4,V4,W1,W4,T1,U2,W3,Y1`, `led[0:7]=N5,M1,M3,M7,N7,M2,M4,L4`. |
| 보드 조작·LED | REQUIRED | 12쪽, 20쪽, 40쪽 5항, 70쪽 | SW1=`sw[7]` advance, N8 버튼 press=enable, K4 reset. LED[1:0]=state/value, LED[7:2]=0. K4→`00`; SW1=1만 바꾸고 N8 없음→`00`; N8 한 번→`01`; SW1=0+N8→`01`; SW1=1+N8 두 번→`10→00`. 스위치를 먼저 정하고 버튼을 누름. |
| XDC와 VS Code | REQUIRED | 26쪽 | Icarus 기능 시뮬레이션은 XDC를 읽지 않음. PASS만으로 보드 핀/버튼 동작을 확인했다고 주장하지 않음. |
| 설정 변경·오류 기록 | NOT_REQUIRED | 6~7쪽, 30쪽, 40쪽 | 도구 점검·오류 해결 안내는 있지만 06 실험 전 레포트 항목에 별도 환경 변경/오류 기록 요구는 없음. 실제 발생 여부는 UNKNOWN; 발생 시 내부 실행 기록으로 남김. |

## 아직 미확인

- `LAB2/06_moore`에 교안 RTL/TB/XDC와 v2.0.1 공통 파일을 전사·배치했다. 현재 소스 상태는 `GENERATED_DRAFT`; 학생의 FSM 구조·예상 동작·TB 검토는 아직 미확인.
- 학생 source review, 정상/변경/복구 simulation 로그·VCD, 사용자 VaporView 관찰, Vivado/보드 결과: NOT_PERFORMED 또는 UNKNOWN.
- XDC 주석이 가리키는 `evidence/board-pin-provenance.json` 제공 여부: UNKNOWN. 교안 XDC 코드 화면은 확인했다.
