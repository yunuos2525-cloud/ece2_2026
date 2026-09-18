# LAB1 Pre-report Manifest

## 0. Manifest metadata

- lab: LAB1
- generated_from: Current LAB1 RTL/TB/XDC/simulation.json; evidence/vscode/LAB1 logs and VCD; Git history; experiment workspaces/tools/README. Evidence results use only preserved normal/intentional_failure/recovery runs. Original build files are read only for copy SHA-256 comparison; no other build run results or result.json are used.
- manifest_status: DRAFT_EVIDENCE_BASED
- repository_branch: main
- current_HEAD: 647a3b310ca63a8bcdd846aa86f5a84c710351e5
- waveform_visual_verification_policy: Only explicit user-confirmed visual evidence can establish visual verification. VCD parsing and candidate intervals do not establish a visual check.
- board_status: NOT_PERFORMED

All paths below are repository-relative. Timing values are simulation time, not wall-clock time. Role labels follow the user-designated preserved runs. Change commits establish RTL history, not direct run-to-commit identity. READY indicates available factual input for a draft; it does not establish student review or overall design verification.

## 1. Environment

- OS: UNKNOWN
- Git version: git version 2.55.0.windows.5
- Python version: UNKNOWN
- Icarus Verilog version: Icarus Verilog version 12.0 (devel) (s20150603-1539-g2693dd32b)
- vvp version: Icarus Verilog runtime version 12.0 (devel) (s20150603-1539-g2693dd32b)
- workspace file: LAB1/<experiment folder>/LAB1.code-workspace (all 10 exist; folder path=".")
- simulation workflow: Workspace tasks: 01 Check tools -> 02 Simulate -> 03 Open waveform. tools/lab1.py check / simulate / wave. Runner compiles explicitly listed RTL and TB using iverilog -g2012 -Wall -s <simulation_top>, then vvp -N; XDC is not an Icarus functional-simulation input. This manifest records existing executions; no new simulation was performed.
- evidence source: evidence/vscode/LAB1/environment/{git.log,iverilog.log,vvp.log}; per-experiment preserved run folders

OS names are not recorded explicitly in the environment logs. Windows paths and a windows Git build do not constitute a recorded OS/version. tools/lab1.py check prints Python version to the terminal, but the preserved environment files contain no Python version. Tool-version logs are LAB1-wide records; exact version linkage to every run is not recorded.

## 2. Experiments


### 01_logic_gates


#### A. Design identity

- experiment folder: LAB1/01_logic_gates
- RTL file(s): LAB1/01_logic_gates/src/logic_gate.v
- RTL module(s): logic_gate
- Design top: logic_gate (derived from TB DUT instantiation; simulation.json does not define a design_top field)
- TB file: LAB1/01_logic_gates/sim/tb_logic_gate_modern.sv
- Simulation top: tb_logic_gate_modern
- XDC file: LAB1/01_logic_gates/constraints/logic_gate.xdc
- simulation.json: LAB1/01_logic_gates/simulation.json
- input ports: a, b
- output ports: x, y, z
- port widths: a: 1 bit(s); b: 1 bit(s); x: 1 bit(s); y: 1 bit(s); z: 1 bit(s)

#### B. Functional intent

x=a&b; y=a|b; z=a^b. Output packing {x,y,z}; a is the MSB of {a,b}.

#### C. Testbench verification

