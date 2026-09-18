# LAB1 Post Fact Sheet

## 0. Work usage policy

이 파일은 Work 전달용 사실·계산·미확인 경계 기록이며 기존 제출 보고서 본문을 수정하지 않는다. current_HEAD=246d6b621ce5b7a30d8a71a98c3e03693e69c9de, branch=main. CURRENT_SOURCE와 HISTORICAL_RUN을 구분하고 RUN_TO_COMMIT = UNKNOWN로 유지한다. 현재 hash와 과거 입력 hash의 일치는 file-content 대응이며 실행 commit의 증명은 아니다.

- 용어 통일: AND·OR·XOR 게이트, 가산기, 감산기, 비교기, MUX/DEMUX, 인코더/디코더, 7-segment decoder 등의 조합논리회로.
- 필요한 값마다 `2'b11`, `4'b1000`, `4'hA`, `8'h80`처럼 radix를 직접 명시한다.
- waveform 해석은 signal label과 안정 구간을 기준으로 한다.
- waveform=기능 검증 핵심; PASS/log=전체 TB coverage 보조; build/DRC/timing=구현 기록; Programmed=programming 기록; board photo=실제 물리 동작 증거.
- 내부 provenance/status/hash 목록은 제출 본문 제목이나 용어로 노출하지 않는다. source hash/상태의 상세 목록은 내부 추적에 사용한다.
- 구조를 사용한 작성자의 개인적 이유는 UNKNOWN이다. 아래 “구조 효과”는 source에서 보이는 기술적 역할이며 작성자 의도를 추정한 설명이 아니다.
- 계산한 expected와 관찰 actual을 구분한다. 정상 동작은 검증한 구간과 조건의 범위에서만 표현한다.
- Source/top/part는 현재 project 설정, simulation/build는 기존 기록이다. 각 stage의 직접 대응 근거는 별도로 표시한다.
- reference 직접 열람 실패 및 원칙 출처는 LAB1_validation_summary.md에 기록했다.
- 팀 분담·여러 PC에서 실험 수행한 환경: USER_REPORTED. 03/05/07의 synthesis / implementation / DRC / timing / bitstream 수행은 사용자 확인에 따라 TEAM_CONFIRMED이다. 담당 팀원 성명과 생성 PC는 UNKNOWN이다.
- LOCAL_VERIFIED: 현재 파일/log/report에서 해당 좁은 사실을 확인. 현재 저장 위치는 생성 PC를 증명하지 않는다.
- TEAM_PROVIDED: 팀원 전달 출처가 확인된 원본을 직접 확인. 현재는 이 출처를 확정한 항목이 없다.
- TEAM_CONFIRMED: 사용자 확인으로 팀원의 해당 실험/단계 수행 사실 확정.
- EVIDENCE_PENDING: 수행 사실은 확정되었으나 원본 evidence 전달/직접 확인이 남음. TEAM_CONFIRMED와 함께 표시하며 실패나 미수행을 뜻하지 않는다.
- NOT_VERIFIED: 수행 여부 자체가 확인되지 않은 경우에만 사용. NOT_APPLICABLE: 해당 없음.
- 세부 수치/경로/hash 및 직접 연결이 미확인인 값은 UNKNOWN으로 표시하고 수행 status와 분리한다.
- 03/05/07 구현 단계: TEAM_CONFIRMED; 원본 evidence 확보/확인: EVIDENCE_PENDING. 로컬 기록 부재를 미수행 가능성으로 해석하지 않는다.
- 사용자 확정 입력/시연 선정과 evidence provenance는 별도 축으로 관리한다.

## 1. Experiment source and evidence facts

### 01_logic_gates

- 담당자: UNKNOWN
- 수행 환경: UNKNOWN (현재 저장 위치와 과거 생성 PC를 동일시하지 않음)
- source / vscode_sim provenance: LOCAL_VERIFIED (현재 파일 및 보존 로그/VCD)
- vivado_sim provenance: LOCAL_VERIFIED (기존 project/log/VCD 및 waveform)
- synthesis / implementation / DRC / timing / bitstream provenance: LOCAL_VERIFIED; 기존 성공 로그·report·bitstream에 한정, 과거 source commit 연결은 UNKNOWN
- programmed 수행 status: NOT_VERIFIED; 특정 실험/bitstream 연결: UNKNOWN (대표 캡처만으로 수행을 확정하지 않음)
- board provenance: LOCAL_VERIFIED (raw video 존재에 한정; 제출 board 사진 대상 아님)

#### A. Actual RTL structure

- experiment: 01_logic_gates
- design top/module: logic_gate
- input/output ports: input a,b (1 bit); output x,y,z (1 bit)
- 설계 목적: AND·OR·XOR 게이트의 입출력 변환
- 실제 RTL / 핵심 구문: x=a&b, y=a|b, z=a^b의 독립 assign 3개
- 논리 흐름: a,b가 세 논리 연산에 병렬로 전달되어 x,y,z를 생성한다.
- 구조 효과: 각 출력의 논리식을 직접 표현하며 세 게이트를 같은 입력으로 비교할 수 있다.
- 보고서용 설계 및 핵심 구조 설명: a와 b를 공통 입력으로 받아 AND, OR, XOR 결과를 각각 x, y, z에 출력한다. RTL은 세 개의 독립적인 assign을 사용하여 각 논리식을 병렬로 표현한다.

#### B. Current source provenance

- label: CURRENT_SOURCE; file/content provenance TOOL_VERIFIED
- current Git commit: 246d6b621ce5b7a30d8a71a98c3e03693e69c9de
- working tree source/TB/XDC/simulation.json: UNCHANGED_TRACKED (읽기 전용 Git status 확인)
- FPGA part: xc7s75fgga484-1
- project: `LAB1/01_logic_gates/logic_gate.xpr`
- current simulation top: tb_logic_gate_modern
- simulation.json: `LAB1/01_logic_gates/simulation.json`
- project design/simulation tops: logic_gate / tb_logic_gate_modern
- project RTL/TB/XDC registrations: $PPRDIR/src/logic_gate.v, $PPRDIR/constraints/logic_gate.xdc, $PPRDIR/sim/tb_logic_gate_modern.sv; 현재 src/sim/constraints 상대 경로를 참조하며 과거 compiled source hash는 UNKNOWN

| Current file | SHA-256 |
| --- | --- |
| `LAB1/01_logic_gates/src/logic_gate.v` | f81ab14eefa8a280e8e3e94272b8f2710539cf812879377c2d586ffc2b522b31 |
| `LAB1/01_logic_gates/sim/tb_logic_gate_modern.sv` | 715ac42305e7e5b5fcf0c919c492e96113789005963990ca0c5fe6d3ebb30ee5 |
| `LAB1/01_logic_gates/constraints/logic_gate.xdc` | a96f06189b49f7ef26f3ca310c69344a08a74bd495b7505be79f0cf791e3eab3 |
| `LAB1/01_logic_gates/simulation.json` | 63fb3a4d4485032dbdf02a05bcfa403adf2e29b87f5b50bc0188eb7ca384ce39 |

- latest result record: `LAB1/01_logic_gates/build/sim/result.json`; recorded run run-6b4d7856b4b74d7182be024c49d8befb
- recorded input hashes: simulation.json 및 RTL/TB 모두 현재 hash와 일치; 아래 표
| Input recorded for this run | Recorded SHA-256 | Current match |
| --- | --- | --- |
| simulation.json | 63fb3a4d4485032dbdf02a05bcfa403adf2e29b87f5b50bc0188eb7ca384ce39 | true |
| src/logic_gate.v | f81ab14eefa8a280e8e3e94272b8f2710539cf812879377c2d586ffc2b522b31 | true |
| sim/tb_logic_gate_modern.sv | 715ac42305e7e5b5fcf0c919c492e96113789005963990ca0c5fe6d3ebb30ee5 | true |
- recorded wave_sha256: c7ff30dcb98937efe9abff84137f5d339df664260ac16fc3c842ef97b46a471e; actual `LAB1/01_logic_gates/build/sim/run-6b4d7856b4b74d7182be024c49d8befb/wave.vcd` 및 build/sim/wave.vcd와 일치
- this result run is preserved recovery: true
- RUN_TO_COMMIT: UNKNOWN. hash 일치는 기록에 지정된 해당 run의 file-content 연결이며 commit 실행 증명은 아니다.

#### C. Historical VS Code/Icarus simulation

- simulator: Icarus Verilog; 보존 environment/iverilog.log는 12.0 devel, environment/vvp.log는 Icarus runtime 기록. 개별 run binary version의 독립 snapshot은 UNKNOWN
- environment evidence: `evidence/vscode/LAB1/environment/iverilog.log`, `evidence/vscode/LAB1/environment/vvp.log`
- current TB input enumeration: {a,b}=n; n=0..3; 10 ns/case (코드 계산, AUTO_DERIVED)

- run ID: run-3da382f3ef754a73ab00728347ecd540; category intentional_failure; HISTORICAL_RUN
- PASS/FAIL: FAIL; cases checked reported: UNKNOWN; end/failure time: 40 ns (VCD 시각, 로그 시간 단위와 확인)
- simulation.log: `evidence/vscode/LAB1/01_logic_gates/intentional_failure__run-3da382f3ef754a73ab00728347ecd540/simulation.log`; SHA-256 33622c99976909d1e1d7ecb51afabf38b24bbacdf6976fe800a59746870725a3
- compile.log: `evidence/vscode/LAB1/01_logic_gates/intentional_failure__run-3da382f3ef754a73ab00728347ecd540/compile.log`; SHA-256 47cb9181752a66d3b04596b7b4a270757c87f16e91497dae9ddcbcf9bd2c7ff0
- VCD: `evidence/vscode/LAB1/01_logic_gates/intentional_failure__run-3da382f3ef754a73ab00728347ecd540/wave.vcd`; SHA-256 ecf5a575f9b4a73aad93c8d67a39a941bac7feb3ba1de7aaf66a3b67105a924f
- actual first failure log: FAIL logic_gate vector=3 expected=6 actual=7 (로그 raw hex 표기를 유지; 완료된 checked cases를 추정하지 않음)
- input hash for this preserved run: UNKNOWN; 다른 run의 result input hash를 전용하지 않음

- run ID: run-4ccd3151c80e42b8a613c46c83a9d378; category normal; HISTORICAL_RUN
- PASS/FAIL: PASS; cases checked reported: 4; end/failure time: 40 ns (VCD 시각, 로그 시간 단위와 확인)
- simulation.log: `evidence/vscode/LAB1/01_logic_gates/normal__run-4ccd3151c80e42b8a613c46c83a9d378/simulation.log`; SHA-256 a9dd5eca42d8abb4bd4929dc292a4c0b3e61312cecc4a594a9e9885a9d5faf47
- compile.log: `evidence/vscode/LAB1/01_logic_gates/normal__run-4ccd3151c80e42b8a613c46c83a9d378/compile.log`; SHA-256 47cb9181752a66d3b04596b7b4a270757c87f16e91497dae9ddcbcf9bd2c7ff0
- VCD: `evidence/vscode/LAB1/01_logic_gates/normal__run-4ccd3151c80e42b8a613c46c83a9d378/wave.vcd`; SHA-256 850c4c1d863d136da26a5282f7708e35c319b791b679e8b896bedb8c6fac2f34
- input hash for this preserved run: UNKNOWN; 다른 run의 result input hash를 전용하지 않음

- run ID: run-6b4d7856b4b74d7182be024c49d8befb; category recovery; HISTORICAL_RUN
- PASS/FAIL: PASS; cases checked reported: 4; end/failure time: 40 ns (VCD 시각, 로그 시간 단위와 확인)
- simulation.log: `evidence/vscode/LAB1/01_logic_gates/recovery__run-6b4d7856b4b74d7182be024c49d8befb/simulation.log`; SHA-256 a9dd5eca42d8abb4bd4929dc292a4c0b3e61312cecc4a594a9e9885a9d5faf47
- compile.log: `evidence/vscode/LAB1/01_logic_gates/recovery__run-6b4d7856b4b74d7182be024c49d8befb/compile.log`; SHA-256 47cb9181752a66d3b04596b7b4a270757c87f16e91497dae9ddcbcf9bd2c7ff0
- VCD: `evidence/vscode/LAB1/01_logic_gates/recovery__run-6b4d7856b4b74d7182be024c49d8befb/wave.vcd`; SHA-256 c7ff30dcb98937efe9abff84137f5d339df664260ac16fc3c842ef97b46a471e
- input hash for this preserved run: 위 result.json에 기록된 RTL/TB/config hash; VCD hash도 일치

Local build/sim historical logs (새 실행 아님):

| Local log | Observed result lines |
| --- | --- |
| `LAB1/01_logic_gates/build/sim/run-0127fdccb0894b19b8437d0e3fff112f/simulation.log` | FATAL: C:\Users\yunji\ece2\lab1_01_logic_gates\sim\tb_logic_gate_modern.sv:16: Incomplete test |
| `LAB1/01_logic_gates/build/sim/run-095a2f2f811049709bdc7afffc18a6be/simulation.log` | LAB1_PASS logic_gate cases=4 / C:\Users\yunji\ece2\lab1_01_logic_gates\sim\tb_logic_gate_modern.sv:19: $finish called at 40000 (1ps) |
| `LAB1/01_logic_gates/build/sim/run-1d983704e34e42a7af527d6023de5ddc/simulation.log` | FATAL: C:\Users\yunji\ece2\lab1_01_logic_gates\sim\tb_logic_gate_modern.sv:14: FAIL logic_gate vector=3 expected=6 actual=7 |
| `LAB1/01_logic_gates/build/sim/run-3da382f3ef754a73ab00728347ecd540/simulation.log` | FATAL: C:\Users\yunji\ece2\lab1_01_logic_gates\sim\tb_logic_gate_modern.sv:14: FAIL logic_gate vector=3 expected=6 actual=7 |
| `LAB1/01_logic_gates/build/sim/run-414e99c358214c7ba335c7d2f6f6f953/simulation.log` | LAB1_PASS logic_gate cases=4 / C:\Users\yunji\ece2\lab1_01_logic_gates\sim\tb_logic_gate_modern.sv:19: $finish called at 40000 (1ps) |
| `LAB1/01_logic_gates/build/sim/run-4ccd3151c80e42b8a613c46c83a9d378/simulation.log` | LAB1_PASS logic_gate cases=4 / C:\Users\yunji\ece2\lab1_01_logic_gates\sim\tb_logic_gate_modern.sv:19: $finish called at 40000 (1ps) |
| `LAB1/01_logic_gates/build/sim/run-6b4d7856b4b74d7182be024c49d8befb/simulation.log` | LAB1_PASS logic_gate cases=4 / C:\Users\yunji\ece2\lab1_01_logic_gates\sim\tb_logic_gate_modern.sv:19: $finish called at 40000 (1ps) |
| `LAB1/01_logic_gates/build/sim/run-9bcf32c405ac48bc998631c647d8af97/simulation.log` | LAB1_PASS logic_gate cases=4 / C:\Users\yunji\ece2\lab1_01_logic_gates\sim\tb_logic_gate_modern.sv:19: $finish called at 40000 (1ps) |
| `LAB1/01_logic_gates/build/sim/run-c3fba20aa2ca402f8e502c7b11637835/simulation.log` | FATAL: C:\Users\yunji\ece2\lab1_01_logic_gates\sim\tb_logic_gate_modern.sv:14: FAIL logic_gate vector=3 expected=6 actual=7 |
| `LAB1/01_logic_gates/build/sim/run-ed18bdc8f546471188b76c4394ebd302/simulation.log` | LAB1_PASS logic_gate cases=4 / C:\Users\yunji\ece2\lab1_01_logic_gates\sim\tb_logic_gate_modern.sv:19: $finish called at 40000 (1ps) |

#### D. Historical Vivado simulation / GUI

- final stable waveform evidence: `evidence/vivado/LAB1/01_logic_gates/LAB1_01_logic_gates_vivado_waveform.png`
- stable representative condition / expected: 20~40 ns: a=1, b=0→1; {x,y,z}=3'b101→3'b110
- observed result: 캡처의 stable signal label/value 및 출력 패턴이 위 계산한 expected와 일치하는 구간이 보임. 범위가 현재 TB에서 도출된 03/05는 정확한 sample time을 학생이 확인해야 함
- Vivado version: Vivado Simulator v2026.1; project/product 및 로컬 report도 2026.1
- executed design/simulation top: logic_gate / tb_logic_gate_modern
- simulation FPGA part/XDC: xc7s75fgga484-1 / LAB1/01_logic_gates/constraints/logic_gate.xdc
- simulation log: `LAB1/01_logic_gates/logic_gate.sim/sim_1/behav/xsim/simulate.log`
- actual PASS/cases/end time: PASS / 4 / 40 ns (simulate.log 직접 판독)
- simulation run ID: UNKNOWN (XSim 로컬 stage 경로만 확인; UUID 임의 생성 금지)
- Vivado VCD: `LAB1/01_logic_gates/logic_gate.sim/sim_1/behav/xsim/wave.vcd`; SHA-256 0305d88ce191b86544bbfc7f02d32340e2c50da80926725bb00ff6d736726186
- VCD last timestamp: 40 ns; 실제 종료는 40 ns. 마지막 event를 종료 시간으로 대체하지 않음
- compiled source registration: `LAB1/01_logic_gates/logic_gate.sim/sim_1/behav/xsim/tb_logic_gate_modern_vlog.prj`; 현재 RTL/TB의 ../../../../src,sim 경로 참조. compiled input source SHA-256 및 run-to-commit은 UNKNOWN

#### E. VS Code ↔ Vivado comparison

- DUT/output signal set: logic_gate / a, b, x, y, z
- expected behavior / current TB: 위 실제 source 계산 및 enumeration 참조
- comparison: FUNCTIONALLY_CONSISTENT; 정상 및 복구 각각 4 case의 n*10+5 ns 안정 sample에서 입력/출력 불일치 0
- input sequence/output/cases/end: VCD 안정 sample 입력·출력 일치, PASS logs 4 cases 및 40 ns 종료 일치; exact compiled source bytes는 UNKNOWN
- exact VCD SHA-256 equality: false (정상 및 복구 각각); byte equality와 기능 일치를 구분

#### F. Build / DRC / timing / bitstream

