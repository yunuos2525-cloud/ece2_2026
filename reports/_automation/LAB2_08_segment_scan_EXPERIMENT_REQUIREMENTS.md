# LAB2 08_segment_scan — EXPERIMENT_REQUIREMENTS

상태: COURSE_EXTRACTED / NOT_PERFORMED. 출처: `C:\Users\yunji\Downloads\05.LAB2_0921_VIVADO_8plus1.zip` 내부 `05.LAB2_08_SEGMENT_SCAN_VIVADO.pdf` **1~82쪽 전체**. 아래 PASS·시각·파형 값은 교안 및 TB에서 얻은 **정상 설계 예상**이며 이 작업공간의 실행 결과가 아니다. `05.LAB2_08A_INTEGRATED_VIVADO.pdf`는 별도 08A 실험 자료이며 이 문서의 08 요구로 합치지 않는다.

## 1. 파일, module, 실행 설정

| 항목 | 판정 | 교안 근거 | 요구 내용 |
|---|---|---|---|
| 템플릿 | REQUIRED | 3~8쪽 | `fpga-lab-template` v2.0.1, `LAB1.code-workspace`; placeholder `src/design.v`, `sim/tb_design.v`, `constraints/pins.xdc`를 실험 파일로 교체 |
| RTL | REQUIRED | 9쪽, 17~24쪽 | `src/segment_scan8.v`의 `segment_scan8`, `src/input_frontend.v`의 `input_frontend`, `src/lab2_segment_scan.v`의 `lab2_segment_scan` |
| TB | REQUIRED | 9쪽, 27~30쪽 | `sim/tb_segment_scan8.sv`, module `tb_segment_scan8` |
| XDC | REQUIRED | 9쪽, 31~36쪽 | `constraints/lab2_segment_scan.xdc`; top의 `clk,rst,button,sw[7:0],led[7:0],seg_data[7:0],seg_com[7:0]` 총 35 포트 bit에 핀과 LVCMOS33 지정 |
| design top | REQUIRED | 23쪽, 51쪽, 60쪽 | `lab2_segment_scan` |
| simulation top | REQUIRED | 10~11쪽, 27쪽, 51쪽, 59~60쪽 | `tb_segment_scan8`; design top과 구분 |
| `simulation.json` | REQUIRED | 10~11쪽 | `sources=["src/segment_scan8.v","src/input_frontend.v","src/lab2_segment_scan.v"]`; `testbench="sim/tb_segment_scan8.sv"`; `simulation_top="tb_segment_scan8"` |
| 도구 구분 | REQUIRED | 6~7쪽, 31쪽 | `01 Check tools`로 Git/Python/Icarus 확인. VS Code `02 Simulate`는 Icarus, Vivado Behavioral Simulation은 XSim. |

## 2. 코어와 보드 연결 원리