- applied input sequence or enumeration method: {a,b}=n, n=0..3
- number of test cases: 4
- interval per case: 10 ns (#10 with 1ns time unit; observation after the delay)
- total expected simulation time: 40 ns for an uninterrupted PASS path
- expected calculation method: {a&b,a|b,a^b}
- DUT output compared against: {x,y,z} compared to expected with !== (case inequality, including X/Z detection)
- PASS condition: All 4 comparisons pass; checked==4; LAB1_PASS with cases=4 is printed, then $finish
- FAIL condition: {x,y,z} !== expected -> $fatal with vector/expected/actual; checked!=4 -> Incomplete test
- watchdog: At 100000 ns, $fatal(1, watchdog/Watchdog) if execution has not already ended
- code basis: LAB1/01_logic_gates/sim/tb_logic_gate_modern.sv; timescale=1ns/1ps

#### D. Representative expected behavior

- source: AUTO_SELECTED_FROM_DESIGN

No experiment-specific representative vectors were found in the inspected repository README material. These are computed expectations, not board observations.

- input: vector n=0; a=0, b=0
- expected output: x=0, y=0, z=0
- calculation/reason: AND / OR / XOR truth table

- input: vector n=1; a=0, b=1
- expected output: x=0, y=1, z=1
- calculation/reason: AND / OR / XOR truth table

- input: vector n=2; a=1, b=0
- expected output: x=0, y=1, z=1
- calculation/reason: AND / OR / XOR truth table

- input: vector n=3; a=1, b=1
- expected output: x=1, y=1, z=0
- calculation/reason: AND / OR / XOR truth table

#### E. Normal simulation evidence

- run ID: run-4ccd3151c80e42b8a613c46c83a9d378
- simulation.log path: evidence/vscode/LAB1/01_logic_gates/normal__run-4ccd3151c80e42b8a613c46c83a9d378/simulation.log
- compile.log path: evidence/vscode/LAB1/01_logic_gates/normal__run-4ccd3151c80e42b8a613c46c83a9d378/compile.log
- wave.vcd path: evidence/vscode/LAB1/01_logic_gates/normal__run-4ccd3151c80e42b8a613c46c83a9d378/wave.vcd
- PASS/FAIL: PASS
- cases: 4
- simulation end time: 40 ns (log and final VCD timestamp agree)
- source commit: UNKNOWN
- evidence_integrity: VERIFIED_COPY

Copy integrity basis: SHA-256 recomputed for each preserved file and its original file in the exact same run; all three match. This confirms byte identity, not source review or run-to-commit identity.

#### F. Intentional failure

- run ID: run-3da382f3ef754a73ab00728347ecd540
- RTL modification: z: a^b -> a|b
- predicted failing condition: a=b=1: correct XOR=0, modified OR=1; first mismatch n=3 (calculated from the Git change and TB; a pre-run prediction record is not available)
- actual first failing vector: 3
- expected: 0x6
- actual: 0x7
- failure time: 40 ns (log interpreted using VCD timescale)
- simulation.log path: evidence/vscode/LAB1/01_logic_gates/intentional_failure__run-3da382f3ef754a73ab00728347ecd540/simulation.log
- wave.vcd path: evidence/vscode/LAB1/01_logic_gates/intentional_failure__run-3da382f3ef754a73ab00728347ecd540/wave.vcd
- source commit: UNKNOWN
- modification evidence: Git change commit 2e0c081, file src/logic_gate.v; preserved FAIL log and VCD TB expected / packed DUT values agree. The run-specific historical RTL snapshot is not preserved here, so the exact run source identity is unconfirmed.

#### G. Recovery

- run ID: run-6b4d7856b4b74d7182be024c49d8befb
- restored behavior: XOR restored for z; Git restoration commit 7d4ae04; recovery role follows user selection
- PASS/FAIL: PASS
- cases: 4
- simulation end time: 40 ns (log and final VCD timestamp agree)
- simulation.log path: evidence/vscode/LAB1/01_logic_gates/recovery__run-6b4d7856b4b74d7182be024c49d8befb/simulation.log
- wave.vcd path: evidence/vscode/LAB1/01_logic_gates/recovery__run-6b4d7856b4b74d7182be024c49d8befb/wave.vcd
- source commit: UNKNOWN

#### H. Waveform verification

- VCD_PRESENT: YES (normal, intentional_failure, recovery)
- VCD_RUN_TRACEABLE: YES (user-designated run IDs in evidence paths; VCD signals, timestamps and log outputs checked; this is not commit traceability)
- USER_VISUAL_CHECK: NOT_VERIFIED
- SCREENSHOT_PRESENT: NOT_AVAILABLE
- representative_intervals: Candidate intervals only, in ns; normal/recovery VCD values checked numerically at both ends of each interval. No visual verification is asserted.
  - normal and recovery: [1, 9] ns, vector n=0; a=0, b=0 -> x=0, y=0, z=0
  - normal and recovery: [11, 19] ns, vector n=1; a=0, b=1 -> x=0, y=1, z=1
  - normal and recovery: [21, 29] ns, vector n=2; a=1, b=0 -> x=0, y=1, z=1
  - normal and recovery: [31, 39] ns, vector n=3; a=1, b=1 -> x=1, y=1, z=0
  - intentional_failure: [31, 39] ns, vector n=3; expected 0x6, actual 0x7; ends before fatal termination
- VCD timescale: normal/failure/recovery: 1ps

#### I. Board plan

- board_status: NOT_PERFORMED
- XDC pin mapping: a->K4; b->N8; x->L4; y->M4; z->M2; all ports LVCMOS33
- planned user inputs: Apply the representative input vectors in section D via the physical controls associated with the XDC input package pins, after verifying the board mapping and polarity.
- expected physical outputs: Design-level expected logic at output package pins follows section D. Actual LED/segment illumination is not inferred from package pins alone.
- verification method: Confirm board model, control-to-pin mapping, output polarity and segment/digit wiring; then apply planned vectors and record actual observations/photos/measurements against section D. This is a plan only.
- board model: UNKNOWN
- physical control/output mapping and polarity: UNKNOWN

#### J. Pre-report readiness

- design_information: READY
- expected_behavior: READY
- normal_simulation: READY
- intentional_failure: READY
- recovery: READY
- waveform_visual_evidence: MISSING
- board_plan: NEEDS_USER_CONFIRMATION
- experiment_readiness: NEEDS_USER_CONFIRMATION

Readiness scope: log-based results and history-based change descriptions are available. Student understanding/review, direct source commit linkage, physical mapping and visual evidence still require confirmation. All three preserved compile logs warn that design elements lack an explicit time unit/time precision.

##### Evidence SHA-256

| Role | File | SHA-256 | Matches original same-run file |
|---|---|---|---|
| normal | simulation.log | a9dd5eca42d8abb4bd4929dc292a4c0b3e61312cecc4a594a9e9885a9d5faf47 | YES |
| normal | compile.log | 47cb9181752a66d3b04596b7b4a270757c87f16e91497dae9ddcbcf9bd2c7ff0 | YES |
| normal | wave.vcd | 850c4c1d863d136da26a5282f7708e35c319b791b679e8b896bedb8c6fac2f34 | YES |
| intentional_failure | simulation.log | 33622c99976909d1e1d7ecb51afabf38b24bbacdf6976fe800a59746870725a3 | YES |
| intentional_failure | compile.log | 47cb9181752a66d3b04596b7b4a270757c87f16e91497dae9ddcbcf9bd2c7ff0 | YES |
| intentional_failure | wave.vcd | ecf5a575f9b4a73aad93c8d67a39a941bac7feb3ba1de7aaf66a3b67105a924f | YES |
| recovery | simulation.log | a9dd5eca42d8abb4bd4929dc292a4c0b3e61312cecc4a594a9e9885a9d5faf47 | YES |
| recovery | compile.log | 47cb9181752a66d3b04596b7b4a270757c87f16e91497dae9ddcbcf9bd2c7ff0 | YES |
| recovery | wave.vcd | c7ff30dcb98937efe9abff84137f5d339df664260ac16fc3c842ef97b46a471e | YES |

Technical note: preserved logs contain the older lab1_01_logic_gates absolute path. The manifest retains the original log unchanged; current source paths come from the current repository, not the old path.

### 02_full_adder


#### A. Design identity

- experiment folder: LAB1/02_full_adder
- RTL file(s): LAB1/02_full_adder/src/half_adder.v; LAB1/02_full_adder/src/full_adder.v
- RTL module(s): half_adder; full_adder
- Design top: full_adder (derived from TB DUT instantiation; simulation.json does not define a design_top field)
- TB file: LAB1/02_full_adder/sim/tb_full_adder.sv
- Simulation top: tb_full_adder
- XDC file: LAB1/02_full_adder/constraints/full_adder.xdc
- simulation.json: LAB1/02_full_adder/simulation.json
- input ports: a, b, cin
- output ports: s, cout
- port widths: a: 1 bit(s); b: 1 bit(s); cin: 1 bit(s); s: 1 bit(s); cout: 1 bit(s)

Submodule half_adder ports: inputs a,b (1 bit each); outputs s,c (1 bit each).

#### B. Functional intent

Two half_adder instances. s=a^b^cin; cout=(a&b)|((a^b)&cin). Output packing {cout,s}. half_adder: s=a^b, c=a&b.

#### C. Testbench verification

- applied input sequence or enumeration method: {a,b,cin}=n, n=0..7
- number of test cases: 8
- interval per case: 10 ns (#10 with 1ns time unit; observation after the delay)
- total expected simulation time: 80 ns for an uninterrupted PASS path
- expected calculation method: int'(a)+int'(b)+int'(cin)
- DUT output compared against: {cout,s} compared to expected with !== (case inequality, including X/Z detection)
- PASS condition: All 8 comparisons pass; checked==8; LAB1_PASS with cases=8 is printed, then $finish
- FAIL condition: {cout,s} !== expected -> $fatal with vector/expected/actual; checked!=8 -> Incomplete test
- watchdog: At 100000 ns, $fatal(1, watchdog/Watchdog) if execution has not already ended
- code basis: LAB1/02_full_adder/sim/tb_full_adder.sv; timescale=1ns/1ps

#### D. Representative expected behavior

- source: AUTO_SELECTED_FROM_DESIGN

No experiment-specific representative vectors were found in the inspected repository README material. These are computed expectations, not board observations.

- input: vector n=0; a=0, b=0, cin=0
- expected output: cout=0, s=0
- calculation/reason: 0+0+0=0

- input: vector n=3; a=0, b=1, cin=1
- expected output: cout=1, s=0
- calculation/reason: 0+1+1=2

- input: vector n=6; a=1, b=1, cin=0
- expected output: cout=1, s=0
- calculation/reason: 1+1+0=2

- input: vector n=7; a=1, b=1, cin=1
- expected output: cout=1, s=1
- calculation/reason: 1+1+1=3

#### E. Normal simulation evidence

- run ID: run-e2dc5b3bf5af401bb6d906dd28fe5de7
- simulation.log path: evidence/vscode/LAB1/02_full_adder/normal__run-e2dc5b3bf5af401bb6d906dd28fe5de7/simulation.log
- compile.log path: evidence/vscode/LAB1/02_full_adder/normal__run-e2dc5b3bf5af401bb6d906dd28fe5de7/compile.log
- wave.vcd path: evidence/vscode/LAB1/02_full_adder/normal__run-e2dc5b3bf5af401bb6d906dd28fe5de7/wave.vcd
- PASS/FAIL: PASS
- cases: 8
- simulation end time: 80 ns (log and final VCD timestamp agree)
- source commit: UNKNOWN
- evidence_integrity: VERIFIED_COPY

Copy integrity basis: SHA-256 recomputed for each preserved file and its original file in the exact same run; all three match. This confirms byte identity, not source review or run-to-commit identity.

#### F. Intentional failure

- run ID: run-e2c662a627954effaf3507dedc43f1a5
- RTL modification: cout: carry_ab|carry_cin -> carry_ab&carry_cin
- predicted failing condition: n=3 gives a=0,b=1,cin=1: correct carry=1, modified carry=0 (calculated from the Git change and TB; a pre-run prediction record is not available)
- actual first failing vector: 3
- expected: 0x2
- actual: 0x0
- failure time: 40 ns (log interpreted using VCD timescale)
- simulation.log path: evidence/vscode/LAB1/02_full_adder/intentional_failure__run-e2c662a627954effaf3507dedc43f1a5/simulation.log
- wave.vcd path: evidence/vscode/LAB1/02_full_adder/intentional_failure__run-e2c662a627954effaf3507dedc43f1a5/wave.vcd
- source commit: UNKNOWN
- modification evidence: Git change commit 9ce18d8, file LAB1/02_full_adder/src/full_adder.v; preserved FAIL log and VCD TB expected / packed DUT values agree. The run-specific historical RTL snapshot is not preserved here, so the exact run source identity is unconfirmed.

#### G. Recovery

- run ID: run-335a41eb710c467a94846bdabb4ec2c5
- restored behavior: OR restored between the two half-adder carries; Git restoration commit 43567a7; recovery role follows user selection
- PASS/FAIL: PASS
- cases: 8
- simulation end time: 80 ns (log and final VCD timestamp agree)
- simulation.log path: evidence/vscode/LAB1/02_full_adder/recovery__run-335a41eb710c467a94846bdabb4ec2c5/simulation.log
- wave.vcd path: evidence/vscode/LAB1/02_full_adder/recovery__run-335a41eb710c467a94846bdabb4ec2c5/wave.vcd
- source commit: UNKNOWN

#### H. Waveform verification

- VCD_PRESENT: YES (normal, intentional_failure, recovery)
- VCD_RUN_TRACEABLE: YES (user-designated run IDs in evidence paths; VCD signals, timestamps and log outputs checked; this is not commit traceability)
- USER_VISUAL_CHECK: NOT_VERIFIED
- SCREENSHOT_PRESENT: NOT_AVAILABLE
- representative_intervals: Candidate intervals only, in ns; normal/recovery VCD values checked numerically at both ends of each interval. No visual verification is asserted.
  - normal and recovery: [1, 9] ns, vector n=0; a=0, b=0, cin=0 -> cout=0, s=0
  - normal and recovery: [31, 39] ns, vector n=3; a=0, b=1, cin=1 -> cout=1, s=0
  - normal and recovery: [61, 69] ns, vector n=6; a=1, b=1, cin=0 -> cout=1, s=0
  - normal and recovery: [71, 79] ns, vector n=7; a=1, b=1, cin=1 -> cout=1, s=1
  - intentional_failure: [31, 39] ns, vector n=3; expected 0x2, actual 0x0; ends before fatal termination
- VCD timescale: normal/failure/recovery: 1ps

#### I. Board plan

- board_status: NOT_PERFORMED
- XDC pin mapping: a->K4; b->N8; cin->N4; cout->L4; s->M4; all ports LVCMOS33
- planned user inputs: Apply the representative input vectors in section D via the physical controls associated with the XDC input package pins, after verifying the board mapping and polarity.
- expected physical outputs: Design-level expected logic at output package pins follows section D. Actual LED/segment illumination is not inferred from package pins alone.
- verification method: Confirm board model, control-to-pin mapping, output polarity and segment/digit wiring; then apply planned vectors and record actual observations/photos/measurements against section D. This is a plan only.
- board model: UNKNOWN
- physical control/output mapping and polarity: UNKNOWN

#### J. Pre-report readiness

- design_information: READY
- expected_behavior: READY
- normal_simulation: READY
- intentional_failure: READY
- recovery: READY
- waveform_visual_evidence: MISSING
- board_plan: NEEDS_USER_CONFIRMATION
- experiment_readiness: NEEDS_USER_CONFIRMATION

Readiness scope: log-based results and history-based change descriptions are available. Student understanding/review, direct source commit linkage, physical mapping and visual evidence still require confirmation. All three preserved compile logs warn that design elements lack an explicit time unit/time precision.

##### Evidence SHA-256

| Role | File | SHA-256 | Matches original same-run file |
|---|---|---|---|
| normal | simulation.log | 2bd40fd396e29ee9e6b5a9705a57611f5265824943efd45b3574620c7b141c3f | YES |
| normal | compile.log | 04f33000b54560c1ba32b2cfb3f039b0b06fbb2997c46f7cd96d9ad6929a4051 | YES |
| normal | wave.vcd | 116eb50becc501c5e9d21d1b65d8f88388d51659ed6379b488efedc0004bcd4c | YES |
| intentional_failure | simulation.log | 0c08ac311a8ca52ead67fc69003d1f8dc6758e2fd68a35174dd4f308ebee91f1 | YES |
| intentional_failure | compile.log | 04f33000b54560c1ba32b2cfb3f039b0b06fbb2997c46f7cd96d9ad6929a4051 | YES |
| intentional_failure | wave.vcd | 0e5e895f7d548be66f69493a7e983a9434a3915d1f4a92a68293a0fbd5d9b05a | YES |
| recovery | simulation.log | 2bd40fd396e29ee9e6b5a9705a57611f5265824943efd45b3574620c7b141c3f | YES |
| recovery | compile.log | 04f33000b54560c1ba32b2cfb3f039b0b06fbb2997c46f7cd96d9ad6929a4051 | YES |
| recovery | wave.vcd | b45cf6285629ec2663ad8859888b8b57f89299efbf16d85624acda19b2cd96bb | YES |

### 03_4bit_adder


#### A. Design identity

- experiment folder: LAB1/03_4bit_adder
- RTL file(s): LAB1/03_4bit_adder/src/adder_4bit.v
- RTL module(s): adder_4bit
- Design top: adder_4bit (derived from TB DUT instantiation; simulation.json does not define a design_top field)
- TB file: LAB1/03_4bit_adder/sim/tb_adder_4bit.sv
- Simulation top: tb_adder_4bit
- XDC file: LAB1/03_4bit_adder/constraints/adder_4bit.xdc
- simulation.json: LAB1/03_4bit_adder/simulation.json
- input ports: a, b
- output ports: s, cout
- port widths: a: 4 bit(s); b: 4 bit(s); s: 4 bit(s); cout: 1 bit(s)

#### B. Functional intent

Unsigned 4-bit addition, zero-extended to 5 bits: {cout,s}={1'b0,a}+{1'b0,b}. s is the low 4 bits; cout is carry bit 4.

#### C. Testbench verification

- applied input sequence or enumeration method: {a,b}=n, n=0..255; a=n//16, b=n%16
- number of test cases: 256
- interval per case: 10 ns (#10 with 1ns time unit; observation after the delay)
- total expected simulation time: 2560 ns for an uninterrupted PASS path
- expected calculation method: (n/16)+(n%16)
- DUT output compared against: {cout,s} compared to expected with !== (case inequality, including X/Z detection)
- PASS condition: All 256 comparisons pass; checked==256; LAB1_PASS with cases=256 is printed, then $finish
- FAIL condition: {cout,s} !== expected -> $fatal with vector/expected/actual; checked!=256 -> Incomplete test
- watchdog: At 100000 ns, $fatal(1, watchdog/Watchdog) if execution has not already ended
- code basis: LAB1/03_4bit_adder/sim/tb_adder_4bit.sv; timescale=1ns/1ps

#### D. Representative expected behavior

- source: AUTO_SELECTED_FROM_DESIGN

No experiment-specific representative vectors were found in the inspected repository README material. These are computed expectations, not board observations.

- input: vector n=0; a=0b0000 (0x0), b=0b0000 (0x0)
- expected output: cout=0, s=0b0000 (0x0)
- calculation/reason: 0+0=0; low 4 bits and carry

- input: vector n=1; a=0b0000 (0x0), b=0b0001 (0x1)
- expected output: cout=0, s=0b0001 (0x1)
- calculation/reason: 0+1=1; low 4 bits and carry

- input: vector n=143; a=0b1000 (0x8), b=0b1111 (0xf)
- expected output: cout=1, s=0b0111 (0x7)
- calculation/reason: 8+15=23; low 4 bits and carry

- input: vector n=255; a=0b1111 (0xf), b=0b1111 (0xf)
- expected output: cout=1, s=0b1110 (0xe)
- calculation/reason: 15+15=30; low 4 bits and carry

#### E. Normal simulation evidence

- run ID: run-096c1dfe66a7434e8f15364c42d08412
- simulation.log path: evidence/vscode/LAB1/03_4bit_adder/normal__run-096c1dfe66a7434e8f15364c42d08412/simulation.log
- compile.log path: evidence/vscode/LAB1/03_4bit_adder/normal__run-096c1dfe66a7434e8f15364c42d08412/compile.log
- wave.vcd path: evidence/vscode/LAB1/03_4bit_adder/normal__run-096c1dfe66a7434e8f15364c42d08412/wave.vcd
- PASS/FAIL: PASS
- cases: 256
- simulation end time: 2560 ns (log and final VCD timestamp agree)
- source commit: UNKNOWN
- evidence_integrity: VERIFIED_COPY

Copy integrity basis: SHA-256 recomputed for each preserved file and its original file in the exact same run; all three match. This confirms byte identity, not source review or run-to-commit identity.

#### F. Intentional failure

- run ID: run-ce60d29254dc4e588077b39cbfb72a1f
- RTL modification: 5-bit operation: addition -> subtraction
- predicted failing condition: n=1 gives a=0,b=1: correct sum=0x01; 5-bit subtraction wraps to 0x1f (calculated from the Git change and TB; a pre-run prediction record is not available)
- actual first failing vector: 1
- expected: 0x01
- actual: 0x1f
- failure time: 20 ns (log interpreted using VCD timescale)
- simulation.log path: evidence/vscode/LAB1/03_4bit_adder/intentional_failure__run-ce60d29254dc4e588077b39cbfb72a1f/simulation.log
- wave.vcd path: evidence/vscode/LAB1/03_4bit_adder/intentional_failure__run-ce60d29254dc4e588077b39cbfb72a1f/wave.vcd
- source commit: UNKNOWN
- modification evidence: Git change commit f8d0948, file LAB1/03_4bit_adder/src/adder_4bit.v; preserved FAIL log and VCD TB expected / packed DUT values agree. The run-specific historical RTL snapshot is not preserved here, so the exact run source identity is unconfirmed.

#### G. Recovery

- run ID: run-3553617cda564961a84d1f67c16a5256
- restored behavior: 5-bit addition restored; Git restoration commit 6666687; recovery role follows user selection
- PASS/FAIL: PASS
- cases: 256
- simulation end time: 2560 ns (log and final VCD timestamp agree)
- simulation.log path: evidence/vscode/LAB1/03_4bit_adder/recovery__run-3553617cda564961a84d1f67c16a5256/simulation.log
- wave.vcd path: evidence/vscode/LAB1/03_4bit_adder/recovery__run-3553617cda564961a84d1f67c16a5256/wave.vcd
- source commit: UNKNOWN

#### H. Waveform verification

- VCD_PRESENT: YES (normal, intentional_failure, recovery)
- VCD_RUN_TRACEABLE: YES (user-designated run IDs in evidence paths; VCD signals, timestamps and log outputs checked; this is not commit traceability)
- USER_VISUAL_CHECK: NOT_VERIFIED
- SCREENSHOT_PRESENT: NOT_AVAILABLE
- representative_intervals: Candidate intervals only, in ns; normal/recovery VCD values checked numerically at both ends of each interval. No visual verification is asserted.
  - normal and recovery: [1, 9] ns, vector n=0; a=0b0000 (0x0), b=0b0000 (0x0) -> cout=0, s=0b0000 (0x0)
  - normal and recovery: [11, 19] ns, vector n=1; a=0b0000 (0x0), b=0b0001 (0x1) -> cout=0, s=0b0001 (0x1)
  - normal and recovery: [1431, 1439] ns, vector n=143; a=0b1000 (0x8), b=0b1111 (0xf) -> cout=1, s=0b0111 (0x7)
  - normal and recovery: [2551, 2559] ns, vector n=255; a=0b1111 (0xf), b=0b1111 (0xf) -> cout=1, s=0b1110 (0xe)
  - intentional_failure: [11, 19] ns, vector n=1; expected 0x01, actual 0x1f; ends before fatal termination
- VCD timescale: normal/failure/recovery: 1ps

#### I. Board plan

- board_status: NOT_PERFORMED
- XDC pin mapping: a[3]->Y1; a[2]->W3; a[1]->U2; a[0]->T1; b[3]->W4; b[2]->W1; b[1]->V4; b[0]->U4; s[3]->M4; s[2]->M2; s[1]->N7; s[0]->M7; cout->L4; all ports LVCMOS33
- planned user inputs: Apply the representative input vectors in section D via the physical controls associated with the XDC input package pins, after verifying the board mapping and polarity.
- expected physical outputs: Design-level expected logic at output package pins follows section D. Actual LED/segment illumination is not inferred from package pins alone.
- verification method: Confirm board model, control-to-pin mapping, output polarity and segment/digit wiring; then apply planned vectors and record actual observations/photos/measurements against section D. This is a plan only.
- board model: UNKNOWN
- physical control/output mapping and polarity: UNKNOWN

#### J. Pre-report readiness

- design_information: READY
- expected_behavior: READY
- normal_simulation: READY
- intentional_failure: READY
- recovery: READY
- waveform_visual_evidence: MISSING
- board_plan: NEEDS_USER_CONFIRMATION
- experiment_readiness: NEEDS_USER_CONFIRMATION

Readiness scope: log-based results and history-based change descriptions are available. Student understanding/review, direct source commit linkage, physical mapping and visual evidence still require confirmation. All three preserved compile logs warn that design elements lack an explicit time unit/time precision.

##### Evidence SHA-256

| Role | File | SHA-256 | Matches original same-run file |
|---|---|---|---|
| normal | simulation.log | e08fb4865f0ad5c61284bd866676dfabf1a66c6d56d0d6a484d7fdbb64fbf0c4 | YES |
| normal | compile.log | c3a4bbb79d3a69e94ec0434eb0470b928e562c39bdcb73006f15ce1930c910b7 | YES |
| normal | wave.vcd | 09b32d3bdc8dbd9e4df2893350fcb85e67f396de6e0ebc384f2ed18ca49e9a2e | YES |
| intentional_failure | simulation.log | c9e387be6b83c285009b239612e7b67eb73e386957dbb98713dc529d0d032ec9 | YES |
| intentional_failure | compile.log | c3a4bbb79d3a69e94ec0434eb0470b928e562c39bdcb73006f15ce1930c910b7 | YES |
| intentional_failure | wave.vcd | 09d4d4dca8df5d72059f196a8924853db9d62eadf5305dfe8ced686be5a9a106 | YES |
| recovery | simulation.log | e08fb4865f0ad5c61284bd866676dfabf1a66c6d56d0d6a484d7fdbb64fbf0c4 | YES |
| recovery | compile.log | c3a4bbb79d3a69e94ec0434eb0470b928e562c39bdcb73006f15ce1930c910b7 | YES |
| recovery | wave.vcd | 19736fccba3c0addcd886c2b1a3fde97daf2cfbd4324bf153551e4443744fd30 | YES |

### 04_4bit_subtractor


#### A. Design identity

- experiment folder: LAB1/04_4bit_subtractor
- RTL file(s): LAB1/04_4bit_subtractor/src/sub_4bit.v
- RTL module(s): sub_4bit
- Design top: sub_4bit (derived from TB DUT instantiation; simulation.json does not define a design_top field)
- TB file: LAB1/04_4bit_subtractor/sim/tb_sub_4bit.sv
- Simulation top: tb_sub_4bit
- XDC file: LAB1/04_4bit_subtractor/constraints/sub_4bit.xdc
- simulation.json: LAB1/04_4bit_subtractor/simulation.json
- input ports: a, b
- output ports: d, bor
- port widths: a: 4 bit(s); b: 4 bit(s); d: 4 bit(s); bor: 1 bit(s)

#### B. Functional intent

d=(a-b) modulo 16; bor=(a<b). Equal operands do not borrow. Output packing {bor,d}.

#### C. Testbench verification

- applied input sequence or enumeration method: {a,b}=n, n=0..255; a=n//16, b=n%16
- number of test cases: 256
- interval per case: 10 ns (#10 with 1ns time unit; observation after the delay)
- total expected simulation time: 2560 ns for an uninterrupted PASS path
- expected calculation method: (((n/16)<(n%16))?16:0) | (((n/16)-(n%16))&15)
- DUT output compared against: {bor,d} compared to expected with !== (case inequality, including X/Z detection)
- PASS condition: All 256 comparisons pass; checked==256; LAB1_PASS with cases=256 is printed, then $finish
- FAIL condition: {bor,d} !== expected -> $fatal with vector/expected/actual; checked!=256 -> Incomplete test
- watchdog: At 100000 ns, $fatal(1, watchdog/Watchdog) if execution has not already ended
- code basis: LAB1/04_4bit_subtractor/sim/tb_sub_4bit.sv; timescale=1ns/1ps

#### D. Representative expected behavior

- source: AUTO_SELECTED_FROM_DESIGN

No experiment-specific representative vectors were found in the inspected repository README material. These are computed expectations, not board observations.

- input: vector n=0; a=0b0000 (0x0), b=0b0000 (0x0)
- expected output: bor=0, d=0b0000 (0x0)
- calculation/reason: 0-0 modulo 16; borrow=0

- input: vector n=1; a=0b0000 (0x0), b=0b0001 (0x1)
- expected output: bor=1, d=0b1111 (0xf)
- calculation/reason: 0-1 modulo 16; borrow=1

- input: vector n=240; a=0b1111 (0xf), b=0b0000 (0x0)
- expected output: bor=0, d=0b1111 (0xf)
- calculation/reason: 15-0 modulo 16; borrow=0

- input: vector n=255; a=0b1111 (0xf), b=0b1111 (0xf)
- expected output: bor=0, d=0b0000 (0x0)
- calculation/reason: 15-15 modulo 16; borrow=0

#### E. Normal simulation evidence

- run ID: run-816105e21bbd4d6cab19cedd6140ad91
- simulation.log path: evidence/vscode/LAB1/04_4bit_subtractor/normal__run-816105e21bbd4d6cab19cedd6140ad91/simulation.log
- compile.log path: evidence/vscode/LAB1/04_4bit_subtractor/normal__run-816105e21bbd4d6cab19cedd6140ad91/compile.log
- wave.vcd path: evidence/vscode/LAB1/04_4bit_subtractor/normal__run-816105e21bbd4d6cab19cedd6140ad91/wave.vcd
- PASS/FAIL: PASS
- cases: 256
- simulation end time: 2560 ns (log and final VCD timestamp agree)
- source commit: UNKNOWN
- evidence_integrity: VERIFIED_COPY

Copy integrity basis: SHA-256 recomputed for each preserved file and its original file in the exact same run; all three match. This confirms byte identity, not source review or run-to-commit identity.

#### F. Intentional failure

- run ID: run-13fbdfbd780a43b19a7da64e2165dc52
- RTL modification: bor: a<b -> a<=b
- predicted failing condition: n=0 gives a=b=0: modified comparator asserts borrow although equality must not borrow (calculated from the Git change and TB; a pre-run prediction record is not available)
- actual first failing vector: 0
- expected: 0x00
- actual: 0x10
- failure time: 10 ns (log interpreted using VCD timescale)
- simulation.log path: evidence/vscode/LAB1/04_4bit_subtractor/intentional_failure__run-13fbdfbd780a43b19a7da64e2165dc52/simulation.log
- wave.vcd path: evidence/vscode/LAB1/04_4bit_subtractor/intentional_failure__run-13fbdfbd780a43b19a7da64e2165dc52/wave.vcd
- source commit: UNKNOWN
- modification evidence: Git change commit d316eda, file LAB1/04_4bit_subtractor/src/sub_4bit.v; preserved FAIL log and VCD TB expected / packed DUT values agree. The run-specific historical RTL snapshot is not preserved here, so the exact run source identity is unconfirmed.

#### G. Recovery

- run ID: run-0bbbc6a5fb114175b9282372017875bc
- restored behavior: Strict borrow comparison a<b restored; Git restoration commit 4fab3b3; recovery role follows user selection
- PASS/FAIL: PASS
- cases: 256
- simulation end time: 2560 ns (log and final VCD timestamp agree)
- simulation.log path: evidence/vscode/LAB1/04_4bit_subtractor/recovery__run-0bbbc6a5fb114175b9282372017875bc/simulation.log
- wave.vcd path: evidence/vscode/LAB1/04_4bit_subtractor/recovery__run-0bbbc6a5fb114175b9282372017875bc/wave.vcd
- source commit: UNKNOWN

#### H. Waveform verification

- VCD_PRESENT: YES (normal, intentional_failure, recovery)
- VCD_RUN_TRACEABLE: YES (user-designated run IDs in evidence paths; VCD signals, timestamps and log outputs checked; this is not commit traceability)
- USER_VISUAL_CHECK: NOT_VERIFIED
- SCREENSHOT_PRESENT: NOT_AVAILABLE
- representative_intervals: Candidate intervals only, in ns; normal/recovery VCD values checked numerically at both ends of each interval. No visual verification is asserted.
  - normal and recovery: [1, 9] ns, vector n=0; a=0b0000 (0x0), b=0b0000 (0x0) -> bor=0, d=0b0000 (0x0)
  - normal and recovery: [11, 19] ns, vector n=1; a=0b0000 (0x0), b=0b0001 (0x1) -> bor=1, d=0b1111 (0xf)
  - normal and recovery: [2401, 2409] ns, vector n=240; a=0b1111 (0xf), b=0b0000 (0x0) -> bor=0, d=0b1111 (0xf)
  - normal and recovery: [2551, 2559] ns, vector n=255; a=0b1111 (0xf), b=0b1111 (0xf) -> bor=0, d=0b0000 (0x0)
  - intentional_failure: [1, 9] ns, vector n=0; expected 0x00, actual 0x10; ends before fatal termination
- VCD timescale: normal/failure/recovery: 1ps

#### I. Board plan

- board_status: NOT_PERFORMED
- XDC pin mapping: a[3]->Y1; a[2]->W3; a[1]->U2; a[0]->T1; b[3]->W4; b[2]->W1; b[1]->V4; b[0]->U4; d[3]->M4; d[2]->M2; d[1]->N7; d[0]->M7; bor->L4; all ports LVCMOS33
- planned user inputs: Apply the representative input vectors in section D via the physical controls associated with the XDC input package pins, after verifying the board mapping and polarity.
- expected physical outputs: Design-level expected logic at output package pins follows section D. Actual LED/segment illumination is not inferred from package pins alone.
- verification method: Confirm board model, control-to-pin mapping, output polarity and segment/digit wiring; then apply planned vectors and record actual observations/photos/measurements against section D. This is a plan only.
- board model: UNKNOWN
- physical control/output mapping and polarity: UNKNOWN

#### J. Pre-report readiness

- design_information: READY
- expected_behavior: READY
- normal_simulation: READY
- intentional_failure: READY
- recovery: READY
- waveform_visual_evidence: MISSING
- board_plan: NEEDS_USER_CONFIRMATION
- experiment_readiness: NEEDS_USER_CONFIRMATION

Readiness scope: log-based results and history-based change descriptions are available. Student understanding/review, direct source commit linkage, physical mapping and visual evidence still require confirmation. All three preserved compile logs warn that design elements lack an explicit time unit/time precision.

##### Evidence SHA-256

| Role | File | SHA-256 | Matches original same-run file |
|---|---|---|---|
| normal | simulation.log | 8111dca71e88dbfd6e52db93d0e7e0951dffa58fea0590ae00592b160948fbd9 | YES |
| normal | compile.log | cbd06c8e4fc8852a0aa8aaafb9acfb7a0ed518c659f2ccb311ae7c2f77ae6142 | YES |
| normal | wave.vcd | 1274cf4e6b51abcc2911d1b26317fe1ef0b0eb01bc96e224d4ed970e80d1e46c | YES |
| intentional_failure | simulation.log | 9a088a764d7940d13a84ac7dd5d49f724748918be8964b0580e5c4d5f6ad4296 | YES |
| intentional_failure | compile.log | cbd06c8e4fc8852a0aa8aaafb9acfb7a0ed518c659f2ccb311ae7c2f77ae6142 | YES |
| intentional_failure | wave.vcd | 4ecf37d4fcc0d5161689e9ac860fe97a13e07ac792f878e2482f961d0521e223 | YES |
| recovery | simulation.log | 8111dca71e88dbfd6e52db93d0e7e0951dffa58fea0590ae00592b160948fbd9 | YES |
| recovery | compile.log | cbd06c8e4fc8852a0aa8aaafb9acfb7a0ed518c659f2ccb311ae7c2f77ae6142 | YES |
| recovery | wave.vcd | fce461d5b59c830c07e489f26e70318cdff889fcd8e5d7aa2534486ecad3205f | YES |

### 05_4bit_comparator


#### A. Design identity

- experiment folder: LAB1/05_4bit_comparator
- RTL file(s): LAB1/05_4bit_comparator/src/compare_4.v
- RTL module(s): compare_4
- Design top: compare_4 (derived from TB DUT instantiation; simulation.json does not define a design_top field)
- TB file: LAB1/05_4bit_comparator/sim/tb_compare_4.sv
- Simulation top: tb_compare_4
- XDC file: LAB1/05_4bit_comparator/constraints/compare_4.xdc
- simulation.json: LAB1/05_4bit_comparator/simulation.json
- input ports: a, b
- output ports: o
- port widths: a: 4 bit(s); b: 4 bit(s); o: 3 bit(s)

#### B. Functional intent

Unsigned comparison: o[2]=a>b; o[1]=a==b; o[0]=a<b. Exactly one comparison bit is high for binary inputs.

#### C. Testbench verification

- applied input sequence or enumeration method: {a,b}=n, n=0..255; a=n//16, b=n%16
- number of test cases: 256
- interval per case: 10 ns (#10 with 1ns time unit; observation after the delay)
- total expected simulation time: 2560 ns for an uninterrupted PASS path
- expected calculation method: a>b ? 4 : (a==b ? 2 : 1)
- DUT output compared against: o compared to expected with !== (case inequality, including X/Z detection)
- PASS condition: All 256 comparisons pass; checked==256; LAB1_PASS with cases=256 is printed, then $finish
- FAIL condition: o !== expected -> $fatal with vector/expected/actual; checked!=256 -> Incomplete test
- watchdog: At 100000 ns, $fatal(1, watchdog/Watchdog) if execution has not already ended
- code basis: LAB1/05_4bit_comparator/sim/tb_compare_4.sv; timescale=1ns/1ps

#### D. Representative expected behavior

- source: AUTO_SELECTED_FROM_DESIGN

No experiment-specific representative vectors were found in the inspected repository README material. These are computed expectations, not board observations.

- input: vector n=0; a=0b0000 (0x0), b=0b0000 (0x0)
- expected output: o=0b010 (0x2)
- calculation/reason: o[2:0]={greater,equal,less}

- input: vector n=1; a=0b0000 (0x0), b=0b0001 (0x1)
- expected output: o=0b001 (0x1)
- calculation/reason: o[2:0]={greater,equal,less}

- input: vector n=240; a=0b1111 (0xf), b=0b0000 (0x0)
- expected output: o=0b100 (0x4)
- calculation/reason: o[2:0]={greater,equal,less}

- input: vector n=255; a=0b1111 (0xf), b=0b1111 (0xf)
- expected output: o=0b010 (0x2)
- calculation/reason: o[2:0]={greater,equal,less}

#### E. Normal simulation evidence

- run ID: run-618a491854d44f08bf315a212d9c6758
- simulation.log path: evidence/vscode/LAB1/05_4bit_comparator/normal__run-618a491854d44f08bf315a212d9c6758/simulation.log
- compile.log path: evidence/vscode/LAB1/05_4bit_comparator/normal__run-618a491854d44f08bf315a212d9c6758/compile.log
- wave.vcd path: evidence/vscode/LAB1/05_4bit_comparator/normal__run-618a491854d44f08bf315a212d9c6758/wave.vcd
- PASS/FAIL: PASS
- cases: 256
- simulation end time: 2560 ns (log and final VCD timestamp agree)
- source commit: UNKNOWN
- evidence_integrity: VERIFIED_COPY

Copy integrity basis: SHA-256 recomputed for each preserved file and its original file in the exact same run; all three match. This confirms byte identity, not source review or run-to-commit identity.

#### F. Intentional failure

- run ID: run-ed6afd5d6ae749688a11f31b8a5bdc58
- RTL modification: o[1]: a==b -> a!=b
- predicted failing condition: n=0 gives a=b=0: equality output becomes 0; correct packed output is 0x2 (calculated from the Git change and TB; a pre-run prediction record is not available)
- actual first failing vector: 0
- expected: 0x2
- actual: 0x0
- failure time: 10 ns (log interpreted using VCD timescale)
- simulation.log path: evidence/vscode/LAB1/05_4bit_comparator/intentional_failure__run-ed6afd5d6ae749688a11f31b8a5bdc58/simulation.log
- wave.vcd path: evidence/vscode/LAB1/05_4bit_comparator/intentional_failure__run-ed6afd5d6ae749688a11f31b8a5bdc58/wave.vcd
- source commit: UNKNOWN
- modification evidence: Git change commit 0f5935a, file LAB1/05_4bit_comparator/src/compare_4.v; preserved FAIL log and VCD TB expected / packed DUT values agree. The run-specific historical RTL snapshot is not preserved here, so the exact run source identity is unconfirmed.

#### G. Recovery

- run ID: run-7cfa2f167dd443ab817fc9d2094f56dc
- restored behavior: Equality comparison a==b restored; Git restoration commit 1cc1837; recovery role follows user selection
- PASS/FAIL: PASS
- cases: 256
- simulation end time: 2560 ns (log and final VCD timestamp agree)
- simulation.log path: evidence/vscode/LAB1/05_4bit_comparator/recovery__run-7cfa2f167dd443ab817fc9d2094f56dc/simulation.log
- wave.vcd path: evidence/vscode/LAB1/05_4bit_comparator/recovery__run-7cfa2f167dd443ab817fc9d2094f56dc/wave.vcd
- source commit: UNKNOWN

#### H. Waveform verification

- VCD_PRESENT: YES (normal, intentional_failure, recovery)
- VCD_RUN_TRACEABLE: YES (user-designated run IDs in evidence paths; VCD signals, timestamps and log outputs checked; this is not commit traceability)
- USER_VISUAL_CHECK: NOT_VERIFIED
- SCREENSHOT_PRESENT: NOT_AVAILABLE
- representative_intervals: Candidate intervals only, in ns; normal/recovery VCD values checked numerically at both ends of each interval. No visual verification is asserted.
  - normal and recovery: [1, 9] ns, vector n=0; a=0b0000 (0x0), b=0b0000 (0x0) -> o=0b010 (0x2)
  - normal and recovery: [11, 19] ns, vector n=1; a=0b0000 (0x0), b=0b0001 (0x1) -> o=0b001 (0x1)
  - normal and recovery: [2401, 2409] ns, vector n=240; a=0b1111 (0xf), b=0b0000 (0x0) -> o=0b100 (0x4)
  - normal and recovery: [2551, 2559] ns, vector n=255; a=0b1111 (0xf), b=0b1111 (0xf) -> o=0b010 (0x2)
  - intentional_failure: [1, 9] ns, vector n=0; expected 0x2, actual 0x0; ends before fatal termination
- VCD timescale: normal/failure/recovery: 1ps

#### I. Board plan

- board_status: NOT_PERFORMED
- XDC pin mapping: a[3]->Y1; a[2]->W3; a[1]->U2; a[0]->T1; b[3]->W4; b[2]->W1; b[1]->V4; b[0]->U4; o[2]->L4; o[1]->M4; o[0]->M2; all ports LVCMOS33
- planned user inputs: Apply the representative input vectors in section D via the physical controls associated with the XDC input package pins, after verifying the board mapping and polarity.
- expected physical outputs: Design-level expected logic at output package pins follows section D. Actual LED/segment illumination is not inferred from package pins alone.
- verification method: Confirm board model, control-to-pin mapping, output polarity and segment/digit wiring; then apply planned vectors and record actual observations/photos/measurements against section D. This is a plan only.
- board model: UNKNOWN
- physical control/output mapping and polarity: UNKNOWN

#### J. Pre-report readiness

- design_information: READY
- expected_behavior: READY
- normal_simulation: READY
- intentional_failure: READY
- recovery: READY
- waveform_visual_evidence: MISSING
- board_plan: NEEDS_USER_CONFIRMATION
- experiment_readiness: NEEDS_USER_CONFIRMATION

Readiness scope: log-based results and history-based change descriptions are available. Student understanding/review, direct source commit linkage, physical mapping and visual evidence still require confirmation. All three preserved compile logs warn that design elements lack an explicit time unit/time precision.

##### Evidence SHA-256

| Role | File | SHA-256 | Matches original same-run file |
|---|---|---|---|
| normal | simulation.log | 56aae9cdd9b366b633b3503c559811b920db7b05b9d4dee6254b49331ef67519 | YES |
| normal | compile.log | 9e413b8dc19d36facf4f81e4842118743fe8dd6eb837e69eaf374125e09957c3 | YES |
| normal | wave.vcd | 94bfb722bfd0841b54f93d709c3dac5ba253dfea1c91ee2f04a31efa49632a79 | YES |
| intentional_failure | simulation.log | 74401831240e65e95b0d6f9e7d8eb8c53f60091e18fa132289910b7f1de8e2d5 | YES |
| intentional_failure | compile.log | 9e413b8dc19d36facf4f81e4842118743fe8dd6eb837e69eaf374125e09957c3 | YES |
| intentional_failure | wave.vcd | 0795b4d6a1b5d534c9ee30e79d01577cd958172e709dbab834a76cef586248f5 | YES |
| recovery | simulation.log | 56aae9cdd9b366b633b3503c559811b920db7b05b9d4dee6254b49331ef67519 | YES |
| recovery | compile.log | 9e413b8dc19d36facf4f81e4842118743fe8dd6eb837e69eaf374125e09957c3 | YES |
| recovery | wave.vcd | a1b6218c0a6c371db23cd23274783cdad8d63dd1dc865f8e233909f70a4f3d6f | YES |

### 06_mux


#### A. Design identity

- experiment folder: LAB1/06_mux
- RTL file(s): LAB1/06_mux/src/mux_4x1.v
- RTL module(s): mux_4x1
- Design top: mux_4x1 (derived from TB DUT instantiation; simulation.json does not define a design_top field)
- TB file: LAB1/06_mux/sim/tb_mux_4x1.sv
- Simulation top: tb_mux_4x1
- XDC file: LAB1/06_mux/constraints/mux_4x1.xdc
- simulation.json: LAB1/06_mux/simulation.json
- input ports: i, s
- output ports: z
- port widths: i: 4 bit(s); s: 2 bit(s); z: 1 bit(s)

#### B. Functional intent

z=i[3-s]. s=00,01,10,11 selects i[3],i[2],i[1],i[0], respectively.

#### C. Testbench verification

- applied input sequence or enumeration method: {i,s}=n, n=0..63; i=n//4, s=n%4
- number of test cases: 64
- interval per case: 10 ns (#10 with 1ns time unit; observation after the delay)
- total expected simulation time: 640 ns for an uninterrupted PASS path
- expected calculation method: ((n/4)>>(3-(n%4)))&1
- DUT output compared against: z compared to expected with !== (case inequality, including X/Z detection)
- PASS condition: All 64 comparisons pass; checked==64; LAB1_PASS with cases=64 is printed, then $finish
- FAIL condition: z !== expected -> $fatal with vector/expected/actual; checked!=64 -> Incomplete test
- watchdog: At 100000 ns, $fatal(1, watchdog/Watchdog) if execution has not already ended
- code basis: LAB1/06_mux/sim/tb_mux_4x1.sv; timescale=1ns/1ps

#### D. Representative expected behavior

- source: AUTO_SELECTED_FROM_DESIGN

No experiment-specific representative vectors were found in the inspected repository README material. These are computed expectations, not board observations.

- input: vector n=4; i=0b0001 (0x1), s=0b00 (0x0)
- expected output: z=0
- calculation/reason: Select i[3]

- input: vector n=6; i=0b0001 (0x1), s=0b10 (0x2)
- expected output: z=0
- calculation/reason: Select i[1]

- input: vector n=32; i=0b1000 (0x8), s=0b00 (0x0)
- expected output: z=1
- calculation/reason: Select i[3]

- input: vector n=35; i=0b1000 (0x8), s=0b11 (0x3)
- expected output: z=0
- calculation/reason: Select i[0]

#### E. Normal simulation evidence

- run ID: run-36f7a5d8e67244aab57bbea64d2a5076
- simulation.log path: evidence/vscode/LAB1/06_mux/normal__run-36f7a5d8e67244aab57bbea64d2a5076/simulation.log
- compile.log path: evidence/vscode/LAB1/06_mux/normal__run-36f7a5d8e67244aab57bbea64d2a5076/compile.log
- wave.vcd path: evidence/vscode/LAB1/06_mux/normal__run-36f7a5d8e67244aab57bbea64d2a5076/wave.vcd
- PASS/FAIL: PASS
- cases: 64
- simulation end time: 640 ns (log and final VCD timestamp agree)
- source commit: UNKNOWN
- evidence_integrity: VERIFIED_COPY

Copy integrity basis: SHA-256 recomputed for each preserved file and its original file in the exact same run; all three match. This confirms byte identity, not source review or run-to-commit identity.

#### F. Intentional failure

- run ID: run-48e62e48ea2b4365ad925d30a2b3fad9
- RTL modification: z: i[3-s] -> i[s]
- predicted failing condition: First mismatch n=4 gives i=0001,s=00: correct i[3]=0; modified i[0]=1 (calculated from the Git change and TB; a pre-run prediction record is not available)
- actual first failing vector: 4
- expected: 0x0
- actual: 0x1
- failure time: 50 ns (log interpreted using VCD timescale)
- simulation.log path: evidence/vscode/LAB1/06_mux/intentional_failure__run-48e62e48ea2b4365ad925d30a2b3fad9/simulation.log
- wave.vcd path: evidence/vscode/LAB1/06_mux/intentional_failure__run-48e62e48ea2b4365ad925d30a2b3fad9/wave.vcd
- source commit: UNKNOWN
- modification evidence: Git change commit dae49fb, file LAB1/06_mux/src/mux_4x1.v; preserved FAIL log and VCD TB expected / packed DUT values agree. The run-specific historical RTL snapshot is not preserved here, so the exact run source identity is unconfirmed.

#### G. Recovery

- run ID: run-57775dd875df4406ad71c9033c956b9b
- restored behavior: Reversed bit-selection order i[3-s] restored; Git restoration commit 685849c; recovery role follows user selection
- PASS/FAIL: PASS
- cases: 64
- simulation end time: 640 ns (log and final VCD timestamp agree)
- simulation.log path: evidence/vscode/LAB1/06_mux/recovery__run-57775dd875df4406ad71c9033c956b9b/simulation.log
- wave.vcd path: evidence/vscode/LAB1/06_mux/recovery__run-57775dd875df4406ad71c9033c956b9b/wave.vcd
- source commit: UNKNOWN

#### H. Waveform verification

- VCD_PRESENT: YES (normal, intentional_failure, recovery)
- VCD_RUN_TRACEABLE: YES (user-designated run IDs in evidence paths; VCD signals, timestamps and log outputs checked; this is not commit traceability)
- USER_VISUAL_CHECK: NOT_VERIFIED
- SCREENSHOT_PRESENT: NOT_AVAILABLE
- representative_intervals: Candidate intervals only, in ns; normal/recovery VCD values checked numerically at both ends of each interval. No visual verification is asserted.
  - normal and recovery: [41, 49] ns, vector n=4; i=0b0001 (0x1), s=0b00 (0x0) -> z=0
  - normal and recovery: [61, 69] ns, vector n=6; i=0b0001 (0x1), s=0b10 (0x2) -> z=0
  - normal and recovery: [321, 329] ns, vector n=32; i=0b1000 (0x8), s=0b00 (0x0) -> z=1
  - normal and recovery: [351, 359] ns, vector n=35; i=0b1000 (0x8), s=0b11 (0x3) -> z=0
  - intentional_failure: [41, 49] ns, vector n=4; expected 0x0, actual 0x1; ends before fatal termination
- VCD timescale: normal/failure/recovery: 1ps

#### I. Board plan

- board_status: NOT_PERFORMED
- XDC pin mapping: i[3]->K4; i[2]->N8; i[1]->N4; i[0]->N1; s[1]->Y1; s[0]->W3; z->L4; all ports LVCMOS33
- planned user inputs: Apply the representative input vectors in section D via the physical controls associated with the XDC input package pins, after verifying the board mapping and polarity.
- expected physical outputs: Design-level expected logic at output package pins follows section D. Actual LED/segment illumination is not inferred from package pins alone.
- verification method: Confirm board model, control-to-pin mapping, output polarity and segment/digit wiring; then apply planned vectors and record actual observations/photos/measurements against section D. This is a plan only.
- board model: UNKNOWN
- physical control/output mapping and polarity: UNKNOWN

#### J. Pre-report readiness

- design_information: READY
- expected_behavior: READY
- normal_simulation: READY
- intentional_failure: READY
- recovery: READY
- waveform_visual_evidence: MISSING
- board_plan: NEEDS_USER_CONFIRMATION
- experiment_readiness: NEEDS_USER_CONFIRMATION

Readiness scope: log-based results and history-based change descriptions are available. Student understanding/review, direct source commit linkage, physical mapping and visual evidence still require confirmation. All three preserved compile logs warn that design elements lack an explicit time unit/time precision.

##### Evidence SHA-256

| Role | File | SHA-256 | Matches original same-run file |
|---|---|---|---|
| normal | simulation.log | 006bb959c632e3a678c7c4b5b078c9b28b9a9a3421ea3ad1e3ceb09dc2ac7981 | YES |
| normal | compile.log | c9bfbefa8e8ea338d8849b1eaec3b8cf9ac5d2d64e03191e6ec8ba2b4ab93dd8 | YES |
| normal | wave.vcd | 8e4a1afb6cad4734c2ed680339e3f332179116bbfadbf2974299a0082e10b042 | YES |
| intentional_failure | simulation.log | 8e08548558196bb75f5081a962c0c58b32ff2030a581df71ed073e3347106314 | YES |
| intentional_failure | compile.log | c9bfbefa8e8ea338d8849b1eaec3b8cf9ac5d2d64e03191e6ec8ba2b4ab93dd8 | YES |
| intentional_failure | wave.vcd | 27fe76b3c1a919e620252360e3f39aa3d2044b235fecef8acbb5f4d0e5d131e6 | YES |
| recovery | simulation.log | 006bb959c632e3a678c7c4b5b078c9b28b9a9a3421ea3ad1e3ceb09dc2ac7981 | YES |
| recovery | compile.log | c9bfbefa8e8ea338d8849b1eaec3b8cf9ac5d2d64e03191e6ec8ba2b4ab93dd8 | YES |
| recovery | wave.vcd | 9fe41cc38393fbb44be7c147ab823856f49e73e169c812ae089c268ba54e9410 | YES |

### 07_demux


#### A. Design identity

- experiment folder: LAB1/07_demux
- RTL file(s): LAB1/07_demux/src/demux_1x8.v
- RTL module(s): demux_1x8
- Design top: demux_1x8 (derived from TB DUT instantiation; simulation.json does not define a design_top field)
- TB file: LAB1/07_demux/sim/tb_demux_1x8.sv
- Simulation top: tb_demux_1x8
- XDC file: LAB1/07_demux/constraints/demux_1x8.xdc
- simulation.json: LAB1/07_demux/simulation.json
- input ports: i, s
- output ports: o
- port widths: i: 1 bit(s); s: 3 bit(s); o: 8 bit(s)

#### B. Functional intent

o=i ? (8'b10000000>>s) : 0. s=000 selects o[7]; s=111 selects o[0]. i=0 clears all outputs.

#### C. Testbench verification

- applied input sequence or enumeration method: {i,s}=n, n=0..15; i=n//8, s=n%8
- number of test cases: 16
- interval per case: 10 ns (#10 with 1ns time unit; observation after the delay)
- total expected simulation time: 160 ns for an uninterrupted PASS path
- expected calculation method: n>=8 ? (128>>(n%8)) : 0
- DUT output compared against: o compared to expected with !== (case inequality, including X/Z detection)
- PASS condition: All 16 comparisons pass; checked==16; LAB1_PASS with cases=16 is printed, then $finish
- FAIL condition: o !== expected -> $fatal with vector/expected/actual; checked!=16 -> Incomplete test
- watchdog: At 100000 ns, $fatal(1, watchdog/Watchdog) if execution has not already ended
- code basis: LAB1/07_demux/sim/tb_demux_1x8.sv; timescale=1ns/1ps

#### D. Representative expected behavior

- source: AUTO_SELECTED_FROM_DESIGN

No experiment-specific representative vectors were found in the inspected repository README material. These are computed expectations, not board observations.

- input: vector n=0; i=0, s=0b000 (0x0)
- expected output: o=0b00000000 (0x0)
- calculation/reason: Input 0 clears output; input 1 selects o[7-s]

- input: vector n=8; i=1, s=0b000 (0x0)
- expected output: o=0b10000000 (0x80)
- calculation/reason: Input 0 clears output; input 1 selects o[7-s]

- input: vector n=9; i=1, s=0b001 (0x1)
- expected output: o=0b01000000 (0x40)
- calculation/reason: Input 0 clears output; input 1 selects o[7-s]

- input: vector n=15; i=1, s=0b111 (0x7)
- expected output: o=0b00000001 (0x1)
- calculation/reason: Input 0 clears output; input 1 selects o[7-s]

#### E. Normal simulation evidence

- run ID: run-bfb14fddf74e45cc96657c160ae52673
- simulation.log path: evidence/vscode/LAB1/07_demux/normal__run-bfb14fddf74e45cc96657c160ae52673/simulation.log
- compile.log path: evidence/vscode/LAB1/07_demux/normal__run-bfb14fddf74e45cc96657c160ae52673/compile.log
- wave.vcd path: evidence/vscode/LAB1/07_demux/normal__run-bfb14fddf74e45cc96657c160ae52673/wave.vcd
- PASS/FAIL: PASS
- cases: 16
- simulation end time: 160 ns (log and final VCD timestamp agree)
- source commit: UNKNOWN
- evidence_integrity: VERIFIED_COPY

Copy integrity basis: SHA-256 recomputed for each preserved file and its original file in the exact same run; all three match. This confirms byte identity, not source review or run-to-commit identity.

#### F. Intentional failure

- run ID: run-db0d2d9924cb4fe0aa36fcbc7a454e35
- RTL modification: Shift operation: right shift -> left shift
- predicted failing condition: n=9 gives i=1,s=001: correct 0x40; 8-bit left shift discards the set bit and gives 0x00 (calculated from the Git change and TB; a pre-run prediction record is not available)
- actual first failing vector: 9
- expected: 0x40
- actual: 0x00
- failure time: 100 ns (log interpreted using VCD timescale)
- simulation.log path: evidence/vscode/LAB1/07_demux/intentional_failure__run-db0d2d9924cb4fe0aa36fcbc7a454e35/simulation.log
- wave.vcd path: evidence/vscode/LAB1/07_demux/intentional_failure__run-db0d2d9924cb4fe0aa36fcbc7a454e35/wave.vcd
- source commit: UNKNOWN
- modification evidence: Git change commit 70155b7, file LAB1/07_demux/src/demux_1x8.v; preserved FAIL log and VCD TB expected / packed DUT values agree. The run-specific historical RTL snapshot is not preserved here, so the exact run source identity is unconfirmed.

#### G. Recovery

- run ID: run-8d10b461d9ec4762ba051885e020afaf
- restored behavior: Right-shift output ordering restored; Git restoration commit 07e4a29; recovery role follows user selection
- PASS/FAIL: PASS
- cases: 16
- simulation end time: 160 ns (log and final VCD timestamp agree)
- simulation.log path: evidence/vscode/LAB1/07_demux/recovery__run-8d10b461d9ec4762ba051885e020afaf/simulation.log
- wave.vcd path: evidence/vscode/LAB1/07_demux/recovery__run-8d10b461d9ec4762ba051885e020afaf/wave.vcd
- source commit: UNKNOWN

#### H. Waveform verification

- VCD_PRESENT: YES (normal, intentional_failure, recovery)
- VCD_RUN_TRACEABLE: YES (user-designated run IDs in evidence paths; VCD signals, timestamps and log outputs checked; this is not commit traceability)
- USER_VISUAL_CHECK: NOT_VERIFIED
- SCREENSHOT_PRESENT: NOT_AVAILABLE
- representative_intervals: Candidate intervals only, in ns; normal/recovery VCD values checked numerically at both ends of each interval. No visual verification is asserted.
  - normal and recovery: [1, 9] ns, vector n=0; i=0, s=0b000 (0x0) -> o=0b00000000 (0x0)
  - normal and recovery: [81, 89] ns, vector n=8; i=1, s=0b000 (0x0) -> o=0b10000000 (0x80)
  - normal and recovery: [91, 99] ns, vector n=9; i=1, s=0b001 (0x1) -> o=0b01000000 (0x40)
  - normal and recovery: [151, 159] ns, vector n=15; i=1, s=0b111 (0x7) -> o=0b00000001 (0x1)
  - intentional_failure: [91, 99] ns, vector n=9; expected 0x40, actual 0x00; ends before fatal termination
- VCD timescale: normal/failure/recovery: 1ps

#### I. Board plan

- board_status: NOT_PERFORMED
- XDC pin mapping: i->K4; s[2]->Y1; s[1]->W3; s[0]->U2; o[7]->L4; o[6]->M4; o[5]->M2; o[4]->N7; o[3]->M7; o[2]->M3; o[1]->M1; o[0]->N5; all ports LVCMOS33
- planned user inputs: Apply the representative input vectors in section D via the physical controls associated with the XDC input package pins, after verifying the board mapping and polarity.
- expected physical outputs: Design-level expected logic at output package pins follows section D. Actual LED/segment illumination is not inferred from package pins alone.
- verification method: Confirm board model, control-to-pin mapping, output polarity and segment/digit wiring; then apply planned vectors and record actual observations/photos/measurements against section D. This is a plan only.
- board model: UNKNOWN
- physical control/output mapping and polarity: UNKNOWN

#### J. Pre-report readiness

- design_information: READY
- expected_behavior: READY
- normal_simulation: READY
- intentional_failure: READY
- recovery: READY
- waveform_visual_evidence: MISSING
- board_plan: NEEDS_USER_CONFIRMATION
- experiment_readiness: NEEDS_USER_CONFIRMATION

Readiness scope: log-based results and history-based change descriptions are available. Student understanding/review, direct source commit linkage, physical mapping and visual evidence still require confirmation. All three preserved compile logs warn that design elements lack an explicit time unit/time precision.

##### Evidence SHA-256

| Role | File | SHA-256 | Matches original same-run file |
|---|---|---|---|
| normal | simulation.log | b49720036a41e4f403f972b81b47a9bc30e6923e80f5fb59e1f2a721b51333b9 | YES |
| normal | compile.log | 8282ea25b1989968563a0d346e05d8f8867cfd218e4f33bcd97d5643554b61b2 | YES |
| normal | wave.vcd | 50c9a9ecdacdebb041dca134c53505aa9e4e2f22b13e82d9577a0f2208ebbc90 | YES |
| intentional_failure | simulation.log | 3bd6052b26855e13431307244a184605b6512d58c4b9b40ad39fe11a2e20f58e | YES |
| intentional_failure | compile.log | 8282ea25b1989968563a0d346e05d8f8867cfd218e4f33bcd97d5643554b61b2 | YES |
| intentional_failure | wave.vcd | 82c9a5b85c06e1c57c1cdab1e7a196265d4c19893ee17f7bab53ae5bee051562 | YES |
| recovery | simulation.log | b49720036a41e4f403f972b81b47a9bc30e6923e80f5fb59e1f2a721b51333b9 | YES |
| recovery | compile.log | 8282ea25b1989968563a0d346e05d8f8867cfd218e4f33bcd97d5643554b61b2 | YES |
| recovery | wave.vcd | f08ae5138bf7fe19f142e585cffbe70dbf97ec228bbd8c5de97c075bc1aeb870 | YES |

### 08_encoder


#### A. Design identity

- experiment folder: LAB1/08_encoder
- RTL file(s): LAB1/08_encoder/src/encoder8x3.v
- RTL module(s): encoder8x3
- Design top: encoder8x3 (derived from TB DUT instantiation; simulation.json does not define a design_top field)
- TB file: LAB1/08_encoder/sim/tb_encoder8x3.sv
- Simulation top: tb_encoder8x3
- XDC file: LAB1/08_encoder/constraints/encoder8x3.xdc
- simulation.json: LAB1/08_encoder/simulation.json
- input ports: i
- output ports: a
- port widths: i: 8 bit(s); a: 3 bit(s)

#### B. Functional intent

One-hot encoder: i=80,40,20,10,08,04,02,01 (hex) maps to a=0..7. Zero and multi-hot inputs return 000. This is not a priority encoder.

#### C. Testbench verification

- applied input sequence or enumeration method: i=n, n=0..255
- number of test cases: 256
- interval per case: 10 ns (#10 with 1ns time unit; observation after the delay)
- total expected simulation time: 2560 ns for an uninterrupted PASS path
- expected calculation method: Start expected=0; for k=0..7, if n==(128>>k), expected=k
- DUT output compared against: a compared to expected with !== (case inequality, including X/Z detection)
- PASS condition: All 256 comparisons pass; checked==256; LAB1_PASS with cases=256 is printed, then $finish
- FAIL condition: a !== expected -> $fatal with vector/expected/actual; checked!=256 -> Incomplete test
- watchdog: At 100000 ns, $fatal(1, watchdog/Watchdog) if execution has not already ended
- code basis: LAB1/08_encoder/sim/tb_encoder8x3.sv; timescale=1ns/1ns

#### D. Representative expected behavior

- source: AUTO_SELECTED_FROM_DESIGN

No experiment-specific representative vectors were found in the inspected repository README material. These are computed expectations, not board observations.

- input: vector n=0; i=0b00000000 (0x0)
- expected output: a=0b000 (0x0)
- calculation/reason: One-hot table; zero/multi-hot default to 000

- input: vector n=1; i=0b00000001 (0x1)
- expected output: a=0b111 (0x7)
- calculation/reason: One-hot table; zero/multi-hot default to 000

- input: vector n=3; i=0b00000011 (0x3)
- expected output: a=0b000 (0x0)
- calculation/reason: One-hot table; zero/multi-hot default to 000

- input: vector n=128; i=0b10000000 (0x80)
- expected output: a=0b000 (0x0)
- calculation/reason: One-hot table; zero/multi-hot default to 000

#### E. Normal simulation evidence

- run ID: run-c192938f32594b7bb22427b71cf14ef1
- simulation.log path: evidence/vscode/LAB1/08_encoder/normal__run-c192938f32594b7bb22427b71cf14ef1/simulation.log
- compile.log path: evidence/vscode/LAB1/08_encoder/normal__run-c192938f32594b7bb22427b71cf14ef1/compile.log
- wave.vcd path: evidence/vscode/LAB1/08_encoder/normal__run-c192938f32594b7bb22427b71cf14ef1/wave.vcd
- PASS/FAIL: PASS
- cases: 256
- simulation end time: 2560 ns (log and final VCD timestamp agree)
- source commit: UNKNOWN
- evidence_integrity: VERIFIED_COPY

Copy integrity basis: SHA-256 recomputed for each preserved file and its original file in the exact same run; all three match. This confirms byte identity, not source review or run-to-commit identity.

#### F. Intentional failure

- run ID: run-86de81e9d439420494915ca07b464d53
- RTL modification: Mapping for i=0x01: a=7 -> a=6
- predicted failing condition: n=1 gives i=0x01: expected a=7; modified mapping gives a=6 (calculated from the Git change and TB; a pre-run prediction record is not available)
- actual first failing vector: 1
- expected: 0x7
- actual: 0x6
- failure time: 20 ns (log interpreted using VCD timescale)
- simulation.log path: evidence/vscode/LAB1/08_encoder/intentional_failure__run-86de81e9d439420494915ca07b464d53/simulation.log
- wave.vcd path: evidence/vscode/LAB1/08_encoder/intentional_failure__run-86de81e9d439420494915ca07b464d53/wave.vcd
- source commit: UNKNOWN
- modification evidence: Git change commit 521acca, file LAB1/08_encoder/src/encoder8x3.v; preserved FAIL log and VCD TB expected / packed DUT values agree. The run-specific historical RTL snapshot is not preserved here, so the exact run source identity is unconfirmed.

#### G. Recovery

- run ID: run-aec4953651124a6990cecdc3b1c2c0ea
- restored behavior: i=0x01 mapping to a=7 restored; Git restoration commit 26c0419; recovery role follows user selection
- PASS/FAIL: PASS
- cases: 256
- simulation end time: 2560 ns (log and final VCD timestamp agree)
- simulation.log path: evidence/vscode/LAB1/08_encoder/recovery__run-aec4953651124a6990cecdc3b1c2c0ea/simulation.log
- wave.vcd path: evidence/vscode/LAB1/08_encoder/recovery__run-aec4953651124a6990cecdc3b1c2c0ea/wave.vcd
- source commit: UNKNOWN

#### H. Waveform verification

- VCD_PRESENT: YES (normal, intentional_failure, recovery)
- VCD_RUN_TRACEABLE: YES (user-designated run IDs in evidence paths; VCD signals, timestamps and log outputs checked; this is not commit traceability)
- USER_VISUAL_CHECK: NOT_VERIFIED
- SCREENSHOT_PRESENT: NOT_AVAILABLE
- representative_intervals: Candidate intervals only, in ns; normal/recovery VCD values checked numerically at both ends of each interval. No visual verification is asserted.
  - normal and recovery: [1, 9] ns, vector n=0; i=0b00000000 (0x0) -> a=0b000 (0x0)
  - normal and recovery: [11, 19] ns, vector n=1; i=0b00000001 (0x1) -> a=0b111 (0x7)
  - normal and recovery: [31, 39] ns, vector n=3; i=0b00000011 (0x3) -> a=0b000 (0x0)
  - normal and recovery: [1281, 1289] ns, vector n=128; i=0b10000000 (0x80) -> a=0b000 (0x0)
  - intentional_failure: [11, 19] ns, vector n=1; expected 0x7, actual 0x6; ends before fatal termination
- VCD timescale: normal/failure/recovery: 1ns

#### I. Board plan

- board_status: NOT_PERFORMED
- XDC pin mapping: i[7]->K4; i[6]->N8; i[5]->N4; i[4]->N1; i[3]->P6; i[2]->N6; i[1]->L5; i[0]->J2; a[2]->L4; a[1]->M4; a[0]->M2; all ports LVCMOS33; DRIVE=12 for a[0]
- planned user inputs: Apply the representative input vectors in section D via the physical controls associated with the XDC input package pins, after verifying the board mapping and polarity.
- expected physical outputs: Design-level expected logic at output package pins follows section D. Actual LED/segment illumination is not inferred from package pins alone.
- verification method: Confirm board model, control-to-pin mapping, output polarity and segment/digit wiring; then apply planned vectors and record actual observations/photos/measurements against section D. This is a plan only.
- board model: UNKNOWN
- physical control/output mapping and polarity: UNKNOWN

#### J. Pre-report readiness

- design_information: READY
- expected_behavior: READY
- normal_simulation: READY
- intentional_failure: READY
- recovery: READY
- waveform_visual_evidence: MISSING
- board_plan: NEEDS_USER_CONFIRMATION
- experiment_readiness: NEEDS_USER_CONFIRMATION

Readiness scope: log-based results and history-based change descriptions are available. Student understanding/review, direct source commit linkage, physical mapping and visual evidence still require confirmation. All three preserved compile logs warn that design elements lack an explicit time unit/time precision.

##### Evidence SHA-256

| Role | File | SHA-256 | Matches original same-run file |
|---|---|---|---|
| normal | simulation.log | 1bb4da6322171d2b0181088fa49b0ee9d5f0062be6637a57c65de7dfa68c1f5a | YES |
| normal | compile.log | 6b377431e787c81d195296991f14287cb9e3f5012e9bbcad5db72fe0994acced | YES |
| normal | wave.vcd | 5093442dc395af65303f62e683a4a6df8715bfcc48652d6ff6d24275a59059c4 | YES |
| intentional_failure | simulation.log | a3defb3819b4c89b1d39a3086c80b82dee2ae13bfeedc7fa7ba9cce3589cdb42 | YES |
| intentional_failure | compile.log | 6b377431e787c81d195296991f14287cb9e3f5012e9bbcad5db72fe0994acced | YES |
| intentional_failure | wave.vcd | 8244c48eaf01ae576253987670f9dce9a40421855c1a3a66c168e6d3c1d775c1 | YES |
| recovery | simulation.log | 1bb4da6322171d2b0181088fa49b0ee9d5f0062be6637a57c65de7dfa68c1f5a | YES |
| recovery | compile.log | 6b377431e787c81d195296991f14287cb9e3f5012e9bbcad5db72fe0994acced | YES |
| recovery | wave.vcd | e3697a61203b4dd07633d93ac50941defa751a584a68265f56f68138cd53e87e | YES |

Technical note: output 000 is shared by i=0x80 and all zero/multi-hot cases; there is no valid flag. Do not describe this circuit as a priority encoder.

### 09_decoder


#### A. Design identity

- experiment folder: LAB1/09_decoder
- RTL file(s): LAB1/09_decoder/src/decoder3x8.v
- RTL module(s): decoder3x8
- Design top: decoder3x8 (derived from TB DUT instantiation; simulation.json does not define a design_top field)
- TB file: LAB1/09_decoder/sim/tb_decoder3x8.sv
- Simulation top: tb_decoder3x8
- XDC file: LAB1/09_decoder/constraints/decoder3x8.xdc
- simulation.json: LAB1/09_decoder/simulation.json
- input ports: a, b, c
- output ports: o
- port widths: a: 1 bit(s); b: 1 bit(s); c: 1 bit(s); o: 8 bit(s)

#### B. Functional intent

o=8'b00000001<<{a,b,c}. a,b,c are selector bits 2,1,0. Selector 000 activates o[0]; 111 activates o[7].

#### C. Testbench verification

- applied input sequence or enumeration method: {a,b,c}=n, n=0..7
- number of test cases: 8
- interval per case: 10 ns (#10 with 1ns time unit; observation after the delay)
- total expected simulation time: 80 ns for an uninterrupted PASS path
- expected calculation method: 1<<n
- DUT output compared against: o compared to expected with !== (case inequality, including X/Z detection)
- PASS condition: All 8 comparisons pass; checked==8; LAB1_PASS with cases=8 is printed, then $finish
- FAIL condition: o !== expected -> $fatal with vector/expected/actual; checked!=8 -> Incomplete test
- watchdog: At 100000 ns, $fatal(1, watchdog/Watchdog) if execution has not already ended
- code basis: LAB1/09_decoder/sim/tb_decoder3x8.sv; timescale=1ns/1ns

#### D. Representative expected behavior

- source: AUTO_SELECTED_FROM_DESIGN

No experiment-specific representative vectors were found in the inspected repository README material. These are computed expectations, not board observations.

- input: vector n=0; a=0, b=0, c=0
- expected output: o=0b00000001 (0x1)
- calculation/reason: 1 << 0

- input: vector n=1; a=0, b=0, c=1
- expected output: o=0b00000010 (0x2)
- calculation/reason: 1 << 1

- input: vector n=6; a=1, b=1, c=0
- expected output: o=0b01000000 (0x40)
- calculation/reason: 1 << 6

- input: vector n=7; a=1, b=1, c=1
- expected output: o=0b10000000 (0x80)
- calculation/reason: 1 << 7

#### E. Normal simulation evidence

- run ID: run-d333ae080651492f8390e84e3c792ce2
- simulation.log path: evidence/vscode/LAB1/09_decoder/normal__run-d333ae080651492f8390e84e3c792ce2/simulation.log
- compile.log path: evidence/vscode/LAB1/09_decoder/normal__run-d333ae080651492f8390e84e3c792ce2/compile.log
- wave.vcd path: evidence/vscode/LAB1/09_decoder/normal__run-d333ae080651492f8390e84e3c792ce2/wave.vcd
- PASS/FAIL: PASS
- cases: 8
- simulation end time: 80 ns (log and final VCD timestamp agree)
- source commit: UNKNOWN
- evidence_integrity: VERIFIED_COPY

Copy integrity basis: SHA-256 recomputed for each preserved file and its original file in the exact same run; all three match. This confirms byte identity, not source review or run-to-commit identity.

#### F. Intentional failure

- run ID: run-c9953810fc18472a80d153b38921d46c
- RTL modification: Shift operation: left shift -> right shift
- predicted failing condition: n=1 gives selector 001: correct 0x02; right-shifted 0x01 gives 0x00 (calculated from the Git change and TB; a pre-run prediction record is not available)
- actual first failing vector: 1
- expected: 0x02
- actual: 0x00
- failure time: 20 ns (log interpreted using VCD timescale)
- simulation.log path: evidence/vscode/LAB1/09_decoder/intentional_failure__run-c9953810fc18472a80d153b38921d46c/simulation.log
- wave.vcd path: evidence/vscode/LAB1/09_decoder/intentional_failure__run-c9953810fc18472a80d153b38921d46c/wave.vcd
- source commit: UNKNOWN
- modification evidence: Git change commit 2ea29aa, file LAB1/09_decoder/src/decoder3x8.v; preserved FAIL log and VCD TB expected / packed DUT values agree. The run-specific historical RTL snapshot is not preserved here, so the exact run source identity is unconfirmed.

#### G. Recovery

- run ID: run-1d0930251102468e85a52b00b169fdc3
- restored behavior: Left-shift one-hot decoder restored; Git restoration commit de0b93f; recovery role follows user selection
- PASS/FAIL: PASS
- cases: 8
- simulation end time: 80 ns (log and final VCD timestamp agree)
- simulation.log path: evidence/vscode/LAB1/09_decoder/recovery__run-1d0930251102468e85a52b00b169fdc3/simulation.log
- wave.vcd path: evidence/vscode/LAB1/09_decoder/recovery__run-1d0930251102468e85a52b00b169fdc3/wave.vcd
- source commit: UNKNOWN

#### H. Waveform verification

- VCD_PRESENT: YES (normal, intentional_failure, recovery)
- VCD_RUN_TRACEABLE: YES (user-designated run IDs in evidence paths; VCD signals, timestamps and log outputs checked; this is not commit traceability)
- USER_VISUAL_CHECK: NOT_VERIFIED
- SCREENSHOT_PRESENT: NOT_AVAILABLE
- representative_intervals: Candidate intervals only, in ns; normal/recovery VCD values checked numerically at both ends of each interval. No visual verification is asserted.
  - normal and recovery: [1, 9] ns, vector n=0; a=0, b=0, c=0 -> o=0b00000001 (0x1)
  - normal and recovery: [11, 19] ns, vector n=1; a=0, b=0, c=1 -> o=0b00000010 (0x2)
  - normal and recovery: [61, 69] ns, vector n=6; a=1, b=1, c=0 -> o=0b01000000 (0x40)
  - normal and recovery: [71, 79] ns, vector n=7; a=1, b=1, c=1 -> o=0b10000000 (0x80)
  - intentional_failure: [11, 19] ns, vector n=1; expected 0x02, actual 0x00; ends before fatal termination
- VCD timescale: normal/failure/recovery: 1ns

#### I. Board plan

- board_status: NOT_PERFORMED
- XDC pin mapping: a->K4; b->N8; c->N4; o[7]->L4; o[6]->M4; o[5]->M2; o[4]->N7; o[3]->M7; o[2]->M3; o[1]->M1; o[0]->N5; all ports LVCMOS33
- planned user inputs: Apply the representative input vectors in section D via the physical controls associated with the XDC input package pins, after verifying the board mapping and polarity.
- expected physical outputs: Design-level expected logic at output package pins follows section D. Actual LED/segment illumination is not inferred from package pins alone.
- verification method: Confirm board model, control-to-pin mapping, output polarity and segment/digit wiring; then apply planned vectors and record actual observations/photos/measurements against section D. This is a plan only.
- board model: UNKNOWN
- physical control/output mapping and polarity: UNKNOWN

#### J. Pre-report readiness

- design_information: READY
- expected_behavior: READY
- normal_simulation: READY
- intentional_failure: READY
- recovery: READY
- waveform_visual_evidence: MISSING
- board_plan: NEEDS_USER_CONFIRMATION
- experiment_readiness: NEEDS_USER_CONFIRMATION

Readiness scope: log-based results and history-based change descriptions are available. Student understanding/review, direct source commit linkage, physical mapping and visual evidence still require confirmation. All three preserved compile logs warn that design elements lack an explicit time unit/time precision.

##### Evidence SHA-256

| Role | File | SHA-256 | Matches original same-run file |
|---|---|---|---|
| normal | simulation.log | 628033a091a62407e2c8087c2731ff55f46b679eb44a50107165c4b91c0c35c8 | YES |
| normal | compile.log | 4dfc77194afe2e693ad2712b1337dcc52be0af2e22110bb92c4eccc09bb27e08 | YES |
| normal | wave.vcd | 861c4579873f8c4cc8200922678b8501b4fa96b4018d9b23ad19cb60c7d370ad | YES |
| intentional_failure | simulation.log | 5cc968cbe2c40b64f023aa51687484b0623032158d1a5ffe51d5101d45bf2010 | YES |
| intentional_failure | compile.log | 4dfc77194afe2e693ad2712b1337dcc52be0af2e22110bb92c4eccc09bb27e08 | YES |
| intentional_failure | wave.vcd | 06d3d6746f58e05d8130c5c936b5281a4ec5719c18f3eff415971b96f118d46b | YES |
| recovery | simulation.log | 628033a091a62407e2c8087c2731ff55f46b679eb44a50107165c4b91c0c35c8 | YES |
| recovery | compile.log | 4dfc77194afe2e693ad2712b1337dcc52be0af2e22110bb92c4eccc09bb27e08 | YES |
| recovery | wave.vcd | e885945cd9f6954b4e4b4deb0d89dd9063da6fe44e837fad965848a1a68969d9 | YES |

### 10_7seg_decoder


#### A. Design identity

- experiment folder: LAB1/10_7seg_decoder
- RTL file(s): LAB1/10_7seg_decoder/src/seg_decoder.v
- RTL module(s): seg_decoder
- Design top: seg_decoder (derived from TB DUT instantiation; simulation.json does not define a design_top field)
- TB file: LAB1/10_7seg_decoder/sim/tb_seg_decoder.sv
- Simulation top: tb_seg_decoder
- XDC file: LAB1/10_7seg_decoder/constraints/seg_decoder.xdc
- simulation.json: LAB1/10_7seg_decoder/simulation.json
- input ports: bcd
- output ports: seg_data
- port widths: bcd: 4 bit(s); seg_data: 8 bit(s)

#### B. Functional intent

Hexadecimal decoder for 0..F, not only decimal BCD. seg_data[7:0]={a,b,c,d,e,f,g,dp}; active-high logical segment bits; dp=0 for all 16 entries.

#### C. Testbench verification

- applied input sequence or enumeration method: bcd=n, n=0..15
- number of test cases: 16
- interval per case: 10 ns (#10 with 1ns time unit; observation after the delay)
- total expected simulation time: 160 ns for an uninterrupted PASS path
- expected calculation method: expected=digits[n]; TB defines an explicit 16-entry 8-bit pattern table
- DUT output compared against: seg_data compared to expected with !== (case inequality, including X/Z detection)
- PASS condition: All 16 comparisons pass; checked==16; LAB1_PASS with cases=16 is printed, then $finish
- FAIL condition: seg_data !== expected -> $fatal with vector/expected/actual; checked!=16 -> Incomplete test
- watchdog: At 100000 ns, $fatal(1, watchdog/Watchdog) if execution has not already ended
- code basis: LAB1/10_7seg_decoder/sim/tb_seg_decoder.sv; timescale=1ns/1ns

#### D. Representative expected behavior

- source: AUTO_SELECTED_FROM_DESIGN

No experiment-specific representative vectors were found in the inspected repository README material. These are computed expectations, not board observations.

- input: vector n=0; bcd=0b0000 (0x0)
- expected output: seg_data=0b11111100 (0xfc)
- calculation/reason: RTL case table and TB digits table; segment bits {a,b,c,d,e,f,g,dp}

- input: vector n=1; bcd=0b0001 (0x1)
- expected output: seg_data=0b01100000 (0x60)
- calculation/reason: RTL case table and TB digits table; segment bits {a,b,c,d,e,f,g,dp}

- input: vector n=10; bcd=0b1010 (0xa)
- expected output: seg_data=0b11101110 (0xee)
- calculation/reason: RTL case table and TB digits table; segment bits {a,b,c,d,e,f,g,dp}

- input: vector n=15; bcd=0b1111 (0xf)
- expected output: seg_data=0b10001110 (0x8e)
- calculation/reason: RTL case table and TB digits table; segment bits {a,b,c,d,e,f,g,dp}

#### E. Normal simulation evidence

- run ID: run-68a357e7a424458aa3262d0ea99829bd
- simulation.log path: evidence/vscode/LAB1/10_7seg_decoder/normal__run-68a357e7a424458aa3262d0ea99829bd/simulation.log
- compile.log path: evidence/vscode/LAB1/10_7seg_decoder/normal__run-68a357e7a424458aa3262d0ea99829bd/compile.log
- wave.vcd path: evidence/vscode/LAB1/10_7seg_decoder/normal__run-68a357e7a424458aa3262d0ea99829bd/wave.vcd
- PASS/FAIL: PASS
- cases: 16
- simulation end time: 160 ns (log and final VCD timestamp agree)
- source commit: UNKNOWN
- evidence_integrity: VERIFIED_COPY

Copy integrity basis: SHA-256 recomputed for each preserved file and its original file in the exact same run; all three match. This confirms byte identity, not source review or run-to-commit identity.

#### F. Intentional failure

- run ID: run-aa683425c13e4c53be1af160ed5187f3
- RTL modification: Pattern for bcd=0: 0xfc -> 0x60
- predicted failing condition: n=0 gives bcd=0: expected 0xfc, modified pattern 0x60 (the digit-1 pattern) (calculated from the Git change and TB; a pre-run prediction record is not available)
- actual first failing vector: 0
- expected: 0xfc
- actual: 0x60
- failure time: 10 ns (log interpreted using VCD timescale)
- simulation.log path: evidence/vscode/LAB1/10_7seg_decoder/intentional_failure__run-aa683425c13e4c53be1af160ed5187f3/simulation.log
- wave.vcd path: evidence/vscode/LAB1/10_7seg_decoder/intentional_failure__run-aa683425c13e4c53be1af160ed5187f3/wave.vcd
- source commit: UNKNOWN
- modification evidence: Git change commit 7e88c77, file LAB1/10_7seg_decoder/src/seg_decoder.v; preserved FAIL log and VCD TB expected / packed DUT values agree. The run-specific historical RTL snapshot is not preserved here, so the exact run source identity is unconfirmed.

#### G. Recovery

- run ID: run-27f60921a06746d883783c9f379e8c76
- restored behavior: bcd=0 pattern 0xfc restored; Git restoration commit f8d10c0; recovery role follows user selection
- PASS/FAIL: PASS
- cases: 16
- simulation end time: 160 ns (log and final VCD timestamp agree)
- simulation.log path: evidence/vscode/LAB1/10_7seg_decoder/recovery__run-27f60921a06746d883783c9f379e8c76/simulation.log
- wave.vcd path: evidence/vscode/LAB1/10_7seg_decoder/recovery__run-27f60921a06746d883783c9f379e8c76/wave.vcd
- source commit: UNKNOWN

#### H. Waveform verification

- VCD_PRESENT: YES (normal, intentional_failure, recovery)
- VCD_RUN_TRACEABLE: YES (user-designated run IDs in evidence paths; VCD signals, timestamps and log outputs checked; this is not commit traceability)
- USER_VISUAL_CHECK: NOT_VERIFIED
- SCREENSHOT_PRESENT: NOT_AVAILABLE
- representative_intervals: Candidate intervals only, in ns; normal/recovery VCD values checked numerically at both ends of each interval. No visual verification is asserted.
  - normal and recovery: [1, 9] ns, vector n=0; bcd=0b0000 (0x0) -> seg_data=0b11111100 (0xfc)
  - normal and recovery: [11, 19] ns, vector n=1; bcd=0b0001 (0x1) -> seg_data=0b01100000 (0x60)
  - normal and recovery: [101, 109] ns, vector n=10; bcd=0b1010 (0xa) -> seg_data=0b11101110 (0xee)
  - normal and recovery: [151, 159] ns, vector n=15; bcd=0b1111 (0xf) -> seg_data=0b10001110 (0x8e)
  - intentional_failure: [1, 9] ns, vector n=0; expected 0xfc, actual 0x60; ends before fatal termination
- VCD timescale: normal/failure/recovery: 1ns

#### I. Board plan

- board_status: NOT_PERFORMED
- XDC pin mapping: bcd[3]->Y1; bcd[2]->W3; bcd[1]->U2; bcd[0]->T1; seg_data[7]->P1; seg_data[6]->P3; seg_data[5]->P7; seg_data[4]->N3; seg_data[3]->T5; seg_data[2]->R2; seg_data[1]->R4; seg_data[0]->R6; all ports LVCMOS33
- planned user inputs: Apply the representative input vectors in section D via the physical controls associated with the XDC input package pins, after verifying the board mapping and polarity.
- expected physical outputs: Design-level expected logic at output package pins follows section D. Actual LED/segment illumination is not inferred from package pins alone.
- verification method: Confirm board model, control-to-pin mapping, output polarity and segment/digit wiring; then apply planned vectors and record actual observations/photos/measurements against section D. This is a plan only.
- board model: UNKNOWN
- physical control/output mapping and polarity: UNKNOWN

#### J. Pre-report readiness

- design_information: READY
- expected_behavior: READY
- normal_simulation: READY
- intentional_failure: READY
- recovery: READY
- waveform_visual_evidence: MISSING
- board_plan: NEEDS_USER_CONFIRMATION
- experiment_readiness: NEEDS_USER_CONFIRMATION

Readiness scope: log-based results and history-based change descriptions are available. Student understanding/review, direct source commit linkage, physical mapping and visual evidence still require confirmation. All three preserved compile logs warn that design elements lack an explicit time unit/time precision.

##### Evidence SHA-256

| Role | File | SHA-256 | Matches original same-run file |
|---|---|---|---|
| normal | simulation.log | 6dc3d8ad7512a9024b8d905c48d5b86e400f745880113489937f5eaf8a57d01e | YES |
| normal | compile.log | cec11eeafb24c9387d24011f944a11f4a307847b1b8fa5d6a8602c5badf41261 | YES |
| normal | wave.vcd | 1307bd86d7719b8e35ac79383a4a8716c528171086c6f7ca13374cc7be26c5aa | YES |
| intentional_failure | simulation.log | db96c0ddf76e3fac3a0ca8a8e3df5d48ebc7b3d751fbbeee6abf28c78229f735 | YES |
| intentional_failure | compile.log | cec11eeafb24c9387d24011f944a11f4a307847b1b8fa5d6a8602c5badf41261 | YES |
| intentional_failure | wave.vcd | ecd7573ec6243889911fcb0aaabac7b622bf87fe1bbf172f907aaac91eb23563 | YES |
| recovery | simulation.log | 6dc3d8ad7512a9024b8d905c48d5b86e400f745880113489937f5eaf8a57d01e | YES |
| recovery | compile.log | cec11eeafb24c9387d24011f944a11f4a307847b1b8fa5d6a8602c5badf41261 | YES |
| recovery | wave.vcd | 27ff0c7771fcd315f1416a71b3c4079ed9f6f733db245870be2edf514cd0d0d4 | YES |

Technical note: bcd is a signal name; the actual code covers hexadecimal A..F. RTL states active-high segment bits, but actual board/display polarity and digit enable remain unconfirmed.

## 3. LAB1 Summary

| Experiment | Normal | Failure detected | Recovery | Waveform visual check | Board |
|---|---|---|---|---|---|
| 01_logic_gates | PASS | YES | PASS | NOT_VERIFIED | NOT_PERFORMED |
| 02_full_adder | PASS | YES | PASS | NOT_VERIFIED | NOT_PERFORMED |
| 03_4bit_adder | PASS | YES | PASS | NOT_VERIFIED | NOT_PERFORMED |
| 04_4bit_subtractor | PASS | YES | PASS | NOT_VERIFIED | NOT_PERFORMED |
| 05_4bit_comparator | PASS | YES | PASS | NOT_VERIFIED | NOT_PERFORMED |
| 06_mux | PASS | YES | PASS | NOT_VERIFIED | NOT_PERFORMED |
| 07_demux | PASS | YES | PASS | NOT_VERIFIED | NOT_PERFORMED |
| 08_encoder | PASS | YES | PASS | NOT_VERIFIED | NOT_PERFORMED |
| 09_decoder | PASS | YES | PASS | NOT_VERIFIED | NOT_PERFORMED |
| 10_7seg_decoder | PASS | YES | PASS | NOT_VERIFIED | NOT_PERFORMED |

### Items requiring user confirmation

- Actual VaporView visual inspection and corresponding approved screenshots for each experiment; current evidence has no screenshots.
- Direct run-to-source-commit mapping for all 30 preserved runs; change/restoration commit names and chronology do not establish that mapping.
- Student understanding and review of the RTL/TB/XDC before treating sources as REVIEWED or VERIFIED.
- Recorded execution OS and Python version, and whether the LAB1-wide environment logs apply to each preserved run.
- Board model, physical switch/output mapping, polarity, segment/digit enable wiring and the vendor-pin-map provenance referenced by the XDC comments.
- Actual board results after physical tests are performed; current board status is the user-requested NOT_PERFORMED.
- Course-specific representative vectors if the course material requires vectors beyond the auto-selected examples.