- historical synthesis: 성공; `LAB1/01_logic_gates/logic_gate.runs/synth_1/runme.log`의 synth_design completed successfully
- historical implementation: 성공; `LAB1/01_logic_gates/logic_gate.runs/impl_1/runme.log`의 route_design completed successfully
- historical write_bitstream: 성공; 같은 impl runme.log의 write_bitstream completed successfully
- actual bitstream: `LAB1/01_logic_gates/logic_gate.runs/impl_1/logic_gate.bit`; SHA-256 d5493ec65caa07126564981677ba1a8080812a3eab9ba3acb36a9b89b272a9ae; size 3687013 bytes
- DRC report: `LAB1/01_logic_gates/logic_gate.runs/impl_1/logic_gate_drc_routed.rpt`; SHA-256 b91ea38d160d2fe17a15c7ea59394714dc0eaec2db2bb2e48f5dff30ec6fb401
- DRC design/device/state: logic_gate / xc7s75fgga484-1 / Fully Routed (report header)
- default routed DRC: errors=0; warnings=1; rule=CFGBVS-1. CFGBVS 및 CONFIG_VOLTAGE 미설정으로 configuration bank voltage 검증 정보가 부족하다는 경고. 경고를 숨기거나 clean DRC PASS라고 쓰지 않음
- timing report: `LAB1/01_logic_gates/logic_gate.runs/impl_1/logic_gate_timing_summary_routed.rpt`; SHA-256 ca808c7649a5d1fca607708e647b6d9e7d6504909f38f13b7c76f5564005cc74
- user timing constraints: 없음; clock summary: 비어 있음; current XDC에도 create_clock/input-output delay 없음
- WNS=inf ns, TNS=0.000 ns, WHS=inf ns, THS=0.000 ns; pulse-width=NA
- timing interpretation: NO_USER_TIMING_CONSTRAINT / NOT_APPLICABLE_TO_SETUP_HOLD_AS_REPORTED; timing verification PASS 아님
- source→historical bitstream/hash→programmed device direct link: UNKNOWN

### 02_full_adder

- 담당자: UNKNOWN
- 수행 환경: UNKNOWN (현재 저장 위치와 과거 생성 PC를 동일시하지 않음)
- source / vscode_sim provenance: LOCAL_VERIFIED (현재 파일 및 보존 로그/VCD)
- vivado_sim provenance: LOCAL_VERIFIED (기존 project/log/VCD 및 waveform)
- synthesis / implementation / DRC / timing / bitstream provenance: LOCAL_VERIFIED; 기존 성공 로그·report·bitstream에 한정, 과거 source commit 연결은 UNKNOWN
- programmed 수행 status: NOT_VERIFIED; 특정 실험/bitstream 연결: UNKNOWN (대표 캡처만으로 수행을 확정하지 않음)
- board provenance: LOCAL_VERIFIED (raw video 존재에 한정; 제출 board 사진 대상 아님)

#### A. Actual RTL structure

- experiment: 02_full_adder
- design top/module: full_adder; child module half_adder
- input/output ports: input a,b,cin (1 bit); output s,cout (1 bit)
- 설계 목적: 전가산기의 입출력 변환
- 실제 RTL / 핵심 구문: half_adder first(a,b,partial_sum,carry_ab); second(partial_sum,cin,s,carry_cin); cout=carry_ab|carry_cin
- 논리 흐름: 첫 half_adder가 partial_sum=a^b 및 carry_ab=a&b를 만든다. 둘째 half_adder가 partial_sum과 cin에서 s 및 carry_cin을 만들고 두 carry를 OR한다.
- 구조 효과: half_adder 모듈을 재사용하여 합과 carry 경로를 분리한다.
- 보고서용 설계 및 핵심 구조 설명: 두 half_adder 인스턴스를 연결하여 전가산기를 구성한다. 첫 단계의 partial_sum을 cin과 함께 두 번째 단계에 전달하고, 두 intermediate carry를 OR하여 최종 cout를 얻는다.

#### B. Current source provenance

- label: CURRENT_SOURCE; file/content provenance TOOL_VERIFIED
- current Git commit: 246d6b621ce5b7a30d8a71a98c3e03693e69c9de
- working tree source/TB/XDC/simulation.json: UNCHANGED_TRACKED (읽기 전용 Git status 확인)
- FPGA part: xc7s75fgga484-1
- project: `LAB1/02_full_adder/full_adder.xpr`
- current simulation top: tb_full_adder
- simulation.json: `LAB1/02_full_adder/simulation.json`
- project design/simulation tops: full_adder / tb_full_adder
- project RTL/TB/XDC registrations: $PPRDIR/src/half_adder.v, $PPRDIR/src/full_adder.v, $PPRDIR/constraints/full_adder.xdc, $PPRDIR/sim/tb_full_adder.sv; 현재 src/sim/constraints 상대 경로를 참조하며 과거 compiled source hash는 UNKNOWN

| Current file | SHA-256 |
| --- | --- |
| `LAB1/02_full_adder/src/full_adder.v` | 6b26f2ea7c75802ef922f5b9224934be055576867e0ed9207677e8f853c371ba |
| `LAB1/02_full_adder/src/half_adder.v` | 1feecff2825c113c1b599e87f5441a9ec94bd078baf9b08c1c5a69a353f6fd74 |
| `LAB1/02_full_adder/sim/tb_full_adder.sv` | 3e1acc0ebfa0ef3b4d347b5f039d39aada787c342852fd318a6366a80a08a9ae |
| `LAB1/02_full_adder/constraints/full_adder.xdc` | 9f299d943c205967b5efe409b2ff352d17e1baff71f26263cf5db1bc7e2a6463 |
| `LAB1/02_full_adder/simulation.json` | 681dab96f9b0b4460494fd39c38ec7d3093646872e43f771cb530c6e4eb10d7f |

- latest result record: `LAB1/02_full_adder/build/sim/result.json`; recorded run run-9fe1d57c3a1c409e82fb042989b8f0f4
- recorded input hashes: simulation.json 및 RTL/TB 모두 현재 hash와 일치; 아래 표
| Input recorded for this run | Recorded SHA-256 | Current match |
| --- | --- | --- |
| simulation.json | 681dab96f9b0b4460494fd39c38ec7d3093646872e43f771cb530c6e4eb10d7f | true |
| src/half_adder.v | 1feecff2825c113c1b599e87f5441a9ec94bd078baf9b08c1c5a69a353f6fd74 | true |
| src/full_adder.v | 6b26f2ea7c75802ef922f5b9224934be055576867e0ed9207677e8f853c371ba | true |
| sim/tb_full_adder.sv | 3e1acc0ebfa0ef3b4d347b5f039d39aada787c342852fd318a6366a80a08a9ae | true |
- recorded wave_sha256: 677fa58a6edf53b23b64735d687997c8b2127d87cdc94868f1772024af7f5e72; actual `LAB1/02_full_adder/build/sim/run-9fe1d57c3a1c409e82fb042989b8f0f4/wave.vcd` 및 build/sim/wave.vcd와 일치
- this result run is preserved recovery: false
- RUN_TO_COMMIT: UNKNOWN. hash 일치는 기록에 지정된 해당 run의 file-content 연결이며 commit 실행 증명은 아니다.

#### C. Historical VS Code/Icarus simulation

- simulator: Icarus Verilog; 보존 environment/iverilog.log는 12.0 devel, environment/vvp.log는 Icarus runtime 기록. 개별 run binary version의 독립 snapshot은 UNKNOWN
- environment evidence: `evidence/vscode/LAB1/environment/iverilog.log`, `evidence/vscode/LAB1/environment/vvp.log`
- current TB input enumeration: {a,b,cin}=n; n=0..7; 10 ns/case (코드 계산, AUTO_DERIVED)

- run ID: run-e2c662a627954effaf3507dedc43f1a5; category intentional_failure; HISTORICAL_RUN
- PASS/FAIL: FAIL; cases checked reported: UNKNOWN; end/failure time: 40 ns (VCD 시각, 로그 시간 단위와 확인)
- simulation.log: `evidence/vscode/LAB1/02_full_adder/intentional_failure__run-e2c662a627954effaf3507dedc43f1a5/simulation.log`; SHA-256 0c08ac311a8ca52ead67fc69003d1f8dc6758e2fd68a35174dd4f308ebee91f1
- compile.log: `evidence/vscode/LAB1/02_full_adder/intentional_failure__run-e2c662a627954effaf3507dedc43f1a5/compile.log`; SHA-256 04f33000b54560c1ba32b2cfb3f039b0b06fbb2997c46f7cd96d9ad6929a4051
- VCD: `evidence/vscode/LAB1/02_full_adder/intentional_failure__run-e2c662a627954effaf3507dedc43f1a5/wave.vcd`; SHA-256 0e5e895f7d548be66f69493a7e983a9434a3915d1f4a92a68293a0fbd5d9b05a
- actual first failure log: FAIL full_adder vector=3 expected=2 actual=0 (로그 raw hex 표기를 유지; 완료된 checked cases를 추정하지 않음)
- input hash for this preserved run: UNKNOWN; 다른 run의 result input hash를 전용하지 않음

- run ID: run-e2dc5b3bf5af401bb6d906dd28fe5de7; category normal; HISTORICAL_RUN
- PASS/FAIL: PASS; cases checked reported: 8; end/failure time: 80 ns (VCD 시각, 로그 시간 단위와 확인)
- simulation.log: `evidence/vscode/LAB1/02_full_adder/normal__run-e2dc5b3bf5af401bb6d906dd28fe5de7/simulation.log`; SHA-256 2bd40fd396e29ee9e6b5a9705a57611f5265824943efd45b3574620c7b141c3f
- compile.log: `evidence/vscode/LAB1/02_full_adder/normal__run-e2dc5b3bf5af401bb6d906dd28fe5de7/compile.log`; SHA-256 04f33000b54560c1ba32b2cfb3f039b0b06fbb2997c46f7cd96d9ad6929a4051
- VCD: `evidence/vscode/LAB1/02_full_adder/normal__run-e2dc5b3bf5af401bb6d906dd28fe5de7/wave.vcd`; SHA-256 116eb50becc501c5e9d21d1b65d8f88388d51659ed6379b488efedc0004bcd4c
- input hash for this preserved run: UNKNOWN; 다른 run의 result input hash를 전용하지 않음

- run ID: run-335a41eb710c467a94846bdabb4ec2c5; category recovery; HISTORICAL_RUN
- PASS/FAIL: PASS; cases checked reported: 8; end/failure time: 80 ns (VCD 시각, 로그 시간 단위와 확인)
- simulation.log: `evidence/vscode/LAB1/02_full_adder/recovery__run-335a41eb710c467a94846bdabb4ec2c5/simulation.log`; SHA-256 2bd40fd396e29ee9e6b5a9705a57611f5265824943efd45b3574620c7b141c3f
- compile.log: `evidence/vscode/LAB1/02_full_adder/recovery__run-335a41eb710c467a94846bdabb4ec2c5/compile.log`; SHA-256 04f33000b54560c1ba32b2cfb3f039b0b06fbb2997c46f7cd96d9ad6929a4051
- VCD: `evidence/vscode/LAB1/02_full_adder/recovery__run-335a41eb710c467a94846bdabb4ec2c5/wave.vcd`; SHA-256 b45cf6285629ec2663ad8859888b8b57f89299efbf16d85624acda19b2cd96bb
- input hash for this preserved run: UNKNOWN; 다른 run의 result input hash를 전용하지 않음

Local build/sim historical logs (새 실행 아님):

| Local log | Observed result lines |
| --- | --- |
| `LAB1/02_full_adder/build/sim/run-2fc713b314ad46a5868690ad9f08f147/simulation.log` | LAB1_PASS full_adder cases=8 / C:\Users\yunji\ece2\ece2_2026\LAB1\02_full_adder\sim\tb_full_adder.sv:33: $finish called at 80000 (1ps) |
| `LAB1/02_full_adder/build/sim/run-335a41eb710c467a94846bdabb4ec2c5/simulation.log` | LAB1_PASS full_adder cases=8 / C:\Users\yunji\ece2\ece2_2026\LAB1\02_full_adder\sim\tb_full_adder.sv:33: $finish called at 80000 (1ps) |
| `LAB1/02_full_adder/build/sim/run-3d8a53fcab7540f2a6ec93ce6433b961/simulation.log` | FATAL: C:\Users\yunji\ece2\ece2_2026\LAB1\02_full_adder\sim\tb_full_adder.sv:23: FAIL full_adder vector=3 expected=2 actual=0 |
| `LAB1/02_full_adder/build/sim/run-9fe1d57c3a1c409e82fb042989b8f0f4/simulation.log` | LAB1_PASS full_adder cases=8 / C:\Users\yunji\ece2\ece2_2026\LAB1\02_full_adder\sim\tb_full_adder.sv:33: $finish called at 80000 (1ps) |
| `LAB1/02_full_adder/build/sim/run-e2c662a627954effaf3507dedc43f1a5/simulation.log` | FATAL: C:\Users\yunji\ece2\ece2_2026\LAB1\02_full_adder\sim\tb_full_adder.sv:23: FAIL full_adder vector=3 expected=2 actual=0 |
| `LAB1/02_full_adder/build/sim/run-e2dc5b3bf5af401bb6d906dd28fe5de7/simulation.log` | LAB1_PASS full_adder cases=8 / C:\Users\yunji\ece2\ece2_2026\LAB1\02_full_adder\sim\tb_full_adder.sv:33: $finish called at 80000 (1ps) |
| `LAB1/02_full_adder/build/sim/run-f9df277cbbd84d76bed84c67a3b2dd5c/simulation.log` | LAB1_PASS full_adder cases=8 / C:\Users\yunji\ece2\ece2_2026\LAB1\02_full_adder\sim\tb_full_adder.sv:33: $finish called at 80000 (1ps) |

#### D. Historical Vivado simulation / GUI

- final stable waveform evidence: `evidence/vivado/LAB1/02_full_adder/LAB1_02_full_adder_vivado_waveform.png`
- stable representative condition / expected: 20~40 ns: a=0,b=1,cin=0→1; {cout,s}=2'b01→2'b10
- observed result: 캡처의 stable signal label/value 및 출력 패턴이 위 계산한 expected와 일치하는 구간이 보임. 범위가 현재 TB에서 도출된 03/05는 정확한 sample time을 학생이 확인해야 함
- Vivado version: Vivado Simulator v2026.1; project/product 및 로컬 report도 2026.1
- executed design/simulation top: full_adder / tb_full_adder
- simulation FPGA part/XDC: xc7s75fgga484-1 / LAB1/02_full_adder/constraints/full_adder.xdc
- simulation log: `LAB1/02_full_adder/full_adder.sim/sim_1/behav/xsim/simulate.log`
- actual PASS/cases/end time: PASS / 8 / 80 ns (simulate.log 직접 판독)
- simulation run ID: UNKNOWN (XSim 로컬 stage 경로만 확인; UUID 임의 생성 금지)
- Vivado VCD: `LAB1/02_full_adder/full_adder.sim/sim_1/behav/xsim/wave.vcd`; SHA-256 b846b9b8058092aa5f146c50fc861f5671b25408b99141afe16865a2e41e5bdd
- VCD last timestamp: 80 ns; 실제 종료는 80 ns. 마지막 event를 종료 시간으로 대체하지 않음
- compiled source registration: `LAB1/02_full_adder/full_adder.sim/sim_1/behav/xsim/tb_full_adder_vlog.prj`; 현재 RTL/TB의 ../../../../src,sim 경로 참조. compiled input source SHA-256 및 run-to-commit은 UNKNOWN

#### E. VS Code ↔ Vivado comparison

- DUT/output signal set: full_adder / a, b, cin, s, cout
- expected behavior / current TB: 위 실제 source 계산 및 enumeration 참조
- comparison: FUNCTIONALLY_CONSISTENT; 정상 및 복구 각각 8 case의 n*10+5 ns 안정 sample에서 입력/출력 불일치 0
- input sequence/output/cases/end: VCD 안정 sample 입력·출력 일치, PASS logs 8 cases 및 80 ns 종료 일치; exact compiled source bytes는 UNKNOWN
- exact VCD SHA-256 equality: false (정상 및 복구 각각); byte equality와 기능 일치를 구분

#### F. Build / DRC / timing / bitstream

- historical synthesis: 성공; `LAB1/02_full_adder/full_adder.runs/synth_1/runme.log`의 synth_design completed successfully
- historical implementation: 성공; `LAB1/02_full_adder/full_adder.runs/impl_1/runme.log`의 route_design completed successfully
- historical write_bitstream: 성공; 같은 impl runme.log의 write_bitstream completed successfully
- actual bitstream: `LAB1/02_full_adder/full_adder.runs/impl_1/full_adder.bit`; SHA-256 e350bc736795497172f6591d04d11cae70b1c36ecdebc6ad181191029cd886a7; size 3687013 bytes
- DRC report: `LAB1/02_full_adder/full_adder.runs/impl_1/full_adder_drc_routed.rpt`; SHA-256 e121f667ea020e5128aa99c8fbecfd6d82e85eabd1e3b7e67a9fccdf833d3f89
- DRC design/device/state: full_adder / xc7s75fgga484-1 / Fully Routed (report header)
- default routed DRC: errors=0; warnings=1; rule=CFGBVS-1. CFGBVS 및 CONFIG_VOLTAGE 미설정으로 configuration bank voltage 검증 정보가 부족하다는 경고. 경고를 숨기거나 clean DRC PASS라고 쓰지 않음
- timing report: `LAB1/02_full_adder/full_adder.runs/impl_1/full_adder_timing_summary_routed.rpt`; SHA-256 b39847e6cdb153c239608344fd9b264f89d8b913413c533a50eaa9114879c9ef
- user timing constraints: 없음; clock summary: 비어 있음; current XDC에도 create_clock/input-output delay 없음
- WNS=inf ns, TNS=0.000 ns, WHS=inf ns, THS=0.000 ns; pulse-width=NA
- timing interpretation: NO_USER_TIMING_CONSTRAINT / NOT_APPLICABLE_TO_SETUP_HOLD_AS_REPORTED; timing verification PASS 아님
- source→historical bitstream/hash→programmed device direct link: UNKNOWN

### 03_4bit_adder

- 담당자: 팀원 (사용자 확인); 성명: UNKNOWN
- 수행 환경: UNKNOWN (현재 저장 위치와 과거 생성 PC를 동일시하지 않음)
- source / vscode_sim provenance: LOCAL_VERIFIED (현재 파일 및 보존 로그/VCD)
- vivado_sim provenance: LOCAL_VERIFIED (최종 waveform 이미지에 한정; version/part/전체 cases/end/log/VCD는 UNKNOWN)
- synthesis / implementation / DRC / timing / bitstream 수행: TEAM_CONFIRMED (사용자 확인); 원본 evidence: EVIDENCE_PENDING
- programmed 수행 status: NOT_VERIFIED; 특정 실험/bitstream 연결: UNKNOWN (대표 캡처만으로 수행을 확정하지 않음)
- board provenance: LOCAL_VERIFIED (raw video 존재에 한정; 제출 board 사진 대상 아님)

#### A. Actual RTL structure

- experiment: 03_4bit_adder
- design top/module: adder_4bit
- input/output ports: input a[3:0],b[3:0]; output s[3:0],cout (1 bit)
- 설계 목적: 4비트 가산기의 입출력 변환
- 실제 RTL / 핵심 구문: assign {cout,s}={1'b0,a}+{1'b0,b}; 양 피연산자를 5비트로 zero-extend
- 논리 흐름: 5비트 합의 상위 bit는 cout, 하위 4비트는 s로 분리된다.
- 구조 효과: 피연산자 확장과 5비트 수신으로 carry를 보존한다.
- 보고서용 설계 및 핵심 구조 설명: 두 4비트 입력을 각각 5비트로 확장한 뒤 더한다. 합을 {cout,s}에 대입하여 최상위 carry와 하위 4비트 결과를 분리한다.

