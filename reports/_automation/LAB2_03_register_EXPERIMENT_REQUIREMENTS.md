# LAB2 03_register — EXPERIMENT_REQUIREMENTS

상태: COURSE_EXTRACTED. 실행 결과가 아닌 교안 기반 계획이다. 출처: `C:\Users\yunji\Downloads\05.LAB2_0921_VIVADO_8plus1.zip` 내부 `05.LAB2_03_REGISTER_VIVADO.pdf` 1~79쪽. 시각과 값은 교안의 TB 및 설명에 근거한 예상이다.

## 1. 파일·top·환경

| 항목 | 판정 | 근거 | 요구 내용 |
|---|---|---|---|
| 시작 템플릿 | REQUIRED | 3~9쪽 | `fpga-lab-template` v2.0.1, `LAB1.code-workspace`; placeholder를 이번 실험 파일로 교체 |
| RTL | REQUIRED | 10쪽, 16~21쪽 | `src/register_pair.v`, `src/input_frontend.v`, `src/lab2_register.v`; module은 각각 `register_pair`, `input_frontend`, `lab2_register` |
| TB | REQUIRED | 10쪽, 26~28쪽 | `sim/tb_register_pair.sv`; module `tb_register_pair` |
| XDC | REQUIRED | 10쪽, 29~32쪽 | `constraints/lab2_register.xdc`; top 포트 `clk`, `rst`, `button`, `sw[7:0]`, `led[7:0]`를 교안의 핀/I/O/클록 제약과 대조 |
| design top | REQUIRED | 20~21쪽, 45쪽, 59쪽 | `lab2_register` |
| simulation top | REQUIRED | 11~12쪽, 26쪽, 45쪽, 58쪽 | `tb_register_pair` |
| `simulation.json` | REQUIRED | 11~12쪽 | `sources=["src/register_pair.v","src/input_frontend.v","src/lab2_register.v"]`, `testbench="sim/tb_register_pair.sv"`, `simulation_top="tb_register_pair"` |
| 실행 도구 구분 | REQUIRED | 7~8쪽, 33쪽 | `01 Check tools` 후 VS Code `02 Simulate`는 Icarus; Vivado `Run Behavioral Simulation`은 XSim |

## 2. 회로 원리와 다음 상태

| 항목 | 판정 | 근거 | 요구 내용 |
|---|---|---|---|
| 저장·전달 | REQUIRED | 13~16쪽 | `stored`는 4비트 입력 저장, `value`는 저장값 전달용 4비트 레지스터. 둘 다 `clk` 상승 에지에만 갱신. `load`는 `data_in`을 `stored`에 저장, `transfer`는 **에지 직전** `stored`를 `value`에 전달. |
| 리셋·유지 | REQUIRED | 13~15쪽 | `rst=1`은 두 레지스터를 0으로 우선 초기화. 각 제어가 0이면 해당 레지스터는 이전 값을 유지. |
| 동시 제어 | REQUIRED | 14~15쪽 | `load`와 `transfer`는 독립된 두 `if`; 동시 1이면 `stored←data_in`, `value←이전 stored`. nonblocking 오른쪽 항은 같은 에지 이전 상태를 읽음. `else if`나 즉시 전달로 해석하지 않음. |
| 보드 입력 처리 | REQUIRED | 17~23쪽 | `input_frontend`는 버튼/스위치를 주 클록에 동기화하고 20개 안정 샘플 뒤 한 클록 `press`를 생성. `lab2_register`는 `press && switches[0]`을 load, `press && switches[1]`을 transfer, `switches[7:4]`를 data_in에 연결. `led={stored,value}`. |

| rst | load | transfer | 다음 stored | 다음 value |
|---:|---:|---:|---|---|
| 1 | 무관 | 무관 | 0 | 0 |
| 0 | 0 | 0 | 이전 stored | 이전 value |
| 0 | 1 | 0 | data_in | 이전 value |
| 0 | 0 | 1 | 이전 stored | 이전 stored |
| 0 | 1 | 1 | data_in | 이전 stored |

상태표 출처: 교안 14쪽. 에지 전 `stored=A`, `data_in=3`, 두 제어 1이면 에지 후 `stored=3, value=A`; 다음 에지에도 두 제어가 1이면 `value=3`(15쪽).

## 3. 정상 TB·파형

| 항목 | 판정 | 근거 | 요구 내용 |
|---|---|---|---|
| TB clock/검사 | REQUIRED | 24~28쪽 | `always #5 clk=~clk`로 10 ns 주기. `step`은 상승 에지 뒤 `#1`까지 기다려 nonblocking 갱신 후 비교. 불일치 시 `LAB2_FAIL`과 `$fatal`, 전 검사 통과 시 `LAB2_PASS`. |
| 정상 검사 | REQUIRED | 24~28쪽, 35쪽 | 6 ns reset `00`; 16 ns A 저장 `A0`; 26 ns 입력 3에서 저장값 전달 `AA`; 36 ns 동시 동작 `3A`; 46 ns 연속 동시 동작 `33`; 56 ns 입력 F이지만 hold `33`; 66 ns 리셋 우선 `00`. 예상 정상 로그 `LAB2_PASS register_pair checks=7`, 종료 `66000 ps`=`66 ns`. 실제 실행은 아직 미확인. |
| 필수 파형 신호 | REQUIRED | 39~40쪽 | VaporView `tb_register_pair`에서 `clk`, `rst`, `load`, `transfer`, `data_in`, `stored`, `value`; 이름 열과 ns 시간축 표시. |
| 전체/확대 관찰 | REQUIRED | 40~44쪽 | Zoom Fit 전체 0~66 ns, 그리고 25/35/45 ns 상승 에지 주변 확대. 15 ns 저장만 수행, 25 ns 입력 3이 아닌 이전 저장 A 전달, 35 ns 동시 동작에서 이전 stored A 사용, 45 ns 다음 전달, 55 ns hold, 65 ns reset 우선순위도 해석. 교안은 확대 창의 시작·끝 ns를 고정하지 않음. |

