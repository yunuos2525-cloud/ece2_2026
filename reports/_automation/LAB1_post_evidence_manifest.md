# LAB1 Post Evidence Manifest

## 0. Metadata and evidence policy

- lab: LAB1
- manifest_scope: POST_EVIDENCE
- manifest_status: DRAFT_EVIDENCE_BASED
- repository_branch: main
- current_HEAD: 246d6b621ce5b7a30d8a71a98c3e03693e69c9de (TOOL_VERIFIED; 확인 시점 repository 기준, 촬영 source commit이 아님)
- generated_from: 현재 evidence/vivado/LAB1 이미지 21개, evidence/board/LAB1/frames 이미지 4개 직접 열람, 현재 LAB1 RTL/TB/XDC, 사용자 확정 정보
- DEMO_SELECTION_STATUS: USER_CONFIRMED
- selected_demo_experiments: 06_mux, 10_7seg_decoder (USER_REPORTED)
- report_board_photo_scope: 위 2개만; 다른 8개 실험의 raw video는 보존 자료이며 제출 board 사진 대상이 아님
- source_run_commit_direct_mapping: UNKNOWN (모든 실험 공통)
- waveform_user_visual_review: NOT_VERIFIED (Codex의 캡처 판독과 사용자 직접 시각 검토 기록은 구분)
- report_draft_start: READY_WITH_OPEN_QA
- submission_finalization: NEEDS_USER_CONFIRMATION

waveform은 기능 검증 핵심 evidence이다. PASS는 TB 전체 coverage의 보조 evidence이며 대표 파형 해석을 대신하지 않는다. Programmed는 FPGA programming의 보조 evidence이며 특정 회로 기능이나 전체 실험 정상 동작을 증명하지 않는다. bitstream 생성과 board 정상 동작은 별개의 확인이다.

파일 존재·이미지 판독은 TOOL_VERIFIED, 사용자 선정/물리 입력 정보는 USER_REPORTED, 현재 RTL/TB에서 계산한 예상과 시간 대응은 AUTO_DERIVED로 구분한다. AUTO_DERIVED 값은 보고서에서 계산한 예상임을 표시한다. 촬영 때 실제 사용한 source와 현재 source가 같다는 직접 근거는 없으므로 대응을 확정하지 않는다. 파형 설명은 시험 조건 → 예상 결과 → 관찰 결과 → 해석 순서로 사용한다. 전체 실험 포함 요구는 대표 분석 구간과 별도로 충족해야 한다.

경로는 repository 루트 기준이다. 이번 작업은 manifest 1개만 생성하며 evidence, source, report, 기존 metadata는 변경하지 않는다. simulation은 실행하지 않는다.

## 1. Experiments

### 01_logic_gates

- experiment: 01_logic_gates
- final Vivado waveform path: `evidence/vivado/LAB1/01_logic_gates/LAB1_01_logic_gates_vivado_waveform.png`
- waveform representative range: 20~40 ns 중 안정 구간; 20~30 ns와 30~40 ns 비교 (캡처 축/전환 TOOL_VERIFIED)
- test condition: a=1 유지, b=0→1
- expected result: RTL x=a&b, y=a|b, z=a^b; {x,y,z}=101→110 (AUTO_DERIVED)
- observed result: 캡처에서 a=1, b 전환과 함께 x=0→1, y=1 유지, z=1→0; expected=3'b101→3'b110과 일치 (TOOL_VERIFIED)
- interpretation: 같은 a 조건에서 AND와 XOR 출력의 상반된 전환 및 OR 유지가 보임. 해당 표시 구간의 기능 설명에 사용 가능
- PASS evidence path if available: `evidence/vivado/LAB1/support/LAB1_01_logic_gates_vivado_pass.png`; LAB1_PASS logic_gate cases=4, 종료 40 ns
- evidence status: WAVEFORM_PRESENT_AND_READABLE; EXPECTED_MATCH_IN_SAMPLED_RANGE; PASS_SUPPORT_PRESENT; source/run 연결 UNKNOWN
- source reference: `LAB1/01_logic_gates/src/logic_gate.v`, `LAB1/01_logic_gates/sim/tb_logic_gate_modern.sv`