#### B. Current source provenance

- label: CURRENT_SOURCE; file/content provenance TOOL_VERIFIED
- current Git commit: 246d6b621ce5b7a30d8a71a98c3e03693e69c9de
- working tree source/TB/XDC/simulation.json: UNCHANGED_TRACKED (읽기 전용 Git status 확인)
- FPGA part: UNKNOWN (해당 실험 로컬 project 설정 없음)
- project: UNKNOWN
- current simulation top: tb_adder_4bit
- simulation.json: `LAB1/03_4bit_adder/simulation.json`

| Current file | SHA-256 |
| --- | --- |
| `LAB1/03_4bit_adder/src/adder_4bit.v` | f53e0fd2a06a3c951b153e319752cbcf972c1d50d1048956fa7f2f729e15d7cc |
| `LAB1/03_4bit_adder/sim/tb_adder_4bit.sv` | 50f512540024b0f13b96111f49cb8771d1008baf357e49675bc516cced12c755 |
| `LAB1/03_4bit_adder/constraints/adder_4bit.xdc` | 4b9c196bcc015ef6bd64dbfb0b143b7d28bbc1c04d6c297c77807ce2d935b758 |
| `LAB1/03_4bit_adder/simulation.json` | 15454c6412d6bf9299ff651940893951f976cdf1be342bb954aeaacffe9b7fde |

- latest result record: `LAB1/03_4bit_adder/build/sim/result.json`; recorded run run-3553617cda564961a84d1f67c16a5256
- recorded input hashes: simulation.json 및 RTL/TB 모두 현재 hash와 일치; 아래 표
| Input recorded for this run | Recorded SHA-256 | Current match |
| --- | --- | --- |
| simulation.json | 15454c6412d6bf9299ff651940893951f976cdf1be342bb954aeaacffe9b7fde | true |
| src/adder_4bit.v | f53e0fd2a06a3c951b153e319752cbcf972c1d50d1048956fa7f2f729e15d7cc | true |
| sim/tb_adder_4bit.sv | 50f512540024b0f13b96111f49cb8771d1008baf357e49675bc516cced12c755 | true |
- recorded wave_sha256: 19736fccba3c0addcd886c2b1a3fde97daf2cfbd4324bf153551e4443744fd30; actual `LAB1/03_4bit_adder/build/sim/run-3553617cda564961a84d1f67c16a5256/wave.vcd` 및 build/sim/wave.vcd와 일치
- this result run is preserved recovery: true
- RUN_TO_COMMIT: UNKNOWN. hash 일치는 기록에 지정된 해당 run의 file-content 연결이며 commit 실행 증명은 아니다.

#### C. Historical VS Code/Icarus simulation

- simulator: Icarus Verilog; 보존 environment/iverilog.log는 12.0 devel, environment/vvp.log는 Icarus runtime 기록. 개별 run binary version의 독립 snapshot은 UNKNOWN
- environment evidence: `evidence/vscode/LAB1/environment/iverilog.log`, `evidence/vscode/LAB1/environment/vvp.log`
- current TB input enumeration: {a,b}=n; n=0..255; 10 ns/case (코드 계산, AUTO_DERIVED)

- run ID: run-ce60d29254dc4e588077b39cbfb72a1f; category intentional_failure; HISTORICAL_RUN
- PASS/FAIL: FAIL; cases checked reported: UNKNOWN; end/failure time: 20 ns (VCD 시각, 로그 시간 단위와 확인)
- simulation.log: `evidence/vscode/LAB1/03_4bit_adder/intentional_failure__run-ce60d29254dc4e588077b39cbfb72a1f/simulation.log`; SHA-256 c9e387be6b83c285009b239612e7b67eb73e386957dbb98713dc529d0d032ec9
- compile.log: `evidence/vscode/LAB1/03_4bit_adder/intentional_failure__run-ce60d29254dc4e588077b39cbfb72a1f/compile.log`; SHA-256 c3a4bbb79d3a69e94ec0434eb0470b928e562c39bdcb73006f15ce1930c910b7
- VCD: `evidence/vscode/LAB1/03_4bit_adder/intentional_failure__run-ce60d29254dc4e588077b39cbfb72a1f/wave.vcd`; SHA-256 09d4d4dca8df5d72059f196a8924853db9d62eadf5305dfe8ced686be5a9a106
- actual first failure log: FAIL adder_4bit vector=1 expected=01 actual=1f (로그 raw hex 표기를 유지; 완료된 checked cases를 추정하지 않음)
- input hash for this preserved run: UNKNOWN; 다른 run의 result input hash를 전용하지 않음

- run ID: run-096c1dfe66a7434e8f15364c42d08412; category normal; HISTORICAL_RUN
- PASS/FAIL: PASS; cases checked reported: 256; end/failure time: 2560 ns (VCD 시각, 로그 시간 단위와 확인)
- simulation.log: `evidence/vscode/LAB1/03_4bit_adder/normal__run-096c1dfe66a7434e8f15364c42d08412/simulation.log`; SHA-256 e08fb4865f0ad5c61284bd866676dfabf1a66c6d56d0d6a484d7fdbb64fbf0c4
- compile.log: `evidence/vscode/LAB1/03_4bit_adder/normal__run-096c1dfe66a7434e8f15364c42d08412/compile.log`; SHA-256 c3a4bbb79d3a69e94ec0434eb0470b928e562c39bdcb73006f15ce1930c910b7
- VCD: `evidence/vscode/LAB1/03_4bit_adder/normal__run-096c1dfe66a7434e8f15364c42d08412/wave.vcd`; SHA-256 09b32d3bdc8dbd9e4df2893350fcb85e67f396de6e0ebc384f2ed18ca49e9a2e
- input hash for this preserved run: UNKNOWN; 다른 run의 result input hash를 전용하지 않음

- run ID: run-3553617cda564961a84d1f67c16a5256; category recovery; HISTORICAL_RUN
- PASS/FAIL: PASS; cases checked reported: 256; end/failure time: 2560 ns (VCD 시각, 로그 시간 단위와 확인)
- simulation.log: `evidence/vscode/LAB1/03_4bit_adder/recovery__run-3553617cda564961a84d1f67c16a5256/simulation.log`; SHA-256 e08fb4865f0ad5c61284bd866676dfabf1a66c6d56d0d6a484d7fdbb64fbf0c4
- compile.log: `evidence/vscode/LAB1/03_4bit_adder/recovery__run-3553617cda564961a84d1f67c16a5256/compile.log`; SHA-256 c3a4bbb79d3a69e94ec0434eb0470b928e562c39bdcb73006f15ce1930c910b7
- VCD: `evidence/vscode/LAB1/03_4bit_adder/recovery__run-3553617cda564961a84d1f67c16a5256/wave.vcd`; SHA-256 19736fccba3c0addcd886c2b1a3fde97daf2cfbd4324bf153551e4443744fd30
- input hash for this preserved run: 위 result.json에 기록된 RTL/TB/config hash; VCD hash도 일치

Local build/sim historical logs (새 실행 아님):

| Local log | Observed result lines |
| --- | --- |
| `LAB1/03_4bit_adder/build/sim/run-096c1dfe66a7434e8f15364c42d08412/simulation.log` | LAB1_PASS adder_4bit cases=256 / C:\Users\yunji\ece2\ece2_2026\LAB1\03_4bit_adder\sim\tb_adder_4bit.sv:34: $finish called at 2560000 (1ps) |
| `LAB1/03_4bit_adder/build/sim/run-3553617cda564961a84d1f67c16a5256/simulation.log` | LAB1_PASS adder_4bit cases=256 / C:\Users\yunji\ece2\ece2_2026\LAB1\03_4bit_adder\sim\tb_adder_4bit.sv:34: $finish called at 2560000 (1ps) |
| `LAB1/03_4bit_adder/build/sim/run-7613ecdeeef6418b80e8cce1fcaab060/simulation.log` | FATAL: C:\Users\yunji\ece2\ece2_2026\LAB1\03_4bit_adder\sim\tb_adder_4bit.sv:24: FAIL adder_4bit vector=1 expected=01 actual=1f |
| `LAB1/03_4bit_adder/build/sim/run-ce60d29254dc4e588077b39cbfb72a1f/simulation.log` | FATAL: C:\Users\yunji\ece2\ece2_2026\LAB1\03_4bit_adder\sim\tb_adder_4bit.sv:24: FAIL adder_4bit vector=1 expected=01 actual=1f |

#### D. Historical Vivado simulation / GUI

- final stable waveform evidence: `evidence/vivado/LAB1/03_4bit_adder/LAB1_03_4bit_adder_vivado_waveform.jpg`
- stable representative condition / expected: a=4'h5, b=4'hA→4'hB; {cout,s}=5'h0F→5'h10; 900~920 ns는 현재 TB에서 도출한 후보
- observed result: 캡처의 stable signal label/value 및 출력 패턴이 위 계산한 expected와 일치하는 구간이 보임. 범위가 현재 TB에서 도출된 03/05는 정확한 sample time을 학생이 확인해야 함
- Vivado version: UNKNOWN (해당 실험 screenshot에서 version 미확인)
- executed design/simulation top: UNKNOWN; 위 current source/TB top과 실제 실행 설정 직접 연결 미확인
- simulation FPGA part/XDC: UNKNOWN (실제 실행 project 미확보); current XDC는 위 source 표 참조
- simulation log: UNKNOWN
- actual Vivado PASS/cases/end time: UNKNOWN; screenshot 시간 축과 현재 TB 총시간을 완료 로그로 대체하지 않음
- Vivado VCD path/hash: UNKNOWN

#### E. VS Code ↔ Vivado comparison

- DUT/output signal set: adder_4bit / input a[3:0],b[3:0]; output s[3:0],cout (1 bit)
- expected behavior / current TB: 위 실제 source 계산 및 enumeration 참조
- comparison: NOT_DIRECTLY_COMPARABLE; screenshot 안정 구간의 기능 해석은 현재 RTL 및 VS Code 결과와 양립하지만 전체 Vivado 입력 sequence, checked cases, end time을 정량 비교할 자료 없음
- exact VCD equality: UNKNOWN

#### F. Build / DRC / timing / bitstream

- synthesis/implementation/write_bitstream 수행: TEAM_CONFIRMED; 원본 log/산출물 확인: EVIDENCE_PENDING
- bitstream 수행: TEAM_CONFIRMED; evidence: EVIDENCE_PENDING; actual path/hash: UNKNOWN
- DRC 수행: TEAM_CONFIRMED; 원본 report: EVIDENCE_PENDING; counts/design state/rule: UNKNOWN
- timing 수행: TEAM_CONFIRMED; 원본 report: EVIDENCE_PENDING; constraints/clock/metrics: UNKNOWN; timing PASS를 추정하지 않음
- artifact absence is not a claim that the student never performed the stage

### 04_4bit_subtractor

- 담당자: UNKNOWN
- 수행 환경: UNKNOWN (현재 저장 위치와 과거 생성 PC를 동일시하지 않음)
- source / vscode_sim provenance: LOCAL_VERIFIED (현재 파일 및 보존 로그/VCD)
- vivado_sim provenance: LOCAL_VERIFIED (기존 project/log/VCD 및 waveform)
- synthesis / implementation / DRC / timing / bitstream provenance: LOCAL_VERIFIED; 기존 성공 로그·report·bitstream에 한정, 과거 source commit 연결은 UNKNOWN
- programmed 수행 status: NOT_VERIFIED; 특정 실험/bitstream 연결: UNKNOWN (대표 캡처만으로 수행을 확정하지 않음)
- board provenance: LOCAL_VERIFIED (raw video 존재에 한정; 제출 board 사진 대상 아님)

#### A. Actual RTL structure

- experiment: 04_4bit_subtractor
- design top/module: sub_4bit
- input/output ports: input a[3:0],b[3:0]; output d[3:0],bor (1 bit)
- 설계 목적: 4비트 감산기의 입출력 변환
- 실제 RTL / 핵심 구문: assign d=a-b; assign bor=a<b
- 논리 흐름: d는 4비트 차로 wrap되며 bor는 unsigned 대소 비교에서 생성된다.
- 구조 효과: 차와 borrow를 별도 식으로 명확히 표현하며 동등 입력에서는 borrow가 0이다.
- 보고서용 설계 및 핵심 구조 설명: a-b의 하위 4비트를 d로 출력하고 a<b 비교 결과를 bor로 출력한다. 동등 입력에서는 borrow가 없으며, a보다 b가 크면 차의 wrap과 borrow를 구분하여 확인할 수 있다.

#### B. Current source provenance

- label: CURRENT_SOURCE; file/content provenance TOOL_VERIFIED
- current Git commit: 246d6b621ce5b7a30d8a71a98c3e03693e69c9de
- working tree source/TB/XDC/simulation.json: UNCHANGED_TRACKED (읽기 전용 Git status 확인)
- FPGA part: xc7s75fgga484-1
- project: `LAB1/04_4bit_subtractor/4bits_subtractor.xpr`
- current simulation top: tb_sub_4bit
- simulation.json: `LAB1/04_4bit_subtractor/simulation.json`
- project design/simulation tops: sub_4bit / tb_sub_4bit
- project RTL/TB/XDC registrations: $PPRDIR/src/sub_4bit.v, $PPRDIR/constraints/sub_4bit.xdc, $PPRDIR/sim/tb_sub_4bit.sv; 현재 src/sim/constraints 상대 경로를 참조하며 과거 compiled source hash는 UNKNOWN

| Current file | SHA-256 |
| --- | --- |
| `LAB1/04_4bit_subtractor/src/sub_4bit.v` | bc4c5848e22ba3b98ef8f751b0efe61737ca8b5a892b30ea43d5a1c794760b9c |
| `LAB1/04_4bit_subtractor/sim/tb_sub_4bit.sv` | 74cbfc5e7375c77c8e214770a16aa451afd17b20d50c7aca8f28f8fb8dc35506 |
| `LAB1/04_4bit_subtractor/constraints/sub_4bit.xdc` | df46a8a16590b51a20529b83eea2005f6225d64810d592e1651b8c7a8c604cbd |
| `LAB1/04_4bit_subtractor/simulation.json` | 7b62c0cfa0d950c159d250b050f62e02258fc12c6017ac7df65a03854650089b |

- latest result record: `LAB1/04_4bit_subtractor/build/sim/result.json`; recorded run run-0bbbc6a5fb114175b9282372017875bc
- recorded input hashes: simulation.json 및 RTL/TB 모두 현재 hash와 일치; 아래 표
| Input recorded for this run | Recorded SHA-256 | Current match |
| --- | --- | --- |
| simulation.json | 7b62c0cfa0d950c159d250b050f62e02258fc12c6017ac7df65a03854650089b | true |
| src/sub_4bit.v | bc4c5848e22ba3b98ef8f751b0efe61737ca8b5a892b30ea43d5a1c794760b9c | true |
| sim/tb_sub_4bit.sv | 74cbfc5e7375c77c8e214770a16aa451afd17b20d50c7aca8f28f8fb8dc35506 | true |
- recorded wave_sha256: fce461d5b59c830c07e489f26e70318cdff889fcd8e5d7aa2534486ecad3205f; actual `LAB1/04_4bit_subtractor/build/sim/run-0bbbc6a5fb114175b9282372017875bc/wave.vcd` 및 build/sim/wave.vcd와 일치
- this result run is preserved recovery: true
- RUN_TO_COMMIT: UNKNOWN. hash 일치는 기록에 지정된 해당 run의 file-content 연결이며 commit 실행 증명은 아니다.

#### C. Historical VS Code/Icarus simulation

- simulator: Icarus Verilog; 보존 environment/iverilog.log는 12.0 devel, environment/vvp.log는 Icarus runtime 기록. 개별 run binary version의 독립 snapshot은 UNKNOWN
- environment evidence: `evidence/vscode/LAB1/environment/iverilog.log`, `evidence/vscode/LAB1/environment/vvp.log`
- current TB input enumeration: {a,b}=n; n=0..255; 10 ns/case (코드 계산, AUTO_DERIVED)

- run ID: run-13fbdfbd780a43b19a7da64e2165dc52; category intentional_failure; HISTORICAL_RUN
- PASS/FAIL: FAIL; cases checked reported: UNKNOWN; end/failure time: 10 ns (VCD 시각, 로그 시간 단위와 확인)
- simulation.log: `evidence/vscode/LAB1/04_4bit_subtractor/intentional_failure__run-13fbdfbd780a43b19a7da64e2165dc52/simulation.log`; SHA-256 9a088a764d7940d13a84ac7dd5d49f724748918be8964b0580e5c4d5f6ad4296
- compile.log: `evidence/vscode/LAB1/04_4bit_subtractor/intentional_failure__run-13fbdfbd780a43b19a7da64e2165dc52/compile.log`; SHA-256 cbd06c8e4fc8852a0aa8aaafb9acfb7a0ed518c659f2ccb311ae7c2f77ae6142
- VCD: `evidence/vscode/LAB1/04_4bit_subtractor/intentional_failure__run-13fbdfbd780a43b19a7da64e2165dc52/wave.vcd`; SHA-256 4ecf37d4fcc0d5161689e9ac860fe97a13e07ac792f878e2482f961d0521e223
- actual first failure log: FAIL sub_4bit vector=0 expected=00 actual=10 (로그 raw hex 표기를 유지; 완료된 checked cases를 추정하지 않음)
- input hash for this preserved run: UNKNOWN; 다른 run의 result input hash를 전용하지 않음

- run ID: run-816105e21bbd4d6cab19cedd6140ad91; category normal; HISTORICAL_RUN
- PASS/FAIL: PASS; cases checked reported: 256; end/failure time: 2560 ns (VCD 시각, 로그 시간 단위와 확인)
- simulation.log: `evidence/vscode/LAB1/04_4bit_subtractor/normal__run-816105e21bbd4d6cab19cedd6140ad91/simulation.log`; SHA-256 8111dca71e88dbfd6e52db93d0e7e0951dffa58fea0590ae00592b160948fbd9
- compile.log: `evidence/vscode/LAB1/04_4bit_subtractor/normal__run-816105e21bbd4d6cab19cedd6140ad91/compile.log`; SHA-256 cbd06c8e4fc8852a0aa8aaafb9acfb7a0ed518c659f2ccb311ae7c2f77ae6142
- VCD: `evidence/vscode/LAB1/04_4bit_subtractor/normal__run-816105e21bbd4d6cab19cedd6140ad91/wave.vcd`; SHA-256 1274cf4e6b51abcc2911d1b26317fe1ef0b0eb01bc96e224d4ed970e80d1e46c
- input hash for this preserved run: UNKNOWN; 다른 run의 result input hash를 전용하지 않음

