# LAB2 08A_integrated — EXPERIMENT_REQUIREMENTS

상태: COURSE_EXTRACTED / GENERATED_DRAFT. 출처: `C:\Users\yunji\Downloads\05.LAB2_0921_VIVADO_8plus1.zip` 내부 **`05.LAB2_08A_INTEGRATED_VIVADO.pdf` 1~120쪽 전체**. 아래 PASS, 시각, 값은 교안과 TB로부터 얻은 예상이며 이 작업공간의 실행 결과가 아니다. 01~08의 별도 교안을 조합해 새 연결을 만들지 않고 **08A 교안의 `lab2_integrated.v` 연결만** 적용한다.

## 1. 파일 구성과 top

| 항목 | 판정 | 교안 근거 | 요구 내용 |
|---|---|---|---|
| 템플릿 | REQUIRED | 3~8쪽 | `fpga-lab-template` v2.0.1과 `LAB1.code-workspace`; placeholder `src/design.v`, `sim/tb_design.v`, `constraints/pins.xdc` 교체 |
| RTL 12개 | REQUIRED | 9~11쪽, 25~49쪽, 93쪽 | `src/counter4.v`, `src/clock_divider.v`, `src/register_pair.v`, `src/shift_register4.v`, `src/piso4.v`, `src/moore_cycle.v`, `src/mealy_toggle.v`, `src/segment_scan8.v`, `src/input_frontend.v`, `src/button_onepulse.v`, `src/lcd_lab2_modes.v`, `src/lab2_integrated.v` |
| TB/XDC | REQUIRED | 11쪽, 54~70쪽 | `sim/tb_lab2_integrated.sv`, `constraints/lab2_integrated.xdc` |
| design/simulation top | REQUIRED | 45쪽, 54쪽, 88쪽, 96쪽 | design `lab2_integrated`, simulation `tb_lab2_integrated` |
| `simulation.json` | REQUIRED | 12~14쪽 | `sources`는 위 RTL 12개를 **그 순서로** 지정; `testbench="sim/tb_lab2_integrated.sv"`; `simulation_top="tb_lab2_integrated"` |
| 실행 도구 | REQUIRED | 6~7쪽, 63쪽, 71쪽 | `01 Check tools`의 Git/Python/Icarus 점검. VS Code `02 Simulate`는 Icarus, Vivado Behavioral Simulation은 XSim. XDC는 Icarus 기능 simulation에 사용되지 않음. |

## 2. 실제 포함 블록과 연결 — 08A top 코드 기준