### 02_full_adder

- experiment: 02_full_adder
- final Vivado waveform path: `evidence/vivado/LAB1/02_full_adder/LAB1_02_full_adder_vivado_waveform.png`
- waveform representative range: 20~40 ns; 전환 30 ns, 경계 직후 안정 구간 사용
- test condition: a=0, b=1, cin=0→1
- expected result: s=a^b^cin, cout=(a&b)|(a&cin)|(b&cin); {cout,s}=01→10 (AUTO_DERIVED)
- observed result: s=1→0, cout=0→1이며 캡처 expected도 1→2 (TOOL_VERIFIED)
- interpretation: cin 변화에 따라 합의 하위 비트와 carry가 전환되는 모습을 설명할 수 있음
- PASS evidence path if available: `evidence/vivado/LAB1/support/LAB1_02_full_adder_vivado_pass.png`; LAB1_PASS full_adder cases=8, 종료 80 ns
- evidence status: WAVEFORM_PRESENT_AND_READABLE; EXPECTED_MATCH_IN_SAMPLED_RANGE; PASS_SUPPORT_PRESENT; source/run 연결 UNKNOWN
- source reference: `LAB1/02_full_adder/src/full_adder.v`, `LAB1/02_full_adder/src/half_adder.v`, `LAB1/02_full_adder/sim/tb_full_adder.sv`

### 03_4bit_adder

- experiment: 03_4bit_adder
- final Vivado waveform path: `evidence/vivado/LAB1/03_4bit_adder/LAB1_03_4bit_adder_vivado_waveform.jpg`
- waveform representative range: 캡처의 800~900 ns 축 주변에서 a=5인 구간; b=A→B 전환 후보는 현재 TB 기준 900~920 ns (AUTO_DERIVED; 정확한 sample time은 학생 확인 필요)
- test condition: a=4'h5, b=4'hA→4'hB; 캡처의 a=5 구간에서 b가 순차 증가
- expected result: {cout,s}=zero_extend(a)+zero_extend(b); 5+A=0F -> cout=0,s=F; 5+B=10 -> cout=1,s=0 (AUTO_DERIVED)
- observed result: a=5 구간에서 b=A/B에 대응하는 s=F/0 및 cout 상승이 보임. Value 열의 a=6,b=4,s=A,cout=0도 별도 cursor 상태로 읽힘 (TOOL_VERIFIED)
- interpretation: 4비트 합 범위를 넘을 때 s의 wrap과 cout가 함께 바뀌는 대표 구간. Value 열의 cursor와 화면의 다른 시점을 혼합하지 않음
- PASS evidence path if available: NOT_AVAILABLE (현재 Vivado evidence에 03 PASS 캡처 없음; 현재 TB의 256 cases는 코드 계획이며 이 실행의 PASS로 대체하지 않음)
- evidence status: WAVEFORM_PRESENT_AND_READABLE; EXPECTED_MATCH_IN_SAMPLED_RANGE; PASS_SUPPORT_NOT_AVAILABLE; EXACT_SAMPLE_TIME_NEEDS_CONFIRMATION; source/run 연결 UNKNOWN
- source reference: `LAB1/03_4bit_adder/src/adder_4bit.v`, `LAB1/03_4bit_adder/sim/tb_adder_4bit.sv`

### 04_4bit_subtractor

