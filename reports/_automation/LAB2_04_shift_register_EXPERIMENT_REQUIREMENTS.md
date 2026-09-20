# LAB2 04_shift_register — EXPERIMENT_REQUIREMENTS

상태: COURSE_EXTRACTED. 이 문서는 실행 결과가 아니다. 출처: `C:\Users\yunji\Downloads\05.LAB2_0921_VIVADO_8plus1.zip` 내부 `05.LAB2_04_SHIFT_REGISTER_VIVADO.pdf` 전체 1~75쪽. 아래 시각·값은 교안과 TB에서 확인한 **예상**이며 실제 실행 결과가 아니다.

## 1. 파일·module·설정

| 항목 | 판정 | 교안 근거 | 요구 내용 |
|---|---|---|---|
| 템플릿 | REQUIRED | 3~9쪽 | `fpga-lab-template` v2.0.1, `LAB1.code-workspace`; placeholder 이름을 교안 파일명으로 교체 |
| RTL | REQUIRED | 10쪽, 16~20쪽 | `src/shift_register4.v` (`shift_register4`), `src/input_frontend.v` (`input_frontend`), `src/lab2_shift_register.v` (`lab2_shift_register`) |
| TB | REQUIRED | 10쪽, 25~27쪽 | `sim/tb_shift_register4.sv`, module `tb_shift_register4` |
| XDC | REQUIRED | 10쪽, 28~31쪽 | `constraints/lab2_shift_register.xdc`; design top 포트 `clk`, `rst`, `button`, `sw[7:0]`, `led[7:0]`의 PACKAGE_PIN·LVCMOS33·클록/false-path 제약 |
| design top | REQUIRED | 20쪽, 43쪽, 57쪽 | `lab2_shift_register` |
| simulation top | REQUIRED | 11~12쪽, 25쪽, 43쪽, 56쪽 | `tb_shift_register4` |
| `simulation.json` | REQUIRED | 11~12쪽 | `sources=["src/shift_register4.v","src/input_frontend.v","src/lab2_shift_register.v"]`, `testbench="sim/tb_shift_register4.sv"`, `simulation_top="tb_shift_register4"` |
| 도구 구분 | REQUIRED | 7~8쪽, 32쪽 | `01 Check tools`로 Git/Python/Icarus 확인. VS Code `02 Simulate`는 Icarus, Vivado `Run Behavioral Simulation`은 XSim |

## 2. 시프트 원리·제어 조건

| 항목 | 판정 | 교안 근거 | 요구 내용 |
|---|---|---|---|
| 방향·입출력 | REQUIRED | 13~16쪽 | `serial_in` 1비트가 `value[3]`에 들어간다. 이전 `value[3]→[2]`, `[2]→[1]`, `[1]→[0]`; 이전 `[0]`은 버린다. `value[3:0]`이 4비트 저장 상태이자 출력. |
| 다음 상태 | REQUIRED | 14~16쪽 | `rst=1`이면 상승 에지에 `0000`; `rst=0,enable=0`이면 유지; `rst=0,enable=1`이면 `{serial_in, 이전 value[3:1]}`. reset이 enable보다 우선. |
| old-value | REQUIRED | 15~16쪽 | nonblocking 대입 오른쪽 항은 에지 직전 `value`; 네 비트는 같은 에지에 갱신된다. 한 입력 비트가 한 에지에 네 단계를 모두 지나가지 않는다. 예: 이전 `0100`, `serial_in=1` → 다음 `1010`. |
| 보드 front-end | REQUIRED | 17~22쪽 | `input_frontend`가 비동기 입력을 주 클록에 동기화하고 버튼 20개 연속 안정 샘플 뒤 한 클록 `press`를 만든다. `lab2_shift_register`는 `press`→`enable`, `switches[7]`→`serial_in`, `led={4'b0000,value}`로 연결한다. 1 kHz에서 20샘플은 20 ms. |

| rst | enable | 다음 `value[3:0]` |
|---:|---:|---|
| 1 | 무관 | `0000` |
| 0 | 0 | 이전 `value` 유지 |
| 0 | 1 | `{serial_in, 이전 value[3:1]}` |

## 3. 정상 TB·파형 계획

| 항목 | 판정 | 교안 근거 | 요구 내용 |
|---|---|---|---|
| TB clock·검사 | REQUIRED | 23~27쪽 | `always #5`로 10 ns 주기; `step`은 `@(posedge clk); #1`로 nonblocking 갱신 뒤 검사. `check`는 X까지 감지하고 불일치 시 `LAB2_FAIL`·`$fatal`; 8개 통과 시 `LAB2_PASS`. |
| 정상 PASS·종료 | REQUIRED | 23~27쪽, 34쪽 | 예상 `LAB2_PASS shift_register4 checks=8`; `$finish` 106000 ps = 106 ns. 실제 PASS·종료는 실행 전 미확인. |
| VaporView 신호 | REQUIRED | 37~38쪽 | `tb_shift_register4`에서 `clk`, `rst`, `enable`, `serial_in`, `value`를 추가하고 신호명과 ns 시간축 표시. |
| 전체/특정 구간 | REQUIRED | 38~42쪽 | 전체 0~106 ns Zoom Fit; 입력·유지(15,25,35,45,55 ns), 네 번의 0 입력(65~95 ns), reset 우선(105 ns)을 확인. 교안은 확대 창 시작·끝 ns 또는 확대 이미지 장수를 고정하지 않음. |

