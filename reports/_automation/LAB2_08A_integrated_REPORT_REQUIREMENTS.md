# LAB2 08A_integrated — REPORT_REQUIREMENTS

상태: COURSE_EXTRACTED. 예비보고서 본문은 아직 작성하지 않았다. 출처: ZIP 내부 `05.LAB2_08A_INTEGRATED_VIVADO.pdf` **1~120쪽**, 특히 **86쪽 실험 전 레포트 1~5항**, 82~87쪽 파형·수정 지시. 아래는 08A 교안의 **내용 요구**다. 고정 제출 제목·순서 여부는 `UNKNOWN_FORMAT_AUTHORITY`로 둔다.

| 보고서 항목 | 판정 | 교안 근거 | 필요한 내용·계산·증거 |
|---|---|---|---|
| 목적, mode·상태 전이·시간 예상표 | REQUIRED | 15~24쪽, 50~53쪽, 86쪽 1항 | K4 reset→mode0, N8 debounce pulse마다 0→1→…→7→0, N4는 선택 회로의 한 단계. 스위치 먼저 설정. mode 변경에서 `circuit_reset=reset\|\|mode_press`, 코어 reset이 step보다 우선하고 이전 mode 상태를 가져오지 않음. TB와 실제 보드 시간축 구분. |
| 8 mode·LCD 대응표 | REQUIRED | 17~18쪽, 41~44쪽, 86쪽 1항 | 내부 mode0~7 ↔ LCD `MODE 01`~`MODE 08` ↔ 둘째 줄 `UP DOWN COUNTER`, `CLOCK DIVIDER`, `REGISTER PAIR`, `SHIFT REGISTER`, `PISO`, `MOORE FSM`, `MEALY FSM`, `8 DIGIT SCAN` (16칸 공백 채움). LCD 숫자는 mode보다 1 큼. |
| 블록·데이터/제어 흐름 | REQUIRED | 19~21쪽, 25~49쪽, 86쪽 2항 | 12 RTL의 역할과 top 연결: `input_frontend`의 `reset/mode_press/switches`, `button_onepulse`의 `step_press`, 8 코어의 mode별 enable/입력, 4개의 `clock_divider`, LCD mode display, LED mux, mode7에만 `seg_data/seg_com`. `tick`은 LED 관찰값이며 코어의 clock/enable이 아님. 실제 top 코드의 연결만 사용. |
| reset과 LCD refresh 구분 | REQUIRED | 20쪽, 22~23쪽, 41~49쪽, 53쪽 | `mode_press`는 모든 코어를 reset하지만 LCD 컨트롤러는 `reset`에만 reset됨. LCD `shown_mode`는 첫 줄 주소 80 전송 시 고정되어 화면 중간 버튼 입력이 번호·이름을 섞지 않음; 다음 refresh에 최신 mode 반영. 전체 rst 뒤 mode0, LED0, lcd_e0, seg_comFF. |
| 각 mode 대표 expected | REQUIRED | 21쪽, 52~53쪽, 58~61쪽, 86쪽 1·4·5항 | TB 기준 LED/출력 사례: counter `00→01→00→0F`; divider TB `/10`에서 30 clock에 tick 3회; register `A0→3A→33`; shift `08→04`; PISO `A1→40→81`; Moore 0→1→2→0; Mealy 입력만으로 `00→02`, step 뒤 `05`, 입력0 뒤 `04`; scan index0에서 SW nibble9/`seg_data=F6`, COM active-low·blank 비율. 8모드 순환 후 counter0과 동시 버튼 reset 우선까지 설명. |
| LCD 버스의 독립 검증 | REQUIRED | 22~23쪽, 50~51쪽, 54~58쪽, 83~84쪽 | 내부 `name` ROM 값을 읽어 정답으로 사용하지 않음. TB가 `lcd_data/lcd_rs/lcd_e`에서 32칸 화면 재구성, 첫 줄 `MODE nn`과 둘째 줄 16자 검사, `80/C0` 주소, `lcd_rw=0`, E 상승 전 setup, E high 동안 DATA/RS 유지 확인. 4-phase/POWER_WAIT 구조와 TB 10 ns·보드 1 kHz 차이 설명. |
| TB 설정, PASS와 종료 | REQUIRED | 50쪽, 53~62쪽, 73~74쪽, 86쪽 3항 | DUT `STABLE_CYCLES=3`, `DIVISOR=10`, TB clock 10 ns 및 posedge 후 #1 검사. **자기 정상 실행**의 `LAB2_INTEGRATED_PASS modes=8 checks=2848`, 종료 **34326 ns**(34.326 µs), 실행 상태와 log/VCD 대응 확인. 교안 예시 로그를 자기 실행으로 전용 금지. |
| 정상 전체 waveform | REQUIRED | 72쪽, 77~82쪽, 86쪽 4항 | VaporView 전체 0~34.326 µs Zoom Fit, `dut.mode` 0→7→0, N8/N4, `sw,led,seg_data,seg_com`, reset 및 모드7 scan만 활성 등을 학생이 실제 관찰하고 screenshot으로 설명. `checks` Decimal (Unsigned), bus hex, Time Unit µs. VCD 존재/PASS만으로 완료 아님. |
| 목적별 확대 waveform | REQUIRED_CONTENT; 여러 증거 결합 허용 | 83~84쪽, 86~87쪽 및 최종 검수 | mode2 register, LCD MODE05 전송, mode7 scan, 동시 mode/step·마지막 reset의 확대 PNG와 전체 파형 및 정상 TB의 내부 mode/count·LCD bus timing 검사를 함께 대조한다. 개별 PNG마다 모든 내부 신호가 있어야 한다고 요구하지 않는다. |
| 정상/변경/복구 3행·실행 로그 | REQUIRED | 85~86쪽 | 정상 log·파형 보존 → **`counter4.v` 증가 `4'd1→4'd2`**, TB expected 고정 → 새 FAIL log의 검사 이름·시각·입력·이전/다음 상태·expected/actual → 원복 후 새 PASS log. 첫 예상 346 ns `counter increments once`, 정상 LED01 대 변경 예상 LED02는 TB 정적 계산이며 실제 로그로 확인. 복구 기대 `modes=8 checks=2848`, 34326 ns. |
| Vivado/보드 사전 계획 | REQUIRED | 86쪽 5항, 88~107쪽, 118~119쪽 | Vivado RTL12/TB/XDC, part `xc7s75fgga484-1`, design top `lab2_integrated`, sim top `tb_lab2_integrated`; B6 1 kHz, K4 reset, N8 mode, N4 step. 모드별 SW→LED/7-seg 예상, LCD 번호·이름, MODE08→01 순환/상태 초기화. 실제 synthesis/bit/board 결과는 아직 쓰지 않음. |
| XDC 기능 simulation 범위 | REQUIRED | 63쪽, 86쪽 2항 | XDC는 보드 핀·clock 제약이며 VS Code/Icarus 기능 simulation에 사용되지 않음. PASS만으로 핀/보드 확인으로 쓰지 않음. |
| 일반 환경 설정 변경·오류 기록 | NOT_REQUIRED | 6~7쪽, 85~86쪽 | 08A PRE의 별도 환경 설정/일반 도구 오류 절은 명시되지 않음. 지정 수정 실험의 FAIL·복구는 위 REQUIRED. POST timing/warnings(114~117쪽)은 후속 단계의 실제 결과로 기록. |
| 실패/복구 waveform screenshot | NOT_REQUIRED | 85~87쪽 | 3행 비교와 실행 log를 요구하나 실패/복구 파형 별도 캡처를 고정하지 않음. |
| PRE 본문 Git hash/run ID/tag | NOT_REQUIRED | 86쪽 | 1~5항에 요구되지 않음. provenance는 내부 manifest/evidence에서 관리. |

## 보고서 작성 경계

- 교안의 86쪽 1~5항은 08A에 대한 내용 요구로 해석한다. `PRE_REPORT_TEMPLATE.md`의 모든 절·캡처를 별도 필수로 만들지 않는다.
- LAB2 제출 실험 수가 08A를 포함해 9개인지: UNKNOWN. 공통 전달 형식은 LAB2 8개이고 08A 교안은 별도 예시/확장 자료이므로 최종 제출 포함 여부를 추정하지 않는다.
- 정상 PASS, 지정 수정 FAIL, 복구 PASS와 학생·교수 역할 ChatGPT의 VaporView 공동 관찰은 확인했다. Vivado/보드 결과는 아직 수행 사실로 쓰지 않는다. 파형 본문은 **시험 조건 → 예상 결과 → 관찰 결과 → 해석** 순서로 작성한다.