- experiment: 04_4bit_subtractor
- final Vivado waveform path: `evidence/vivado/LAB1/04_4bit_subtractor/LAB1_04_4bit_subtractor_vivado_waveform.png`
- waveform representative range: 0~20 ns; a=0,b=0 구간과 b=1 구간 비교
- test condition: a=0, b=0→1
- expected result: d=(a-b) mod 16, bor=(a<b); {bor,d}=00→1F (AUTO_DERIVED)
- observed result: d=0→F, bor=0→1; expected=00→1F (TOOL_VERIFIED). Value 열의 a=6,b=4,d=2,bor=0는 화면 왼쪽 0~20 ns와 다른 cursor 상태이므로 혼합하지 않음
- interpretation: 동등 입력은 borrow가 없고 a보다 b가 커지면 borrow와 wrap된 차가 나타나는 구간
- PASS evidence path if available: `evidence/vivado/LAB1/support/LAB1_04_4bit_subtractor_vivado_pass.png`; LAB1_PASS sub_4bit cases=256, 종료 2560 ns
- evidence status: WAVEFORM_PRESENT_AND_READABLE; EXPECTED_MATCH_IN_SAMPLED_RANGE; PASS_SUPPORT_PRESENT; source/run 연결 UNKNOWN
- source reference: `LAB1/04_4bit_subtractor/src/sub_4bit.v`, `LAB1/04_4bit_subtractor/sim/tb_sub_4bit.sv`
- additional waveform: `evidence/vivado/LAB1/04_4bit_subtractor/LAB1_04_4bit_subtractor_vivado_overview.png`; 전체 실행 overview이며 상세 값은 확대 파형으로 판독

### 05_4bit_comparator

- experiment: 05_4bit_comparator
- final Vivado waveform path: `evidence/vivado/LAB1/05_4bit_comparator/LAB1_05_4bit_comparator_vivado_waveform.jpg`
- waveform representative range: 캡처의 a=5 구간에서 b=4→5→6; 현재 TB 기준 840~870 ns (AUTO_DERIVED; 정확한 안정 sample time은 학생 확인 필요)
- test condition: a=5 유지, b=4→5→6
- expected result: o={a>b,a==b,a<b}; 100→010→001, hex 4→2→1 (AUTO_DERIVED)
- observed result: 캡처 a=5 구간에서 b=4/5/6와 함께 o 및 expected가 4/2/1로 전환 (TOOL_VERIFIED)
- interpretation: 동일 a에서 greater/equal/less 관계에 따라 출력 위치가 전환됨
- PASS evidence path if available: NOT_AVAILABLE (현재 Vivado evidence에 05 PASS 캡처 없음)
- evidence status: WAVEFORM_PRESENT_AND_READABLE; EXPECTED_MATCH_IN_SAMPLED_RANGE; PASS_SUPPORT_NOT_AVAILABLE; EXACT_SAMPLE_TIME_NEEDS_CONFIRMATION; source/run 연결 UNKNOWN
- source reference: `LAB1/05_4bit_comparator/src/compare_4.v`, `LAB1/05_4bit_comparator/sim/tb_compare_4.sv`

### 06_mux

- experiment: 06_mux
- final Vivado waveform path: `evidence/vivado/LAB1/06_mux/LAB1_06_mux_vivado_waveform.png`
- waveform representative range: 60~80 ns; s=2→3 전환 70 ns; cursor 73.100 ns도 판독 가능
- test condition: i=4'b0001 유지, s=2'b10→2'b11
- expected result: z=i[3-s]; s=2이면 i[1]=0, s=3이면 i[0]=1 -> z=0→1 (AUTO_DERIVED)
- observed result: i=1, s=2→3에서 z=0→1; 73.100 ns cursor에 i=1,s=3,z=1,expected=1 (TOOL_VERIFIED)
- interpretation: data word를 유지하고 selector로 선택 bit를 바꾸면 출력이 바뀜. `i[s]`가 아니라 `i[3-s]` 순서를 설명해야 함
- PASS evidence path if available: `evidence/vivado/LAB1/support/LAB1_06_mux_vivado_pass.png`; LAB1_PASS mux_4x1 cases=64, 종료 640 ns
- evidence status: WAVEFORM_PRESENT_AND_READABLE; EXPECTED_MATCH_IN_SAMPLED_RANGE; PASS_SUPPORT_PRESENT; BOARD_PHOTOS_PRESENT_WITH_OPEN_INPUT_QA; source/run 연결 UNKNOWN
- source reference: `LAB1/06_mux/src/mux_4x1.v`, `LAB1/06_mux/sim/tb_mux_4x1.sv`, `LAB1/06_mux/constraints/mux_4x1.xdc`

#### Selected-demo board evidence