| 검사 시각 | 에지 전 시험 조건 | 에지 뒤 예상 `value` | TB 설명 |
|---:|---|---:|---|
| 6 ns | 5 ns, `rst=1` | `0` | `reset` |
| 16 ns | 15 ns, `enable=1`, `serial_in=1` | `8` (`1000`) | `input enters MSB` |
| 26 ns | 25 ns, `enable=1`, `serial_in=0` | `4` (`0100`) | `move toward LSB` |
| 36 ns | 35 ns, `enable=0`, `serial_in=1` | `4` 유지 | `hold` |
| 46 ns | 45 ns, `enable=1`, `serial_in=1` | `A` (`1010`) | `retain old stage values` |
| 56 ns | 55 ns, `enable=1`, `serial_in=0` | `5` (`0101`) | `four bit history` |
| 96 ns | 65/75/85/95 ns에 0 네 번 입력 | `0`; 경과 `5→2→1→0→0` | `flush with four zeros` |
| 106 ns | 105 ns, `rst=1`, `enable=1`, `serial_in=1` | `0` | `reset priority` |

0~5 ns의 `value=X`는 첫 동기 reset 에지 전 미정 상태다(40쪽). 첫 reset 에지 후에도 X가 남으면 원인을 점검한다.

## 4. 수정·실패·복구 — MODIFICATION_REQUIRED = REQUIRED

| 항목 | 판정 | 교안 근거 | 요구 내용 |
|---|---|---|---|
| 정상 증거 보존 | REQUIRED | 41쪽 | 정상 `simulation.log`와 `wave.vcd`를 수정 전에 보관. |
| 정확한 변경 | REQUIRED | 16쪽, 41쪽 | `src/shift_register4.v`의 `else if (enable) value <= {serial_in, value[3:1]};`에서 식 `{serial_in,value[3:1]}` → `{value[2:0],serial_in}`. TB와 정상 expected는 그대로 유지. |
| 왜 실패하는가 | REQUIRED | 13~16쪽, 23쪽, 41쪽 | 직렬 입력이 MSB `[3]` 대신 LSB `[0]`로 들어가 이동 방향이 반대가 됨. 첫 입력 1에 정상 `1000`(8), 변경 후 예상 `0001`(1). |
| 최초 예상 실패 | REQUIRED | 25~27쪽, 41쪽 | 15 ns 상승 에지 후 16 ns 검사 `input enters MSB`에서 첫 FAIL 예상. 실제 실패 시각/문구/값은 변경 실행 로그로 재확인. |
| 원복 | REQUIRED | 41~42쪽 | 원래 식으로 복원·저장 후 새 실행에서 `checks=8`, 106 ns 종료 PASS 확인. 정상/수정/원복 실행의 로그를 구분. |

## 5. Vivado·보드 사전 준비와 범위

| 항목 | 판정 | 교안 근거 | 요구 내용 |
|---|---|---|---|
| Vivado 준비 | REQUIRED | 43~57쪽 | 정상·변경·원복 후 동일 학생 폴더의 RTL 3개, TB, XDC를 Copy 옵션 해제하고 연결. 부품 `xc7s75fgga484-1`, design top `lab2_shift_register`, simulation top `tb_shift_register4`. 아직 Vivado 실행 결과로 취급하지 않음. |
| XDC·clock | REQUIRED | 22쪽, 28~31쪽, 63쪽 | Combo II-DLD S75, B6=`clk` 1 kHz / `create_clock -period 1000000.000` ns, K4=`rst`, N8=`button`, 모든 대상 `LVCMOS33`. 교안의 `sw[0:7]=U4,V4,W1,W4,T1,U2,W3,Y1`, `led[0:7]=N5,M1,M3,M7,N7,M2,M4,L4`; reset/button/sw false path. |
| 보드 조작·출력 | REQUIRED | 21~22쪽, 42쪽 5항, 73~74쪽 | DIP SW1=`sw[7]`이 serial input; N8 한 번 누르고 놓으면 한 단계; K4 reset. LED[3:0]=`value`, LED[7:4]=0. 예상 `00→08→04→0A→05→02→01→00→00`; N8 없이 SW1만 바꾸면 유지. 조작 전 스위치 안정 필요. |
| XDC의 VS Code 사용 | REQUIRED | 28쪽 | Icarus 코어 TB는 XDC를 읽지 않음. PASS가 실제 핀 연결·버튼·보드 검증을 뜻하지 않음. |
| 설정·오류 기록 | NOT_REQUIRED | 7~8쪽, 32쪽, 42쪽 | 교안은 도구 오류의 확인·해결 방법을 안내하지만, 04의 실험 전 레포트 항목에는 설정 변경/오류 기록을 요구하지 않음. 실제 오류 발생 여부는 UNKNOWN; 발생한다면 내부 provenance에 기록. |

## 아직 미확인

- `LAB2/04_shift_register`에 교안 RTL/TB/XDC와 v2.0.1 공통 파일을 전사·배치했다. 현재 소스 상태는 `GENERATED_DRAFT`; 학생의 구조·예상 동작·TB 검토는 아직 미확인.
- 학생 source review, 정상·수정·원복 simulation, VaporView 사용자 관찰, Vivado/보드 결과: NOT_PERFORMED 또는 UNKNOWN.
- XDC 주석이 가리키는 `evidence/board-pin-provenance.json` 원본 제공 여부: UNKNOWN. 교안의 XDC 코드 화면은 확인했다.