- run ID: run-0bbbc6a5fb114175b9282372017875bc; category recovery; HISTORICAL_RUN
- PASS/FAIL: PASS; cases checked reported: 256; end/failure time: 2560 ns (VCD 시각, 로그 시간 단위와 확인)
- simulation.log: `evidence/vscode/LAB1/04_4bit_subtractor/recovery__run-0bbbc6a5fb114175b9282372017875bc/simulation.log`; SHA-256 8111dca71e88dbfd6e52db93d0e7e0951dffa58fea0590ae00592b160948fbd9
- compile.log: `evidence/vscode/LAB1/04_4bit_subtractor/recovery__run-0bbbc6a5fb114175b9282372017875bc/compile.log`; SHA-256 cbd06c8e4fc8852a0aa8aaafb9acfb7a0ed518c659f2ccb311ae7c2f77ae6142
- VCD: `evidence/vscode/LAB1/04_4bit_subtractor/recovery__run-0bbbc6a5fb114175b9282372017875bc/wave.vcd`; SHA-256 fce461d5b59c830c07e489f26e70318cdff889fcd8e5d7aa2534486ecad3205f
- input hash for this preserved run: 위 result.json에 기록된 RTL/TB/config hash; VCD hash도 일치

Local build/sim historical logs (새 실행 아님):

| Local log | Observed result lines |
| --- | --- |
| `LAB1/04_4bit_subtractor/build/sim/run-0bbbc6a5fb114175b9282372017875bc/simulation.log` | LAB1_PASS sub_4bit cases=256 / C:\Users\yunji\ece2\ece2_2026\LAB1\04_4bit_subtractor\sim\tb_sub_4bit.sv:39: $finish called at 2560000 (1ps) |
| `LAB1/04_4bit_subtractor/build/sim/run-13fbdfbd780a43b19a7da64e2165dc52/simulation.log` | FATAL: C:\Users\yunji\ece2\ece2_2026\LAB1\04_4bit_subtractor\sim\tb_sub_4bit.sv:28: FAIL sub_4bit vector=0 expected=00 actual=10 |
| `LAB1/04_4bit_subtractor/build/sim/run-816105e21bbd4d6cab19cedd6140ad91/simulation.log` | LAB1_PASS sub_4bit cases=256 / C:\Users\yunji\ece2\ece2_2026\LAB1\04_4bit_subtractor\sim\tb_sub_4bit.sv:39: $finish called at 2560000 (1ps) |

#### D. Historical Vivado simulation / GUI

- final stable waveform evidence: `evidence/vivado/LAB1/04_4bit_subtractor/LAB1_04_4bit_subtractor_vivado_waveform.png`
- stable representative condition / expected: 0~20 ns: a=4'h0,b=4'h0→4'h1; {bor,d}=5'h00→5'h1F
- observed result: 캡처의 stable signal label/value 및 출력 패턴이 위 계산한 expected와 일치하는 구간이 보임. 범위가 현재 TB에서 도출된 03/05는 정확한 sample time을 학생이 확인해야 함
- Vivado version: Vivado Simulator v2026.1; project/product 및 로컬 report도 2026.1
- executed design/simulation top: sub_4bit / tb_sub_4bit
- simulation FPGA part/XDC: xc7s75fgga484-1 / LAB1/04_4bit_subtractor/constraints/sub_4bit.xdc
- simulation log: `LAB1/04_4bit_subtractor/4bits_subtractor.sim/sim_1/behav/xsim/simulate.log`
- actual PASS/cases/end time: PASS / 256 / 2560 ns (simulate.log 직접 판독)
- simulation run ID: UNKNOWN (XSim 로컬 stage 경로만 확인; UUID 임의 생성 금지)
- Vivado VCD: `LAB1/04_4bit_subtractor/4bits_subtractor.sim/sim_1/behav/xsim/wave.vcd`; SHA-256 1e56f04d454bc6b93fafeb3376064b5b35a9e9e98dd7bd199b294bd5038b4f79
- VCD last timestamp: 2560 ns; 실제 종료는 2560 ns. 마지막 event를 종료 시간으로 대체하지 않음
- compiled source registration: `LAB1/04_4bit_subtractor/4bits_subtractor.sim/sim_1/behav/xsim/tb_sub_4bit_vlog.prj`; 현재 RTL/TB의 ../../../../src,sim 경로 참조. compiled input source SHA-256 및 run-to-commit은 UNKNOWN

#### E. VS Code ↔ Vivado comparison

- DUT/output signal set: sub_4bit / a, b, d, bor
- expected behavior / current TB: 위 실제 source 계산 및 enumeration 참조
- comparison: FUNCTIONALLY_CONSISTENT; 정상 및 복구 각각 256 case의 n*10+5 ns 안정 sample에서 입력/출력 불일치 0
- input sequence/output/cases/end: VCD 안정 sample 입력·출력 일치, PASS logs 256 cases 및 2560 ns 종료 일치; exact compiled source bytes는 UNKNOWN
- exact VCD SHA-256 equality: false (정상 및 복구 각각); byte equality와 기능 일치를 구분

#### F. Build / DRC / timing / bitstream

- historical synthesis: 성공; `LAB1/04_4bit_subtractor/4bits_subtractor.runs/synth_1/runme.log`의 synth_design completed successfully
- historical implementation: 성공; `LAB1/04_4bit_subtractor/4bits_subtractor.runs/impl_1/runme.log`의 route_design completed successfully
- historical write_bitstream: 성공; 같은 impl runme.log의 write_bitstream completed successfully
- actual bitstream: `LAB1/04_4bit_subtractor/4bits_subtractor.runs/impl_1/sub_4bit.bit`; SHA-256 a15681f9e1735b6a8fc2b504c6f24fddfeb6414296aac16dbdb33d9064f760e1; size 3687011 bytes
- DRC report: `LAB1/04_4bit_subtractor/4bits_subtractor.runs/impl_1/sub_4bit_drc_routed.rpt`; SHA-256 4181377381b55b30b1709f2b97eb2c74480720a2392154707eea170b74fad044
- DRC design/device/state: sub_4bit / xc7s75fgga484-1 / Fully Routed (report header)
- default routed DRC: errors=0; warnings=1; rule=CFGBVS-1. CFGBVS 및 CONFIG_VOLTAGE 미설정으로 configuration bank voltage 검증 정보가 부족하다는 경고. 경고를 숨기거나 clean DRC PASS라고 쓰지 않음
- timing report: `LAB1/04_4bit_subtractor/4bits_subtractor.runs/impl_1/sub_4bit_timing_summary_routed.rpt`; SHA-256 98a0e945c083277cfc18069bafa0feffda549cf71991470cd1b924b259ffb115
- user timing constraints: 없음; clock summary: 비어 있음; current XDC에도 create_clock/input-output delay 없음
- WNS=inf ns, TNS=0.000 ns, WHS=inf ns, THS=0.000 ns; pulse-width=NA
- timing interpretation: NO_USER_TIMING_CONSTRAINT / NOT_APPLICABLE_TO_SETUP_HOLD_AS_REPORTED; timing verification PASS 아님
- source→historical bitstream/hash→programmed device direct link: UNKNOWN

### 05_4bit_comparator

- 담당자: 팀원 (사용자 확인); 성명: UNKNOWN
- 수행 환경: UNKNOWN (현재 저장 위치와 과거 생성 PC를 동일시하지 않음)
- source / vscode_sim provenance: LOCAL_VERIFIED (현재 파일 및 보존 로그/VCD)
- vivado_sim provenance: LOCAL_VERIFIED (최종 waveform 이미지에 한정; version/part/전체 cases/end/log/VCD는 UNKNOWN)
- synthesis / implementation / DRC / timing / bitstream 수행: TEAM_CONFIRMED (사용자 확인); 원본 evidence: EVIDENCE_PENDING
- programmed 수행 status: NOT_VERIFIED; 특정 실험/bitstream 연결: UNKNOWN (대표 캡처만으로 수행을 확정하지 않음)
- board provenance: LOCAL_VERIFIED (raw video 존재에 한정; 제출 board 사진 대상 아님)

#### A. Actual RTL structure

- experiment: 05_4bit_comparator
- design top/module: compare_4
- input/output ports: input a[3:0],b[3:0]; output o[2:0]
- 설계 목적: 4비트 비교기의 입출력 변환
- 실제 RTL / 핵심 구문: assign o={a>b,a==b,a<b}
- 논리 흐름: o[2]는 greater, o[1]은 equal, o[0]은 less 결과이다.
- 구조 효과: 세 관계를 출력 bit별로 직접 대응시킨다.
- 보고서용 설계 및 핵심 구조 설명: 두 입력의 대소 및 동등 관계를 동시에 계산하여 o[2:0]에 연결한다. 각 bit는 순서대로 a>b, a==b, a<b를 뜻하며 대표 구간에서는 3'b100, 3'b010, 3'b001 전환을 분석한다.

#### B. Current source provenance

- label: CURRENT_SOURCE; file/content provenance TOOL_VERIFIED
- current Git commit: 246d6b621ce5b7a30d8a71a98c3e03693e69c9de
- working tree source/TB/XDC/simulation.json: UNCHANGED_TRACKED (읽기 전용 Git status 확인)
- FPGA part: UNKNOWN (해당 실험 로컬 project 설정 없음)
- project: UNKNOWN
- current simulation top: tb_compare_4
- simulation.json: `LAB1/05_4bit_comparator/simulation.json`

| Current file | SHA-256 |
| --- | --- |
| `LAB1/05_4bit_comparator/src/compare_4.v` | 5eea7006f90371e8c6fc9009af035156b3db9e8e8b117ad0f0c5e87fe136d3a5 |
| `LAB1/05_4bit_comparator/sim/tb_compare_4.sv` | e4e0b831a9ae2e3c96f1a1d2efb6d6d11a8520079e61dea287a13a18ad88e290 |
| `LAB1/05_4bit_comparator/constraints/compare_4.xdc` | 9d29027785c018bca8ab2c07d0cc8222bb626b4954935e2f9ec7fa0cf6efaeac |
| `LAB1/05_4bit_comparator/simulation.json` | b6ca653884508c688c95f7a4edd0ec180d486db64fa49b62c54289161d831f1f |

- latest result record: `LAB1/05_4bit_comparator/build/sim/result.json`; recorded run run-7cfa2f167dd443ab817fc9d2094f56dc
- recorded input hashes: simulation.json 및 RTL/TB 모두 현재 hash와 일치; 아래 표
| Input recorded for this run | Recorded SHA-256 | Current match |
| --- | --- | --- |
| simulation.json | b6ca653884508c688c95f7a4edd0ec180d486db64fa49b62c54289161d831f1f | true |
| src/compare_4.v | 5eea7006f90371e8c6fc9009af035156b3db9e8e8b117ad0f0c5e87fe136d3a5 | true |
| sim/tb_compare_4.sv | e4e0b831a9ae2e3c96f1a1d2efb6d6d11a8520079e61dea287a13a18ad88e290 | true |
- recorded wave_sha256: a1b6218c0a6c371db23cd23274783cdad8d63dd1dc865f8e233909f70a4f3d6f; actual `LAB1/05_4bit_comparator/build/sim/run-7cfa2f167dd443ab817fc9d2094f56dc/wave.vcd` 및 build/sim/wave.vcd와 일치
- this result run is preserved recovery: true
- RUN_TO_COMMIT: UNKNOWN. hash 일치는 기록에 지정된 해당 run의 file-content 연결이며 commit 실행 증명은 아니다.

#### C. Historical VS Code/Icarus simulation

- simulator: Icarus Verilog; 보존 environment/iverilog.log는 12.0 devel, environment/vvp.log는 Icarus runtime 기록. 개별 run binary version의 독립 snapshot은 UNKNOWN
- environment evidence: `evidence/vscode/LAB1/environment/iverilog.log`, `evidence/vscode/LAB1/environment/vvp.log`
- current TB input enumeration: {a,b}=n; n=0..255; 10 ns/case (코드 계산, AUTO_DERIVED)

- run ID: run-ed6afd5d6ae749688a11f31b8a5bdc58; category intentional_failure; HISTORICAL_RUN
- PASS/FAIL: FAIL; cases checked reported: UNKNOWN; end/failure time: 10 ns (VCD 시각, 로그 시간 단위와 확인)
- simulation.log: `evidence/vscode/LAB1/05_4bit_comparator/intentional_failure__run-ed6afd5d6ae749688a11f31b8a5bdc58/simulation.log`; SHA-256 74401831240e65e95b0d6f9e7d8eb8c53f60091e18fa132289910b7f1de8e2d5
- compile.log: `evidence/vscode/LAB1/05_4bit_comparator/intentional_failure__run-ed6afd5d6ae749688a11f31b8a5bdc58/compile.log`; SHA-256 9e413b8dc19d36facf4f81e4842118743fe8dd6eb837e69eaf374125e09957c3
- VCD: `evidence/vscode/LAB1/05_4bit_comparator/intentional_failure__run-ed6afd5d6ae749688a11f31b8a5bdc58/wave.vcd`; SHA-256 0795b4d6a1b5d534c9ee30e79d01577cd958172e709dbab834a76cef586248f5
- actual first failure log: FAIL compare_4 vector=0 expected=2 actual=0 (로그 raw hex 표기를 유지; 완료된 checked cases를 추정하지 않음)
- input hash for this preserved run: UNKNOWN; 다른 run의 result input hash를 전용하지 않음

- run ID: run-618a491854d44f08bf315a212d9c6758; category normal; HISTORICAL_RUN
- PASS/FAIL: PASS; cases checked reported: 256; end/failure time: 2560 ns (VCD 시각, 로그 시간 단위와 확인)
- simulation.log: `evidence/vscode/LAB1/05_4bit_comparator/normal__run-618a491854d44f08bf315a212d9c6758/simulation.log`; SHA-256 56aae9cdd9b366b633b3503c559811b920db7b05b9d4dee6254b49331ef67519
- compile.log: `evidence/vscode/LAB1/05_4bit_comparator/normal__run-618a491854d44f08bf315a212d9c6758/compile.log`; SHA-256 9e413b8dc19d36facf4f81e4842118743fe8dd6eb837e69eaf374125e09957c3
- VCD: `evidence/vscode/LAB1/05_4bit_comparator/normal__run-618a491854d44f08bf315a212d9c6758/wave.vcd`; SHA-256 94bfb722bfd0841b54f93d709c3dac5ba253dfea1c91ee2f04a31efa49632a79
- input hash for this preserved run: UNKNOWN; 다른 run의 result input hash를 전용하지 않음

- run ID: run-7cfa2f167dd443ab817fc9d2094f56dc; category recovery; HISTORICAL_RUN
- PASS/FAIL: PASS; cases checked reported: 256; end/failure time: 2560 ns (VCD 시각, 로그 시간 단위와 확인)
- simulation.log: `evidence/vscode/LAB1/05_4bit_comparator/recovery__run-7cfa2f167dd443ab817fc9d2094f56dc/simulation.log`; SHA-256 56aae9cdd9b366b633b3503c559811b920db7b05b9d4dee6254b49331ef67519
- compile.log: `evidence/vscode/LAB1/05_4bit_comparator/recovery__run-7cfa2f167dd443ab817fc9d2094f56dc/compile.log`; SHA-256 9e413b8dc19d36facf4f81e4842118743fe8dd6eb837e69eaf374125e09957c3
- VCD: `evidence/vscode/LAB1/05_4bit_comparator/recovery__run-7cfa2f167dd443ab817fc9d2094f56dc/wave.vcd`; SHA-256 a1b6218c0a6c371db23cd23274783cdad8d63dd1dc865f8e233909f70a4f3d6f
- input hash for this preserved run: 위 result.json에 기록된 RTL/TB/config hash; VCD hash도 일치

Local build/sim historical logs (새 실행 아님):

| Local log | Observed result lines |
| --- | --- |
| `LAB1/05_4bit_comparator/build/sim/run-618a491854d44f08bf315a212d9c6758/simulation.log` | VCD info: dumpfile wave.vcd opened for output. / LAB1_PASS compare_4 cases=256 / C:\Users\yunji\ece2\ece2_2026\LAB1\05_4bit_comparator\sim\tb_compare_4.sv:38: $finish called at 2560000 (1ps) |
| `LAB1/05_4bit_comparator/build/sim/run-7cfa2f167dd443ab817fc9d2094f56dc/simulation.log` | VCD info: dumpfile wave.vcd opened for output. / LAB1_PASS compare_4 cases=256 / C:\Users\yunji\ece2\ece2_2026\LAB1\05_4bit_comparator\sim\tb_compare_4.sv:38: $finish called at 2560000 (1ps) |
| `LAB1/05_4bit_comparator/build/sim/run-93d233e7229648d88eb6ba9688fd6e51/simulation.log` | UNKNOWN (빈 로그/판정 문구 없음) |
| `LAB1/05_4bit_comparator/build/sim/run-ed6afd5d6ae749688a11f31b8a5bdc58/simulation.log` | VCD info: dumpfile wave.vcd opened for output. / FATAL: C:\Users\yunji\ece2\ece2_2026\LAB1\05_4bit_comparator\sim\tb_compare_4.sv:27: FAIL compare_4 vector=0 expected=2 actual=0 /        Time: 10000  Scope: tb_compare_4 |

#### D. Historical Vivado simulation / GUI

- final stable waveform evidence: `evidence/vivado/LAB1/05_4bit_comparator/LAB1_05_4bit_comparator_vivado_waveform.jpg`
- stable representative condition / expected: a=4'h5,b=4'h4→4'h5→4'h6; o=3'b100→3'b010→3'b001; 840~870 ns는 TB 도출 후보
- observed result: 캡처의 stable signal label/value 및 출력 패턴이 위 계산한 expected와 일치하는 구간이 보임. 범위가 현재 TB에서 도출된 03/05는 정확한 sample time을 학생이 확인해야 함
- Vivado version: UNKNOWN (해당 실험 screenshot에서 version 미확인)
- executed design/simulation top: UNKNOWN; 위 current source/TB top과 실제 실행 설정 직접 연결 미확인
- simulation FPGA part/XDC: UNKNOWN (실제 실행 project 미확보); current XDC는 위 source 표 참조
- simulation log: UNKNOWN
- actual Vivado PASS/cases/end time: UNKNOWN; screenshot 시간 축과 현재 TB 총시간을 완료 로그로 대체하지 않음
- Vivado VCD path/hash: UNKNOWN

#### E. VS Code ↔ Vivado comparison

- DUT/output signal set: compare_4 / input a[3:0],b[3:0]; output o[2:0]
- expected behavior / current TB: 위 실제 source 계산 및 enumeration 참조
- comparison: NOT_DIRECTLY_COMPARABLE; screenshot 안정 구간의 기능 해석은 현재 RTL 및 VS Code 결과와 양립하지만 전체 Vivado 입력 sequence, checked cases, end time을 정량 비교할 자료 없음
- exact VCD equality: UNKNOWN

#### F. Build / DRC / timing / bitstream

