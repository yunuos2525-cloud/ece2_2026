# LAB2 05_piso — EXPERIMENT_REQUIREMENTS

상태: COURSE_EXTRACTED. 실행 결과가 아닌 교안 기반 요구사항이다. 출처: `C:\Users\yunji\Downloads\05.LAB2_0921_VIVADO_8plus1.zip` 내부 `05.LAB2_05_PISO_VIVADO.pdf` 전체 1~74쪽. 아래 시각·값은 교안 및 TB에서 확인한 **예상**이며 실제 실행 결과가 아니다.

## 1. 파일·module·설정

| 항목 | 판정 | 교안 근거 | 요구 내용 |
|---|---|---|---|
| 시작 템플릿 | REQUIRED | 3~8쪽 | `fpga-lab-template` v2.0.1, `LAB1.code-workspace`; placeholder를 이번 파일명으로 교체 |
| RTL | REQUIRED | 9쪽, 16~21쪽 | `src/piso4.v` (`piso4`), `src/input_frontend.v` (`input_frontend`), `src/lab2_piso.v` (`lab2_piso`) |
| TB | REQUIRED | 9쪽, 24~26쪽 | `sim/tb_piso4.sv`, module `tb_piso4` |
| XDC | REQUIRED | 9쪽, 27~30쪽 | `constraints/lab2_piso.xdc`; top 포트 `clk`, `rst`, `button`, `sw[7:0]`, `led[7:0]`의 핀·I/O·클록 제약 |
| design top | REQUIRED | 20~21쪽, 44쪽, 55쪽 | `lab2_piso` |
| simulation top | REQUIRED | 10~11쪽, 24쪽, 44쪽, 54쪽 | `tb_piso4` |
| `simulation.json` | REQUIRED | 10~11쪽 | `sources=["src/piso4.v","src/input_frontend.v","src/lab2_piso.v"]`, `testbench="sim/tb_piso4.sv"`, `simulation_top="tb_piso4"` |
| 실행 도구 | REQUIRED | 6~7쪽, 31쪽 | `01 Check tools`로 Git/Python/Icarus 확인. VS Code `02 Simulate`=Icarus, Vivado `Run Behavioral Simulation`=XSim |

## 2. PISO 원리와 우선순위

| 항목 | 판정 | 교안 근거 | 요구 내용 |
|---|---|---|---|
| 병렬 load | REQUIRED | 13~16쪽 | 상승 에지에서 `load=1`이면 `data_in[3:0]`의 네 비트를 각각 같은 번호의 `value[3:0]`에 한 번에 저장한다(`value <= data_in`). `enable=1`이어도 load가 우선. |
| 직렬 출력 | REQUIRED | 13~16쪽 | `serial_out`은 별도 출력 레지스터가 아닌 `value[3]` 연결선. **첫 shift 전에** 현재 MSB를 읽고 다음 상승 에지에서 이동한다. |
| shift 방향 | REQUIRED | 13~16쪽 | `rst=0,load=0,enable=1` 상승 에지에 `value <= {이전 value[2:0],1'b0}`. 이전 `[2]→[3]`, `[1]→[2]`, `[0]→[1]`; `[0]`은 0으로 채운다. 이동 후 `serial_out`은 새 `value[3]`. |
| reset/hold | REQUIRED | 14~16쪽 | `rst=1`이 load/enable보다 우선해 상승 에지에 `value=0000`. `rst=0,load=0,enable=0`이면 이전 값 유지. |
| 에지 전후 | REQUIRED | 15~16쪽, 22~23쪽 | nonblocking 오른쪽 항은 상승 에지 **전** `value`/`data_in`; 에지 후 저장값과 그에 연결된 `serial_out`이 갱신된다. TB는 현재 serial bit를 shift 에지 전에 비교한다. |
| 보드 입력 처리 | REQUIRED | 12쪽, 20~21쪽 | `input_frontend` 출력 `press`가 있을 때 `switches[0]=1`이면 load, `0`이면 shift enable. `switches[7:4]`가 병렬 데이터. `led={value,3'b000,serial_out}`. |