| 블록·신호 | 판정 | 교안 근거 | 연결/역할 |
|---|---|---|---|
| 공통 clock과 제어 | REQUIRED | 15~20쪽, 45~47쪽 | 전 코어의 저장 clock은 **B6 `clk` 하나**. `input_frontend #(.STABLE_CYCLES(STABLE_CYCLES))`에 `clk,rst,mode_button,sw`를 넣어 `reset,mode_press,switches`를 생성. `button_onepulse`는 `clk,reset,step_button`에서 `step_press` 생성. `mode[2:0]`은 reset에서 0, `mode_press` 때 +1로 0~7 순환. |
| 모드 변경 reset | REQUIRED | 20쪽, 46~49쪽, 53쪽 | `circuit_reset = reset \|\| mode_press`. **모든 8개 코어**의 reset에 연결되어 새 모드 진입 시 상태 초기화. 같은 에지에 `step_press=1`이어도 reset 우선. LCD `lcd_lab2_modes`에는 `reset`만 연결하며 `mode_press`는 LCD reset이 아님. |
| mode 0 counter | REQUIRED | 19~21쪽, 25쪽, 47~48쪽, 52쪽 | `counter4(clk,circuit_reset,step_press && mode==0,switches[0],count)`. SW8=`sw[0]`이 down 선택(0 증가, 1 감소); N4 step마다 4-bit count. LED=`{4'b0,count}`. |
| mode 1 divider/tick | REQUIRED | 19~21쪽, 26~27쪽, 47~48쪽, 50~52쪽 | `clock_divider` **4개**: 주 `DIVISOR`(기본 1000)의 `divided,tick`, 관찰용 DIVISOR 2/10/50의 `div2,div10,div50`. 모두 `clk,circuit_reset` 사용; 다른 코어의 clock이나 enable로 tick을 연결하지 않음. LED=`{3'b0,tick,divided,div50,div10,div2}`. mode1에서 관찰하되 divider 자체는 mode gate 없이 clock에 연결됨. |
| mode 2 register | REQUIRED | 21쪽, 28쪽, 47~48쪽, 52쪽 | `register_pair`: `load=step_press && mode==2 && switches[0]`, `transfer=step_press && mode==2 && switches[1]`, `data_in=switches[7:4]`, `stored,registered`. LED=`{stored,registered}`. 동시 load/transfer 때 `registered`는 nonblocking에 따른 **이전** `stored`. |
| mode 3 shift | REQUIRED | 21쪽, 29쪽, 47~48쪽, 52쪽 | `shift_register4`: `enable=step_press && mode==3`, `serial_in=switches[7]`; serial bit가 bit3으로 들어와 기존 비트가 bit0 방향으로 이동. LED=`{4'b0,shifted}`. |
| mode 4 PISO | REQUIRED | 21쪽, 30쪽, 47~48쪽, 52쪽 | `piso4`: `load=step_press && mode==4 && switches[0]`, `enable=step_press && mode==4 && !switches[0]`, `data_in=switches[7:4]`. load 우선, shift 때 내부 값 `{value[2:0],1'b0}`, `serial_out=value[3]`. LED=`{parallel,3'b0,serial_out}`. 여기서 `switches[1]`은 PISO enable에 연결되지 않음. |
| mode 5 Moore | REQUIRED | 21쪽, 31쪽, 47~48쪽, 52쪽 | `moore_cycle`: `enable=step_press && mode==5`, `advance=switches[7]`; reset 0, 입력1과 step에서 0→1→2→0, 입력만 바꾸면 출력 상태 유지. LED=`{6'b0,moore_value}`. |
| mode 6 Mealy | REQUIRED | 21쪽, 32쪽, 47~48쪽, 52쪽 | `mealy_toggle`: `enable=step_press && mode==6`, `bit_in=switches[7]`; bit_in1과 step에서 state 반전. `value=!bit_in ? 00 : (state ? 01 : 10)`은 조합 출력이라 입력 변경만으로 변할 수 있음. LED=`{5'b0,mealy_state,mealy_value}`. |
| mode 7 scan | REQUIRED | 21쪽, 33~35쪽, 47~48쪽, 52쪽 | `segment_scan8`: `enable=mode==7`, `digits={28'h7654321,switches[7:4]}`; `selected,segments,scan_index`. LED=`{5'b0,scan_index}`. `seg_data=segments`와 reversed/inverted `seg_com`은 **mode7에서만** 출력; 다른 모드 `seg_data=00`, `seg_com=FF`. 자리 활성/blank 교대; SW1~4 (`sw[7:4]`)가 첫 자리 숫자. |
| LCD mode display | REQUIRED | 17~18쪽, 22~23쪽, 41~44쪽, 49~51쪽 | `lcd_lab2_modes #(.POWER_WAIT(LCD_POWER_WAIT)) display(clk,reset,{1'b0,mode},lcd_e,lcd_rs,lcd_rw,lcd_data)`. LCD 첫 줄 `MODE 01`~`MODE 08`, 둘째 줄 각 mode명 16칸 공백 채움. `shown_mode`는 새 첫 줄 주소 `80` 전송 때 현재 mode를 고정해 한 화면 안에서 번호와 이름이 섞이지 않음. `lcd_rw=0`; 4-phase setup/E-high/E-low/recovery, 기본 1 kHz에서 각 phase 1 ms. 기본 `LCD_POWER_WAIT=50` clock. |
| 포함하지 않는 연결 | NOT_REQUIRED | 45~49쪽 | 별도 top별 wrapper `lab2_counter`, `lab2_piso` 등은 08A `sources`에 없음. `tick`으로 코어들을 구동하는 구조, N8을 step으로 겸용하는 구조, 별도 LCD clock 생성도 없음. |