- synthesis/implementation/write_bitstream 수행: TEAM_CONFIRMED; 원본 log/산출물 확인: EVIDENCE_PENDING
- bitstream 수행: TEAM_CONFIRMED; evidence: EVIDENCE_PENDING; actual path/hash: UNKNOWN
- DRC 수행: TEAM_CONFIRMED; 원본 report: EVIDENCE_PENDING; counts/design state/rule: UNKNOWN
- timing 수행: TEAM_CONFIRMED; 원본 report: EVIDENCE_PENDING; constraints/clock/metrics: UNKNOWN; timing PASS를 추정하지 않음
- artifact absence is not a claim that the student never performed the stage

### 06_mux

- 담당자: UNKNOWN
- 수행 환경: UNKNOWN (현재 저장 위치와 과거 생성 PC를 동일시하지 않음)
- source / vscode_sim provenance: LOCAL_VERIFIED (현재 파일 및 보존 로그/VCD)
- vivado_sim provenance: LOCAL_VERIFIED (기존 project/log/VCD 및 waveform)
- synthesis / implementation / DRC / timing / bitstream provenance: LOCAL_VERIFIED; 기존 성공 로그·report·bitstream에 한정, 과거 source commit 연결은 UNKNOWN
- programmed 수행 status: NOT_VERIFIED; 특정 실험/bitstream 연결: UNKNOWN (대표 캡처만으로 수행을 확정하지 않음)
- board provenance: LOCAL_VERIFIED (선정 실험 최종 사진; 입력/출력 확인 한계는 board 절 참조)

#### A. Actual RTL structure

- experiment: 06_mux
- design top/module: mux_4x1
- input/output ports: input i[3:0],s[1:0]; output z (1 bit)
- 설계 목적: 4:1 MUX의 입출력 변환
- 실제 RTL / 핵심 구문: assign z=i[3-s]
- 논리 흐름: s=2'b00/01/10/11이 각각 i[3]/i[2]/i[1]/i[0]를 선택한다.
- 구조 효과: 기존 LAB의 역순 선택 규칙을 index 식으로 보존한다 (RTL 주석 근거).
- 보고서용 설계 및 핵심 구조 설명: selector s에 따라 네 data bit 중 하나를 z로 전달한다. RTL은 i[3-s]를 사용하므로 s=2'b00에서 i[3], s=2'b11에서 i[0]를 선택한다.

#### B. Current source provenance

- label: CURRENT_SOURCE; file/content provenance TOOL_VERIFIED
- current Git commit: 246d6b621ce5b7a30d8a71a98c3e03693e69c9de
- working tree source/TB/XDC/simulation.json: UNCHANGED_TRACKED (읽기 전용 Git status 확인)
- FPGA part: xc7s75fgga484-1
- project: `LAB1/06_mux/mux.xpr`
- current simulation top: tb_mux_4x1
- simulation.json: `LAB1/06_mux/simulation.json`
- project design/simulation tops: mux_4x1 / tb_mux_4x1
- project RTL/TB/XDC registrations: $PPRDIR/src/mux_4x1.v, $PPRDIR/constraints/mux_4x1.xdc, $PPRDIR/sim/tb_mux_4x1.sv; 현재 src/sim/constraints 상대 경로를 참조하며 과거 compiled source hash는 UNKNOWN

| Current file | SHA-256 |
| --- | --- |
| `LAB1/06_mux/src/mux_4x1.v` | 74932cbf7f94c1209533657d639e4849762c6ea3f78005567b0e908fcfd18d32 |
| `LAB1/06_mux/sim/tb_mux_4x1.sv` | 0189d5a65e66acd884be08be2d2848d40eeb333957d2bfbdf1bbd83eb39ffa29 |
| `LAB1/06_mux/constraints/mux_4x1.xdc` | 0cfe63d2243e7d33b343ebe9c5a1d22b4785c8b3926ea0881567850825d67621 |
| `LAB1/06_mux/simulation.json` | de172ad2e00846ce7fe4eb652ef56828e20adaeb933be09850c16f5d5ac462c1 |

- latest result record: `LAB1/06_mux/build/sim/result.json`; recorded run run-57775dd875df4406ad71c9033c956b9b
- recorded input hashes: simulation.json 및 RTL/TB 모두 현재 hash와 일치; 아래 표
| Input recorded for this run | Recorded SHA-256 | Current match |
| --- | --- | --- |
| simulation.json | de172ad2e00846ce7fe4eb652ef56828e20adaeb933be09850c16f5d5ac462c1 | true |
| src/mux_4x1.v | 74932cbf7f94c1209533657d639e4849762c6ea3f78005567b0e908fcfd18d32 | true |
| sim/tb_mux_4x1.sv | 0189d5a65e66acd884be08be2d2848d40eeb333957d2bfbdf1bbd83eb39ffa29 | true |
- recorded wave_sha256: 9fe41cc38393fbb44be7c147ab823856f49e73e169c812ae089c268ba54e9410; actual `LAB1/06_mux/build/sim/run-57775dd875df4406ad71c9033c956b9b/wave.vcd` 및 build/sim/wave.vcd와 일치
- this result run is preserved recovery: true
- RUN_TO_COMMIT: UNKNOWN. hash 일치는 기록에 지정된 해당 run의 file-content 연결이며 commit 실행 증명은 아니다.

#### C. Historical VS Code/Icarus simulation

- simulator: Icarus Verilog; 보존 environment/iverilog.log는 12.0 devel, environment/vvp.log는 Icarus runtime 기록. 개별 run binary version의 독립 snapshot은 UNKNOWN
- environment evidence: `evidence/vscode/LAB1/environment/iverilog.log`, `evidence/vscode/LAB1/environment/vvp.log`
- current TB input enumeration: {i,s}=n; n=0..63; 10 ns/case (코드 계산, AUTO_DERIVED)

- run ID: run-48e62e48ea2b4365ad925d30a2b3fad9; category intentional_failure; HISTORICAL_RUN
- PASS/FAIL: FAIL; cases checked reported: UNKNOWN; end/failure time: 50 ns (VCD 시각, 로그 시간 단위와 확인)
- simulation.log: `evidence/vscode/LAB1/06_mux/intentional_failure__run-48e62e48ea2b4365ad925d30a2b3fad9/simulation.log`; SHA-256 8e08548558196bb75f5081a962c0c58b32ff2030a581df71ed073e3347106314
- compile.log: `evidence/vscode/LAB1/06_mux/intentional_failure__run-48e62e48ea2b4365ad925d30a2b3fad9/compile.log`; SHA-256 c9bfbefa8e8ea338d8849b1eaec3b8cf9ac5d2d64e03191e6ec8ba2b4ab93dd8
- VCD: `evidence/vscode/LAB1/06_mux/intentional_failure__run-48e62e48ea2b4365ad925d30a2b3fad9/wave.vcd`; SHA-256 27fe76b3c1a919e620252360e3f39aa3d2044b235fecef8acbb5f4d0e5d131e6
- actual first failure log: FAIL mux_4x1 vector=4 expected=0 actual=1 (로그 raw hex 표기를 유지; 완료된 checked cases를 추정하지 않음)
- input hash for this preserved run: UNKNOWN; 다른 run의 result input hash를 전용하지 않음

- run ID: run-36f7a5d8e67244aab57bbea64d2a5076; category normal; HISTORICAL_RUN
- PASS/FAIL: PASS; cases checked reported: 64; end/failure time: 640 ns (VCD 시각, 로그 시간 단위와 확인)
- simulation.log: `evidence/vscode/LAB1/06_mux/normal__run-36f7a5d8e67244aab57bbea64d2a5076/simulation.log`; SHA-256 006bb959c632e3a678c7c4b5b078c9b28b9a9a3421ea3ad1e3ceb09dc2ac7981
- compile.log: `evidence/vscode/LAB1/06_mux/normal__run-36f7a5d8e67244aab57bbea64d2a5076/compile.log`; SHA-256 c9bfbefa8e8ea338d8849b1eaec3b8cf9ac5d2d64e03191e6ec8ba2b4ab93dd8
- VCD: `evidence/vscode/LAB1/06_mux/normal__run-36f7a5d8e67244aab57bbea64d2a5076/wave.vcd`; SHA-256 8e4a1afb6cad4734c2ed680339e3f332179116bbfadbf2974299a0082e10b042
- input hash for this preserved run: UNKNOWN; 다른 run의 result input hash를 전용하지 않음

- run ID: run-57775dd875df4406ad71c9033c956b9b; category recovery; HISTORICAL_RUN
- PASS/FAIL: PASS; cases checked reported: 64; end/failure time: 640 ns (VCD 시각, 로그 시간 단위와 확인)
- simulation.log: `evidence/vscode/LAB1/06_mux/recovery__run-57775dd875df4406ad71c9033c956b9b/simulation.log`; SHA-256 006bb959c632e3a678c7c4b5b078c9b28b9a9a3421ea3ad1e3ceb09dc2ac7981
- compile.log: `evidence/vscode/LAB1/06_mux/recovery__run-57775dd875df4406ad71c9033c956b9b/compile.log`; SHA-256 c9bfbefa8e8ea338d8849b1eaec3b8cf9ac5d2d64e03191e6ec8ba2b4ab93dd8
- VCD: `evidence/vscode/LAB1/06_mux/recovery__run-57775dd875df4406ad71c9033c956b9b/wave.vcd`; SHA-256 9fe41cc38393fbb44be7c147ab823856f49e73e169c812ae089c268ba54e9410
- input hash for this preserved run: 위 result.json에 기록된 RTL/TB/config hash; VCD hash도 일치

Local build/sim historical logs (새 실행 아님):

| Local log | Observed result lines |
| --- | --- |
| `LAB1/06_mux/build/sim/run-36f7a5d8e67244aab57bbea64d2a5076/simulation.log` | VCD info: dumpfile wave.vcd opened for output. / LAB1_PASS mux_4x1 cases=64 / C:\Users\yunji\ece2\ece2_2026\LAB1\06_mux\sim\tb_mux_4x1.sv:37: $finish called at 640000 (1ps) |
| `LAB1/06_mux/build/sim/run-48e62e48ea2b4365ad925d30a2b3fad9/simulation.log` | VCD info: dumpfile wave.vcd opened for output. / FATAL: C:\Users\yunji\ece2\ece2_2026\LAB1\06_mux\sim\tb_mux_4x1.sv:26: FAIL mux_4x1 vector=4 expected=0 actual=1 /        Time: 50000  Scope: tb_mux_4x1 |
| `LAB1/06_mux/build/sim/run-57775dd875df4406ad71c9033c956b9b/simulation.log` | VCD info: dumpfile wave.vcd opened for output. / LAB1_PASS mux_4x1 cases=64 / C:\Users\yunji\ece2\ece2_2026\LAB1\06_mux\sim\tb_mux_4x1.sv:37: $finish called at 640000 (1ps) |

#### D. Historical Vivado simulation / GUI

- final stable waveform evidence: `evidence/vivado/LAB1/06_mux/LAB1_06_mux_vivado_waveform.png`
- stable representative condition / expected: 60~80 ns: i=4'b0001, s=2'b10→2'b11; z=1'b0→1'b1
- observed result: 캡처의 stable signal label/value 및 출력 패턴이 위 계산한 expected와 일치하는 구간이 보임. 범위가 현재 TB에서 도출된 03/05는 정확한 sample time을 학생이 확인해야 함
- Vivado version: Vivado Simulator v2026.1; project/product 및 로컬 report도 2026.1
- executed design/simulation top: mux_4x1 / tb_mux_4x1
- simulation FPGA part/XDC: xc7s75fgga484-1 / LAB1/06_mux/constraints/mux_4x1.xdc
- simulation log: `LAB1/06_mux/mux.sim/sim_1/behav/xsim/simulate.log`
- actual PASS/cases/end time: PASS / 64 / 640 ns (simulate.log 직접 판독)
- simulation run ID: UNKNOWN (XSim 로컬 stage 경로만 확인; UUID 임의 생성 금지)
- Vivado VCD: `LAB1/06_mux/mux.sim/sim_1/behav/xsim/wave.vcd`; SHA-256 66e3ced5149fdeb033ed4b0ba8930f7c6553641b1812d3c25b117b2e9e371d9e
- VCD last timestamp: 640 ns; 실제 종료는 640 ns. 마지막 event를 종료 시간으로 대체하지 않음
- compiled source registration: `LAB1/06_mux/mux.sim/sim_1/behav/xsim/tb_mux_4x1_vlog.prj`; 현재 RTL/TB의 ../../../../src,sim 경로 참조. compiled input source SHA-256 및 run-to-commit은 UNKNOWN

#### E. VS Code ↔ Vivado comparison

- DUT/output signal set: mux_4x1 / i, s, z
- expected behavior / current TB: 위 실제 source 계산 및 enumeration 참조
- comparison: FUNCTIONALLY_CONSISTENT; 정상 및 복구 각각 64 case의 n*10+5 ns 안정 sample에서 입력/출력 불일치 0
- input sequence/output/cases/end: VCD 안정 sample 입력·출력 일치, PASS logs 64 cases 및 640 ns 종료 일치; exact compiled source bytes는 UNKNOWN
- exact VCD SHA-256 equality: false (정상 및 복구 각각); byte equality와 기능 일치를 구분

#### F. Build / DRC / timing / bitstream

- historical synthesis: 성공; `LAB1/06_mux/mux.runs/synth_1/runme.log`의 synth_design completed successfully
- historical implementation: 성공; `LAB1/06_mux/mux.runs/impl_1/runme.log`의 route_design completed successfully
- historical write_bitstream: 성공; 같은 impl runme.log의 write_bitstream completed successfully
- actual bitstream: `LAB1/06_mux/mux.runs/impl_1/mux_4x1.bit`; SHA-256 e6c9a465b56e5f092b74fdae484389d540d6da6771ca64ef8af9d2fce0cff0b9; size 3687010 bytes
- DRC report: `LAB1/06_mux/mux.runs/impl_1/mux_4x1_drc_routed.rpt`; SHA-256 8638855f02a5269e746f5b8b4e322691ec01450ec1235f455b2adbbdc0b5f26d
- DRC design/device/state: mux_4x1 / xc7s75fgga484-1 / Fully Routed (report header)
- default routed DRC: errors=0; warnings=1; rule=CFGBVS-1. CFGBVS 및 CONFIG_VOLTAGE 미설정으로 configuration bank voltage 검증 정보가 부족하다는 경고. 경고를 숨기거나 clean DRC PASS라고 쓰지 않음
- timing report: `LAB1/06_mux/mux.runs/impl_1/mux_4x1_timing_summary_routed.rpt`; SHA-256 329b62a7bb1ec010081041913f9639e6dffebb9ebbe78bfdee7913ba541e9f7d
- user timing constraints: 없음; clock summary: 비어 있음; current XDC에도 create_clock/input-output delay 없음
- WNS=inf ns, TNS=0.000 ns, WHS=inf ns, THS=0.000 ns; pulse-width=NA
- timing interpretation: NO_USER_TIMING_CONSTRAINT / NOT_APPLICABLE_TO_SETUP_HOLD_AS_REPORTED; timing verification PASS 아님
- source→historical bitstream/hash→programmed device direct link: UNKNOWN

### 07_demux

- 담당자: 팀원 (사용자 확인); 성명: UNKNOWN
- 수행 환경: UNKNOWN (현재 저장 위치와 과거 생성 PC를 동일시하지 않음)
- source / vscode_sim provenance: LOCAL_VERIFIED (현재 파일 및 보존 로그/VCD)
- vivado_sim provenance: LOCAL_VERIFIED (최종 waveform 이미지에 한정; version/part/전체 cases/end/log/VCD는 UNKNOWN)
- synthesis / implementation / DRC / timing / bitstream 수행: TEAM_CONFIRMED (사용자 확인); 원본 evidence: EVIDENCE_PENDING
- programmed 수행 status: NOT_VERIFIED; 특정 실험/bitstream 연결: UNKNOWN (대표 캡처만으로 수행을 확정하지 않음)
- board provenance: LOCAL_VERIFIED (raw video 존재에 한정; 제출 board 사진 대상 아님)

#### A. Actual RTL structure