| rst | load | enable | 다음 `value[3:0]` | 에지 후 `serial_out` |
|---:|---:|---:|---|---|
| 1 | 무관 | 무관 | `0000` | 0 |
| 0 | 1 | 무관 | `data_in[3:0]` | 새 `data_in[3]` |
| 0 | 0 | 1 | `{이전 value[2:0],1'b0}` | 새 `value[3]` = 이전 `value[2]` |
| 0 | 0 | 0 | 이전 `value` 유지 | 이전 `value[3]` 유지 |

정상 A(`1010`) load 후 shift **전** 읽는 직렬 비트열은 `1,0,1,0`; shift 후 값은 `A→4→8→0→0`이다(15쪽). shift 에지 뒤에만 네 번 읽으면 첫 1을 놓친다.

## 3. 정상 TB·파형

| 항목 | 판정 | 교안 근거 | 요구 내용 |
|---|---|---|---|
| TB clock/검사 | REQUIRED | 22~26쪽 | `always #5 clk=~clk` → 10 ns 주기. `step`은 상승 에지 뒤 `#1`; `check`는 4상태 비교를 확인하고 불일치 시 `LAB2_FAIL`·`$fatal`. |
| 입력 범위·검사 수 | REQUIRED | 22쪽, 24~26쪽 | `word=0..15` 모든 4비트 입력. word마다 load 우선, hold, shift **전** serial bit 4개, 네 번 shift 후 0 채움 = 7회; 초기 reset 1 + 16×7 + 최종 reset 우선 1 = **114회**. |
| 정상 PASS·종료 | REQUIRED | 33~34쪽 | 예상 `LAB2_PASS piso4 checks=114`, 976000 ps = **976 ns** 종료. 실제 PASS와 종료는 실행 전 미확인. |
| 필수 파형 신호 | REQUIRED | 32쪽, 37~38쪽, 43쪽 | VaporView `tb_piso4`에서 `clk`, `rst`, `load`, `enable`, `data_in`, `value`, `serial_out`; `value`는 비트 이동을 보이려면 binary 표시가 유용함. |
| 전체·출력 화면 | REQUIRED | 32쪽, 38쪽 | 0~976 ns 전체 Zoom Fit/ns 시간축에서 `data_in=0..F` 확인. 출력(`value`, `serial_out`)만 본 화면과 전체 신호 파형을 각각 저장. |
| A 확대 | REQUIRED | 23쪽, 39~40쪽, 42~43쪽 | 약 600~670 ns에서 A load/hold/shift, 상승 에지 전 입력과 에지 후 상태, shift 전 serial bit `1,0,1,0`을 대조. 아래 예상 시각은 교안에서 직접 지정. |
| reset/hold/마지막 검사 | REQUIRED | 22쪽, 26쪽, 32쪽 | reset 우선, `enable=0` 유지, 전체 종료 전 마지막 검사 시각 확인. 별도 reset 확대 screenshot은 교안에서 지정하지 않음. |

| 검사 시각 | 교안/TB 시험 조건 | 정상 expected |
|---:|---|---|
| 6 ns | 첫 reset 상승 에지 5 ns 뒤 | `value=0` |
| 616 ns | word=10(`A`), 615 ns load 에지 후; load와 enable 모두 1 | `value=A`, `serial_out=1` |
| 626 ns | 625 ns hold 에지 후; 첫 serial bit를 **shift 전** 비교 | `value=A`, `serial_out=1` |
| 636 ns | 635 ns 첫 shift 에지 후; 둘째 bit 비교 | `value=4`, `serial_out=0` |
| 646 ns | 645 ns 둘째 shift 에지 후; 셋째 bit 비교 | `value=8`, `serial_out=1` |
| 656 ns | 655 ns 셋째 shift 에지 후; 넷째 bit 비교 | `value=0`, `serial_out=0` |
| 666 ns | 665 ns 넷째 shift 에지 후 | `value=0` (zero fill) |
| 976 ns | 최종 `rst=1`, `load=1`, `data_in=F`에서 reset 우선 | `value=0`, PASS 예상 |

VaporView 예시의 626.599 ns 커서는 교안 40쪽의 화면 위치이며 **TB 비교 시각 626 ns와 같지 않다**.

## 4. 수정·실패·복구 — MODIFICATION_REQUIRED = REQUIRED