## 3. 정상 TB, 대표 expected, 파형

| 항목 | 판정 | 교안 근거 | 검증 내용 |
|---|---|---|---|
| TB 시간축·입력 | REQUIRED | 50쪽, 54~62쪽 | `` `timescale 1ns/1ps``, `clk=0`, `always #5` → **10 ns 주기**. DUT `STABLE_CYCLES=3`, `DIVISOR=10`으로 버튼/분주 대기 단축; LCD는 기본 POWER_WAIT 유지. `step`은 posedge 뒤 `#1`; `switches`는 4 step 동기화 대기. 실제 보드 기본 STABLE_CYCLES=20, DIVISOR=1000, B6 1 kHz와 혼동 금지. |
| 버튼·LCD 검사 | REQUIRED | 50~51쪽, 54~58쪽 | 짧은 바운스+긴 유효 누름으로 N8/N4 one-pulse 검증. LCD를 내부 ROM 없이 실제 `lcd_data,lcd_rs,lcd_e` 버스에서 **32칸 screen**으로 복원; 주소 `80/C0`, write-only, data/RS 안정 및 E-high 시간 확인. `check_lcd`는 300 clock 뒤 번호·공백·둘째 줄 16문자 비교. |
| 8 mode 예상 sequence | REQUIRED | 52~53쪽, 58~61쪽 | mode0 `00→01→00→0F`(증가·감소·borrow wrap); mode1 TB `/10`에서 30 clock 동안 tick 3회; mode2 `A0→3A→33`(동시 load/transfer의 이전 값); mode3 `08→04`; mode4 `A1→40→81`; mode5 입력만으로 유지한 뒤 `0→1→2→0`; mode6 `00→02`(입력만), step 뒤 `05`, 입력0 뒤 `04`; mode7 SW nibble 9에서 `seg_data=F6`(index0 활성), COM 극성·blank 32/active 32. 이어 mode7→0에서 이전 counter 15가 유지되지 않고 0, 동시 버튼과 전체 reset 확인. |
| 정상 PASS | REQUIRED | 53쪽, 73~74쪽, 61~62쪽 | 교안/TB 기준 `LAB2_INTEGRATED_PASS modes=8 checks=2848`, 종료 **34326 ns** (=34.326 µs). 실제 log·종료 상태는 실행 뒤 확인. |
| 전체 waveform | REQUIRED | 72쪽, 77~82쪽, 86~87쪽 | VaporView 전체 0~34.326 µs Zoom Fit: mode 0→7→0, N8/N4 역할, sw/LED, mode7에서만 seg 출력. TB shallow 변수와 `dut.mode` 추가, `checks` Decimal (Unsigned), hex bus, Time Unit µs/Zoom Fit. |
| 목적별 확대 | REQUIRED | 82~84쪽, 86~87쪽 | 제어(`clk,rst,mode_button,step_button,dut.mode,dut.mode_press,dut.step_press,dut.circuit_reset`), 회로(`sw,led`와 현재 코어 저장값), LCD(`lcd_e,rs,rw,data`, MODE05 전송 **약 17.1 µs**), scan(`seg_com,seg_data,dut.scan_index`, FF blank), 마지막 동시 버튼/reset을 **해당 실제 run 시각**에 대조. 정확한 모든 확대 시간창은 교안 미지정. |
| reset 전체 관계 | REQUIRED | 20쪽, 53쪽, 61쪽 | 전체 rst에서 mode0, LED0, `lcd_e=0`, `seg_com=FF`; mode 변경 때 각 코어 초기화, LCD는 계속 작성 중인 화면을 완성하고 다음 refresh에서 최신 mode 표시. |