- experiment: 07_demux
- design top/module: demux_1x8
- input/output ports: input i (1 bit),s[2:0]; output o[7:0]
- 설계 목적: 1:8 DEMUX의 입출력 변환
- 실제 RTL / 핵심 구문: assign o=i?(8'b10000000>>s):8'b0
- 논리 흐름: i=1이면 MSB one-hot를 s만큼 오른쪽 이동하며 i=0이면 전체 출력이 0이다.
- 구조 효과: selector에 따른 단일 출력 위치 이동과 data 비활성 처리를 분리한다.
- 보고서용 설계 및 핵심 구조 설명: 입력 i가 활성일 때 8'h80을 selector만큼 이동하여 one-hot 출력을 만든다. i가 비활성이면 selector와 관계없이 전체 출력을 0으로 만든다.

#### B. Current source provenance

- label: CURRENT_SOURCE; file/content provenance TOOL_VERIFIED
- current Git commit: 246d6b621ce5b7a30d8a71a98c3e03693e69c9de
- working tree source/TB/XDC/simulation.json: UNCHANGED_TRACKED (읽기 전용 Git status 확인)
- FPGA part: UNKNOWN (해당 실험 로컬 project 설정 없음)
- project: UNKNOWN
- current simulation top: tb_demux_1x8
- simulation.json: `LAB1/07_demux/simulation.json`

| Current file | SHA-256 |
| --- | --- |
| `LAB1/07_demux/src/demux_1x8.v` | 3fb4ca4198f0073214e4e1bb61414e58a897678ae337c69b8c0713ac20dbf537 |
| `LAB1/07_demux/sim/tb_demux_1x8.sv` | 9fcf724c7629ae9f1122b362fb16a17c802798b5b27ad1d97eccac700fb525d9 |
| `LAB1/07_demux/constraints/demux_1x8.xdc` | d7356f4c11a223c6d75bc8cf91b012e36445273d7e6fc9380c2b15bfecf6903f |
| `LAB1/07_demux/simulation.json` | 53acc6b298a90a962992c173858011e5dfbc17b27ef10b341fc77e545d59778a |

- latest result record: `LAB1/07_demux/build/sim/result.json`; recorded run run-8d10b461d9ec4762ba051885e020afaf
- recorded input hashes: simulation.json 및 RTL/TB 모두 현재 hash와 일치; 아래 표
| Input recorded for this run | Recorded SHA-256 | Current match |
| --- | --- | --- |
| simulation.json | 53acc6b298a90a962992c173858011e5dfbc17b27ef10b341fc77e545d59778a | true |
| src/demux_1x8.v | 3fb4ca4198f0073214e4e1bb61414e58a897678ae337c69b8c0713ac20dbf537 | true |
| sim/tb_demux_1x8.sv | 9fcf724c7629ae9f1122b362fb16a17c802798b5b27ad1d97eccac700fb525d9 | true |
- recorded wave_sha256: f08ae5138bf7fe19f142e585cffbe70dbf97ec228bbd8c5de97c075bc1aeb870; actual `LAB1/07_demux/build/sim/run-8d10b461d9ec4762ba051885e020afaf/wave.vcd` 및 build/sim/wave.vcd와 일치
- this result run is preserved recovery: true
- RUN_TO_COMMIT: UNKNOWN. hash 일치는 기록에 지정된 해당 run의 file-content 연결이며 commit 실행 증명은 아니다.

#### C. Historical VS Code/Icarus simulation

- simulator: Icarus Verilog; 보존 environment/iverilog.log는 12.0 devel, environment/vvp.log는 Icarus runtime 기록. 개별 run binary version의 독립 snapshot은 UNKNOWN
- environment evidence: `evidence/vscode/LAB1/environment/iverilog.log`, `evidence/vscode/LAB1/environment/vvp.log`
- current TB input enumeration: {i,s}=n; n=0..15; 10 ns/case (코드 계산, AUTO_DERIVED)

- run ID: run-db0d2d9924cb4fe0aa36fcbc7a454e35; category intentional_failure; HISTORICAL_RUN
- PASS/FAIL: FAIL; cases checked reported: UNKNOWN; end/failure time: 100 ns (VCD 시각, 로그 시간 단위와 확인)
- simulation.log: `evidence/vscode/LAB1/07_demux/intentional_failure__run-db0d2d9924cb4fe0aa36fcbc7a454e35/simulation.log`; SHA-256 3bd6052b26855e13431307244a184605b6512d58c4b9b40ad39fe11a2e20f58e
- compile.log: `evidence/vscode/LAB1/07_demux/intentional_failure__run-db0d2d9924cb4fe0aa36fcbc7a454e35/compile.log`; SHA-256 8282ea25b1989968563a0d346e05d8f8867cfd218e4f33bcd97d5643554b61b2
- VCD: `evidence/vscode/LAB1/07_demux/intentional_failure__run-db0d2d9924cb4fe0aa36fcbc7a454e35/wave.vcd`; SHA-256 82c9a5b85c06e1c57c1cdab1e7a196265d4c19893ee17f7bab53ae5bee051562
- actual first failure log: FAIL demux_1x8 vector=9 expected=40 actual=00 (로그 raw hex 표기를 유지; 완료된 checked cases를 추정하지 않음)
- input hash for this preserved run: UNKNOWN; 다른 run의 result input hash를 전용하지 않음

- run ID: run-bfb14fddf74e45cc96657c160ae52673; category normal; HISTORICAL_RUN
- PASS/FAIL: PASS; cases checked reported: 16; end/failure time: 160 ns (VCD 시각, 로그 시간 단위와 확인)
- simulation.log: `evidence/vscode/LAB1/07_demux/normal__run-bfb14fddf74e45cc96657c160ae52673/simulation.log`; SHA-256 b49720036a41e4f403f972b81b47a9bc30e6923e80f5fb59e1f2a721b51333b9
- compile.log: `evidence/vscode/LAB1/07_demux/normal__run-bfb14fddf74e45cc96657c160ae52673/compile.log`; SHA-256 8282ea25b1989968563a0d346e05d8f8867cfd218e4f33bcd97d5643554b61b2
- VCD: `evidence/vscode/LAB1/07_demux/normal__run-bfb14fddf74e45cc96657c160ae52673/wave.vcd`; SHA-256 50c9a9ecdacdebb041dca134c53505aa9e4e2f22b13e82d9577a0f2208ebbc90
- input hash for this preserved run: UNKNOWN; 다른 run의 result input hash를 전용하지 않음

- run ID: run-8d10b461d9ec4762ba051885e020afaf; category recovery; HISTORICAL_RUN
- PASS/FAIL: PASS; cases checked reported: 16; end/failure time: 160 ns (VCD 시각, 로그 시간 단위와 확인)
- simulation.log: `evidence/vscode/LAB1/07_demux/recovery__run-8d10b461d9ec4762ba051885e020afaf/simulation.log`; SHA-256 b49720036a41e4f403f972b81b47a9bc30e6923e80f5fb59e1f2a721b51333b9
- compile.log: `evidence/vscode/LAB1/07_demux/recovery__run-8d10b461d9ec4762ba051885e020afaf/compile.log`; SHA-256 8282ea25b1989968563a0d346e05d8f8867cfd218e4f33bcd97d5643554b61b2
- VCD: `evidence/vscode/LAB1/07_demux/recovery__run-8d10b461d9ec4762ba051885e020afaf/wave.vcd`; SHA-256 f08ae5138bf7fe19f142e585cffbe70dbf97ec228bbd8c5de97c075bc1aeb870
- input hash for this preserved run: 위 result.json에 기록된 RTL/TB/config hash; VCD hash도 일치

Local build/sim historical logs (새 실행 아님):

| Local log | Observed result lines |
| --- | --- |
| `LAB1/07_demux/build/sim/run-8d10b461d9ec4762ba051885e020afaf/simulation.log` | LAB1_PASS demux_1x8 cases=16 / C:\Users\yunji\ece2\ece2_2026\LAB1\07_demux\sim\tb_demux_1x8.sv:37: $finish called at 160000 (1ps) |
| `LAB1/07_demux/build/sim/run-bfb14fddf74e45cc96657c160ae52673/simulation.log` | LAB1_PASS demux_1x8 cases=16 / C:\Users\yunji\ece2\ece2_2026\LAB1\07_demux\sim\tb_demux_1x8.sv:37: $finish called at 160000 (1ps) |
| `LAB1/07_demux/build/sim/run-db0d2d9924cb4fe0aa36fcbc7a454e35/simulation.log` | FATAL: C:\Users\yunji\ece2\ece2_2026\LAB1\07_demux\sim\tb_demux_1x8.sv:26: FAIL demux_1x8 vector=9 expected=40 actual=00 |

#### D. Historical Vivado simulation / GUI

- final stable waveform evidence: `evidence/vivado/LAB1/07_demux/LAB1_07_demux_vivado_waveform.jpg`
- stable representative condition / expected: 80~100 ns: i=1'b1,s=3'b000→3'b001; o=8'h80→8'h40
- observed result: 캡처의 stable signal label/value 및 출력 패턴이 위 계산한 expected와 일치하는 구간이 보임. 범위가 현재 TB에서 도출된 03/05는 정확한 sample time을 학생이 확인해야 함
- Vivado version: UNKNOWN (해당 실험 screenshot에서 version 미확인)
- executed design/simulation top: UNKNOWN; 위 current source/TB top과 실제 실행 설정 직접 연결 미확인
- simulation FPGA part/XDC: UNKNOWN (실제 실행 project 미확보); current XDC는 위 source 표 참조
- simulation log: UNKNOWN
- actual Vivado PASS/cases/end time: UNKNOWN; screenshot 시간 축과 현재 TB 총시간을 완료 로그로 대체하지 않음
- Vivado VCD path/hash: UNKNOWN

#### E. VS Code ↔ Vivado comparison

- DUT/output signal set: demux_1x8 / input i (1 bit),s[2:0]; output o[7:0]
- expected behavior / current TB: 위 실제 source 계산 및 enumeration 참조
- comparison: NOT_DIRECTLY_COMPARABLE; screenshot 안정 구간의 기능 해석은 현재 RTL 및 VS Code 결과와 양립하지만 전체 Vivado 입력 sequence, checked cases, end time을 정량 비교할 자료 없음
- exact VCD equality: UNKNOWN

#### F. Build / DRC / timing / bitstream

- synthesis/implementation/write_bitstream 수행: TEAM_CONFIRMED; 원본 log/산출물 확인: EVIDENCE_PENDING
- bitstream 수행: TEAM_CONFIRMED; evidence: EVIDENCE_PENDING; actual path/hash: UNKNOWN
- DRC 수행: TEAM_CONFIRMED; 원본 report: EVIDENCE_PENDING; counts/design state/rule: UNKNOWN
- timing 수행: TEAM_CONFIRMED; 원본 report: EVIDENCE_PENDING; constraints/clock/metrics: UNKNOWN; timing PASS를 추정하지 않음
- artifact absence is not a claim that the student never performed the stage

### 08_encoder

- 담당자: UNKNOWN
- 수행 환경: UNKNOWN (현재 저장 위치와 과거 생성 PC를 동일시하지 않음)
- source / vscode_sim provenance: LOCAL_VERIFIED (현재 파일 및 보존 로그/VCD)
- vivado_sim provenance: LOCAL_VERIFIED (기존 project/log/VCD 및 waveform)
- synthesis / implementation / DRC / timing / bitstream provenance: LOCAL_VERIFIED; 기존 성공 로그·report·bitstream에 한정, 과거 source commit 연결은 UNKNOWN
- programmed 수행 status: NOT_VERIFIED; 특정 실험/bitstream 연결: UNKNOWN (대표 캡처만으로 수행을 확정하지 않음)
- board provenance: LOCAL_VERIFIED (raw video 존재에 한정; 제출 board 사진 대상 아님)

#### A. Actual RTL structure

- experiment: 08_encoder
- design top/module: encoder8x3
- input/output ports: input i[7:0]; output reg a[2:0]
- 설계 목적: 8:3 인코더의 입출력 변환
- 실제 RTL / 핵심 구문: always @*의 case: 80/40/20/10/08/04/02/01 -> a=0/1/2/3/4/5/6/7; default a=0
- 논리 흐름: 정확한 one-hot 상수 일치에만 code를 부여하며 zero/multi-hot는 default로 간다.
- 구조 효과: one-hot 입력 영역을 명시하고 무효 입력 동작을 정의한다. priority 선택 구조가 아니다.
- 보고서용 설계 및 핵심 구조 설명: one-hot 입력 위치를 case 문으로 3비트 코드에 대응시킨다. 일치하지 않는 zero 또는 multi-hot 입력은 3'b000으로 처리하므로 priority encoder로 해석하지 않는다.

#### B. Current source provenance

- label: CURRENT_SOURCE; file/content provenance TOOL_VERIFIED
- current Git commit: 246d6b621ce5b7a30d8a71a98c3e03693e69c9de
- working tree source/TB/XDC/simulation.json: UNCHANGED_TRACKED (읽기 전용 Git status 확인)
- FPGA part: xc7s75fgga484-1
- project: `LAB1/08_encoder/08_encoder.xpr`
- current simulation top: tb_encoder8x3
- simulation.json: `LAB1/08_encoder/simulation.json`
- project design/simulation tops: encoder8x3 / tb_encoder8x3
- project RTL/TB/XDC registrations: $PPRDIR/src/encoder8x3.v, $PPRDIR/constraints/encoder8x3.xdc, $PPRDIR/sim/tb_encoder8x3.sv; 현재 src/sim/constraints 상대 경로를 참조하며 과거 compiled source hash는 UNKNOWN

| Current file | SHA-256 |
| --- | --- |
| `LAB1/08_encoder/src/encoder8x3.v` | 5422ebc5449e77085635b4a5d00fd1f0f6685f9b83276c702ea9eec099fe57b0 |
| `LAB1/08_encoder/sim/tb_encoder8x3.sv` | 3c092b5f627b6ad17600d13054dfca474cf2e817bd2939a8ed100cd90c70e859 |
| `LAB1/08_encoder/constraints/encoder8x3.xdc` | f3b056e8d9c9027857dc4275ac39264d59a92456411ba2a83a3494fe5d953ae6 |
| `LAB1/08_encoder/simulation.json` | d4cddbb0060258d3ae19ff5bd411b3496e464efa60b726aefef05f40e8c5b0b6 |

- latest result record: `LAB1/08_encoder/build/sim/result.json`; recorded run run-aec4953651124a6990cecdc3b1c2c0ea
- recorded input hashes: simulation.json 및 RTL/TB 모두 현재 hash와 일치; 아래 표
| Input recorded for this run | Recorded SHA-256 | Current match |
| --- | --- | --- |
| simulation.json | d4cddbb0060258d3ae19ff5bd411b3496e464efa60b726aefef05f40e8c5b0b6 | true |
| src/encoder8x3.v | 5422ebc5449e77085635b4a5d00fd1f0f6685f9b83276c702ea9eec099fe57b0 | true |
| sim/tb_encoder8x3.sv | 3c092b5f627b6ad17600d13054dfca474cf2e817bd2939a8ed100cd90c70e859 | true |
- recorded wave_sha256: e3697a61203b4dd07633d93ac50941defa751a584a68265f56f68138cd53e87e; actual `LAB1/08_encoder/build/sim/run-aec4953651124a6990cecdc3b1c2c0ea/wave.vcd` 및 build/sim/wave.vcd와 일치
- this result run is preserved recovery: true
- RUN_TO_COMMIT: UNKNOWN. hash 일치는 기록에 지정된 해당 run의 file-content 연결이며 commit 실행 증명은 아니다.

#### C. Historical VS Code/Icarus simulation

- simulator: Icarus Verilog; 보존 environment/iverilog.log는 12.0 devel, environment/vvp.log는 Icarus runtime 기록. 개별 run binary version의 독립 snapshot은 UNKNOWN
- environment evidence: `evidence/vscode/LAB1/environment/iverilog.log`, `evidence/vscode/LAB1/environment/vvp.log`
- current TB input enumeration: i=n; n=0..255; one-hot 8개만 code mapping, 나머지 default; 10 ns/case (코드 계산, AUTO_DERIVED)

- run ID: run-86de81e9d439420494915ca07b464d53; category intentional_failure; HISTORICAL_RUN
- PASS/FAIL: FAIL; cases checked reported: UNKNOWN; end/failure time: 20 ns (VCD 시각, 로그 시간 단위와 확인)
- simulation.log: `evidence/vscode/LAB1/08_encoder/intentional_failure__run-86de81e9d439420494915ca07b464d53/simulation.log`; SHA-256 a3defb3819b4c89b1d39a3086c80b82dee2ae13bfeedc7fa7ba9cce3589cdb42
- compile.log: `evidence/vscode/LAB1/08_encoder/intentional_failure__run-86de81e9d439420494915ca07b464d53/compile.log`; SHA-256 6b377431e787c81d195296991f14287cb9e3f5012e9bbcad5db72fe0994acced
- VCD: `evidence/vscode/LAB1/08_encoder/intentional_failure__run-86de81e9d439420494915ca07b464d53/wave.vcd`; SHA-256 8244c48eaf01ae576253987670f9dce9a40421855c1a3a66c168e6d3c1d775c1
- actual first failure log: FAIL encoder8x3 vector=1 expected=7 actual=6 (로그 raw hex 표기를 유지; 완료된 checked cases를 추정하지 않음)
- input hash for this preserved run: UNKNOWN; 다른 run의 result input hash를 전용하지 않음

- run ID: run-c192938f32594b7bb22427b71cf14ef1; category normal; HISTORICAL_RUN
- PASS/FAIL: PASS; cases checked reported: 256; end/failure time: 2560 ns (VCD 시각, 로그 시간 단위와 확인)
- simulation.log: `evidence/vscode/LAB1/08_encoder/normal__run-c192938f32594b7bb22427b71cf14ef1/simulation.log`; SHA-256 1bb4da6322171d2b0181088fa49b0ee9d5f0062be6637a57c65de7dfa68c1f5a
- compile.log: `evidence/vscode/LAB1/08_encoder/normal__run-c192938f32594b7bb22427b71cf14ef1/compile.log`; SHA-256 6b377431e787c81d195296991f14287cb9e3f5012e9bbcad5db72fe0994acced
- VCD: `evidence/vscode/LAB1/08_encoder/normal__run-c192938f32594b7bb22427b71cf14ef1/wave.vcd`; SHA-256 5093442dc395af65303f62e683a4a6df8715bfcc48652d6ff6d24275a59059c4
- input hash for this preserved run: UNKNOWN; 다른 run의 result input hash를 전용하지 않음

- run ID: run-aec4953651124a6990cecdc3b1c2c0ea; category recovery; HISTORICAL_RUN
- PASS/FAIL: PASS; cases checked reported: 256; end/failure time: 2560 ns (VCD 시각, 로그 시간 단위와 확인)
- simulation.log: `evidence/vscode/LAB1/08_encoder/recovery__run-aec4953651124a6990cecdc3b1c2c0ea/simulation.log`; SHA-256 1bb4da6322171d2b0181088fa49b0ee9d5f0062be6637a57c65de7dfa68c1f5a
- compile.log: `evidence/vscode/LAB1/08_encoder/recovery__run-aec4953651124a6990cecdc3b1c2c0ea/compile.log`; SHA-256 6b377431e787c81d195296991f14287cb9e3f5012e9bbcad5db72fe0994acced
- VCD: `evidence/vscode/LAB1/08_encoder/recovery__run-aec4953651124a6990cecdc3b1c2c0ea/wave.vcd`; SHA-256 e3697a61203b4dd07633d93ac50941defa751a584a68265f56f68138cd53e87e
- input hash for this preserved run: 위 result.json에 기록된 RTL/TB/config hash; VCD hash도 일치

Local build/sim historical logs (새 실행 아님):

| Local log | Observed result lines |
| --- | --- |
| `LAB1/08_encoder/build/sim/run-86de81e9d439420494915ca07b464d53/simulation.log` | FATAL: C:\Users\yunji\ece2\ece2_2026\LAB1\08_encoder\sim\tb_encoder8x3.sv:29: FAIL encoder8x3 vector=1 expected=7 actual=6 |
| `LAB1/08_encoder/build/sim/run-aec4953651124a6990cecdc3b1c2c0ea/simulation.log` | LAB1_PASS encoder8x3 cases=256 / C:\Users\yunji\ece2\ece2_2026\LAB1\08_encoder\sim\tb_encoder8x3.sv:40: $finish called at 2560 (1ns) |
| `LAB1/08_encoder/build/sim/run-c192938f32594b7bb22427b71cf14ef1/simulation.log` | LAB1_PASS encoder8x3 cases=256 / C:\Users\yunji\ece2\ece2_2026\LAB1\08_encoder\sim\tb_encoder8x3.sv:40: $finish called at 2560 (1ns) |

#### D. Historical Vivado simulation / GUI

- final stable waveform evidence: `evidence/vivado/LAB1/08_encoder/LAB1_08_encoder_vivado_waveform.png`
- stable representative condition / expected: 10~40 ns: i=8'h01→8'h02→8'h03; a=3'b111→3'b110→3'b000
- observed result: 캡처의 stable signal label/value 및 출력 패턴이 위 계산한 expected와 일치하는 구간이 보임. 범위가 현재 TB에서 도출된 03/05는 정확한 sample time을 학생이 확인해야 함
- Vivado version: Vivado Simulator v2026.1; project/product 및 로컬 report도 2026.1
- executed design/simulation top: encoder8x3 / tb_encoder8x3
- simulation FPGA part/XDC: xc7s75fgga484-1 / LAB1/08_encoder/constraints/encoder8x3.xdc
- simulation log: `LAB1/08_encoder/08_encoder.sim/sim_1/behav/xsim/simulate.log`
- actual PASS/cases/end time: PASS / 256 / 2560 ns (simulate.log 직접 판독)
- simulation run ID: UNKNOWN (XSim 로컬 stage 경로만 확인; UUID 임의 생성 금지)
- Vivado VCD: `LAB1/08_encoder/08_encoder.sim/sim_1/behav/xsim/wave.vcd`; SHA-256 489ecb921177957647f1d642f015684945b22ec49432cc40cbf114ade9e62db2
- VCD last timestamp: 2550 ns; 실제 종료는 2560 ns. 마지막 event를 종료 시간으로 대체하지 않음
- compiled source registration: `LAB1/08_encoder/08_encoder.sim/sim_1/behav/xsim/tb_encoder8x3_vlog.prj`; 현재 RTL/TB의 ../../../../src,sim 경로 참조. compiled input source SHA-256 및 run-to-commit은 UNKNOWN

#### E. VS Code ↔ Vivado comparison

- DUT/output signal set: encoder8x3 / i, a
- expected behavior / current TB: 위 실제 source 계산 및 enumeration 참조
- comparison: FUNCTIONALLY_CONSISTENT; 정상 및 복구 각각 256 case의 n*10+5 ns 안정 sample에서 입력/출력 불일치 0
- input sequence/output/cases/end: VCD 안정 sample 입력·출력 일치, PASS logs 256 cases 및 2560 ns 종료 일치; exact compiled source bytes는 UNKNOWN
- exact VCD SHA-256 equality: false (정상 및 복구 각각); byte equality와 기능 일치를 구분

#### F. Build / DRC / timing / bitstream

- historical synthesis: 성공; `LAB1/08_encoder/08_encoder.runs/synth_1/runme.log`의 synth_design completed successfully
- historical implementation: 성공; `LAB1/08_encoder/08_encoder.runs/impl_1/runme.log`의 route_design completed successfully
- historical write_bitstream: 성공; 같은 impl runme.log의 write_bitstream completed successfully
- actual bitstream: `LAB1/08_encoder/08_encoder.runs/impl_1/encoder8x3.bit`; SHA-256 bdbcce72fc2c202045bfd89514d65d0cebc5152199d7dcd763844fa1540946d2; size 3687013 bytes
- DRC report: `LAB1/08_encoder/08_encoder.runs/impl_1/encoder8x3_drc_routed.rpt`; SHA-256 c619138df3b2fef420d915227719fcc22da8b3e806bcaa7af661d6e383c464b0
- DRC design/device/state: encoder8x3 / xc7s75fgga484-1 / Fully Routed (report header)
- default routed DRC: errors=0; warnings=1; rule=CFGBVS-1. CFGBVS 및 CONFIG_VOLTAGE 미설정으로 configuration bank voltage 검증 정보가 부족하다는 경고. 경고를 숨기거나 clean DRC PASS라고 쓰지 않음
- timing report: `LAB1/08_encoder/08_encoder.runs/impl_1/encoder8x3_timing_summary_routed.rpt`; SHA-256 bf80a46dd94c7ba8cc9443a9b4c499c4bf1ba3d4758629ea7fcac07b20762746
- user timing constraints: 없음; clock summary: 비어 있음; current XDC에도 create_clock/input-output delay 없음
- WNS=inf ns, TNS=0.000 ns, WHS=inf ns, THS=0.000 ns; pulse-width=NA
- timing interpretation: NO_USER_TIMING_CONSTRAINT / NOT_APPLICABLE_TO_SETUP_HOLD_AS_REPORTED; timing verification PASS 아님
- source→historical bitstream/hash→programmed device direct link: UNKNOWN

### 09_decoder

- 담당자: UNKNOWN
- 수행 환경: UNKNOWN (현재 저장 위치와 과거 생성 PC를 동일시하지 않음)
- source / vscode_sim provenance: LOCAL_VERIFIED (현재 파일 및 보존 로그/VCD)
- vivado_sim provenance: LOCAL_VERIFIED (기존 project/log/VCD 및 waveform)
- synthesis / implementation / DRC / timing / bitstream provenance: LOCAL_VERIFIED; 기존 성공 로그·report·bitstream에 한정, 과거 source commit 연결은 UNKNOWN
- programmed 수행 status: NOT_VERIFIED; 특정 실험/bitstream 연결: UNKNOWN (대표 캡처만으로 수행을 확정하지 않음)
- board provenance: LOCAL_VERIFIED (raw video 존재에 한정; 제출 board 사진 대상 아님)

#### A. Actual RTL structure

- experiment: 09_decoder
- design top/module: decoder3x8
- input/output ports: input a,b,c (1 bit); output o[7:0]
- 설계 목적: 3:8 디코더의 입출력 변환
- 실제 RTL / 핵심 구문: assign o=8'b00000001<<{a,b,c}
- 논리 흐름: {a,b,c}를 unsigned 3비트 code로 사용하여 LSB one-hot를 왼쪽 이동한다.
- 구조 효과: code와 one-hot 위치를 직접 대응시킨다.
- 보고서용 설계 및 핵심 구조 설명: 세 입력을 {a,b,c} 순서로 묶어 one-hot 출력의 위치를 결정한다. 8'h01을 해당 code만큼 이동하므로 code 3'b000은 o[0], 3'b111은 o[7]을 활성화한다.

#### B. Current source provenance

- label: CURRENT_SOURCE; file/content provenance TOOL_VERIFIED
- current Git commit: 246d6b621ce5b7a30d8a71a98c3e03693e69c9de
- working tree source/TB/XDC/simulation.json: UNCHANGED_TRACKED (읽기 전용 Git status 확인)
- FPGA part: xc7s75fgga484-1
- project: `LAB1/09_decoder/decoder.xpr`
- current simulation top: tb_decoder3x8
- simulation.json: `LAB1/09_decoder/simulation.json`
- project design/simulation tops: decoder3x8 / tb_decoder3x8
- project RTL/TB/XDC registrations: $PPRDIR/src/decoder3x8.v, $PPRDIR/constraints/decoder3x8.xdc, $PPRDIR/sim/tb_decoder3x8.sv; 현재 src/sim/constraints 상대 경로를 참조하며 과거 compiled source hash는 UNKNOWN

| Current file | SHA-256 |
| --- | --- |
| `LAB1/09_decoder/src/decoder3x8.v` | e609ed90370168eb41921bf44e24a7b2c1197e2cf5034940e49d950a6e74d5e2 |
| `LAB1/09_decoder/sim/tb_decoder3x8.sv` | 9846eb7843ac0235661377df4e18d8b3f63616c82dd0f9a362db8db7173ba61a |
| `LAB1/09_decoder/constraints/decoder3x8.xdc` | 569e3250edc42b90ed3800da964df8d33d61c40efff25f32675c12007126a893 |
| `LAB1/09_decoder/simulation.json` | 9222a3e91370f0504f783d021080c755f8730e79f67f989b20acc329ed52a5e6 |

- latest result record: `LAB1/09_decoder/build/sim/result.json`; recorded run run-1d0930251102468e85a52b00b169fdc3
- recorded input hashes: simulation.json 및 RTL/TB 모두 현재 hash와 일치; 아래 표
| Input recorded for this run | Recorded SHA-256 | Current match |
| --- | --- | --- |
| simulation.json | 9222a3e91370f0504f783d021080c755f8730e79f67f989b20acc329ed52a5e6 | true |
| src/decoder3x8.v | e609ed90370168eb41921bf44e24a7b2c1197e2cf5034940e49d950a6e74d5e2 | true |
| sim/tb_decoder3x8.sv | 9846eb7843ac0235661377df4e18d8b3f63616c82dd0f9a362db8db7173ba61a | true |
- recorded wave_sha256: e885945cd9f6954b4e4b4deb0d89dd9063da6fe44e837fad965848a1a68969d9; actual `LAB1/09_decoder/build/sim/run-1d0930251102468e85a52b00b169fdc3/wave.vcd` 및 build/sim/wave.vcd와 일치
- this result run is preserved recovery: true
- RUN_TO_COMMIT: UNKNOWN. hash 일치는 기록에 지정된 해당 run의 file-content 연결이며 commit 실행 증명은 아니다.

#### C. Historical VS Code/Icarus simulation

- simulator: Icarus Verilog; 보존 environment/iverilog.log는 12.0 devel, environment/vvp.log는 Icarus runtime 기록. 개별 run binary version의 독립 snapshot은 UNKNOWN
- environment evidence: `evidence/vscode/LAB1/environment/iverilog.log`, `evidence/vscode/LAB1/environment/vvp.log`
- current TB input enumeration: {a,b,c}=n; n=0..7; 10 ns/case (코드 계산, AUTO_DERIVED)

- run ID: run-c9953810fc18472a80d153b38921d46c; category intentional_failure; HISTORICAL_RUN
- PASS/FAIL: FAIL; cases checked reported: UNKNOWN; end/failure time: 20 ns (VCD 시각, 로그 시간 단위와 확인)
- simulation.log: `evidence/vscode/LAB1/09_decoder/intentional_failure__run-c9953810fc18472a80d153b38921d46c/simulation.log`; SHA-256 5cc968cbe2c40b64f023aa51687484b0623032158d1a5ffe51d5101d45bf2010
- compile.log: `evidence/vscode/LAB1/09_decoder/intentional_failure__run-c9953810fc18472a80d153b38921d46c/compile.log`; SHA-256 4dfc77194afe2e693ad2712b1337dcc52be0af2e22110bb92c4eccc09bb27e08
- VCD: `evidence/vscode/LAB1/09_decoder/intentional_failure__run-c9953810fc18472a80d153b38921d46c/wave.vcd`; SHA-256 06d3d6746f58e05d8130c5c936b5281a4ec5719c18f3eff415971b96f118d46b
- actual first failure log: FAIL decoder3x8 vector=1 expected=02 actual=00 (로그 raw hex 표기를 유지; 완료된 checked cases를 추정하지 않음)
- input hash for this preserved run: UNKNOWN; 다른 run의 result input hash를 전용하지 않음

- run ID: run-d333ae080651492f8390e84e3c792ce2; category normal; HISTORICAL_RUN
- PASS/FAIL: PASS; cases checked reported: 8; end/failure time: 80 ns (VCD 시각, 로그 시간 단위와 확인)
- simulation.log: `evidence/vscode/LAB1/09_decoder/normal__run-d333ae080651492f8390e84e3c792ce2/simulation.log`; SHA-256 628033a091a62407e2c8087c2731ff55f46b679eb44a50107165c4b91c0c35c8
- compile.log: `evidence/vscode/LAB1/09_decoder/normal__run-d333ae080651492f8390e84e3c792ce2/compile.log`; SHA-256 4dfc77194afe2e693ad2712b1337dcc52be0af2e22110bb92c4eccc09bb27e08
- VCD: `evidence/vscode/LAB1/09_decoder/normal__run-d333ae080651492f8390e84e3c792ce2/wave.vcd`; SHA-256 861c4579873f8c4cc8200922678b8501b4fa96b4018d9b23ad19cb60c7d370ad
- input hash for this preserved run: UNKNOWN; 다른 run의 result input hash를 전용하지 않음

- run ID: run-1d0930251102468e85a52b00b169fdc3; category recovery; HISTORICAL_RUN
- PASS/FAIL: PASS; cases checked reported: 8; end/failure time: 80 ns (VCD 시각, 로그 시간 단위와 확인)
- simulation.log: `evidence/vscode/LAB1/09_decoder/recovery__run-1d0930251102468e85a52b00b169fdc3/simulation.log`; SHA-256 628033a091a62407e2c8087c2731ff55f46b679eb44a50107165c4b91c0c35c8
- compile.log: `evidence/vscode/LAB1/09_decoder/recovery__run-1d0930251102468e85a52b00b169fdc3/compile.log`; SHA-256 4dfc77194afe2e693ad2712b1337dcc52be0af2e22110bb92c4eccc09bb27e08
- VCD: `evidence/vscode/LAB1/09_decoder/recovery__run-1d0930251102468e85a52b00b169fdc3/wave.vcd`; SHA-256 e885945cd9f6954b4e4b4deb0d89dd9063da6fe44e837fad965848a1a68969d9
- input hash for this preserved run: 위 result.json에 기록된 RTL/TB/config hash; VCD hash도 일치

Local build/sim historical logs (새 실행 아님):

| Local log | Observed result lines |
| --- | --- |
| `LAB1/09_decoder/build/sim/run-1d0930251102468e85a52b00b169fdc3/simulation.log` | LAB1_PASS decoder3x8 cases=8 / C:\Users\yunji\ece2\ece2_2026\LAB1\09_decoder\sim\tb_decoder3x8.sv:35: $finish called at 80 (1ns) |
| `LAB1/09_decoder/build/sim/run-c9953810fc18472a80d153b38921d46c/simulation.log` | FATAL: C:\Users\yunji\ece2\ece2_2026\LAB1\09_decoder\sim\tb_decoder3x8.sv:24: FAIL decoder3x8 vector=1 expected=02 actual=00 |
| `LAB1/09_decoder/build/sim/run-d333ae080651492f8390e84e3c792ce2/simulation.log` | LAB1_PASS decoder3x8 cases=8 / C:\Users\yunji\ece2\ece2_2026\LAB1\09_decoder\sim\tb_decoder3x8.sv:35: $finish called at 80 (1ns) |

#### D. Historical Vivado simulation / GUI

- final stable waveform evidence: `evidence/vivado/LAB1/09_decoder/LAB1_09_decoder_vivado_waveform.png`
- stable representative condition / expected: 30~50 ns: {a,b,c}=3'b011→3'b100; o=8'h08→8'h10
- observed result: 캡처의 stable signal label/value 및 출력 패턴이 위 계산한 expected와 일치하는 구간이 보임. 범위가 현재 TB에서 도출된 03/05는 정확한 sample time을 학생이 확인해야 함
- Vivado version: Vivado Simulator v2026.1; project/product 및 로컬 report도 2026.1
- executed design/simulation top: decoder3x8 / tb_decoder3x8
- simulation FPGA part/XDC: xc7s75fgga484-1 / LAB1/09_decoder/constraints/decoder3x8.xdc
- simulation log: `LAB1/09_decoder/decoder.sim/sim_1/behav/xsim/simulate.log`
- actual PASS/cases/end time: PASS / 8 / 80 ns (simulate.log 직접 판독)
- simulation run ID: UNKNOWN (XSim 로컬 stage 경로만 확인; UUID 임의 생성 금지)
- Vivado VCD: `LAB1/09_decoder/decoder.sim/sim_1/behav/xsim/wave.vcd`; SHA-256 d7fcf4e5676ffae05ff3524dcf5ad266d8f1f71b0e2c36d5cf0a0bf2898c9c5d
- VCD last timestamp: 70 ns; 실제 종료는 80 ns. 마지막 event를 종료 시간으로 대체하지 않음
- compiled source registration: `LAB1/09_decoder/decoder.sim/sim_1/behav/xsim/tb_decoder3x8_vlog.prj`; 현재 RTL/TB의 ../../../../src,sim 경로 참조. compiled input source SHA-256 및 run-to-commit은 UNKNOWN

#### E. VS Code ↔ Vivado comparison

- DUT/output signal set: decoder3x8 / a, b, c, o
- expected behavior / current TB: 위 실제 source 계산 및 enumeration 참조
- comparison: FUNCTIONALLY_CONSISTENT; 정상 및 복구 각각 8 case의 n*10+5 ns 안정 sample에서 입력/출력 불일치 0
- input sequence/output/cases/end: VCD 안정 sample 입력·출력 일치, PASS logs 8 cases 및 80 ns 종료 일치; exact compiled source bytes는 UNKNOWN
- exact VCD SHA-256 equality: false (정상 및 복구 각각); byte equality와 기능 일치를 구분

#### F. Build / DRC / timing / bitstream

- historical synthesis: 성공; `LAB1/09_decoder/decoder.runs/synth_1/runme.log`의 synth_design completed successfully
- historical implementation: 성공; `LAB1/09_decoder/decoder.runs/impl_1/runme.log`의 route_design completed successfully
- historical write_bitstream: 성공; 같은 impl runme.log의 write_bitstream completed successfully
- actual bitstream: `LAB1/09_decoder/decoder.runs/impl_1/decoder3x8.bit`; SHA-256 dfbc70ecfacf07794e3940f5bd363037280b66cfff76dfb11fb2fd6346923003; size 3687013 bytes
- DRC report: `LAB1/09_decoder/decoder.runs/impl_1/decoder3x8_drc_routed.rpt`; SHA-256 3910dd2d28041645fc1a107e2ca09a71db4ea7f8ca6b0df52b0adaf3c4e39476
- DRC design/device/state: decoder3x8 / xc7s75fgga484-1 / Fully Routed (report header)
- default routed DRC: errors=0; warnings=1; rule=CFGBVS-1. CFGBVS 및 CONFIG_VOLTAGE 미설정으로 configuration bank voltage 검증 정보가 부족하다는 경고. 경고를 숨기거나 clean DRC PASS라고 쓰지 않음
- timing report: `LAB1/09_decoder/decoder.runs/impl_1/decoder3x8_timing_summary_routed.rpt`; SHA-256 52e44a59545c9cb58b29225a747c348149e6f2cacf885a1a37e05db3fd71b741
- user timing constraints: 없음; clock summary: 비어 있음; current XDC에도 create_clock/input-output delay 없음
- WNS=inf ns, TNS=0.000 ns, WHS=inf ns, THS=0.000 ns; pulse-width=NA
- timing interpretation: NO_USER_TIMING_CONSTRAINT / NOT_APPLICABLE_TO_SETUP_HOLD_AS_REPORTED; timing verification PASS 아님
- source→historical bitstream/hash→programmed device direct link: UNKNOWN

### 10_7seg_decoder

- 담당자: UNKNOWN
- 수행 환경: UNKNOWN (현재 저장 위치와 과거 생성 PC를 동일시하지 않음)
- source / vscode_sim provenance: LOCAL_VERIFIED (현재 파일 및 보존 로그/VCD)
- vivado_sim provenance: LOCAL_VERIFIED (기존 project/log/VCD 및 waveform)
- synthesis / implementation / DRC / timing / bitstream provenance: LOCAL_VERIFIED; 기존 성공 로그·report·bitstream에 한정, 과거 source commit 연결은 UNKNOWN
- programmed 수행 status: NOT_VERIFIED; 특정 실험/bitstream 연결: UNKNOWN (대표 캡처만으로 수행을 확정하지 않음)
- board provenance: LOCAL_VERIFIED (선정 실험 최종 사진; 입력/출력 확인 한계는 board 절 참조)

#### A. Actual RTL structure

- experiment: 10_7seg_decoder
- design top/module: seg_decoder
- input/output ports: input bcd[3:0]; output reg seg_data[7:0]
- 설계 목적: 7-segment decoder의 입출력 변환
- 실제 RTL / 핵심 구문: always @*의 0..15 case lookup; default seg_data=0; {a,b,c,d,e,f,g,dp}, active high, dp=0
- 논리 흐름: 4비트 입력으로 segment lookup을 선택하여 8비트 pattern을 출력한다.
- 구조 효과: 각 16진 문자의 segment pattern과 bit order를 명시한다.
- 보고서용 설계 및 핵심 구조 설명: 4비트 입력 0~F에 대응하는 segment pattern을 case 문으로 출력한다. seg_data의 bit 순서는 {a,b,c,d,e,f,g,dp}이며 active high이고, 입력 4'h8과 4'hF의 pattern은 각각 8'hFE와 8'h8E이다.

#### B. Current source provenance

- label: CURRENT_SOURCE; file/content provenance TOOL_VERIFIED
- current Git commit: 246d6b621ce5b7a30d8a71a98c3e03693e69c9de
- working tree source/TB/XDC/simulation.json: UNCHANGED_TRACKED (읽기 전용 Git status 확인)
- FPGA part: xc7s75fgga484-1
- project: `LAB1/10_7seg_decoder/10_7seg_decoder.xpr`
- current simulation top: tb_seg_decoder
- simulation.json: `LAB1/10_7seg_decoder/simulation.json`
- project design/simulation tops: seg_decoder / tb_seg_decoder
- project RTL/TB/XDC registrations: $PPRDIR/src/seg_decoder.v, $PPRDIR/constraints/seg_decoder.xdc, $PPRDIR/sim/tb_seg_decoder.sv; 현재 src/sim/constraints 상대 경로를 참조하며 과거 compiled source hash는 UNKNOWN

| Current file | SHA-256 |
| --- | --- |
| `LAB1/10_7seg_decoder/src/seg_decoder.v` | 5686cf729eee0f50c3a111e18dda90cd47f058d02739c2f82fd694c5ac0bcd93 |
| `LAB1/10_7seg_decoder/sim/tb_seg_decoder.sv` | bd2c10391c383c7f22173a7194343a3a07ed7f7f604f79f8fcd6986efc657a45 |
| `LAB1/10_7seg_decoder/constraints/seg_decoder.xdc` | 617ccaf85ebf956c696cf9714419ef08bc5f06934e52d458e15280a94fd6dbd1 |
| `LAB1/10_7seg_decoder/simulation.json` | 9732f367903c9d95f76904adc070ea0d7f11d5824c271420a8d407d4a2237243 |

- latest result record: `LAB1/10_7seg_decoder/build/sim/result.json`; recorded run run-27f60921a06746d883783c9f379e8c76
- recorded input hashes: simulation.json 및 RTL/TB 모두 현재 hash와 일치; 아래 표
| Input recorded for this run | Recorded SHA-256 | Current match |
| --- | --- | --- |
| simulation.json | 9732f367903c9d95f76904adc070ea0d7f11d5824c271420a8d407d4a2237243 | true |
| src/seg_decoder.v | 5686cf729eee0f50c3a111e18dda90cd47f058d02739c2f82fd694c5ac0bcd93 | true |
| sim/tb_seg_decoder.sv | bd2c10391c383c7f22173a7194343a3a07ed7f7f604f79f8fcd6986efc657a45 | true |
- recorded wave_sha256: 27ff0c7771fcd315f1416a71b3c4079ed9f6f733db245870be2edf514cd0d0d4; actual `LAB1/10_7seg_decoder/build/sim/run-27f60921a06746d883783c9f379e8c76/wave.vcd` 및 build/sim/wave.vcd와 일치
- this result run is preserved recovery: true
- RUN_TO_COMMIT: UNKNOWN. hash 일치는 기록에 지정된 해당 run의 file-content 연결이며 commit 실행 증명은 아니다.

#### C. Historical VS Code/Icarus simulation

- simulator: Icarus Verilog; 보존 environment/iverilog.log는 12.0 devel, environment/vvp.log는 Icarus runtime 기록. 개별 run binary version의 독립 snapshot은 UNKNOWN
- environment evidence: `evidence/vscode/LAB1/environment/iverilog.log`, `evidence/vscode/LAB1/environment/vvp.log`
- current TB input enumeration: bcd=n; n=0..15; digits lookup으로 expected 계산; 10 ns/case (코드 계산, AUTO_DERIVED)

- run ID: run-aa683425c13e4c53be1af160ed5187f3; category intentional_failure; HISTORICAL_RUN
- PASS/FAIL: FAIL; cases checked reported: UNKNOWN; end/failure time: 10 ns (VCD 시각, 로그 시간 단위와 확인)
- simulation.log: `evidence/vscode/LAB1/10_7seg_decoder/intentional_failure__run-aa683425c13e4c53be1af160ed5187f3/simulation.log`; SHA-256 db96c0ddf76e3fac3a0ca8a8e3df5d48ebc7b3d751fbbeee6abf28c78229f735
- compile.log: `evidence/vscode/LAB1/10_7seg_decoder/intentional_failure__run-aa683425c13e4c53be1af160ed5187f3/compile.log`; SHA-256 cec11eeafb24c9387d24011f944a11f4a307847b1b8fa5d6a8602c5badf41261
- VCD: `evidence/vscode/LAB1/10_7seg_decoder/intentional_failure__run-aa683425c13e4c53be1af160ed5187f3/wave.vcd`; SHA-256 ecd7573ec6243889911fcb0aaabac7b622bf87fe1bbf172f907aaac91eb23563
- actual first failure log: FAIL seg_decoder vector=0 expected=fc actual=60 (로그 raw hex 표기를 유지; 완료된 checked cases를 추정하지 않음)
- input hash for this preserved run: UNKNOWN; 다른 run의 result input hash를 전용하지 않음

- run ID: run-68a357e7a424458aa3262d0ea99829bd; category normal; HISTORICAL_RUN
- PASS/FAIL: PASS; cases checked reported: 16; end/failure time: 160 ns (VCD 시각, 로그 시간 단위와 확인)
- simulation.log: `evidence/vscode/LAB1/10_7seg_decoder/normal__run-68a357e7a424458aa3262d0ea99829bd/simulation.log`; SHA-256 6dc3d8ad7512a9024b8d905c48d5b86e400f745880113489937f5eaf8a57d01e
- compile.log: `evidence/vscode/LAB1/10_7seg_decoder/normal__run-68a357e7a424458aa3262d0ea99829bd/compile.log`; SHA-256 cec11eeafb24c9387d24011f944a11f4a307847b1b8fa5d6a8602c5badf41261
- VCD: `evidence/vscode/LAB1/10_7seg_decoder/normal__run-68a357e7a424458aa3262d0ea99829bd/wave.vcd`; SHA-256 1307bd86d7719b8e35ac79383a4a8716c528171086c6f7ca13374cc7be26c5aa
- input hash for this preserved run: UNKNOWN; 다른 run의 result input hash를 전용하지 않음

- run ID: run-27f60921a06746d883783c9f379e8c76; category recovery; HISTORICAL_RUN
- PASS/FAIL: PASS; cases checked reported: 16; end/failure time: 160 ns (VCD 시각, 로그 시간 단위와 확인)
- simulation.log: `evidence/vscode/LAB1/10_7seg_decoder/recovery__run-27f60921a06746d883783c9f379e8c76/simulation.log`; SHA-256 6dc3d8ad7512a9024b8d905c48d5b86e400f745880113489937f5eaf8a57d01e
- compile.log: `evidence/vscode/LAB1/10_7seg_decoder/recovery__run-27f60921a06746d883783c9f379e8c76/compile.log`; SHA-256 cec11eeafb24c9387d24011f944a11f4a307847b1b8fa5d6a8602c5badf41261
- VCD: `evidence/vscode/LAB1/10_7seg_decoder/recovery__run-27f60921a06746d883783c9f379e8c76/wave.vcd`; SHA-256 27ff0c7771fcd315f1416a71b3c4079ed9f6f733db245870be2edf514cd0d0d4
- input hash for this preserved run: 위 result.json에 기록된 RTL/TB/config hash; VCD hash도 일치

Local build/sim historical logs (새 실행 아님):

| Local log | Observed result lines |
| --- | --- |
| `LAB1/10_7seg_decoder/build/sim/run-27f60921a06746d883783c9f379e8c76/simulation.log` | LAB1_PASS seg_decoder cases=16 / C:\Users\yunji\ece2\ece2_2026\LAB1\10_7seg_decoder\sim\tb_seg_decoder.sv:53: $finish called at 160 (1ns) |
| `LAB1/10_7seg_decoder/build/sim/run-68a357e7a424458aa3262d0ea99829bd/simulation.log` | LAB1_PASS seg_decoder cases=16 / C:\Users\yunji\ece2\ece2_2026\LAB1\10_7seg_decoder\sim\tb_seg_decoder.sv:53: $finish called at 160 (1ns) |
| `LAB1/10_7seg_decoder/build/sim/run-aa683425c13e4c53be1af160ed5187f3/simulation.log` | FATAL: C:\Users\yunji\ece2\ece2_2026\LAB1\10_7seg_decoder\sim\tb_seg_decoder.sv:42: FAIL seg_decoder vector=0 expected=fc actual=60 |

#### D. Historical Vivado simulation / GUI

- final stable waveform evidence: `evidence/vivado/LAB1/10_7seg_decoder/LAB1_10_7seg_decoder_vivado_waveform.jpg`
- stable representative condition / expected: 80~90 ns: bcd=4'h8,seg_data=8'hFE; 150~160 ns: bcd=4'hF,seg_data=8'h8E
- observed result: 캡처의 stable signal label/value 및 출력 패턴이 위 계산한 expected와 일치하는 구간이 보임. 범위가 현재 TB에서 도출된 03/05는 정확한 sample time을 학생이 확인해야 함
- Vivado version: Vivado Simulator v2026.1; project/product 및 로컬 report도 2026.1
- executed design/simulation top: seg_decoder / tb_seg_decoder
- simulation FPGA part/XDC: xc7s75fgga484-1 / LAB1/10_7seg_decoder/constraints/seg_decoder.xdc
- simulation log: `LAB1/10_7seg_decoder/10_7seg_decoder.sim/sim_1/behav/xsim/simulate.log`
- actual PASS/cases/end time: PASS / 16 / 160 ns (simulate.log 직접 판독)
- simulation run ID: UNKNOWN (XSim 로컬 stage 경로만 확인; UUID 임의 생성 금지)
- Vivado VCD: `LAB1/10_7seg_decoder/10_7seg_decoder.sim/sim_1/behav/xsim/wave.vcd`; SHA-256 a625a2d710c977d4f236143c91ca395cb554c3a1ffb9e73ce14521eaabce6efa
- VCD last timestamp: 160 ns; 실제 종료는 160 ns. 마지막 event를 종료 시간으로 대체하지 않음
- compiled source registration: `LAB1/10_7seg_decoder/10_7seg_decoder.sim/sim_1/behav/xsim/tb_seg_decoder_vlog.prj`; 현재 RTL/TB의 ../../../../src,sim 경로 참조. compiled input source SHA-256 및 run-to-commit은 UNKNOWN

#### E. VS Code ↔ Vivado comparison

- DUT/output signal set: seg_decoder / bcd, seg_data
- expected behavior / current TB: 위 실제 source 계산 및 enumeration 참조
- comparison: FUNCTIONALLY_CONSISTENT; 정상 및 복구 각각 16 case의 n*10+5 ns 안정 sample에서 입력/출력 불일치 0
- input sequence/output/cases/end: VCD 안정 sample 입력·출력 일치, PASS logs 16 cases 및 160 ns 종료 일치; exact compiled source bytes는 UNKNOWN
- exact VCD SHA-256 equality: false (정상 및 복구 각각); byte equality와 기능 일치를 구분

#### F. Build / DRC / timing / bitstream

- historical synthesis: 성공; `LAB1/10_7seg_decoder/10_7seg_decoder.runs/synth_1/runme.log`의 synth_design completed successfully
- historical implementation: 성공; `LAB1/10_7seg_decoder/10_7seg_decoder.runs/impl_1/runme.log`의 route_design completed successfully
- historical write_bitstream: 성공; 같은 impl runme.log의 write_bitstream completed successfully
- actual bitstream: `LAB1/10_7seg_decoder/10_7seg_decoder.runs/impl_1/seg_decoder.bit`; SHA-256 13b511d9e865587d00a5d1f699f2781aa445d59c2765c21be960c2af481bcfd2; size 3687014 bytes
- DRC report: `LAB1/10_7seg_decoder/10_7seg_decoder.runs/impl_1/seg_decoder_drc_routed.rpt`; SHA-256 8c79653077c3fcfa29c99406b94fa64bd62e646c629caf0024d6c2346f046ea2
- DRC design/device/state: seg_decoder / xc7s75fgga484-1 / Fully Routed (report header)
- default routed DRC: errors=0; warnings=1; rule=CFGBVS-1. CFGBVS 및 CONFIG_VOLTAGE 미설정으로 configuration bank voltage 검증 정보가 부족하다는 경고. 경고를 숨기거나 clean DRC PASS라고 쓰지 않음
- timing report: `LAB1/10_7seg_decoder/10_7seg_decoder.runs/impl_1/seg_decoder_timing_summary_routed.rpt`; SHA-256 d4f4b3c661dd04372856ac044a48c389d1c5f856f3caf35b629eac43c079a668
- user timing constraints: 없음; clock summary: 비어 있음; current XDC에도 create_clock/input-output delay 없음
- WNS=inf ns, TNS=0.000 ns, WHS=inf ns, THS=0.000 ns; pulse-width=NA
- timing interpretation: NO_USER_TIMING_CONSTRAINT / NOT_APPLICABLE_TO_SETUP_HOLD_AS_REPORTED; timing verification PASS 아님
- source→historical bitstream/hash→programmed device direct link: UNKNOWN

## 2. Program Device and selected board evidence

- Programmed support provenance: LOCAL_VERIFIED (대표 장치 상태); 특정 실험/bitstream 연결: UNKNOWN.
- Programmed support: `evidence/vivado/LAB1/support/Hardware_Properties.png`; device xc7s75_0, part xc7s75, Status=Programmed. programming file path 및 hash는 화면에서 확인되지 않아 UNKNOWN. 특정 실험의 bitstream 연결이나 기능 검증은 별개다.
- selected_demo_experiments: 06_mux, 10_7seg_decoder; DEMO_SELECTION_STATUS=USER_CONFIRMED (USER_REPORTED).
- raw board videos의 존재를 조교 선정이나 영상 제출 의무로 해석하지 않는다. 다른 8개는 raw evidence로 유지한다.

| Experiment | Final photo | User-confirmed input / expected | Visible actual | Remaining boundary |
| --- | --- | --- | --- | --- |
| 06_mux | `evidence/board/LAB1/frames/LAB1_06_mux_board_s00_i3.png` | button1=i[3]; s=2'b00이면 z=i[3] | 버튼 조작 장면과 LED1 점등 | 사진별 s=00 입력 직접 대응, button polarity, L4=LED1 및 programmed source 연결 UNKNOWN |
| 06_mux | `evidence/board/LAB1/frames/LAB1_06_mux_board_s11_i0.png` | button4=i[0]; s=2'b11이면 z=i[0] | 버튼 조작 장면과 LED1 점등 | 사진별 s=11 입력 직접 대응 및 전체 input word UNKNOWN |
| 10_7seg_decoder | `evidence/board/LAB1/frames/LAB1_10_7seg_board_8.png` | 4'b1000 -> seg_data=8'hFE, a~g 활성/dp 비활성 | 실제 단일 7-segment에 8 표시 | 전체 16개 board 입력 정상 동작으로 확대하지 않음 |
| 10_7seg_decoder | `evidence/board/LAB1/frames/LAB1_10_7seg_board_F.png` | 4'b1111 -> seg_data=8'h8E, a/e/f/g 활성 | 실제 단일 7-segment에 F 표시 | 정확한 전기적 segment bit 값을 사진만으로 측정했다고 주장하지 않음 |

사진 timestamp/source-video direct mapping은 UNKNOWN이다. 기존 A 해석은 사용자 확인 및 현재 8/F 사진에 따라 사용하지 않는다. board photo는 물리 관찰, simulation VCD는 정량 검증으로 역할을 구분한다.

## 3. Work report additions and internal-only records

보고서에 추가할 내용: 10개 설계 핵심 구조 설명과 stable waveform의 시험 조건/계산한 expected/관찰/해석; 가능한 7개 VS Code↔Vivado 정량 비교; 7개 기존 synthesis/implementation/bitstream 기록; DRC 경고와 timing 제약 부재의 의미; 선정 2개 사진의 실험 번호·입력 조건·실제 관찰 설명. 없는 stage는 자연스럽게 미확인/증거 미확보로 설명한다.

내부에 보존하되 본문에 전부 나열할 필요가 없는 것: 41개 source hash, compile/VCD hash, UUID, 전체 historical run 목록, source-provenance 상태 이름, JSON schema/QA 용어, duplicate overview/JPG, 다른 8개 board raw video. 본문은 실제 필요한 증거를 인용하고 상세 추적 목록은 GitHub 내부 기록으로 유지한다.

새로운 실행·source 수정·원본 evidence 복사 없이 작성했다. 추가 GitHub evidence 보존, source/run 직접 연결 확정 및 기존 보고서 수정은 별도 사용자 승인 단계다.

## 4. Team environment and reporting scope

팀 분담 및 여러 PC 사용은 사용자 제공 환경 정보다. 03/05/07의 Vivado 구현 관련 단계 수행은 TEAM_CONFIRMED이며 해당 원본 log/report/bitstream 직접 확인은 EVIDENCE_PENDING이다. 담당 팀원 성명과 생성 PC는 UNKNOWN이다. 자료 부재를 미수행 가능성으로 해석하지 않으며, 자료 생성/전달 출처와 세부 값은 별도로 확인한다.

보고서용 제안 문장: “팀 분담에 따라 여러 작업 환경에서 실험을 수행하였으며, 본 보고서에서는 현재 확보된 각 실험의 시뮬레이션 자료와 확인 가능한 구현 기록을 바탕으로 결과를 정리하였다.” 이 문장은 팀 환경에 대한 사용자 확인과 확보한 기록 범위만 표현하며 모든 실험의 구현 완료를 뜻하지 않는다. 실험 03, 05, 07의 팀원 수행 사실은 확정되었으며 원본 전달 여부와 구분하여 설명한다.

보고서용 확정 문장: “실험 03, 05, 07의 Vivado 구현 단계는 팀 분담에 따라 팀원이 수행하였으며, 현재 보고서 작성 환경에는 해당 원본 구현 로그 일부가 보관되어 있지 않다.” 수행 사실의 provenance는 사용자 확인이며, 직접 확인하지 않은 DRC count, timing 값 및 bitstream hash는 이 문장으로 확정되지 않는다.

자료 요청은 LAB1_team_evidence_request.md를 따른다. 10개 최종 waveform과 기존 source, VS Code 기록, 7개 구현 기록, 최종 board 사진 4개는 중복 요청하지 않는다. 사용자 실제 waveform observation gate, intentional failure/recovery, timing 및 programming/board 구분은 유지한다.