## 4. 수정·실패·복구

| 항목 | 판정 | 근거 | 요구 내용 |
|---|---|---|---|
| 수정 실험 | REQUIRED | 43~44쪽 | 정상 로그와 `wave.vcd`를 먼저 보관. `src/register_pair.v`의 **한 줄** `if (transfer) value <= stored;`에서 오른쪽 항만 바꿔 `if (transfer) value <= data_in;`. TB는 그대로 둠. 저장·실행 후 실패 확인. |
| 첫 실패 예상 | REQUIRED | 24~28쪽, 43쪽 | 25 ns 에지 전 `stored=A`, `data_in=3`, `transfer=1`. 정상 `value=A`, 오류 회로 `value=3`; 26 ns 검사 `transfer stored not live input`에서 처음 FAIL 예상. `stored`는 A로 유지하므로 정상 결합값 `{stored,value}=8'haa`, 오류 예상 `8'ha3`. |
| 원복 | REQUIRED | 43~44쪽 | 원래 `value <= stored`로 복원·저장 후 새 시뮬레이션에서 `checks=7` PASS 확인. 정상·변경·원복 각 실행 로그와 검사 시각을 구분. |

## 5. Vivado·보드 및 기록

| 항목 | 판정 | 근거 | 요구 내용 |
|---|---|---|---|
| Vivado 준비 | REQUIRED | 45~59쪽 | 같은 학생 폴더의 RTL 3개, TB, XDC를 Copy 옵션 해제해 연결. `xc7s75fgga484-1`, design top `lab2_register`, simulation top `tb_register_pair`. 뒤의 XSim/합성/구현/bit/보드 단계는 아직 수행 결과가 아님. |
| 클록·핀 | REQUIRED | 22~23쪽, 29~32쪽, 67쪽, 77쪽 | Combo II-DLD S75, B6 주 클록 **1 kHz**, K4 reset, N8 button, DIP SW1~SW8=`sw[7]`~`sw[0]`; LED[7:4]=stored, LED[3:0]=value. XDC는 `create_clock -period 1000000.000` ns와 `LVCMOS33` 등을 지정. |
| 보드 사전 계산 | REQUIRED | 44쪽 5항, 77~78쪽 | 스위치를 먼저 안정시킨 뒤 N8을 누르고 놓음. `sw=A1→LED=A0`, `32→AA`, `33→3A`, 다시 `33→33`, `F0→33` 유지, K4 리셋→`00` 예상. `sw[3:2]` 미사용. 20 안정 샘플=20 ms 조건 고려. 실제 board 관찰과 구분. |
| XDC와 VS Code | REQUIRED | 29쪽 | Icarus 기능 시뮬레이션은 XDC를 사용하지 않음. 코어 TB 통과는 핀/보드 검증이 아님. |
| 개인 설정/오류 기록 | REQUIRED_IF_APPLICABLE | 7~8쪽, 33쪽, 36쪽 | 실제 Python/PATH/slang 변경, WindowsApps·9009 등의 오류가 발생하면 수정 내용과 실제 버전/해결을 기록. 현재 발생 여부는 UNKNOWN이며 오류를 꾸미지 않음. |

교안 XDC 30~32쪽의 비트별 PACKAGE_PIN: `sw[0:7]=U4,V4,W1,W4,T1,U2,W3,Y1`, `led[0:7]=N5,M1,M3,M7,N7,M2,M4,L4`. `clk=B6`, `rst=K4`, `button=N8`; 모든 대상 포트 `LVCMOS33`. `rst`, `button`, `sw[*]` 입력에는 교안의 `set_false_path -from` 제약이 있다. 이 값은 03 교안 XDC 코드 화면을 재대조한 것이다.

## 아직 미확인

- `LAB2/03_register`에는 교안 RTL/TB/XDC와 v2.0.1 공통 파일을 전사·배치했다. 현재 소스 상태는 `GENERATED_DRAFT`; 학생의 구조·예상 동작·TB 검토는 아직 미확인.
- 정상·수정·원복 실행 로그, 실제 종료 시각, VCD, 사용자 VaporView 관찰, Vivado/board 수행 결과: NOT_PERFORMED 또는 UNKNOWN.
- XDC 주석이 가리키는 `evidence/board-pin-provenance.json` 제공 파일의 존재와 원본 근거: UNKNOWN.