## 4. 수정 실험 — REQUIRED, 아직 수행하지 않음

| 항목 | 교안 근거 | 지정 변경 및 예상 |
|---|---|---|
| 한 줄 변경 | 25쪽 10행, 85~86쪽 | **`src/counter4.v`**의 증가식 `else value <= value + 4'd1;`에서 증가량 **`4'd1` → `4'd2`**. 다른 연산/연결 및 TB expected는 그대로. 정상 log·wave 먼저 보존. |
| 첫 예상 FAIL | 54~59쪽 TB 순서에서 계산, 85쪽 | `switches(0); push_step; check(led===1,"counter increments once")`의 **346 ns**. 정상 expected LED `8'h01`/counter1; 변경 예상 actual LED `8'h02`/counter2. failure description `counter increments once`. 교안은 최초 시각을 직접 적지 않으므로 **TB의 10 ns clock·`step` 호출 수로 계산한 예상**이다. 실제 FAIL 시각은 새 로그에서 다시 확인. |
| 실패·복구 | 85~86쪽 | 수정 실행의 `LAB2_INTEGRATED_FAIL` 검사 이름·시간·입력/이전·다음 상태 기록. 원래 `4'd1` 복원·저장 뒤 **새 실행**에서 modes8/checks2848/34326 ns PASS 기대. 정상/변경/복구 3행 비교와 각 실행 log. |

## 5. Vivado / board 계획과 설정 범위

| 항목 | 판정 | 교안 근거 | 요구 내용 |
|---|---|---|---|
| Vivado 시작 | REQUIRED | 88~100쪽 | device `xc7s75fgga484-1`, design top `lab2_integrated`, simulation top `tb_lab2_integrated`; 같은 RTL 12개, TB, XDC를 Copy 옵션 해제해 참조. XSim 기본 1000 ns는 불충분하므로 Run All로 `$finish`까지. 아직 XSim 결과로 주장하지 않음. |
| XDC/clock | REQUIRED | 63~70쪽, 101~107쪽 | XDC top 47 포트 bit: `clk,rst,mode_button,step_button`, `sw[7:0],led[7:0],seg_data[7:0],seg_com[7:0],lcd_data[7:0]`, `lcd_e,lcd_rs,lcd_rw`; 전부 LVCMOS33. B6 clk **1 kHz**, `create_clock -period 1000000.000` ns; K4 rst, N8 mode, N4 step. `rst mode_button step_button sw[*]` false path. bit 0→7 순서로 SW=U4/V4/W1/W4/T1/U2/W3/Y1, LED=N5/M1/M3/M7/N7/M2/M4/L4, `seg_data`=H2/J7/J3/J1/E4/E2/F5/F1, `seg_com`=K5/K3/K1/L6/G3/G1/H6/H4, `lcd_data`=A4/B2/C3/D4/A2/C5/C1/D1; LCD E=A6, RS=G6, RW=D6. `seg_com`의 0은 **선택된 COM 핀의 활성-low**, `FF`는 전체 off. |
| 실제 입력 순서 | REQUIRED | 15~18쪽, 52쪽, 86쪽 5항, 118~119쪽 | B6 1 kHz 설정 → K4 reset으로 MODE 01/counter 초기화 → 각 mode에서 스위치를 먼저 놓고 N4로 해당 동작 실행 → N8로 다음 mode. 8개 mode의 LCD 번호·이름과 sw/LED 결과, MODE 08의 8자리 scan/blank, MODE 08→01 순환 및 counter 0 재시작을 기록. 실제 눈·카메라 관찰 전에는 board 검증으로 주장 금지. |
| 별도 일반 환경 변경·오류 기록 | NOT_REQUIRED | 6~7쪽, 85~86쪽 | PRE 항목에 별도 설정 변경·일반 도구 오류 기록 절은 명시되지 않음. **지정 수정 실험 FAIL·복구 로그는 REQUIRED**. 실제 도구 오류가 생기면 내부 provenance에만 사실대로 기록. POST의 timing/warning 검토(114~117쪽)는 별도 후속 단계. |