| 항목 | 판정 | 교안 근거 | 요구 내용 |
|---|---|---|---|
| 정상 증거 보존 | REQUIRED | 41쪽 | 정상 로그와 파형/VCD를 수정 전에 보존. |
| 정확한 변경 | REQUIRED | 16쪽 8행, 41·43쪽 | `src/piso4.v`의 **한 줄** `assign serial_out = value[3];` → `assign serial_out = value[0];`. TB expected와 나머지 RTL은 유지. |
| 실패 원인 | REQUIRED | 13~15쪽, 22쪽, 43쪽 | MSB 먼저 읽어야 하는 PISO가 LSB를 직렬 출력함. 병렬 load/shift 저장값 자체와 TB의 기대 비트 순서는 그대로이므로 출력 비트 비교에서 불일치. |
| 첫 실패 예상 | REQUIRED | 24~26쪽, 43쪽 | `word=1`(`0001`)의 첫 출력 검사 **86 ns**, TB 설명 `MSB first before edge`. 정상 expected `serial_out=value[3]=0`, 변경 후 예상 actual `value[0]=1`. 실제 FAIL 시각/문구는 변경 실행 로그에서 확인. |
| 복구 | REQUIRED | 41~43쪽 | 원래 `value[3]` 연결로 복구·저장 후 새 실행에서 PASS 114개와 976 ns 종료 확인. 정상·변경·복구 각 로그와 출력 순서 구분. |

## 5. Vivado·보드 계획·제약 범위

| 항목 | 판정 | 교안 근거 | 요구 내용 |
|---|---|---|---|
| Vivado 준비 | REQUIRED | 44~55쪽 | 정상·수정·복구 검사와 PRE 뒤 동일 학생 폴더의 RTL 3개, TB, XDC를 Copy 옵션 해제해 참조. `xc7s75fgga484-1`, design top `lab2_piso`, simulation top `tb_piso4`. |
| XDC/clock | REQUIRED | 27~30쪽, 61~62쪽 | Combo II-DLD S75. B6=`clk` **1 kHz**, K4=`rst`, N8=`button`; 19개 포트 LVCMOS33. 1 kHz 제약 `create_clock -period 1000000.000` ns, 비동기 입력 false path. 교안 핀: `sw[0:7]=U4,V4,W1,W4,T1,U2,W3,Y1`, `led[0:7]=N5,M1,M3,M7,N7,M2,M4,L4`. |
| 보드 입력/LED | REQUIRED | 12쪽, 20~21쪽, 42쪽 5항, 61쪽, 73쪽 | SW1~SW4=`sw[7:4]` 병렬 데이터, SW8=`sw[0]` load 선택(1=load, 0=shift), N8=한 번 실행, K4=reset. LED[7:4]=저장값, LED[3:1]=0, LED[0]=현재 MSB 직렬 출력. A 입력 계획: load `A1` → shift `40→81→00→00`; **load 직후 첫 shift 전에 LED0=1을 먼저 읽음**. 실제 board 관찰과 구분. |
| XDC와 VS Code | REQUIRED | 27쪽 | Icarus 기능 시뮬레이션은 XDC를 읽지 않음. PASS만으로 실제 pin/버튼 동작을 검증했다고 하지 않음. |
| 설정 변경·오류 기록 | NOT_REQUIRED | 6~7쪽, 31쪽, 42쪽 | 도구 점검·오류 해결 안내는 있지만 05 실험 전 레포트 항목에 별도 환경 변경/오류 기록 지시는 없음. 실제 발생 여부는 UNKNOWN이며 발생 시 내부 실행 기록으로 남김. |

## 아직 미확인

- `LAB2/05_piso`에 교안 RTL/TB/XDC와 v2.0.1 공통 파일을 전사·배치했다. 현재 소스 상태는 `GENERATED_DRAFT`; 학생의 구조·예상 동작·TB 검토는 아직 미확인.
- 학생 source review, 정상/수정/복구 실행 로그·VCD, 사용자 VaporView 관찰, Vivado/보드 결과: NOT_PERFORMED 또는 UNKNOWN.
- XDC 주석이 가리키는 `evidence/board-pin-provenance.json`의 제공 여부: UNKNOWN. 교안 XDC 코드 화면은 확인했다.