| 항목 | 판정 | 교안 근거 | 실제 코드·설명 기준 |
|---|---|---|---|
| 코어 입출력 | REQUIRED | 13~19쪽 | `clk,rst,enable,digits[31:0]` 입력, `select[7:0],segments[7:0],index[2:0]` 출력. `digits`는 8개 4-bit nibble 묶음; `index=0`은 최하위 nibble. `nibble=digits >> (index*4)`로 현재 자리의 숫자 선택. |
| scan 순서 | REQUIRED | 13~15쪽, 17~18쪽 | 3-bit `index`가 0→1→…→7→0 순환. 1회의 활성 구간 다음에 1회의 blank 구간. `enable=1`인 에지에서 `blank<=~blank`; **에지 전** `blank=0`이면 `index<=index+1'b1`로 다음 자리 준비, `blank=1`이면 index 유지. `enable=0`이면 두 상태 유지. |
| reset | REQUIRED | 14쪽, 17쪽, 26쪽 | 상승 에지에서 `index<=0`, `blank<=1`. 따라서 논리 `select=00`, 모든 자리 off. `segments`는 별도 0 초기화가 아니며 현재 nibble의 패턴이 조합적으로 나올 수 있다. |
| 논리 자리 선택 | REQUIRED | 13~14쪽, 18쪽 | `select=blank ? 8'h00 : (8'h01 << index)`; **active-high one-hot**. `00`은 전체 blank. |
| 논리 segment | REQUIRED | 16쪽, 18~19쪽 | `segments[7:0]={a,b,c,d,e,f,g,dp}`; 해당 segment 켜짐이 1, `dp=0`. `nibble` case로 `0..F`를 조합 decode. `seg_data=segments`로 전달. |
| 0~F 패턴 | REQUIRED | 18~19쪽, 29쪽 | `0:FC, 1:60, 2:DA, 3:F2, 4:66, 5:B6, 6:BE, 7:E0, 8:FE, 9:F6, A:EE, B:3E, C:9C, D:7A, E:9E, F:8E` (hex). `default:00`. |
| 물리 COM 변환 | REQUIRED | 16쪽, 23~24쪽, 47쪽 | legacy COM은 **active-low**이며 비트 순서가 역전. `seg_com=~{selected[0],selected[1],...,selected[7]}`. index 0 논리 `select=01` → 물리 `seg_com=7F`(COM[7]만 0); index 1 → `BF`; index 2 → `DF`; blank → `FF`. 논리 `select`와 물리 `seg_com`의 극성을 혼동하지 않음. |
| wrapper 입력·출력 | REQUIRED | 12쪽, 23~24쪽, 47쪽 | `digits={28'h7654321,switches[7:4]}`; SW1~4가 첫 자리 nibble. `input_frontend`는 reset/스위치 동기화. `segment_scan8`의 enable은 `1'b1`에 고정되어 자동 scan; N8 버튼으로 scan을 진행하지 않음. `led={5'b00000,index}`로 LED[2:0]에 현재 index. |
| 분주/tick | NOT_REQUIRED | 15쪽, 17~24쪽 | 별도 분주기·tick RTL 없음. 코어는 enable 에지마다 활성/blank를 교대하고 보드 wrapper는 enable을 1로 고정. 실제 B6 1 kHz 조건에서 활성 1 ms + blank 1 ms = 자리당 2 ms, 8자리 한 바퀴 16 ms, 자리당 반복률 **62.5 Hz**, on duty **1/16 = 6.25%**. TB는 enable=0 hold 검사를 끼워 넣으므로 TB 파형의 시간 간격을 이 보드 주기라고 해석하지 않음. |
| 논리 블록 | REQUIRED | 17~19쪽 | `always @(posedge clk)`에서 `index`,`blank`를 nonblocking `<=`로 갱신. `always @*`에서 `nibble`,`select`,`segments`를 blocking `=`로 계산. 분리된 next-state 조합 블록은 없음. |

## 3. 정상 TB 및 파형

| 항목 | 판정 | 교안 근거 | 확인할 내용 |
|---|---|---|---|
| clock/검사 | REQUIRED | 25~30쪽 | `` `timescale 1ns/1ps``, `clk=0`, `always #5 clk=~clk` → 10 ns 주기. `step`은 `@(posedge clk); #1`, `check`는 불일치 시 `LAB2_FAIL`과 `$fatal`; watchdog `#100000`. |
| 입력·검사 수 | REQUIRED | 25쪽, 28~30쪽 | `digits=32'h76543210`에서 0~7, `32'hfedcba98`에서 8~F. 각 bank를 두 바퀴. 자리마다 `index`, one-hot `select`, `segments` 패턴, active hold, blank, blank hold의 6검사. 초기/마지막 reset 각 1검사. `2×2×8×6+2=194`. |
| 정상 종료 | REQUIRED | 25쪽, 39~40쪽 | 정상 기대 로그 `LAB2_PASS segment_scan8 checks=194`, `$finish` **1306 ns**. 교안 캡처의 1306000 ps는 같은 시각. 실제 PASS 여부는 새 실행 뒤 확인. |
| 첫 전환의 expected | REQUIRED | 26쪽, 29~30쪽, 45쪽 | 6 ns reset `index=0,select=00`(segments는 0 digit `FC` 가능). 16 ns `index=0,select=01,segments=FC`; 26 ns enable0에서 `01` 유지; 36 ns `index=1,select=00` blank; 46 ns enable0에서 `00` 유지; 56 ns `index=1,select=02,segments=60`. **blank는 `segments=00` 여부가 아닌 `select=00`으로 판단**. |
| 전체 파형 | REQUIRED | 38쪽, 43~46쪽 | VaporView에 `clk,rst,enable,digits,index,select,segments`와 검사 수 `checks`를 추가. `checks`는 Decimal (Unsigned); `index` decimal, `select/segments` hex 가독성. Zoom Fit으로 정상 예상 전체 **0~1306 ns**, digits 두 묶음, 각 묶음의 index 0~7 두 바퀴, enable0 hold, 마지막 reset 확인. |
| 전환 확대 | REQUIRED | 26쪽, 45쪽, 49~50쪽 | 첫 두 자리 중심으로 **6~56 ns**의 reset blank→digit0 활성→hold→digit1 준비 blank→hold→digit1 활성. `clk,rst,enable,digits,index,select,segments`를 함께 비교. 확대 캡처의 정확한 좌우 여백/파일명은 교안 미지정. |
| 사용자 관찰 | REQUIRED | 38~40쪽, workflow | 자기 최신 실행의 VCD를 VaporView에서 학생이 직접 읽고 screenshot을 제공/승인. 교안 예시 screenshot, PASS 로그 또는 VCD 수치 parsing만으로 완료 처리하지 않음. |