### 보드 입력·출력 사전 계획 — 교안 top/TB에서 계산, 실제 관찰 아님

B6를 1 kHz로 맞추고 K4 reset 뒤 **스위치를 먼저 설정하고 버튼을 누른다**. N8은 다음 mode, N4는 선택된 코어의 step이다. 스위치 변경은 `input_frontend` 동기화 뒤 반영되며, 각 유효 버튼 누름에는 STABLE_CYCLES=20의 debounce 시간이 필요하다. LCD는 현재 mode의 번호·이름을 refresh 주기에 표시한다.

| LCD / 내부 mode | 사용자가 설정·조작할 입력 예 | 교안 top/TB 기준 예상 출력 |
|---|---|---|
| MODE 01 / 0 | K4 뒤 SW8=`sw[0]`=0, N4; 이어 SW8=1, N4 두 번 | counter LED 하위 nibble `0→1→0→F`; 다음 mode로 갔다 돌아오면 초기 0 |
| MODE 02 / 1 | N8로 진입 후 clock 경과 관찰, N4 불필요 | LED[4:0]=`tick,divided,div50,div10,div2`; 기본 DIVISOR 1000과 1 kHz에서 tick은 1초마다 **1 ms** pulse, divided 1 Hz, 나머지 20/100/500 Hz 관찰값. 개별 빠른 LED 변화를 육안으로 모두 구분한다고 가정하지 않음 |
| MODE 03 / 2 | SW=`A1`, N4; SW=`33`, N4 두 번 | LED `A0→3A→33`; 두 저장소의 동시 load/transfer 시 old `stored` 사용 |
| MODE 04 / 3 | SW=`80`, N4; SW=`00`, N4 | LED `08→04`; SW1=`sw[7]` serial input |
| MODE 05 / 4 | SW=`A1`, N4 load; SW=`A0`, N4 두 번 shift | LED `A1→40→81`; serial output은 내부 bit3 |
| MODE 06 / 5 | SW=`80`으로 입력1, N4 세 번 | LED `0→1→2→0`; 입력만 변경하면 상태 유지 |
| MODE 07 / 6 | SW=`00`→`80` 변경, N4, 다시 `00` | LED `00→02`(입력만)→`05`(step)→`04`(입력0); `value`는 조합 출력 |
| MODE 08 / 7 | SW=`90`으로 첫 nibble9, 자동 scan 관찰; N8로 MODE01 복귀 | 첫 자리 COM[7] 활성 때 `seg_data=F6`, 나머지 1~7; blank에서 `seg_com=FF`, LED[2:0]=scan index. N4 불필요; N8 복귀 후 counter=0 |

## 아직 미확인

- `LAB2/08A_integrated`에 교안 RTL 12개, TB, XDC와 v2.0.1 기반 공통 구조를 배치했다. 현재 소스 상태는 `GENERATED_DRAFT`이며 아직 simulation을 실행하지 않았다.
- 학생 source review, 정상/변경/복구 log·VCD, 사용자 VaporView 관찰, Vivado/board 실제 결과: NOT_PERFORMED / NOT_VERIFIED.
- 교안 XDC 첫 줄의 `evidence/board-pin-provenance.json` 실제 제공 여부: UNKNOWN. 핀은 64~70쪽의 교안 화면에서 직접 확인했다.
- 08A가 LAB2 공식 **8개 제출 실험에 추가되는 별도 제출 단위인지**: UNKNOWN. 08A 교안에는 자체 실험 전 보고서 86쪽이 있으나 공통 형식 자료는 LAB2 실험 수를 8로 전달한다. 사용자가 08A 문서화를 요청한 범위에서 요구를 정리하며 제출 수를 임의로 9로 확정하지 않는다.
- 교수 제공 참고 목차의 고정 제목·순서 여부: `UNKNOWN_FORMAT_AUTHORITY`.