- final board frame path: `evidence/board/LAB1/frames/LAB1_06_mux_board_s00_i3.png`, `evidence/board/LAB1/frames/LAB1_06_mux_board_s11_i0.png`
- USER_CONFIRMED board input condition: button1=i[3], button2=i[2], button3=i[1], button4=i[0]; s=00/01/10/11 각각 button1/2/3/4 선택 (USER_REPORTED). 사용자는 각 selector에서 button1~4를 순차 조작했다고 확인함
- frame-specific input correspondence: 파일명은 s00/i3 및 s11/i0 조건을 표시하지만 화면만으로 그 selector 논리값·전체 입력 word를 독립 확정하지 않음; USER_CONFIRMATION_REQUIRED
- expected board behavior: s=00에서는 z=i[3], s=11에서는 z=i[0]. 선택 bit가 1이면 z=1이고 0이면 z=0 (AUTO_DERIVED). 버튼 눌림의 논리 레벨·LED polarity는 UNKNOWN
- visible actual behavior: 두 최종 프레임 모두 버튼 조작 영역에 손이 있고 보드 LED1이 붉게 점등되어 있음 (TOOL_VERIFIED). 이 캡처만으로 z 전기적 값이나 선택되지 않은 버튼의 모든 반응을 확정하지 않음
- board interpretation: 입력 조작과 실제 LED 점등이 함께 보이는 사진 2개로 사용 가능. s=00/button1 및 s=11/button4의 정확한 조건 설명은 파일명과 사용자 절차의 시점별 대응 확인 후 사용. 모든 선택 조합 정상 동작을 주장하지 않음
- board evidence status: FINAL_PHOTOS_PRESENT; VISIBLE_LED_ACTIVITY; USER_CONFIRMED_BUTTON_MAPPING; SELECTOR_LED_POLARITY_AND_FRAME_CONDITION_NEEDS_CONFIRMATION
- board source video: UNKNOWN (현재 사진은 존재하지만 기존 metadata의 LAB1_06_mux_board.mp4와 동일 영상에서 추출했다는 직접 기록 없음)
- frame timestamp: UNKNOWN
- XDC reference: i[3]/i[2]/i[1]/i[0] -> K4/N8/N4/N1; s[1]/s[0] -> Y1/W3; z -> L4. L4=LED1의 물리 연결은 아직 UNKNOWN

### 07_demux