## 4. 수정 실험 — REQUIRED, 아직 수행하지 않음

| 항목 | 교안 근거 | 지정 내용 / 정상 코드로부터 계산한 예상 |
|---|---|---|
| 변경 위치·한 줄 | 18쪽 24행, 48쪽, 50쪽 | `src/segment_scan8.v` 조합 블록의 `select = blank ? 8'h00 : (8'h01 << index);`에서 **`blank ? 8'h00 :` 부분만 제거**하여 `select = (8'h01 << index);`로 변경. 자리 간 blanking 제거. 다른 RTL·TB expected는 바꾸지 않음. |
| 정상 보존 | 48쪽 | 정상 log·파형을 먼저 보관. 수정 실행 증거를 정상 실행 증거와 분리. |
| 첫 예상 failure | 29쪽 37행, 50쪽 | reset 첫 검사 **6 ns**, description `reset blanks digit zero`. 정상 expected: `index=0,select=00`; 변경 예상 actual: `index=0,select=01`. 이 변경은 자리 간 blank뿐 아니라 **reset blank**도 없애므로 첫 검사가 reset 검사임. |
| 실패/복구 | 48~50쪽 | 실제 `LAB2_FAIL`의 검사 이름·시간/조건 기록, 왜 실패했는지 설명. 원래 식으로 되돌리고 저장한 뒤 **새 실행**의 전체 PASS 194개·1306 ns 확인. 정상/변경/복구 3행 비교표와 실행 로그 준비. |

## 5. Vivado / board 사전 준비

| 항목 | 판정 | 교안 근거 | 요구 내용 |
|---|---|---|---|
| 프로젝트 | REQUIRED | 51~63쪽 | 부품 `xc7s75fgga484-1`; 같은 RTL 3개/TB/XDC를 Copy sources/constraints 옵션 해제해 등록. design top `lab2_segment_scan`, simulation top `tb_segment_scan8`. XSim은 기본 1000 ns에서 끝나지 않으므로 Run All로 1306 ns `$finish`까지. 아직 실행 결과로 주장하지 않음. |
| XDC / 보드 clock | REQUIRED | 31~36쪽, 66~70쪽 | B6=`clk` 실제 **1 kHz**, XDC `create_clock -period 1000000.000` ns; K4=`rst`, N8=`button`. 35개 포트 bit에 LVCMOS33, `rst button sw[*]`에 false path. 핀 세부 값은 XDC 원문 화면 32~36쪽 근거이며 추측 금지. |
| 보드 표시·관찰 계획 | REQUIRED | 12쪽, 47쪽, 49쪽 5항, 80~81쪽 | SW1~4=`1001`이면 첫 자리 9, 이어 1~7을 COM[7]부터 표시. SW1~4 변경 시 첫 자리만 변경, N8 입력 불필요. LED[2:0]=scan index. 1 kHz/K4 reset 뒤 자동 scan과 blanking을 육안·카메라 관찰하되 빠른 index/COM/LED 전환의 개별 상태를 육안으로 모두 분리할 수 있다고 가정하지 않음. |
| VS Code와 XDC | REQUIRED | 31쪽 | Icarus 기능 simulation은 XDC를 사용하지 않음. PASS가 pin/보드 검증을 뜻하지 않음. |
| 별도 환경 설정·일반 오류 기록 | NOT_REQUIRED | 6~7쪽, 48~50쪽 | 도구 점검/문제 해결 안내는 있으나 08 실험 전 레포트의 별도 설정 변경·일반 오류 기록 항목은 명시되지 않음. **지정 수정 실험의 FAIL·복구 기록은 REQUIRED**. 실제 환경 오류 발생 여부는 UNKNOWN. |

## 아직 미확인

- `LAB2/08_segment_scan`에 교안 RTL·TB·XDC와 v2.0.1 기반 공통 구조를 배치했다. 현재 상태는 `GENERATED_DRAFT`이며 학생 source review는 아직 확인되지 않았다.
- 학생 source review, 이 작업공간의 정상/변경/복구 simulation과 로그·VCD, 사용자 VaporView 관찰, Vivado/board 실제 결과: NOT_PERFORMED / NOT_VERIFIED.
- 교안 XDC 주석의 `evidence/board-pin-provenance.json` 실제 제공 여부: UNKNOWN. 핀 값은 교안 XDC 화면 32~36쪽에서 확인했으며 외부 파일을 읽은 것으로 간주하지 않는다.
- 제출용 전체 제목·순서를 강제하는 원본 양식: `UNKNOWN_FORMAT_AUTHORITY`. 08 교안 49쪽의 내용 1~5항은 직접 확인했다.