- experiment: 07_demux
- final Vivado waveform path: `evidence/vivado/LAB1/07_demux/LAB1_07_demux_vivado_waveform.jpg`
- waveform representative range: 80~100 ns; 80~90 ns와 90~100 ns 비교. 전체 캡처는 0~160 ns도 표시
- test condition: i=1 유지, s=000→001; 보조로 i=0 구간의 비활성 확인
- expected result: o=i?(8'h80>>s):0; i=1에서 o=80→40, i=0에서는 모든 selector에서 00 (AUTO_DERIVED)
- observed result: 첫 i=0 구간은 o=00, i=1 구간에서 s=0~7에 따라 o=80,40,20,10,08,04,02,01이며 expected와 일치 (TOOL_VERIFIED)
- interpretation: data enable과 selector에 따른 one-hot 출력 이동을 구분해 설명 가능
- PASS evidence path if available: NOT_AVAILABLE (현재 Vivado evidence에 07 PASS 캡처 없음; screenshot의 checked 및 current TB 계획을 별도 PASS 캡처로 취급하지 않음)
- evidence status: WAVEFORM_PRESENT_AND_READABLE; EXPECTED_MATCH_IN_SAMPLED_RANGE; PASS_SUPPORT_NOT_AVAILABLE; source/run 연결 UNKNOWN
- source reference: `LAB1/07_demux/src/demux_1x8.v`, `LAB1/07_demux/sim/tb_demux_1x8.sv`

### 08_encoder

- experiment: 08_encoder
- final Vivado waveform path: `evidence/vivado/LAB1/08_encoder/LAB1_08_encoder_vivado_waveform.png`
- waveform representative range: 10~40 ns; one-hot 01/02와 invalid 03 비교
- test condition: i=8'h01→02→03
- expected result: one-hot 01→a=7, 02→a=6; multi-hot 03→a=0 (AUTO_DERIVED; priority encoder가 아님)
- observed result: i=01/02/03 구간에서 a 및 expected가 7/6/0. 보조로 i=00에서 0, i=04에서 5도 보임 (TOOL_VERIFIED)
- interpretation: one-hot 위치를 코드로 변환하며 invalid-domain 입력은 default 0으로 처리함. 출력 0만으로 유효 입력 80과 무효 입력을 구별할 수 없음
- PASS evidence path if available: `evidence/vivado/LAB1/support/LAB1_08_encoder_vivado_pass.png`; LAB1_PASS encoder8x3 cases=256, 종료 2560 ns
- evidence status: WAVEFORM_PRESENT_AND_READABLE; EXPECTED_MATCH_IN_SAMPLED_RANGE; PASS_SUPPORT_PRESENT; source/run 연결 UNKNOWN
- source reference: `LAB1/08_encoder/src/encoder8x3.v`, `LAB1/08_encoder/sim/tb_encoder8x3.sv`
- additional waveform: `evidence/vivado/LAB1/08_encoder/LAB1_08_encoder_vivado_overview.png`; 전체 실행 overview, 상세 one-hot 판독은 위 확대 파형을 사용

### 09_decoder

- experiment: 09_decoder
- final Vivado waveform path: `evidence/vivado/LAB1/LAB1_09_decoder_vivado_waveform.png`
- waveform representative range: 30~50 ns; 30~40 ns와 40~50 ns 비교
- test condition: {a,b,c}=011→100
- expected result: o=8'b1 << {a,b,c}; 08→10 (AUTO_DERIVED)
- observed result: 입력 011→100에서 o 및 expected=08→10; 전체 보이는 코드 000~111에 대해 01,02,04,08,10,20,40,80 (TOOL_VERIFIED)
- interpretation: 3비트 코드 변화에 따라 one-hot 출력 위치가 이동함
- PASS evidence path if available: `evidence/vivado/LAB1/support/LAB1_09_decoder_vivado_pass.png`; LAB1_PASS decoder3x8 cases=8, 종료 80 ns
- evidence status: WAVEFORM_PRESENT_AND_READABLE; EXPECTED_MATCH_IN_SAMPLED_RANGE; PASS_SUPPORT_PRESENT; NONSTANDARD_LOCATION; source/run 연결 UNKNOWN
- source reference: `LAB1/09_decoder/src/decoder3x8.v`, `LAB1/09_decoder/sim/tb_decoder3x8.sv`
- location QA: 현재 09_decoder 폴더에는 파일이 없고 파형이 LAB1 루트에 있음. 실제 경로를 기록했으며 이동하지 않음

### 10_7seg_decoder

- experiment: 10_7seg_decoder
- final Vivado waveform path: `evidence/vivado/LAB1/10_7seg_decoder/LAB1_10_7seg_decoder_vivado_waveform.png`
- waveform representative range: 80~90 ns (8), 150~160 ns (F); 전체 0~160 ns에는 0~F 변환 표시
- test condition: bcd=4'h8 및 4'hF; 각 구간은 서로 인접한 전환이 아님
- expected result: seg_data[7:0]={a,b,c,d,e,f,g,dp}, active high; 8→8'hFE=11111110, F→8'h8E=10001110, dp=0 (AUTO_DERIVED; 실제 RTL case 확인)
- observed result: bcd=8/F에서 seg_data와 expected=FE/8E; 캡처의 0~F 변환 값도 RTL lookup과 동일 (TOOL_VERIFIED)
- interpretation: 8은 a~g 전체 활성, F는 a/e/f/g 활성이고 b/c/d/dp 비활성인 패턴으로 설명 가능. 이전 board A 해석을 사용하지 않음
- PASS evidence path if available: `evidence/vivado/LAB1/support/LAB1_10_7seg_decoder_vivado_pass.png`; LAB1_PASS seg_decoder cases=16, 종료 160 ns
- evidence status: WAVEFORM_PRESENT_AND_READABLE; EXPECTED_MATCH_IN_SAMPLED_RANGE; PASS_SUPPORT_PRESENT; BOARD_8_F_PHOTOS_PRESENT; source/run 연결 UNKNOWN
- source reference: `LAB1/10_7seg_decoder/src/seg_decoder.v`, `LAB1/10_7seg_decoder/sim/tb_seg_decoder.sv`
- alternate waveform: `evidence/vivado/LAB1/10_7seg_decoder/LAB1_10_7seg_decoder_vivado_waveform.jpg`; 같은 0~F 변환을 보여주는 대체 캡처이며 별도 실행이라고 단정하지 않음

#### Selected-demo board evidence

- final board frame path: `evidence/board/LAB1/frames/LAB1_10_7seg_board_8.png`, `evidence/board/LAB1/frames/LAB1_10_7seg_board_F.png`
- USER_CONFIRMED board input condition: 8=4'b1000, F=4'b1111 (USER_REPORTED)
- expected board behavior: 입력 8은 a~g 활성 및 dp 비활성으로 8 표시; 입력 F는 a/e/f/g 활성 및 b/c/d/dp 비활성으로 F 표시 (AUTO_DERIVED; 실제 RTL의 FE/8E 패턴 근거)
- visible actual behavior: 각각의 사진에서 단일 7-segment의 8 및 F 표시가 명확히 보이며 손에 가리지 않음 (TOOL_VERIFIED)
- board interpretation: 사용자 확인 입력 8/F에 대해 실제 표시부에 8/F 문자가 보이는 사진으로 사용 가능. 사진만으로 전체 16개 입력 및 전기적 bit pattern 검증을 주장하지 않음
- board evidence status: FINAL_PHOTOS_PRESENT; USER_CONFIRMED_INPUTS; VISIBLE_8_F_DISPLAY
- board source video: UNKNOWN (사진에서 원본 영상과의 직접 추출 대응 기록 확인 불가)
- frame timestamp: UNKNOWN

## 2. Support evidence (기능 파형과 분리)

### PASS: overall TB coverage support

| Experiment | Actual PASS capture path | Caption-visible result | End time |
|---|---|---|---|
| 01_logic_gates | `evidence/vivado/LAB1/support/LAB1_01_logic_gates_vivado_pass.png` | LAB1_PASS logic_gate cases=4 | 40 ns |
| 02_full_adder | `evidence/vivado/LAB1/support/LAB1_02_full_adder_vivado_pass.png` | LAB1_PASS full_adder cases=8 | 80 ns |
| 04_4bit_subtractor | `evidence/vivado/LAB1/support/LAB1_04_4bit_subtractor_vivado_pass.png` | LAB1_PASS sub_4bit cases=256 | 2560 ns |
| 06_mux | `evidence/vivado/LAB1/support/LAB1_06_mux_vivado_pass.png` | LAB1_PASS mux_4x1 cases=64 | 640 ns |
| 08_encoder | `evidence/vivado/LAB1/support/LAB1_08_encoder_vivado_pass.png` | LAB1_PASS encoder8x3 cases=256 | 2560 ns |
| 09_decoder | `evidence/vivado/LAB1/support/LAB1_09_decoder_vivado_pass.png` | LAB1_PASS decoder3x8 cases=8 | 80 ns |
| 10_7seg_decoder | `evidence/vivado/LAB1/support/LAB1_10_7seg_decoder_vivado_pass.png` | LAB1_PASS seg_decoder cases=16 | 160 ns |

7개 캡처의 문구와 종료 시간은 TOOL_VERIFIED이다. 03/05/07의 별도 Vivado PASS 캡처는 NOT_AVAILABLE이며 VS Code PASS를 Vivado PASS로 대체하지 않는다. 캡처의 TB 절대경로는 표시된 실행 경로의 보조 기록이지만 해당 source의 hash/commit이나 waveform과 동일 run임을 증명하지 않는다. PASS↔waveform 직접 run 연결은 UNKNOWN이다.

### Programmed: FPGA programming support

- path: `evidence/vivado/LAB1/support/Hardware_Properties.png`
- visible fields: Name=xc7s75_0, Part=xc7s75, ID code=037C8093, IR length=6, Status=Programmed (TOOL_VERIFIED)
- use: 대표 programming 보조 캡처 1개
- limitations: 전체 package/speed-grade는 UNKNOWN; 해당 캡처의 실험명·bitstream·source/run 대응 UNKNOWN. 10개 모든 실험이 이 캡처로 programming 확인되었다거나 board 정상 동작이 입증되었다고 주장하지 않음

### Sources / synthesis / implementation / bitstream

- dedicated Sources capture in current evidence/vivado/LAB1: NOT_AVAILABLE
- dedicated synthesis/implementation/DRC/timing reports in current evidence/vivado/LAB1: NOT_AVAILABLE
- dedicated bitstream file/generation-success capture in current evidence/vivado/LAB1: NOT_AVAILABLE
- interpretation: 현재 evidence 폴더에서 발견되지 않았다는 뜻이며 실제 미수행을 단정하지 않음. 로컬 Vivado 생성 폴더의 결과나 Programmed 상태를 각 단계의 직접 증거로 대체하지 않음
- 04/08 overview 이미지는 waveform overview이며 Sources/bitstream 증거로 재분류하지 않음

## 3. Completeness and open QA

| Experiment | Waveform file | Representative analysis | PASS support | Board submission scope |
|---|---|---|---|---|
| 01_logic_gates | PRESENT | READABLE | PRESENT | NOT_SELECTED |
| 02_full_adder | PRESENT | READABLE | PRESENT | NOT_SELECTED |
| 03_4bit_adder | PRESENT | READABLE; exact sample time derived | NOT_AVAILABLE | NOT_SELECTED |
| 04_4bit_subtractor | PRESENT | READABLE | PRESENT | NOT_SELECTED |
| 05_4bit_comparator | PRESENT | READABLE; exact sample time derived | NOT_AVAILABLE | NOT_SELECTED |
| 06_mux | PRESENT | READABLE | PRESENT | USER_CONFIRMED; 2 photos; open frame-input QA |
| 07_demux | PRESENT | READABLE | NOT_AVAILABLE | NOT_SELECTED |
| 08_encoder | PRESENT | READABLE | PRESENT | NOT_SELECTED |
| 09_decoder | PRESENT; LAB1 root | READABLE | PRESENT | NOT_SELECTED |
| 10_7seg_decoder | PRESENT; PNG chosen, JPG alternate | READABLE | PRESENT | USER_CONFIRMED; 8/F photos |

- Required waveform inclusion: 10/10 PRESENT. 10번 PNG/JPG를 서로 다른 실험이나 독립적인 PASS 증거로 중복 계산하지 않음.
- Selected-demo board photos: 2/2 experiments PRESENT; total 4 files. MUX의 현재 사진은 LED1 점등을 보여주지만 selector 논리값 및 L4와의 물리 대응 확인은 아직 필요함.
- Existing board inventory/metadata still refer to older filenames, weak scenes and failed extraction. 현재 확인한 4개 사진을 이 manifest에 기록했으며 과거 실패 기록을 현재 파일 부재로 해석하지 않음. 기존 inventory는 이번에 수정하지 않음.
- Board photo timestamps/source-video extraction links: UNKNOWN. 사진에서 입력 숫자를 출력으로부터 역추정하지 않음.
- Source/run/commit direct mapping and programmed-bitstream identity: UNKNOWN; evidence filename agreement alone is insufficient.
- Final student review of waveform ranges/observations: NOT_VERIFIED. 특히 03/05의 정확한 안정 sample time과 MUX 사진별 selector/버튼 조건 대응을 확인해야 함.
- PASS support absent for 03/05/07 is not by itself missing required POST waveform evidence.
- Open support gaps: synthesis/implementation/DRC/timing/bitstream evidence, if needed to substantiate those report sections, must be supplied before claiming results.
- Draft can start using current waveform observations and 8/F board photos. MUX exact frame-input claims and unverified implementation/programming identity must remain qualified. Final submission QA remains open.
