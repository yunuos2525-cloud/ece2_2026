# LAB1 Pre-report Manifest v2

## 0. Manifest metadata

- lab: LAB1
  - provenance: TOOL_VERIFIED
  - basis: Existing manifest metadata and repository read-only inspection
- generated_from: reports/_automation/LAB1_pre_manifest.md; current repository/evidence read-only cross-checks; actual VCD parsing. No user report or course PDF was supplied. No simulation was run.
  - provenance: TOOL_VERIFIED
  - basis: Existing manifest metadata and repository read-only inspection
- manifest_status: DRAFT_EVIDENCE_BASED
  - provenance: USER_REPORTED
  - basis: User-requested policy/status; not an inferred physical result
- repository_branch: main
  - provenance: TOOL_VERIFIED
  - basis: Existing manifest metadata and repository read-only inspection
- current_HEAD: 647a3b310ca63a8bcdd846aa86f5a84c710351e5
  - provenance: TOOL_VERIFIED
  - basis: Existing manifest metadata and repository read-only inspection
- waveform_visual_verification_policy: Only explicit user-confirmed visual evidence can establish visual verification. VCD parsing and candidate intervals do not establish a visual check.
  - provenance: USER_REPORTED
  - basis: User-requested policy/status; not an inferred physical result
- board_status: NOT_PERFORMED
  - provenance: USER_REPORTED
  - basis: User-requested policy/status; not an inferred physical result
- manifest_scope: PRE
  - provenance: USER_REPORTED
  - basis: Requested pre-report scope
- common_fields_present: YES
  - provenance: TOOL_VERIFIED
  - basis: Design identity, functional intent, source/evidence provenance and verification fields retained
- post_only_fields_present: NO
  - provenance: TOOL_VERIFIED
  - basis: No Vivado synthesis/implementation results, bitstream results or observed board results are added; board section is a plan
- report_generation_policy: Only fields with TOOL_VERIFIED, COURSE_MATERIAL, USER_REPORTED, or explicit user confirmation may be stated as facts in a report. AUTO_DERIVED values may be used only when clearly marked as derived or after user confirmation.
  - provenance: USER_REPORTED
  - basis: User-specified report-generation policy
- course_material_content: UNKNOWN
  - provenance: UNKNOWN
  - basis: Course PDF not supplied or inspected
- user_report_content: UNKNOWN
  - provenance: UNKNOWN
  - basis: User report not supplied or inspected
- base_manifest_sha256: 1ca089a2e48fab150bbe449809af6a526ab08b4d95b13ff282a3cf9eb3bec529
  - provenance: TOOL_VERIFIED
  - basis: SHA-256 of unchanged reports/_automation/LAB1_pre_manifest.md

All paths are repository-relative. Each field has separate provenance and basis. TOOL_VERIFIED confirms the stated limited observation, not overall functional, visual or physical verification. USER_REPORTED denotes an explicit user instruction/report, not a independently measured result. AUTO_DERIVED denotes interpretation, calculation, recommendations or readiness assessment. Run role labels are the user-designated preservation roles; role labels do not identify a source commit. NOT_PERFORMED board status is retained by user instruction, not inferred from directory contents. QA notes and hash audit data are excluded from report-body facts unless intentionally selected with their scope.

## 1. Environment

- OS: UNKNOWN
  - provenance: UNKNOWN
  - basis: No preserved execution record for this value
- Git version: git version 2.55.0.windows.5
  - provenance: TOOL_VERIFIED
  - basis: Preserved environment logs; workspaces and tools/lab1.py for workflow
- Python version: UNKNOWN
  - provenance: UNKNOWN
  - basis: No preserved execution record for this value
- Icarus Verilog version: Icarus Verilog version 12.0 (devel) (s20150603-1539-g2693dd32b)
  - provenance: TOOL_VERIFIED
  - basis: Preserved environment logs; workspaces and tools/lab1.py for workflow
- vvp version: Icarus Verilog runtime version 12.0 (devel) (s20150603-1539-g2693dd32b)
  - provenance: TOOL_VERIFIED
  - basis: Preserved environment logs; workspaces and tools/lab1.py for workflow
- workspace file: LAB1/<experiment folder>/LAB1.code-workspace (all 10 exist; folder path=".")
  - provenance: TOOL_VERIFIED
  - basis: Preserved environment logs; workspaces and tools/lab1.py for workflow
- simulation workflow: Workspace tasks: 01 Check tools -> 02 Simulate -> 03 Open waveform. tools/lab1.py check / simulate / wave. Runner compiles explicitly listed RTL and TB using iverilog -g2012 -Wall -s <simulation_top>, then vvp -N; XDC is not an Icarus functional-simulation input. This manifest records existing executions; no new simulation was performed.
  - provenance: TOOL_VERIFIED
  - basis: Preserved environment logs; workspaces and tools/lab1.py for workflow
- evidence source: evidence/vscode/LAB1/environment/{git.log,iverilog.log,vvp.log}; per-experiment preserved run folders
  - provenance: TOOL_VERIFIED
  - basis: Preserved environment logs; workspaces and tools/lab1.py for workflow

Environment versions describe the preserved LAB1-wide logs; per-run applicability remains unconfirmed. The absence of a recorded OS/Python value must not be filled using the runtime that generates this document.

## 2. Experiments


### 01_logic_gates


#### A. Design identity

- experiment folder: LAB1/01_logic_gates
  - provenance: TOOL_VERIFIED
  - basis: LAB1/01_logic_gates current RTL/TB/XDC/simulation.json
- RTL file(s): LAB1/01_logic_gates/src/logic_gate.v
  - provenance: TOOL_VERIFIED
  - basis: LAB1/01_logic_gates current RTL/TB/XDC/simulation.json
- RTL module(s): logic_gate
  - provenance: TOOL_VERIFIED
  - basis: LAB1/01_logic_gates current RTL/TB/XDC/simulation.json
- Design top: logic_gate
  - provenance: AUTO_DERIVED
  - basis: LAB1/01_logic_gates/sim/tb_logic_gate_modern.sv DUT instantiation
- TB file: LAB1/01_logic_gates/sim/tb_logic_gate_modern.sv
  - provenance: TOOL_VERIFIED
  - basis: LAB1/01_logic_gates current RTL/TB/XDC/simulation.json
- Simulation top: tb_logic_gate_modern
  - provenance: TOOL_VERIFIED
  - basis: LAB1/01_logic_gates current RTL/TB/XDC/simulation.json
- XDC file: LAB1/01_logic_gates/constraints/logic_gate.xdc
  - provenance: TOOL_VERIFIED
  - basis: LAB1/01_logic_gates current RTL/TB/XDC/simulation.json
- simulation.json: LAB1/01_logic_gates/simulation.json
  - provenance: TOOL_VERIFIED
  - basis: LAB1/01_logic_gates current RTL/TB/XDC/simulation.json
- input ports: a, b
  - provenance: TOOL_VERIFIED
  - basis: LAB1/01_logic_gates current RTL/TB/XDC/simulation.json
- output ports: x, y, z
  - provenance: TOOL_VERIFIED
  - basis: LAB1/01_logic_gates current RTL/TB/XDC/simulation.json
- port widths: a: 1 bit(s); b: 1 bit(s); x: 1 bit(s); y: 1 bit(s); z: 1 bit(s)
  - provenance: TOOL_VERIFIED
  - basis: LAB1/01_logic_gates current RTL/TB/XDC/simulation.json

#### B. Functional intent

- functional description: x=a&b; y=a|b; z=a^b. Output packing {x,y,z}; a is the MSB of {a,b}.
  - provenance: AUTO_DERIVED
  - basis: LAB1/01_logic_gates/src/logic_gate.v
- valid_input_domain: NOT_APPLICABLE
  - provenance: AUTO_DERIVED
  - basis: LAB1/01_logic_gates/src/logic_gate.v and TB enumeration; no course material available
- invalid_input_behavior: NOT_APPLICABLE
  - provenance: AUTO_DERIVED
  - basis: No special restricted binary-input semantics identified

#### C. Testbench verification

- applied input sequence or enumeration method: {a,b}=n, n=0..3
  - provenance: TOOL_VERIFIED
  - basis: LAB1/01_logic_gates/sim/tb_logic_gate_modern.sv
- number of test cases: 4
  - provenance: TOOL_VERIFIED
  - basis: LAB1/01_logic_gates/sim/tb_logic_gate_modern.sv
- interval per case: 10 ns (#10 with 1ns time unit; observation after the delay)
  - provenance: AUTO_DERIVED
  - basis: LAB1/01_logic_gates/sim/tb_logic_gate_modern.sv
- total expected simulation time: 40 ns for an uninterrupted PASS path
  - provenance: AUTO_DERIVED
  - basis: LAB1/01_logic_gates/sim/tb_logic_gate_modern.sv
- expected calculation method: {a&b,a|b,a^b}
  - provenance: TOOL_VERIFIED
  - basis: LAB1/01_logic_gates/sim/tb_logic_gate_modern.sv
- DUT output compared against: {x,y,z} compared to expected with !== (case inequality, including X/Z detection)
  - provenance: TOOL_VERIFIED
  - basis: LAB1/01_logic_gates/sim/tb_logic_gate_modern.sv
- PASS condition: All 4 comparisons pass; checked==4; LAB1_PASS with cases=4 is printed, then $finish
  - provenance: AUTO_DERIVED
  - basis: LAB1/01_logic_gates/sim/tb_logic_gate_modern.sv
- FAIL condition: {x,y,z} !== expected -> $fatal with vector/expected/actual; checked!=4 -> Incomplete test
  - provenance: AUTO_DERIVED
  - basis: LAB1/01_logic_gates/sim/tb_logic_gate_modern.sv
- watchdog: At 100000 ns, $fatal(1, watchdog/Watchdog) if execution has not already ended
  - provenance: AUTO_DERIVED
  - basis: LAB1/01_logic_gates/sim/tb_logic_gate_modern.sv
- code basis: LAB1/01_logic_gates/sim/tb_logic_gate_modern.sv; timescale=1ns/1ps
  - provenance: TOOL_VERIFIED
  - basis: LAB1/01_logic_gates/sim/tb_logic_gate_modern.sv

#### D. Representative expected behavior

- course_required_cases: UNKNOWN
  - provenance: UNKNOWN
  - basis: No course PDF/requirements provided
- report_recorded_cases: UNKNOWN
  - provenance: UNKNOWN
  - basis: No user report provided; current cases are suggestions

##### Case 1

- selection_source: AUTO_SUGGESTED
  - provenance: AUTO_DERIVED
  - basis: Automatically selected from design/TB in v1; user approval and course-required status are not established
- input: vector n=0; a=0, b=0
  - provenance: AUTO_DERIVED
  - basis: LAB1/01_logic_gates/sim/tb_logic_gate_modern.sv input enumeration; suggested representative vector
- expected output: x=0, y=0, z=0
  - provenance: AUTO_DERIVED
  - basis: LAB1/01_logic_gates/src/logic_gate.v and TB expected calculation
- calculation/reason: AND / OR / XOR truth table
  - provenance: AUTO_DERIVED
  - basis: LAB1/01_logic_gates/src/logic_gate.v and TB expected calculation

##### Case 2

- selection_source: AUTO_SUGGESTED
  - provenance: AUTO_DERIVED
  - basis: Automatically selected from design/TB in v1; user approval and course-required status are not established
- input: vector n=1; a=0, b=1
  - provenance: AUTO_DERIVED
  - basis: LAB1/01_logic_gates/sim/tb_logic_gate_modern.sv input enumeration; suggested representative vector
- expected output: x=0, y=1, z=1
  - provenance: AUTO_DERIVED
  - basis: LAB1/01_logic_gates/src/logic_gate.v and TB expected calculation
- calculation/reason: AND / OR / XOR truth table
  - provenance: AUTO_DERIVED
  - basis: LAB1/01_logic_gates/src/logic_gate.v and TB expected calculation

##### Case 3

- selection_source: AUTO_SUGGESTED
  - provenance: AUTO_DERIVED
  - basis: Automatically selected from design/TB in v1; user approval and course-required status are not established
- input: vector n=2; a=1, b=0
  - provenance: AUTO_DERIVED
  - basis: LAB1/01_logic_gates/sim/tb_logic_gate_modern.sv input enumeration; suggested representative vector
- expected output: x=0, y=1, z=1
  - provenance: AUTO_DERIVED
  - basis: LAB1/01_logic_gates/src/logic_gate.v and TB expected calculation
- calculation/reason: AND / OR / XOR truth table
  - provenance: AUTO_DERIVED
  - basis: LAB1/01_logic_gates/src/logic_gate.v and TB expected calculation

##### Case 4

- selection_source: AUTO_SUGGESTED
  - provenance: AUTO_DERIVED
  - basis: Automatically selected from design/TB in v1; user approval and course-required status are not established
- input: vector n=3; a=1, b=1
  - provenance: AUTO_DERIVED
  - basis: LAB1/01_logic_gates/sim/tb_logic_gate_modern.sv input enumeration; suggested representative vector
- expected output: x=1, y=1, z=0
  - provenance: AUTO_DERIVED
  - basis: LAB1/01_logic_gates/src/logic_gate.v and TB expected calculation
- calculation/reason: AND / OR / XOR truth table
  - provenance: AUTO_DERIVED
  - basis: LAB1/01_logic_gates/src/logic_gate.v and TB expected calculation

#### E. Normal simulation evidence

- run ID: run-4ccd3151c80e42b8a613c46c83a9d378
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/01_logic_gates/normal__run-4ccd3151c80e42b8a613c46c83a9d378/simulation.log; VCD for numeric/time checks
- simulation.log path: evidence/vscode/LAB1/01_logic_gates/normal__run-4ccd3151c80e42b8a613c46c83a9d378/simulation.log
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/01_logic_gates/normal__run-4ccd3151c80e42b8a613c46c83a9d378/simulation.log; VCD for numeric/time checks
- compile.log path: evidence/vscode/LAB1/01_logic_gates/normal__run-4ccd3151c80e42b8a613c46c83a9d378/compile.log
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/01_logic_gates/normal__run-4ccd3151c80e42b8a613c46c83a9d378/simulation.log; VCD for numeric/time checks
- wave.vcd path: evidence/vscode/LAB1/01_logic_gates/normal__run-4ccd3151c80e42b8a613c46c83a9d378/wave.vcd
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/01_logic_gates/normal__run-4ccd3151c80e42b8a613c46c83a9d378/simulation.log; VCD for numeric/time checks
- PASS/FAIL: PASS
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/01_logic_gates/normal__run-4ccd3151c80e42b8a613c46c83a9d378/simulation.log; VCD for numeric/time checks
- cases: 4
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/01_logic_gates/normal__run-4ccd3151c80e42b8a613c46c83a9d378/simulation.log; VCD for numeric/time checks
- simulation end time: 40 ns (log and final VCD timestamp agree)
  - provenance: AUTO_DERIVED
  - basis: evidence/vscode/LAB1/01_logic_gates/normal__run-4ccd3151c80e42b8a613c46c83a9d378/simulation.log; VCD for numeric/time checks
- source commit: UNKNOWN
  - provenance: UNKNOWN
  - basis: Direct run-to-commit record unavailable
- evidence_integrity: VERIFIED_COPY
  - provenance: TOOL_VERIFIED
  - basis: v1 same-run copy verification; current evidence hash matches v1 hash audit

#### F. Intentional failure

- run ID: run-3da382f3ef754a73ab00728347ecd540
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/01_logic_gates/intentional_failure__run-3da382f3ef754a73ab00728347ecd540/simulation.log and VCD
- RTL modification: z: a^b -> a|b
  - provenance: TOOL_VERIFIED
  - basis: Git historical RTL change (not a run-specific source attribution)
- predicted failing condition: a=b=1: correct XOR=0, modified OR=1; first mismatch n=3
  - provenance: AUTO_DERIVED
  - basis: Historical Git diff and current TB; post-hoc calculation, not a recorded pre-run prediction
- actual first failing vector: 3
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/01_logic_gates/intentional_failure__run-3da382f3ef754a73ab00728347ecd540/simulation.log and VCD
- expected: 0x6
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/01_logic_gates/intentional_failure__run-3da382f3ef754a73ab00728347ecd540/simulation.log and VCD
- actual: 0x7
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/01_logic_gates/intentional_failure__run-3da382f3ef754a73ab00728347ecd540/simulation.log and VCD
- failure time: 40 ns (log interpreted using VCD timescale)
  - provenance: AUTO_DERIVED
  - basis: evidence/vscode/LAB1/01_logic_gates/intentional_failure__run-3da382f3ef754a73ab00728347ecd540/simulation.log and VCD
- simulation.log path: evidence/vscode/LAB1/01_logic_gates/intentional_failure__run-3da382f3ef754a73ab00728347ecd540/simulation.log
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/01_logic_gates/intentional_failure__run-3da382f3ef754a73ab00728347ecd540/simulation.log and VCD
- wave.vcd path: evidence/vscode/LAB1/01_logic_gates/intentional_failure__run-3da382f3ef754a73ab00728347ecd540/wave.vcd
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/01_logic_gates/intentional_failure__run-3da382f3ef754a73ab00728347ecd540/simulation.log and VCD
- source commit: UNKNOWN
  - provenance: UNKNOWN
  - basis: Direct run-to-commit record unavailable

#### G. Recovery

- run ID: run-6b4d7856b4b74d7182be024c49d8befb
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/01_logic_gates/recovery__run-6b4d7856b4b74d7182be024c49d8befb/simulation.log and VCD
- restored behavior: XOR restored for z
  - provenance: AUTO_DERIVED
  - basis: Git restoration history plus user-designated recovery evidence; direct commit linkage unavailable
- PASS/FAIL: PASS
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/01_logic_gates/recovery__run-6b4d7856b4b74d7182be024c49d8befb/simulation.log and VCD
- cases: 4
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/01_logic_gates/recovery__run-6b4d7856b4b74d7182be024c49d8befb/simulation.log and VCD
- simulation end time: 40 ns (log and final VCD timestamp agree)
  - provenance: AUTO_DERIVED
  - basis: evidence/vscode/LAB1/01_logic_gates/recovery__run-6b4d7856b4b74d7182be024c49d8befb/simulation.log and VCD
- simulation.log path: evidence/vscode/LAB1/01_logic_gates/recovery__run-6b4d7856b4b74d7182be024c49d8befb/simulation.log
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/01_logic_gates/recovery__run-6b4d7856b4b74d7182be024c49d8befb/simulation.log and VCD
- wave.vcd path: evidence/vscode/LAB1/01_logic_gates/recovery__run-6b4d7856b4b74d7182be024c49d8befb/wave.vcd
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/01_logic_gates/recovery__run-6b4d7856b4b74d7182be024c49d8befb/simulation.log and VCD
- source commit: UNKNOWN
  - provenance: UNKNOWN
  - basis: Direct run-to-commit record unavailable

#### H. Waveform verification

- VCD_PRESENT: YES
  - provenance: TOOL_VERIFIED
  - basis: All three preserved run VCD files exist and were parsed
- VCD_RUN_TRACEABLE: YES
  - provenance: TOOL_VERIFIED
  - basis: Evidence folder run IDs, logs and VCDs; current hashes match v1 same-run copy audit; this is not source commit traceability
- VCD_NUMERIC_CHECK: VERIFIED
  - provenance: TOOL_VERIFIED
  - basis: Actual parsing of all three VCDs: representative normal/recovery inputs and outputs at both interval endpoints; failure TB expected and packed DUT output before fatal time; log/VCD end time agreement. Limited sampled numeric check, not full waveform/visual verification.
- USER_VISUAL_CHECK: NOT_VERIFIED
  - provenance: UNKNOWN
  - basis: No explicit user visual-inspection approval is recorded in the supplied evidence
- SCREENSHOT_PRESENT: NOT_AVAILABLE
  - provenance: TOOL_VERIFIED
  - basis: Evidence contains logs/VCD only; no user-confirmed screenshot file found
- representative_intervals: Candidate intervals only; values checked numerically. Selection and intervals remain derived suggestions.
  - provenance: AUTO_DERIVED
  - basis: TB vector index and 10 ns case interval; actual VCD samples
  - normal and recovery: [1, 9] ns, vector n=0; a=0, b=0 -> x=0, y=0, z=0
    - provenance: AUTO_DERIVED
    - basis: Suggested vector interval; corresponding VCD values parsed
  - normal and recovery: [11, 19] ns, vector n=1; a=0, b=1 -> x=0, y=1, z=1
    - provenance: AUTO_DERIVED
    - basis: Suggested vector interval; corresponding VCD values parsed
  - normal and recovery: [21, 29] ns, vector n=2; a=1, b=0 -> x=0, y=1, z=1
    - provenance: AUTO_DERIVED
    - basis: Suggested vector interval; corresponding VCD values parsed
  - normal and recovery: [31, 39] ns, vector n=3; a=1, b=1 -> x=1, y=1, z=0
    - provenance: AUTO_DERIVED
    - basis: Suggested vector interval; corresponding VCD values parsed
  - intentional_failure: [31, 39] ns, vector n=3; expected 0x6, actual 0x7; ends before fatal termination
    - provenance: AUTO_DERIVED
    - basis: Suggested vector interval; corresponding VCD values parsed
- VCD timescale: normal/failure/recovery: 1ps
  - provenance: TOOL_VERIFIED
  - basis: Preserved VCD $timescale declarations

#### I. Board plan

- board_status: NOT_PERFORMED
  - provenance: USER_REPORTED
  - basis: User instruction: keep board result NOT_PERFORMED
- XDC pin mapping: a->K4; b->N8; x->L4; y->M4; z->M2; all ports LVCMOS33
  - provenance: TOOL_VERIFIED
  - basis: LAB1/01_logic_gates/constraints/logic_gate.xdc
- planned user inputs: Apply the representative input vectors in section D via the physical controls associated with the XDC input package pins, after verifying the board mapping and polarity.
  - provenance: AUTO_DERIVED
  - basis: Proposed plan from RTL expected behavior and XDC; not a physical observation
- expected physical outputs: Design-level expected logic at output package pins follows section D. Actual LED/segment illumination is not inferred from package pins alone.
  - provenance: AUTO_DERIVED
  - basis: Proposed plan from RTL expected behavior and XDC; not a physical observation
- verification method: Confirm board model, control-to-pin mapping, output polarity and segment/digit wiring; then apply planned vectors and record actual observations/photos/measurements against section D. This is a plan only.
  - provenance: AUTO_DERIVED
  - basis: Proposed plan from RTL expected behavior and XDC; not a physical observation
- board model: UNKNOWN
  - provenance: UNKNOWN
  - basis: Board model/wiring/polarity evidence unavailable
- physical control/output mapping and polarity: UNKNOWN
  - provenance: UNKNOWN
  - basis: Board model/wiring/polarity evidence unavailable

#### J. Pre-report readiness

- design_information: READY
  - provenance: AUTO_DERIVED
  - basis: Draft-data readiness assessment; outstanding confirmations in section 4. READY does not certify student review or full verification
- expected_behavior: READY
  - provenance: AUTO_DERIVED
  - basis: Draft-data readiness assessment; outstanding confirmations in section 4. READY does not certify student review or full verification
- normal_simulation: READY
  - provenance: AUTO_DERIVED
  - basis: Draft-data readiness assessment; outstanding confirmations in section 4. READY does not certify student review or full verification
- intentional_failure: READY
  - provenance: AUTO_DERIVED
  - basis: Draft-data readiness assessment; outstanding confirmations in section 4. READY does not certify student review or full verification
- recovery: READY
  - provenance: AUTO_DERIVED
  - basis: Draft-data readiness assessment; outstanding confirmations in section 4. READY does not certify student review or full verification
- waveform_visual_evidence: MISSING
  - provenance: AUTO_DERIVED
  - basis: Draft-data readiness assessment; outstanding confirmations in section 4. READY does not certify student review or full verification
- board_plan: NEEDS_USER_CONFIRMATION
  - provenance: AUTO_DERIVED
  - basis: Draft-data readiness assessment; outstanding confirmations in section 4. READY does not certify student review or full verification
- experiment_readiness: NEEDS_USER_CONFIRMATION
  - provenance: AUTO_DERIVED
  - basis: Draft-data readiness assessment; outstanding confirmations in section 4. READY does not certify student review or full verification

#### K. QA notes

- note_id: compile_warning
  - note: All three preserved compile logs warn that design elements lack explicit time unit/time precision. Preserve this warning; no source was changed.
  - provenance: TOOL_VERIFIED
  - basis: normal/intentional_failure/recovery compile.log
- note_id: run_commit_gap
  - note: All three source commit fields remain UNKNOWN. Git change/restoration commits document source history, not direct run identity.
  - provenance: UNKNOWN
  - basis: No direct run-to-commit record in the supplied evidence
- note_id: role_provenance
  - note: Normal/failure/recovery folder roles follow the user-specified run selection. Role names are not independent proof of run source identity.
  - provenance: USER_REPORTED
  - basis: User-specified preservation run IDs and roles
- note_id: prediction_record
  - note: The predicted failing condition is a post-hoc AUTO_DERIVED calculation. A contemporaneous pre-run prediction record is not available.
  - provenance: UNKNOWN
  - basis: No pre-run prediction record in the supplied evidence
- note_id: readiness_scope
  - note: Draft factual inputs are available. Visual evidence, representative selection, student review, physical plan assumptions and source commit provenance remain unresolved.
  - provenance: AUTO_DERIVED
  - basis: Sections D/H/I/J and section 4
- note_id: technical_1
  - note: preserved logs contain the older lab1_01_logic_gates absolute path. The manifest retains the original log unchanged; current source paths come from the current repository, not the old path.
  - provenance: TOOL_VERIFIED
  - basis: Preserved logs or current RTL; board caveats reflect missing physical evidence
- historical_modification_evidence: Git change commit 2e0c081, file src/logic_gate.v; preserved FAIL log and VCD TB expected / packed DUT values agree. The run-specific historical RTL snapshot is not preserved here, so the exact run source identity is unconfirmed.
  - provenance: TOOL_VERIFIED
  - basis: Historical Git diff and preserved FAIL log/VCD; the quoted source-identity limitation remains in force
- historical_restoration_evidence: XOR restored for z; Git restoration commit 7d4ae04; recovery role follows user selection
  - provenance: TOOL_VERIFIED
  - basis: Git restoration history and user-selected role; not direct commit-to-run proof
- copy_integrity_audit: Prior v1 recorded original/copy equality. Current evidence SHA-256 was recomputed and matches every v1 stored hash; originals were not reread during v2 generation.
  - provenance: TOOL_VERIFIED
  - basis: Unchanged v1 audit plus current preserved evidence SHA-256

##### Evidence SHA-256 audit

| Role | File | SHA-256 | Prior original-copy match | Current evidence matches v1 hash | Provenance |
|---|---|---|---|---|---|
| normal | simulation.log | a9dd5eca42d8abb4bd4929dc292a4c0b3e61312cecc4a594a9e9885a9d5faf47 | YES | YES | TOOL_VERIFIED |
| normal | compile.log | 47cb9181752a66d3b04596b7b4a270757c87f16e91497dae9ddcbcf9bd2c7ff0 | YES | YES | TOOL_VERIFIED |
| normal | wave.vcd | 850c4c1d863d136da26a5282f7708e35c319b791b679e8b896bedb8c6fac2f34 | YES | YES | TOOL_VERIFIED |
| intentional_failure | simulation.log | 33622c99976909d1e1d7ecb51afabf38b24bbacdf6976fe800a59746870725a3 | YES | YES | TOOL_VERIFIED |
| intentional_failure | compile.log | 47cb9181752a66d3b04596b7b4a270757c87f16e91497dae9ddcbcf9bd2c7ff0 | YES | YES | TOOL_VERIFIED |
| intentional_failure | wave.vcd | ecf5a575f9b4a73aad93c8d67a39a941bac7feb3ba1de7aaf66a3b67105a924f | YES | YES | TOOL_VERIFIED |
| recovery | simulation.log | a9dd5eca42d8abb4bd4929dc292a4c0b3e61312cecc4a594a9e9885a9d5faf47 | YES | YES | TOOL_VERIFIED |
| recovery | compile.log | 47cb9181752a66d3b04596b7b4a270757c87f16e91497dae9ddcbcf9bd2c7ff0 | YES | YES | TOOL_VERIFIED |
| recovery | wave.vcd | c7ff30dcb98937efe9abff84137f5d339df664260ac16fc3c842ef97b46a471e | YES | YES | TOOL_VERIFIED |

### 02_full_adder


#### A. Design identity

- experiment folder: LAB1/02_full_adder
  - provenance: TOOL_VERIFIED
  - basis: LAB1/02_full_adder current RTL/TB/XDC/simulation.json
- RTL file(s): LAB1/02_full_adder/src/half_adder.v; LAB1/02_full_adder/src/full_adder.v
  - provenance: TOOL_VERIFIED
  - basis: LAB1/02_full_adder current RTL/TB/XDC/simulation.json
- RTL module(s): half_adder; full_adder
  - provenance: TOOL_VERIFIED
  - basis: LAB1/02_full_adder current RTL/TB/XDC/simulation.json
- Design top: full_adder
  - provenance: AUTO_DERIVED
  - basis: LAB1/02_full_adder/sim/tb_full_adder.sv DUT instantiation
- TB file: LAB1/02_full_adder/sim/tb_full_adder.sv
  - provenance: TOOL_VERIFIED
  - basis: LAB1/02_full_adder current RTL/TB/XDC/simulation.json
- Simulation top: tb_full_adder
  - provenance: TOOL_VERIFIED
  - basis: LAB1/02_full_adder current RTL/TB/XDC/simulation.json
- XDC file: LAB1/02_full_adder/constraints/full_adder.xdc
  - provenance: TOOL_VERIFIED
  - basis: LAB1/02_full_adder current RTL/TB/XDC/simulation.json
- simulation.json: LAB1/02_full_adder/simulation.json
  - provenance: TOOL_VERIFIED
  - basis: LAB1/02_full_adder current RTL/TB/XDC/simulation.json
- input ports: a, b, cin
  - provenance: TOOL_VERIFIED
  - basis: LAB1/02_full_adder current RTL/TB/XDC/simulation.json
- output ports: s, cout
  - provenance: TOOL_VERIFIED
  - basis: LAB1/02_full_adder current RTL/TB/XDC/simulation.json
- port widths: a: 1 bit(s); b: 1 bit(s); cin: 1 bit(s); s: 1 bit(s); cout: 1 bit(s)
  - provenance: TOOL_VERIFIED
  - basis: LAB1/02_full_adder current RTL/TB/XDC/simulation.json
- submodule ports: half_adder inputs a,b:1 bit; outputs s,c:1 bit
  - provenance: TOOL_VERIFIED
  - basis: LAB1/02_full_adder/src/half_adder.v

#### B. Functional intent

- functional description: Two half_adder instances. s=a^b^cin; cout=(a&b)|((a^b)&cin). Output packing {cout,s}. half_adder: s=a^b, c=a&b.
  - provenance: AUTO_DERIVED
  - basis: LAB1/02_full_adder/src/half_adder.v; LAB1/02_full_adder/src/full_adder.v
- valid_input_domain: NOT_APPLICABLE
  - provenance: AUTO_DERIVED
  - basis: LAB1/02_full_adder/src/half_adder.v; LAB1/02_full_adder/src/full_adder.v and TB enumeration; no course material available
- invalid_input_behavior: NOT_APPLICABLE
  - provenance: AUTO_DERIVED
  - basis: No special restricted binary-input semantics identified

#### C. Testbench verification

- applied input sequence or enumeration method: {a,b,cin}=n, n=0..7
  - provenance: TOOL_VERIFIED
  - basis: LAB1/02_full_adder/sim/tb_full_adder.sv
- number of test cases: 8
  - provenance: TOOL_VERIFIED
  - basis: LAB1/02_full_adder/sim/tb_full_adder.sv
- interval per case: 10 ns (#10 with 1ns time unit; observation after the delay)
  - provenance: AUTO_DERIVED
  - basis: LAB1/02_full_adder/sim/tb_full_adder.sv
- total expected simulation time: 80 ns for an uninterrupted PASS path
  - provenance: AUTO_DERIVED
  - basis: LAB1/02_full_adder/sim/tb_full_adder.sv
- expected calculation method: int'(a)+int'(b)+int'(cin)
  - provenance: TOOL_VERIFIED
  - basis: LAB1/02_full_adder/sim/tb_full_adder.sv
- DUT output compared against: {cout,s} compared to expected with !== (case inequality, including X/Z detection)
  - provenance: TOOL_VERIFIED
  - basis: LAB1/02_full_adder/sim/tb_full_adder.sv
- PASS condition: All 8 comparisons pass; checked==8; LAB1_PASS with cases=8 is printed, then $finish
  - provenance: AUTO_DERIVED
  - basis: LAB1/02_full_adder/sim/tb_full_adder.sv
- FAIL condition: {cout,s} !== expected -> $fatal with vector/expected/actual; checked!=8 -> Incomplete test
  - provenance: AUTO_DERIVED
  - basis: LAB1/02_full_adder/sim/tb_full_adder.sv
- watchdog: At 100000 ns, $fatal(1, watchdog/Watchdog) if execution has not already ended
  - provenance: AUTO_DERIVED
  - basis: LAB1/02_full_adder/sim/tb_full_adder.sv
- code basis: LAB1/02_full_adder/sim/tb_full_adder.sv; timescale=1ns/1ps
  - provenance: TOOL_VERIFIED
  - basis: LAB1/02_full_adder/sim/tb_full_adder.sv

#### D. Representative expected behavior

- course_required_cases: UNKNOWN
  - provenance: UNKNOWN
  - basis: No course PDF/requirements provided
- report_recorded_cases: UNKNOWN
  - provenance: UNKNOWN
  - basis: No user report provided; current cases are suggestions

##### Case 1

- selection_source: AUTO_SUGGESTED
  - provenance: AUTO_DERIVED
  - basis: Automatically selected from design/TB in v1; user approval and course-required status are not established
- input: vector n=0; a=0, b=0, cin=0
  - provenance: AUTO_DERIVED
  - basis: LAB1/02_full_adder/sim/tb_full_adder.sv input enumeration; suggested representative vector
- expected output: cout=0, s=0
  - provenance: AUTO_DERIVED
  - basis: LAB1/02_full_adder/src/half_adder.v; LAB1/02_full_adder/src/full_adder.v and TB expected calculation
- calculation/reason: 0+0+0=0
  - provenance: AUTO_DERIVED
  - basis: LAB1/02_full_adder/src/half_adder.v; LAB1/02_full_adder/src/full_adder.v and TB expected calculation

##### Case 2

- selection_source: AUTO_SUGGESTED
  - provenance: AUTO_DERIVED
  - basis: Automatically selected from design/TB in v1; user approval and course-required status are not established
- input: vector n=3; a=0, b=1, cin=1
  - provenance: AUTO_DERIVED
  - basis: LAB1/02_full_adder/sim/tb_full_adder.sv input enumeration; suggested representative vector
- expected output: cout=1, s=0
  - provenance: AUTO_DERIVED
  - basis: LAB1/02_full_adder/src/half_adder.v; LAB1/02_full_adder/src/full_adder.v and TB expected calculation
- calculation/reason: 0+1+1=2
  - provenance: AUTO_DERIVED
  - basis: LAB1/02_full_adder/src/half_adder.v; LAB1/02_full_adder/src/full_adder.v and TB expected calculation

##### Case 3

- selection_source: AUTO_SUGGESTED
  - provenance: AUTO_DERIVED
  - basis: Automatically selected from design/TB in v1; user approval and course-required status are not established
- input: vector n=6; a=1, b=1, cin=0
  - provenance: AUTO_DERIVED
  - basis: LAB1/02_full_adder/sim/tb_full_adder.sv input enumeration; suggested representative vector
- expected output: cout=1, s=0
  - provenance: AUTO_DERIVED
  - basis: LAB1/02_full_adder/src/half_adder.v; LAB1/02_full_adder/src/full_adder.v and TB expected calculation
- calculation/reason: 1+1+0=2
  - provenance: AUTO_DERIVED
  - basis: LAB1/02_full_adder/src/half_adder.v; LAB1/02_full_adder/src/full_adder.v and TB expected calculation

##### Case 4

- selection_source: AUTO_SUGGESTED
  - provenance: AUTO_DERIVED
  - basis: Automatically selected from design/TB in v1; user approval and course-required status are not established
- input: vector n=7; a=1, b=1, cin=1
  - provenance: AUTO_DERIVED
  - basis: LAB1/02_full_adder/sim/tb_full_adder.sv input enumeration; suggested representative vector
- expected output: cout=1, s=1
  - provenance: AUTO_DERIVED
  - basis: LAB1/02_full_adder/src/half_adder.v; LAB1/02_full_adder/src/full_adder.v and TB expected calculation
- calculation/reason: 1+1+1=3
  - provenance: AUTO_DERIVED
  - basis: LAB1/02_full_adder/src/half_adder.v; LAB1/02_full_adder/src/full_adder.v and TB expected calculation

#### E. Normal simulation evidence

- run ID: run-e2dc5b3bf5af401bb6d906dd28fe5de7
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/02_full_adder/normal__run-e2dc5b3bf5af401bb6d906dd28fe5de7/simulation.log; VCD for numeric/time checks
- simulation.log path: evidence/vscode/LAB1/02_full_adder/normal__run-e2dc5b3bf5af401bb6d906dd28fe5de7/simulation.log
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/02_full_adder/normal__run-e2dc5b3bf5af401bb6d906dd28fe5de7/simulation.log; VCD for numeric/time checks
- compile.log path: evidence/vscode/LAB1/02_full_adder/normal__run-e2dc5b3bf5af401bb6d906dd28fe5de7/compile.log
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/02_full_adder/normal__run-e2dc5b3bf5af401bb6d906dd28fe5de7/simulation.log; VCD for numeric/time checks
- wave.vcd path: evidence/vscode/LAB1/02_full_adder/normal__run-e2dc5b3bf5af401bb6d906dd28fe5de7/wave.vcd
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/02_full_adder/normal__run-e2dc5b3bf5af401bb6d906dd28fe5de7/simulation.log; VCD for numeric/time checks
- PASS/FAIL: PASS
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/02_full_adder/normal__run-e2dc5b3bf5af401bb6d906dd28fe5de7/simulation.log; VCD for numeric/time checks
- cases: 8
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/02_full_adder/normal__run-e2dc5b3bf5af401bb6d906dd28fe5de7/simulation.log; VCD for numeric/time checks
- simulation end time: 80 ns (log and final VCD timestamp agree)
  - provenance: AUTO_DERIVED
  - basis: evidence/vscode/LAB1/02_full_adder/normal__run-e2dc5b3bf5af401bb6d906dd28fe5de7/simulation.log; VCD for numeric/time checks
- source commit: UNKNOWN
  - provenance: UNKNOWN
  - basis: Direct run-to-commit record unavailable
- evidence_integrity: VERIFIED_COPY
  - provenance: TOOL_VERIFIED
  - basis: v1 same-run copy verification; current evidence hash matches v1 hash audit

#### F. Intentional failure

- run ID: run-e2c662a627954effaf3507dedc43f1a5
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/02_full_adder/intentional_failure__run-e2c662a627954effaf3507dedc43f1a5/simulation.log and VCD
- RTL modification: cout: carry_ab|carry_cin -> carry_ab&carry_cin
  - provenance: TOOL_VERIFIED
  - basis: Git historical RTL change (not a run-specific source attribution)
- predicted failing condition: n=3 gives a=0,b=1,cin=1: correct carry=1, modified carry=0
  - provenance: AUTO_DERIVED
  - basis: Historical Git diff and current TB; post-hoc calculation, not a recorded pre-run prediction
- actual first failing vector: 3
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/02_full_adder/intentional_failure__run-e2c662a627954effaf3507dedc43f1a5/simulation.log and VCD
- expected: 0x2
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/02_full_adder/intentional_failure__run-e2c662a627954effaf3507dedc43f1a5/simulation.log and VCD
- actual: 0x0
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/02_full_adder/intentional_failure__run-e2c662a627954effaf3507dedc43f1a5/simulation.log and VCD
- failure time: 40 ns (log interpreted using VCD timescale)
  - provenance: AUTO_DERIVED
  - basis: evidence/vscode/LAB1/02_full_adder/intentional_failure__run-e2c662a627954effaf3507dedc43f1a5/simulation.log and VCD
- simulation.log path: evidence/vscode/LAB1/02_full_adder/intentional_failure__run-e2c662a627954effaf3507dedc43f1a5/simulation.log
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/02_full_adder/intentional_failure__run-e2c662a627954effaf3507dedc43f1a5/simulation.log and VCD
- wave.vcd path: evidence/vscode/LAB1/02_full_adder/intentional_failure__run-e2c662a627954effaf3507dedc43f1a5/wave.vcd
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/02_full_adder/intentional_failure__run-e2c662a627954effaf3507dedc43f1a5/simulation.log and VCD
- source commit: UNKNOWN
  - provenance: UNKNOWN
  - basis: Direct run-to-commit record unavailable

#### G. Recovery

- run ID: run-335a41eb710c467a94846bdabb4ec2c5
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/02_full_adder/recovery__run-335a41eb710c467a94846bdabb4ec2c5/simulation.log and VCD
- restored behavior: OR restored between the two half-adder carries
  - provenance: AUTO_DERIVED
  - basis: Git restoration history plus user-designated recovery evidence; direct commit linkage unavailable
- PASS/FAIL: PASS
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/02_full_adder/recovery__run-335a41eb710c467a94846bdabb4ec2c5/simulation.log and VCD
- cases: 8
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/02_full_adder/recovery__run-335a41eb710c467a94846bdabb4ec2c5/simulation.log and VCD
- simulation end time: 80 ns (log and final VCD timestamp agree)
  - provenance: AUTO_DERIVED
  - basis: evidence/vscode/LAB1/02_full_adder/recovery__run-335a41eb710c467a94846bdabb4ec2c5/simulation.log and VCD
- simulation.log path: evidence/vscode/LAB1/02_full_adder/recovery__run-335a41eb710c467a94846bdabb4ec2c5/simulation.log
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/02_full_adder/recovery__run-335a41eb710c467a94846bdabb4ec2c5/simulation.log and VCD
- wave.vcd path: evidence/vscode/LAB1/02_full_adder/recovery__run-335a41eb710c467a94846bdabb4ec2c5/wave.vcd
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/02_full_adder/recovery__run-335a41eb710c467a94846bdabb4ec2c5/simulation.log and VCD
- source commit: UNKNOWN
  - provenance: UNKNOWN
  - basis: Direct run-to-commit record unavailable

#### H. Waveform verification

- VCD_PRESENT: YES
  - provenance: TOOL_VERIFIED
  - basis: All three preserved run VCD files exist and were parsed
- VCD_RUN_TRACEABLE: YES
  - provenance: TOOL_VERIFIED
  - basis: Evidence folder run IDs, logs and VCDs; current hashes match v1 same-run copy audit; this is not source commit traceability
- VCD_NUMERIC_CHECK: VERIFIED
  - provenance: TOOL_VERIFIED
  - basis: Actual parsing of all three VCDs: representative normal/recovery inputs and outputs at both interval endpoints; failure TB expected and packed DUT output before fatal time; log/VCD end time agreement. Limited sampled numeric check, not full waveform/visual verification.
- USER_VISUAL_CHECK: NOT_VERIFIED
  - provenance: UNKNOWN
  - basis: No explicit user visual-inspection approval is recorded in the supplied evidence
- SCREENSHOT_PRESENT: NOT_AVAILABLE
  - provenance: TOOL_VERIFIED
  - basis: Evidence contains logs/VCD only; no user-confirmed screenshot file found
- representative_intervals: Candidate intervals only; values checked numerically. Selection and intervals remain derived suggestions.
  - provenance: AUTO_DERIVED
  - basis: TB vector index and 10 ns case interval; actual VCD samples
  - normal and recovery: [1, 9] ns, vector n=0; a=0, b=0, cin=0 -> cout=0, s=0
    - provenance: AUTO_DERIVED
    - basis: Suggested vector interval; corresponding VCD values parsed
  - normal and recovery: [31, 39] ns, vector n=3; a=0, b=1, cin=1 -> cout=1, s=0
    - provenance: AUTO_DERIVED
    - basis: Suggested vector interval; corresponding VCD values parsed
  - normal and recovery: [61, 69] ns, vector n=6; a=1, b=1, cin=0 -> cout=1, s=0
    - provenance: AUTO_DERIVED
    - basis: Suggested vector interval; corresponding VCD values parsed
  - normal and recovery: [71, 79] ns, vector n=7; a=1, b=1, cin=1 -> cout=1, s=1
    - provenance: AUTO_DERIVED
    - basis: Suggested vector interval; corresponding VCD values parsed
  - intentional_failure: [31, 39] ns, vector n=3; expected 0x2, actual 0x0; ends before fatal termination
    - provenance: AUTO_DERIVED
    - basis: Suggested vector interval; corresponding VCD values parsed
- VCD timescale: normal/failure/recovery: 1ps
  - provenance: TOOL_VERIFIED
  - basis: Preserved VCD $timescale declarations

#### I. Board plan

- board_status: NOT_PERFORMED
  - provenance: USER_REPORTED
  - basis: User instruction: keep board result NOT_PERFORMED
- XDC pin mapping: a->K4; b->N8; cin->N4; cout->L4; s->M4; all ports LVCMOS33
  - provenance: TOOL_VERIFIED
  - basis: LAB1/02_full_adder/constraints/full_adder.xdc
- planned user inputs: Apply the representative input vectors in section D via the physical controls associated with the XDC input package pins, after verifying the board mapping and polarity.
  - provenance: AUTO_DERIVED
  - basis: Proposed plan from RTL expected behavior and XDC; not a physical observation
- expected physical outputs: Design-level expected logic at output package pins follows section D. Actual LED/segment illumination is not inferred from package pins alone.
  - provenance: AUTO_DERIVED
  - basis: Proposed plan from RTL expected behavior and XDC; not a physical observation
- verification method: Confirm board model, control-to-pin mapping, output polarity and segment/digit wiring; then apply planned vectors and record actual observations/photos/measurements against section D. This is a plan only.
  - provenance: AUTO_DERIVED
  - basis: Proposed plan from RTL expected behavior and XDC; not a physical observation
- board model: UNKNOWN
  - provenance: UNKNOWN
  - basis: Board model/wiring/polarity evidence unavailable
- physical control/output mapping and polarity: UNKNOWN
  - provenance: UNKNOWN
  - basis: Board model/wiring/polarity evidence unavailable

#### J. Pre-report readiness

- design_information: READY
  - provenance: AUTO_DERIVED
  - basis: Draft-data readiness assessment; outstanding confirmations in section 4. READY does not certify student review or full verification
- expected_behavior: READY
  - provenance: AUTO_DERIVED
  - basis: Draft-data readiness assessment; outstanding confirmations in section 4. READY does not certify student review or full verification
- normal_simulation: READY
  - provenance: AUTO_DERIVED
  - basis: Draft-data readiness assessment; outstanding confirmations in section 4. READY does not certify student review or full verification
- intentional_failure: READY
  - provenance: AUTO_DERIVED
  - basis: Draft-data readiness assessment; outstanding confirmations in section 4. READY does not certify student review or full verification
- recovery: READY
  - provenance: AUTO_DERIVED
  - basis: Draft-data readiness assessment; outstanding confirmations in section 4. READY does not certify student review or full verification
- waveform_visual_evidence: MISSING
  - provenance: AUTO_DERIVED
  - basis: Draft-data readiness assessment; outstanding confirmations in section 4. READY does not certify student review or full verification
- board_plan: NEEDS_USER_CONFIRMATION
  - provenance: AUTO_DERIVED
  - basis: Draft-data readiness assessment; outstanding confirmations in section 4. READY does not certify student review or full verification
- experiment_readiness: NEEDS_USER_CONFIRMATION
  - provenance: AUTO_DERIVED
  - basis: Draft-data readiness assessment; outstanding confirmations in section 4. READY does not certify student review or full verification

#### K. QA notes

- note_id: compile_warning
  - note: All three preserved compile logs warn that design elements lack explicit time unit/time precision. Preserve this warning; no source was changed.
  - provenance: TOOL_VERIFIED
  - basis: normal/intentional_failure/recovery compile.log
- note_id: run_commit_gap
  - note: All three source commit fields remain UNKNOWN. Git change/restoration commits document source history, not direct run identity.
  - provenance: UNKNOWN
  - basis: No direct run-to-commit record in the supplied evidence
- note_id: role_provenance
  - note: Normal/failure/recovery folder roles follow the user-specified run selection. Role names are not independent proof of run source identity.
  - provenance: USER_REPORTED
  - basis: User-specified preservation run IDs and roles
- note_id: prediction_record
  - note: The predicted failing condition is a post-hoc AUTO_DERIVED calculation. A contemporaneous pre-run prediction record is not available.
  - provenance: UNKNOWN
  - basis: No pre-run prediction record in the supplied evidence
- note_id: readiness_scope
  - note: Draft factual inputs are available. Visual evidence, representative selection, student review, physical plan assumptions and source commit provenance remain unresolved.
  - provenance: AUTO_DERIVED
  - basis: Sections D/H/I/J and section 4
- historical_modification_evidence: Git change commit 9ce18d8, file LAB1/02_full_adder/src/full_adder.v; preserved FAIL log and VCD TB expected / packed DUT values agree. The run-specific historical RTL snapshot is not preserved here, so the exact run source identity is unconfirmed.
  - provenance: TOOL_VERIFIED
  - basis: Historical Git diff and preserved FAIL log/VCD; the quoted source-identity limitation remains in force
- historical_restoration_evidence: OR restored between the two half-adder carries; Git restoration commit 43567a7; recovery role follows user selection
  - provenance: TOOL_VERIFIED
  - basis: Git restoration history and user-selected role; not direct commit-to-run proof
- copy_integrity_audit: Prior v1 recorded original/copy equality. Current evidence SHA-256 was recomputed and matches every v1 stored hash; originals were not reread during v2 generation.
  - provenance: TOOL_VERIFIED
  - basis: Unchanged v1 audit plus current preserved evidence SHA-256

##### Evidence SHA-256 audit

| Role | File | SHA-256 | Prior original-copy match | Current evidence matches v1 hash | Provenance |
|---|---|---|---|---|---|
| normal | simulation.log | 2bd40fd396e29ee9e6b5a9705a57611f5265824943efd45b3574620c7b141c3f | YES | YES | TOOL_VERIFIED |
| normal | compile.log | 04f33000b54560c1ba32b2cfb3f039b0b06fbb2997c46f7cd96d9ad6929a4051 | YES | YES | TOOL_VERIFIED |
| normal | wave.vcd | 116eb50becc501c5e9d21d1b65d8f88388d51659ed6379b488efedc0004bcd4c | YES | YES | TOOL_VERIFIED |
| intentional_failure | simulation.log | 0c08ac311a8ca52ead67fc69003d1f8dc6758e2fd68a35174dd4f308ebee91f1 | YES | YES | TOOL_VERIFIED |
| intentional_failure | compile.log | 04f33000b54560c1ba32b2cfb3f039b0b06fbb2997c46f7cd96d9ad6929a4051 | YES | YES | TOOL_VERIFIED |
| intentional_failure | wave.vcd | 0e5e895f7d548be66f69493a7e983a9434a3915d1f4a92a68293a0fbd5d9b05a | YES | YES | TOOL_VERIFIED |
| recovery | simulation.log | 2bd40fd396e29ee9e6b5a9705a57611f5265824943efd45b3574620c7b141c3f | YES | YES | TOOL_VERIFIED |
| recovery | compile.log | 04f33000b54560c1ba32b2cfb3f039b0b06fbb2997c46f7cd96d9ad6929a4051 | YES | YES | TOOL_VERIFIED |
| recovery | wave.vcd | b45cf6285629ec2663ad8859888b8b57f89299efbf16d85624acda19b2cd96bb | YES | YES | TOOL_VERIFIED |

### 03_4bit_adder


#### A. Design identity

- experiment folder: LAB1/03_4bit_adder
  - provenance: TOOL_VERIFIED
  - basis: LAB1/03_4bit_adder current RTL/TB/XDC/simulation.json
- RTL file(s): LAB1/03_4bit_adder/src/adder_4bit.v
  - provenance: TOOL_VERIFIED
  - basis: LAB1/03_4bit_adder current RTL/TB/XDC/simulation.json
- RTL module(s): adder_4bit
  - provenance: TOOL_VERIFIED
  - basis: LAB1/03_4bit_adder current RTL/TB/XDC/simulation.json
- Design top: adder_4bit
  - provenance: AUTO_DERIVED
  - basis: LAB1/03_4bit_adder/sim/tb_adder_4bit.sv DUT instantiation
- TB file: LAB1/03_4bit_adder/sim/tb_adder_4bit.sv
  - provenance: TOOL_VERIFIED
  - basis: LAB1/03_4bit_adder current RTL/TB/XDC/simulation.json
- Simulation top: tb_adder_4bit
  - provenance: TOOL_VERIFIED
  - basis: LAB1/03_4bit_adder current RTL/TB/XDC/simulation.json
- XDC file: LAB1/03_4bit_adder/constraints/adder_4bit.xdc
  - provenance: TOOL_VERIFIED
  - basis: LAB1/03_4bit_adder current RTL/TB/XDC/simulation.json
- simulation.json: LAB1/03_4bit_adder/simulation.json
  - provenance: TOOL_VERIFIED
  - basis: LAB1/03_4bit_adder current RTL/TB/XDC/simulation.json
- input ports: a, b
  - provenance: TOOL_VERIFIED
  - basis: LAB1/03_4bit_adder current RTL/TB/XDC/simulation.json
- output ports: s, cout
  - provenance: TOOL_VERIFIED
  - basis: LAB1/03_4bit_adder current RTL/TB/XDC/simulation.json
- port widths: a: 4 bit(s); b: 4 bit(s); s: 4 bit(s); cout: 1 bit(s)
  - provenance: TOOL_VERIFIED
  - basis: LAB1/03_4bit_adder current RTL/TB/XDC/simulation.json

#### B. Functional intent

- functional description: Unsigned 4-bit addition, zero-extended to 5 bits: {cout,s}={1'b0,a}+{1'b0,b}. s is the low 4 bits; cout is carry bit 4.
  - provenance: AUTO_DERIVED
  - basis: LAB1/03_4bit_adder/src/adder_4bit.v
- valid_input_domain: NOT_APPLICABLE
  - provenance: AUTO_DERIVED
  - basis: LAB1/03_4bit_adder/src/adder_4bit.v and TB enumeration; no course material available
- invalid_input_behavior: NOT_APPLICABLE
  - provenance: AUTO_DERIVED
  - basis: No special restricted binary-input semantics identified

#### C. Testbench verification

- applied input sequence or enumeration method: {a,b}=n, n=0..255; a=n//16, b=n%16
  - provenance: TOOL_VERIFIED
  - basis: LAB1/03_4bit_adder/sim/tb_adder_4bit.sv
- number of test cases: 256
  - provenance: TOOL_VERIFIED
  - basis: LAB1/03_4bit_adder/sim/tb_adder_4bit.sv
- interval per case: 10 ns (#10 with 1ns time unit; observation after the delay)
  - provenance: AUTO_DERIVED
  - basis: LAB1/03_4bit_adder/sim/tb_adder_4bit.sv
- total expected simulation time: 2560 ns for an uninterrupted PASS path
  - provenance: AUTO_DERIVED
  - basis: LAB1/03_4bit_adder/sim/tb_adder_4bit.sv
- expected calculation method: (n/16)+(n%16)
  - provenance: TOOL_VERIFIED
  - basis: LAB1/03_4bit_adder/sim/tb_adder_4bit.sv
- DUT output compared against: {cout,s} compared to expected with !== (case inequality, including X/Z detection)
  - provenance: TOOL_VERIFIED
  - basis: LAB1/03_4bit_adder/sim/tb_adder_4bit.sv
- PASS condition: All 256 comparisons pass; checked==256; LAB1_PASS with cases=256 is printed, then $finish
  - provenance: AUTO_DERIVED
  - basis: LAB1/03_4bit_adder/sim/tb_adder_4bit.sv
- FAIL condition: {cout,s} !== expected -> $fatal with vector/expected/actual; checked!=256 -> Incomplete test
  - provenance: AUTO_DERIVED
  - basis: LAB1/03_4bit_adder/sim/tb_adder_4bit.sv
- watchdog: At 100000 ns, $fatal(1, watchdog/Watchdog) if execution has not already ended
  - provenance: AUTO_DERIVED
  - basis: LAB1/03_4bit_adder/sim/tb_adder_4bit.sv
- code basis: LAB1/03_4bit_adder/sim/tb_adder_4bit.sv; timescale=1ns/1ps
  - provenance: TOOL_VERIFIED
  - basis: LAB1/03_4bit_adder/sim/tb_adder_4bit.sv

#### D. Representative expected behavior

- course_required_cases: UNKNOWN
  - provenance: UNKNOWN
  - basis: No course PDF/requirements provided
- report_recorded_cases: UNKNOWN
  - provenance: UNKNOWN
  - basis: No user report provided; current cases are suggestions

##### Case 1

- selection_source: AUTO_SUGGESTED
  - provenance: AUTO_DERIVED
  - basis: Automatically selected from design/TB in v1; user approval and course-required status are not established
- input: vector n=0; a=0b0000 (0x0), b=0b0000 (0x0)
  - provenance: AUTO_DERIVED
  - basis: LAB1/03_4bit_adder/sim/tb_adder_4bit.sv input enumeration; suggested representative vector
- expected output: cout=0, s=0b0000 (0x0)
  - provenance: AUTO_DERIVED
  - basis: LAB1/03_4bit_adder/src/adder_4bit.v and TB expected calculation
- calculation/reason: 0+0=0; low 4 bits and carry
  - provenance: AUTO_DERIVED
  - basis: LAB1/03_4bit_adder/src/adder_4bit.v and TB expected calculation

##### Case 2

- selection_source: AUTO_SUGGESTED
  - provenance: AUTO_DERIVED
  - basis: Automatically selected from design/TB in v1; user approval and course-required status are not established
- input: vector n=1; a=0b0000 (0x0), b=0b0001 (0x1)
  - provenance: AUTO_DERIVED
  - basis: LAB1/03_4bit_adder/sim/tb_adder_4bit.sv input enumeration; suggested representative vector
- expected output: cout=0, s=0b0001 (0x1)
  - provenance: AUTO_DERIVED
  - basis: LAB1/03_4bit_adder/src/adder_4bit.v and TB expected calculation
- calculation/reason: 0+1=1; low 4 bits and carry
  - provenance: AUTO_DERIVED
  - basis: LAB1/03_4bit_adder/src/adder_4bit.v and TB expected calculation

##### Case 3

- selection_source: AUTO_SUGGESTED
  - provenance: AUTO_DERIVED
  - basis: Automatically selected from design/TB in v1; user approval and course-required status are not established
- input: vector n=143; a=0b1000 (0x8), b=0b1111 (0xf)
  - provenance: AUTO_DERIVED
  - basis: LAB1/03_4bit_adder/sim/tb_adder_4bit.sv input enumeration; suggested representative vector
- expected output: cout=1, s=0b0111 (0x7)
  - provenance: AUTO_DERIVED
  - basis: LAB1/03_4bit_adder/src/adder_4bit.v and TB expected calculation
- calculation/reason: 8+15=23; low 4 bits and carry
  - provenance: AUTO_DERIVED
  - basis: LAB1/03_4bit_adder/src/adder_4bit.v and TB expected calculation

##### Case 4

- selection_source: AUTO_SUGGESTED
  - provenance: AUTO_DERIVED
  - basis: Automatically selected from design/TB in v1; user approval and course-required status are not established
- input: vector n=255; a=0b1111 (0xf), b=0b1111 (0xf)
  - provenance: AUTO_DERIVED
  - basis: LAB1/03_4bit_adder/sim/tb_adder_4bit.sv input enumeration; suggested representative vector
- expected output: cout=1, s=0b1110 (0xe)
  - provenance: AUTO_DERIVED
  - basis: LAB1/03_4bit_adder/src/adder_4bit.v and TB expected calculation
- calculation/reason: 15+15=30; low 4 bits and carry
  - provenance: AUTO_DERIVED
  - basis: LAB1/03_4bit_adder/src/adder_4bit.v and TB expected calculation

#### E. Normal simulation evidence

- run ID: run-096c1dfe66a7434e8f15364c42d08412
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/03_4bit_adder/normal__run-096c1dfe66a7434e8f15364c42d08412/simulation.log; VCD for numeric/time checks
- simulation.log path: evidence/vscode/LAB1/03_4bit_adder/normal__run-096c1dfe66a7434e8f15364c42d08412/simulation.log
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/03_4bit_adder/normal__run-096c1dfe66a7434e8f15364c42d08412/simulation.log; VCD for numeric/time checks
- compile.log path: evidence/vscode/LAB1/03_4bit_adder/normal__run-096c1dfe66a7434e8f15364c42d08412/compile.log
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/03_4bit_adder/normal__run-096c1dfe66a7434e8f15364c42d08412/simulation.log; VCD for numeric/time checks
- wave.vcd path: evidence/vscode/LAB1/03_4bit_adder/normal__run-096c1dfe66a7434e8f15364c42d08412/wave.vcd
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/03_4bit_adder/normal__run-096c1dfe66a7434e8f15364c42d08412/simulation.log; VCD for numeric/time checks
- PASS/FAIL: PASS
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/03_4bit_adder/normal__run-096c1dfe66a7434e8f15364c42d08412/simulation.log; VCD for numeric/time checks
- cases: 256
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/03_4bit_adder/normal__run-096c1dfe66a7434e8f15364c42d08412/simulation.log; VCD for numeric/time checks
- simulation end time: 2560 ns (log and final VCD timestamp agree)
  - provenance: AUTO_DERIVED
  - basis: evidence/vscode/LAB1/03_4bit_adder/normal__run-096c1dfe66a7434e8f15364c42d08412/simulation.log; VCD for numeric/time checks
- source commit: UNKNOWN
  - provenance: UNKNOWN
  - basis: Direct run-to-commit record unavailable
- evidence_integrity: VERIFIED_COPY
  - provenance: TOOL_VERIFIED
  - basis: v1 same-run copy verification; current evidence hash matches v1 hash audit

#### F. Intentional failure

- run ID: run-ce60d29254dc4e588077b39cbfb72a1f
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/03_4bit_adder/intentional_failure__run-ce60d29254dc4e588077b39cbfb72a1f/simulation.log and VCD
- RTL modification: 5-bit operation: addition -> subtraction
  - provenance: TOOL_VERIFIED
  - basis: Git historical RTL change (not a run-specific source attribution)
- predicted failing condition: n=1 gives a=0,b=1: correct sum=0x01; 5-bit subtraction wraps to 0x1f
  - provenance: AUTO_DERIVED
  - basis: Historical Git diff and current TB; post-hoc calculation, not a recorded pre-run prediction
- actual first failing vector: 1
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/03_4bit_adder/intentional_failure__run-ce60d29254dc4e588077b39cbfb72a1f/simulation.log and VCD
- expected: 0x01
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/03_4bit_adder/intentional_failure__run-ce60d29254dc4e588077b39cbfb72a1f/simulation.log and VCD
- actual: 0x1f
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/03_4bit_adder/intentional_failure__run-ce60d29254dc4e588077b39cbfb72a1f/simulation.log and VCD
- failure time: 20 ns (log interpreted using VCD timescale)
  - provenance: AUTO_DERIVED
  - basis: evidence/vscode/LAB1/03_4bit_adder/intentional_failure__run-ce60d29254dc4e588077b39cbfb72a1f/simulation.log and VCD
- simulation.log path: evidence/vscode/LAB1/03_4bit_adder/intentional_failure__run-ce60d29254dc4e588077b39cbfb72a1f/simulation.log
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/03_4bit_adder/intentional_failure__run-ce60d29254dc4e588077b39cbfb72a1f/simulation.log and VCD
- wave.vcd path: evidence/vscode/LAB1/03_4bit_adder/intentional_failure__run-ce60d29254dc4e588077b39cbfb72a1f/wave.vcd
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/03_4bit_adder/intentional_failure__run-ce60d29254dc4e588077b39cbfb72a1f/simulation.log and VCD
- source commit: UNKNOWN
  - provenance: UNKNOWN
  - basis: Direct run-to-commit record unavailable

#### G. Recovery

- run ID: run-3553617cda564961a84d1f67c16a5256
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/03_4bit_adder/recovery__run-3553617cda564961a84d1f67c16a5256/simulation.log and VCD
- restored behavior: 5-bit addition restored
  - provenance: AUTO_DERIVED
  - basis: Git restoration history plus user-designated recovery evidence; direct commit linkage unavailable
- PASS/FAIL: PASS
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/03_4bit_adder/recovery__run-3553617cda564961a84d1f67c16a5256/simulation.log and VCD
- cases: 256
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/03_4bit_adder/recovery__run-3553617cda564961a84d1f67c16a5256/simulation.log and VCD
- simulation end time: 2560 ns (log and final VCD timestamp agree)
  - provenance: AUTO_DERIVED
  - basis: evidence/vscode/LAB1/03_4bit_adder/recovery__run-3553617cda564961a84d1f67c16a5256/simulation.log and VCD
- simulation.log path: evidence/vscode/LAB1/03_4bit_adder/recovery__run-3553617cda564961a84d1f67c16a5256/simulation.log
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/03_4bit_adder/recovery__run-3553617cda564961a84d1f67c16a5256/simulation.log and VCD
- wave.vcd path: evidence/vscode/LAB1/03_4bit_adder/recovery__run-3553617cda564961a84d1f67c16a5256/wave.vcd
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/03_4bit_adder/recovery__run-3553617cda564961a84d1f67c16a5256/simulation.log and VCD
- source commit: UNKNOWN
  - provenance: UNKNOWN
  - basis: Direct run-to-commit record unavailable

#### H. Waveform verification

- VCD_PRESENT: YES
  - provenance: TOOL_VERIFIED
  - basis: All three preserved run VCD files exist and were parsed
- VCD_RUN_TRACEABLE: YES
  - provenance: TOOL_VERIFIED
  - basis: Evidence folder run IDs, logs and VCDs; current hashes match v1 same-run copy audit; this is not source commit traceability
- VCD_NUMERIC_CHECK: VERIFIED
  - provenance: TOOL_VERIFIED
  - basis: Actual parsing of all three VCDs: representative normal/recovery inputs and outputs at both interval endpoints; failure TB expected and packed DUT output before fatal time; log/VCD end time agreement. Limited sampled numeric check, not full waveform/visual verification.
- USER_VISUAL_CHECK: NOT_VERIFIED
  - provenance: UNKNOWN
  - basis: No explicit user visual-inspection approval is recorded in the supplied evidence
- SCREENSHOT_PRESENT: NOT_AVAILABLE
  - provenance: TOOL_VERIFIED
  - basis: Evidence contains logs/VCD only; no user-confirmed screenshot file found
- representative_intervals: Candidate intervals only; values checked numerically. Selection and intervals remain derived suggestions.
  - provenance: AUTO_DERIVED
  - basis: TB vector index and 10 ns case interval; actual VCD samples
  - normal and recovery: [1, 9] ns, vector n=0; a=0b0000 (0x0), b=0b0000 (0x0) -> cout=0, s=0b0000 (0x0)
    - provenance: AUTO_DERIVED
    - basis: Suggested vector interval; corresponding VCD values parsed
  - normal and recovery: [11, 19] ns, vector n=1; a=0b0000 (0x0), b=0b0001 (0x1) -> cout=0, s=0b0001 (0x1)
    - provenance: AUTO_DERIVED
    - basis: Suggested vector interval; corresponding VCD values parsed
  - normal and recovery: [1431, 1439] ns, vector n=143; a=0b1000 (0x8), b=0b1111 (0xf) -> cout=1, s=0b0111 (0x7)
    - provenance: AUTO_DERIVED
    - basis: Suggested vector interval; corresponding VCD values parsed
  - normal and recovery: [2551, 2559] ns, vector n=255; a=0b1111 (0xf), b=0b1111 (0xf) -> cout=1, s=0b1110 (0xe)
    - provenance: AUTO_DERIVED
    - basis: Suggested vector interval; corresponding VCD values parsed
  - intentional_failure: [11, 19] ns, vector n=1; expected 0x01, actual 0x1f; ends before fatal termination
    - provenance: AUTO_DERIVED
    - basis: Suggested vector interval; corresponding VCD values parsed
- VCD timescale: normal/failure/recovery: 1ps
  - provenance: TOOL_VERIFIED
  - basis: Preserved VCD $timescale declarations

#### I. Board plan

- board_status: NOT_PERFORMED
  - provenance: USER_REPORTED
  - basis: User instruction: keep board result NOT_PERFORMED
- XDC pin mapping: a[3]->Y1; a[2]->W3; a[1]->U2; a[0]->T1; b[3]->W4; b[2]->W1; b[1]->V4; b[0]->U4; s[3]->M4; s[2]->M2; s[1]->N7; s[0]->M7; cout->L4; all ports LVCMOS33
  - provenance: TOOL_VERIFIED
  - basis: LAB1/03_4bit_adder/constraints/adder_4bit.xdc
- planned user inputs: Apply the representative input vectors in section D via the physical controls associated with the XDC input package pins, after verifying the board mapping and polarity.
  - provenance: AUTO_DERIVED
  - basis: Proposed plan from RTL expected behavior and XDC; not a physical observation
- expected physical outputs: Design-level expected logic at output package pins follows section D. Actual LED/segment illumination is not inferred from package pins alone.
  - provenance: AUTO_DERIVED
  - basis: Proposed plan from RTL expected behavior and XDC; not a physical observation
- verification method: Confirm board model, control-to-pin mapping, output polarity and segment/digit wiring; then apply planned vectors and record actual observations/photos/measurements against section D. This is a plan only.
  - provenance: AUTO_DERIVED
  - basis: Proposed plan from RTL expected behavior and XDC; not a physical observation
- board model: UNKNOWN
  - provenance: UNKNOWN
  - basis: Board model/wiring/polarity evidence unavailable
- physical control/output mapping and polarity: UNKNOWN
  - provenance: UNKNOWN
  - basis: Board model/wiring/polarity evidence unavailable

#### J. Pre-report readiness

- design_information: READY
  - provenance: AUTO_DERIVED
  - basis: Draft-data readiness assessment; outstanding confirmations in section 4. READY does not certify student review or full verification
- expected_behavior: READY
  - provenance: AUTO_DERIVED
  - basis: Draft-data readiness assessment; outstanding confirmations in section 4. READY does not certify student review or full verification
- normal_simulation: READY
  - provenance: AUTO_DERIVED
  - basis: Draft-data readiness assessment; outstanding confirmations in section 4. READY does not certify student review or full verification
- intentional_failure: READY
  - provenance: AUTO_DERIVED
  - basis: Draft-data readiness assessment; outstanding confirmations in section 4. READY does not certify student review or full verification
- recovery: READY
  - provenance: AUTO_DERIVED
  - basis: Draft-data readiness assessment; outstanding confirmations in section 4. READY does not certify student review or full verification
- waveform_visual_evidence: MISSING
  - provenance: AUTO_DERIVED
  - basis: Draft-data readiness assessment; outstanding confirmations in section 4. READY does not certify student review or full verification
- board_plan: NEEDS_USER_CONFIRMATION
  - provenance: AUTO_DERIVED
  - basis: Draft-data readiness assessment; outstanding confirmations in section 4. READY does not certify student review or full verification
- experiment_readiness: NEEDS_USER_CONFIRMATION
  - provenance: AUTO_DERIVED
  - basis: Draft-data readiness assessment; outstanding confirmations in section 4. READY does not certify student review or full verification

#### K. QA notes

- note_id: compile_warning
  - note: All three preserved compile logs warn that design elements lack explicit time unit/time precision. Preserve this warning; no source was changed.
  - provenance: TOOL_VERIFIED
  - basis: normal/intentional_failure/recovery compile.log
- note_id: run_commit_gap
  - note: All three source commit fields remain UNKNOWN. Git change/restoration commits document source history, not direct run identity.
  - provenance: UNKNOWN
  - basis: No direct run-to-commit record in the supplied evidence
- note_id: role_provenance
  - note: Normal/failure/recovery folder roles follow the user-specified run selection. Role names are not independent proof of run source identity.
  - provenance: USER_REPORTED
  - basis: User-specified preservation run IDs and roles
- note_id: prediction_record
  - note: The predicted failing condition is a post-hoc AUTO_DERIVED calculation. A contemporaneous pre-run prediction record is not available.
  - provenance: UNKNOWN
  - basis: No pre-run prediction record in the supplied evidence
- note_id: readiness_scope
  - note: Draft factual inputs are available. Visual evidence, representative selection, student review, physical plan assumptions and source commit provenance remain unresolved.
  - provenance: AUTO_DERIVED
  - basis: Sections D/H/I/J and section 4
- historical_modification_evidence: Git change commit f8d0948, file LAB1/03_4bit_adder/src/adder_4bit.v; preserved FAIL log and VCD TB expected / packed DUT values agree. The run-specific historical RTL snapshot is not preserved here, so the exact run source identity is unconfirmed.
  - provenance: TOOL_VERIFIED
  - basis: Historical Git diff and preserved FAIL log/VCD; the quoted source-identity limitation remains in force
- historical_restoration_evidence: 5-bit addition restored; Git restoration commit 6666687; recovery role follows user selection
  - provenance: TOOL_VERIFIED
  - basis: Git restoration history and user-selected role; not direct commit-to-run proof
- copy_integrity_audit: Prior v1 recorded original/copy equality. Current evidence SHA-256 was recomputed and matches every v1 stored hash; originals were not reread during v2 generation.
  - provenance: TOOL_VERIFIED
  - basis: Unchanged v1 audit plus current preserved evidence SHA-256

##### Evidence SHA-256 audit

| Role | File | SHA-256 | Prior original-copy match | Current evidence matches v1 hash | Provenance |
|---|---|---|---|---|---|
| normal | simulation.log | e08fb4865f0ad5c61284bd866676dfabf1a66c6d56d0d6a484d7fdbb64fbf0c4 | YES | YES | TOOL_VERIFIED |
| normal | compile.log | c3a4bbb79d3a69e94ec0434eb0470b928e562c39bdcb73006f15ce1930c910b7 | YES | YES | TOOL_VERIFIED |
| normal | wave.vcd | 09b32d3bdc8dbd9e4df2893350fcb85e67f396de6e0ebc384f2ed18ca49e9a2e | YES | YES | TOOL_VERIFIED |
| intentional_failure | simulation.log | c9e387be6b83c285009b239612e7b67eb73e386957dbb98713dc529d0d032ec9 | YES | YES | TOOL_VERIFIED |
| intentional_failure | compile.log | c3a4bbb79d3a69e94ec0434eb0470b928e562c39bdcb73006f15ce1930c910b7 | YES | YES | TOOL_VERIFIED |
| intentional_failure | wave.vcd | 09d4d4dca8df5d72059f196a8924853db9d62eadf5305dfe8ced686be5a9a106 | YES | YES | TOOL_VERIFIED |
| recovery | simulation.log | e08fb4865f0ad5c61284bd866676dfabf1a66c6d56d0d6a484d7fdbb64fbf0c4 | YES | YES | TOOL_VERIFIED |
| recovery | compile.log | c3a4bbb79d3a69e94ec0434eb0470b928e562c39bdcb73006f15ce1930c910b7 | YES | YES | TOOL_VERIFIED |
| recovery | wave.vcd | 19736fccba3c0addcd886c2b1a3fde97daf2cfbd4324bf153551e4443744fd30 | YES | YES | TOOL_VERIFIED |

### 04_4bit_subtractor


#### A. Design identity

- experiment folder: LAB1/04_4bit_subtractor
  - provenance: TOOL_VERIFIED
  - basis: LAB1/04_4bit_subtractor current RTL/TB/XDC/simulation.json
- RTL file(s): LAB1/04_4bit_subtractor/src/sub_4bit.v
  - provenance: TOOL_VERIFIED
  - basis: LAB1/04_4bit_subtractor current RTL/TB/XDC/simulation.json
- RTL module(s): sub_4bit
  - provenance: TOOL_VERIFIED
  - basis: LAB1/04_4bit_subtractor current RTL/TB/XDC/simulation.json
- Design top: sub_4bit
  - provenance: AUTO_DERIVED
  - basis: LAB1/04_4bit_subtractor/sim/tb_sub_4bit.sv DUT instantiation
- TB file: LAB1/04_4bit_subtractor/sim/tb_sub_4bit.sv
  - provenance: TOOL_VERIFIED
  - basis: LAB1/04_4bit_subtractor current RTL/TB/XDC/simulation.json
- Simulation top: tb_sub_4bit
  - provenance: TOOL_VERIFIED
  - basis: LAB1/04_4bit_subtractor current RTL/TB/XDC/simulation.json
- XDC file: LAB1/04_4bit_subtractor/constraints/sub_4bit.xdc
  - provenance: TOOL_VERIFIED
  - basis: LAB1/04_4bit_subtractor current RTL/TB/XDC/simulation.json
- simulation.json: LAB1/04_4bit_subtractor/simulation.json
  - provenance: TOOL_VERIFIED
  - basis: LAB1/04_4bit_subtractor current RTL/TB/XDC/simulation.json
- input ports: a, b
  - provenance: TOOL_VERIFIED
  - basis: LAB1/04_4bit_subtractor current RTL/TB/XDC/simulation.json
- output ports: d, bor
  - provenance: TOOL_VERIFIED
  - basis: LAB1/04_4bit_subtractor current RTL/TB/XDC/simulation.json
- port widths: a: 4 bit(s); b: 4 bit(s); d: 4 bit(s); bor: 1 bit(s)
  - provenance: TOOL_VERIFIED
  - basis: LAB1/04_4bit_subtractor current RTL/TB/XDC/simulation.json

#### B. Functional intent

- functional description: d=(a-b) modulo 16; bor=(a<b). Equal operands do not borrow. Output packing {bor,d}.
  - provenance: AUTO_DERIVED
  - basis: LAB1/04_4bit_subtractor/src/sub_4bit.v
- valid_input_domain: NOT_APPLICABLE
  - provenance: AUTO_DERIVED
  - basis: LAB1/04_4bit_subtractor/src/sub_4bit.v and TB enumeration; no course material available
- invalid_input_behavior: NOT_APPLICABLE
  - provenance: AUTO_DERIVED
  - basis: No special restricted binary-input semantics identified

#### C. Testbench verification

- applied input sequence or enumeration method: {a,b}=n, n=0..255; a=n//16, b=n%16
  - provenance: TOOL_VERIFIED
  - basis: LAB1/04_4bit_subtractor/sim/tb_sub_4bit.sv
- number of test cases: 256
  - provenance: TOOL_VERIFIED
  - basis: LAB1/04_4bit_subtractor/sim/tb_sub_4bit.sv
- interval per case: 10 ns (#10 with 1ns time unit; observation after the delay)
  - provenance: AUTO_DERIVED
  - basis: LAB1/04_4bit_subtractor/sim/tb_sub_4bit.sv
- total expected simulation time: 2560 ns for an uninterrupted PASS path
  - provenance: AUTO_DERIVED
  - basis: LAB1/04_4bit_subtractor/sim/tb_sub_4bit.sv
- expected calculation method: (((n/16)<(n%16))?16:0) | (((n/16)-(n%16))&15)
  - provenance: TOOL_VERIFIED
  - basis: LAB1/04_4bit_subtractor/sim/tb_sub_4bit.sv
- DUT output compared against: {bor,d} compared to expected with !== (case inequality, including X/Z detection)
  - provenance: TOOL_VERIFIED
  - basis: LAB1/04_4bit_subtractor/sim/tb_sub_4bit.sv
- PASS condition: All 256 comparisons pass; checked==256; LAB1_PASS with cases=256 is printed, then $finish
  - provenance: AUTO_DERIVED
  - basis: LAB1/04_4bit_subtractor/sim/tb_sub_4bit.sv
- FAIL condition: {bor,d} !== expected -> $fatal with vector/expected/actual; checked!=256 -> Incomplete test
  - provenance: AUTO_DERIVED
  - basis: LAB1/04_4bit_subtractor/sim/tb_sub_4bit.sv
- watchdog: At 100000 ns, $fatal(1, watchdog/Watchdog) if execution has not already ended
  - provenance: AUTO_DERIVED
  - basis: LAB1/04_4bit_subtractor/sim/tb_sub_4bit.sv
- code basis: LAB1/04_4bit_subtractor/sim/tb_sub_4bit.sv; timescale=1ns/1ps
  - provenance: TOOL_VERIFIED
  - basis: LAB1/04_4bit_subtractor/sim/tb_sub_4bit.sv

#### D. Representative expected behavior

- course_required_cases: UNKNOWN
  - provenance: UNKNOWN
  - basis: No course PDF/requirements provided
- report_recorded_cases: UNKNOWN
  - provenance: UNKNOWN
  - basis: No user report provided; current cases are suggestions

##### Case 1

- selection_source: AUTO_SUGGESTED
  - provenance: AUTO_DERIVED
  - basis: Automatically selected from design/TB in v1; user approval and course-required status are not established
- input: vector n=0; a=0b0000 (0x0), b=0b0000 (0x0)
  - provenance: AUTO_DERIVED
  - basis: LAB1/04_4bit_subtractor/sim/tb_sub_4bit.sv input enumeration; suggested representative vector
- expected output: bor=0, d=0b0000 (0x0)
  - provenance: AUTO_DERIVED
  - basis: LAB1/04_4bit_subtractor/src/sub_4bit.v and TB expected calculation
- calculation/reason: 0-0 modulo 16; borrow=0
  - provenance: AUTO_DERIVED
  - basis: LAB1/04_4bit_subtractor/src/sub_4bit.v and TB expected calculation

##### Case 2

- selection_source: AUTO_SUGGESTED
  - provenance: AUTO_DERIVED
  - basis: Automatically selected from design/TB in v1; user approval and course-required status are not established
- input: vector n=1; a=0b0000 (0x0), b=0b0001 (0x1)
  - provenance: AUTO_DERIVED
  - basis: LAB1/04_4bit_subtractor/sim/tb_sub_4bit.sv input enumeration; suggested representative vector
- expected output: bor=1, d=0b1111 (0xf)
  - provenance: AUTO_DERIVED
  - basis: LAB1/04_4bit_subtractor/src/sub_4bit.v and TB expected calculation
- calculation/reason: 0-1 modulo 16; borrow=1
  - provenance: AUTO_DERIVED
  - basis: LAB1/04_4bit_subtractor/src/sub_4bit.v and TB expected calculation

##### Case 3

- selection_source: AUTO_SUGGESTED
  - provenance: AUTO_DERIVED
  - basis: Automatically selected from design/TB in v1; user approval and course-required status are not established
- input: vector n=240; a=0b1111 (0xf), b=0b0000 (0x0)
  - provenance: AUTO_DERIVED
  - basis: LAB1/04_4bit_subtractor/sim/tb_sub_4bit.sv input enumeration; suggested representative vector
- expected output: bor=0, d=0b1111 (0xf)
  - provenance: AUTO_DERIVED
  - basis: LAB1/04_4bit_subtractor/src/sub_4bit.v and TB expected calculation
- calculation/reason: 15-0 modulo 16; borrow=0
  - provenance: AUTO_DERIVED
  - basis: LAB1/04_4bit_subtractor/src/sub_4bit.v and TB expected calculation

##### Case 4

- selection_source: AUTO_SUGGESTED
  - provenance: AUTO_DERIVED
  - basis: Automatically selected from design/TB in v1; user approval and course-required status are not established
- input: vector n=255; a=0b1111 (0xf), b=0b1111 (0xf)
  - provenance: AUTO_DERIVED
  - basis: LAB1/04_4bit_subtractor/sim/tb_sub_4bit.sv input enumeration; suggested representative vector
- expected output: bor=0, d=0b0000 (0x0)
  - provenance: AUTO_DERIVED
  - basis: LAB1/04_4bit_subtractor/src/sub_4bit.v and TB expected calculation
- calculation/reason: 15-15 modulo 16; borrow=0
  - provenance: AUTO_DERIVED
  - basis: LAB1/04_4bit_subtractor/src/sub_4bit.v and TB expected calculation

#### E. Normal simulation evidence

- run ID: run-816105e21bbd4d6cab19cedd6140ad91
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/04_4bit_subtractor/normal__run-816105e21bbd4d6cab19cedd6140ad91/simulation.log; VCD for numeric/time checks
- simulation.log path: evidence/vscode/LAB1/04_4bit_subtractor/normal__run-816105e21bbd4d6cab19cedd6140ad91/simulation.log
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/04_4bit_subtractor/normal__run-816105e21bbd4d6cab19cedd6140ad91/simulation.log; VCD for numeric/time checks
- compile.log path: evidence/vscode/LAB1/04_4bit_subtractor/normal__run-816105e21bbd4d6cab19cedd6140ad91/compile.log
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/04_4bit_subtractor/normal__run-816105e21bbd4d6cab19cedd6140ad91/simulation.log; VCD for numeric/time checks
- wave.vcd path: evidence/vscode/LAB1/04_4bit_subtractor/normal__run-816105e21bbd4d6cab19cedd6140ad91/wave.vcd
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/04_4bit_subtractor/normal__run-816105e21bbd4d6cab19cedd6140ad91/simulation.log; VCD for numeric/time checks
- PASS/FAIL: PASS
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/04_4bit_subtractor/normal__run-816105e21bbd4d6cab19cedd6140ad91/simulation.log; VCD for numeric/time checks
- cases: 256
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/04_4bit_subtractor/normal__run-816105e21bbd4d6cab19cedd6140ad91/simulation.log; VCD for numeric/time checks
- simulation end time: 2560 ns (log and final VCD timestamp agree)
  - provenance: AUTO_DERIVED
  - basis: evidence/vscode/LAB1/04_4bit_subtractor/normal__run-816105e21bbd4d6cab19cedd6140ad91/simulation.log; VCD for numeric/time checks
- source commit: UNKNOWN
  - provenance: UNKNOWN
  - basis: Direct run-to-commit record unavailable
- evidence_integrity: VERIFIED_COPY
  - provenance: TOOL_VERIFIED
  - basis: v1 same-run copy verification; current evidence hash matches v1 hash audit

#### F. Intentional failure

- run ID: run-13fbdfbd780a43b19a7da64e2165dc52
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/04_4bit_subtractor/intentional_failure__run-13fbdfbd780a43b19a7da64e2165dc52/simulation.log and VCD
- RTL modification: bor: a<b -> a<=b
  - provenance: TOOL_VERIFIED
  - basis: Git historical RTL change (not a run-specific source attribution)
- predicted failing condition: n=0 gives a=b=0: modified comparator asserts borrow although equality must not borrow
  - provenance: AUTO_DERIVED
  - basis: Historical Git diff and current TB; post-hoc calculation, not a recorded pre-run prediction
- actual first failing vector: 0
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/04_4bit_subtractor/intentional_failure__run-13fbdfbd780a43b19a7da64e2165dc52/simulation.log and VCD
- expected: 0x00
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/04_4bit_subtractor/intentional_failure__run-13fbdfbd780a43b19a7da64e2165dc52/simulation.log and VCD
- actual: 0x10
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/04_4bit_subtractor/intentional_failure__run-13fbdfbd780a43b19a7da64e2165dc52/simulation.log and VCD
- failure time: 10 ns (log interpreted using VCD timescale)
  - provenance: AUTO_DERIVED
  - basis: evidence/vscode/LAB1/04_4bit_subtractor/intentional_failure__run-13fbdfbd780a43b19a7da64e2165dc52/simulation.log and VCD
- simulation.log path: evidence/vscode/LAB1/04_4bit_subtractor/intentional_failure__run-13fbdfbd780a43b19a7da64e2165dc52/simulation.log
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/04_4bit_subtractor/intentional_failure__run-13fbdfbd780a43b19a7da64e2165dc52/simulation.log and VCD
- wave.vcd path: evidence/vscode/LAB1/04_4bit_subtractor/intentional_failure__run-13fbdfbd780a43b19a7da64e2165dc52/wave.vcd
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/04_4bit_subtractor/intentional_failure__run-13fbdfbd780a43b19a7da64e2165dc52/simulation.log and VCD
- source commit: UNKNOWN
  - provenance: UNKNOWN
  - basis: Direct run-to-commit record unavailable

#### G. Recovery

- run ID: run-0bbbc6a5fb114175b9282372017875bc
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/04_4bit_subtractor/recovery__run-0bbbc6a5fb114175b9282372017875bc/simulation.log and VCD
- restored behavior: Strict borrow comparison a<b restored
  - provenance: AUTO_DERIVED
  - basis: Git restoration history plus user-designated recovery evidence; direct commit linkage unavailable
- PASS/FAIL: PASS
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/04_4bit_subtractor/recovery__run-0bbbc6a5fb114175b9282372017875bc/simulation.log and VCD
- cases: 256
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/04_4bit_subtractor/recovery__run-0bbbc6a5fb114175b9282372017875bc/simulation.log and VCD
- simulation end time: 2560 ns (log and final VCD timestamp agree)
  - provenance: AUTO_DERIVED
  - basis: evidence/vscode/LAB1/04_4bit_subtractor/recovery__run-0bbbc6a5fb114175b9282372017875bc/simulation.log and VCD
- simulation.log path: evidence/vscode/LAB1/04_4bit_subtractor/recovery__run-0bbbc6a5fb114175b9282372017875bc/simulation.log
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/04_4bit_subtractor/recovery__run-0bbbc6a5fb114175b9282372017875bc/simulation.log and VCD
- wave.vcd path: evidence/vscode/LAB1/04_4bit_subtractor/recovery__run-0bbbc6a5fb114175b9282372017875bc/wave.vcd
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/04_4bit_subtractor/recovery__run-0bbbc6a5fb114175b9282372017875bc/simulation.log and VCD
- source commit: UNKNOWN
  - provenance: UNKNOWN
  - basis: Direct run-to-commit record unavailable

#### H. Waveform verification

- VCD_PRESENT: YES
  - provenance: TOOL_VERIFIED
  - basis: All three preserved run VCD files exist and were parsed
- VCD_RUN_TRACEABLE: YES
  - provenance: TOOL_VERIFIED
  - basis: Evidence folder run IDs, logs and VCDs; current hashes match v1 same-run copy audit; this is not source commit traceability
- VCD_NUMERIC_CHECK: VERIFIED
  - provenance: TOOL_VERIFIED
  - basis: Actual parsing of all three VCDs: representative normal/recovery inputs and outputs at both interval endpoints; failure TB expected and packed DUT output before fatal time; log/VCD end time agreement. Limited sampled numeric check, not full waveform/visual verification.
- USER_VISUAL_CHECK: NOT_VERIFIED
  - provenance: UNKNOWN
  - basis: No explicit user visual-inspection approval is recorded in the supplied evidence
- SCREENSHOT_PRESENT: NOT_AVAILABLE
  - provenance: TOOL_VERIFIED
  - basis: Evidence contains logs/VCD only; no user-confirmed screenshot file found
- representative_intervals: Candidate intervals only; values checked numerically. Selection and intervals remain derived suggestions.
  - provenance: AUTO_DERIVED
  - basis: TB vector index and 10 ns case interval; actual VCD samples
  - normal and recovery: [1, 9] ns, vector n=0; a=0b0000 (0x0), b=0b0000 (0x0) -> bor=0, d=0b0000 (0x0)
    - provenance: AUTO_DERIVED
    - basis: Suggested vector interval; corresponding VCD values parsed
  - normal and recovery: [11, 19] ns, vector n=1; a=0b0000 (0x0), b=0b0001 (0x1) -> bor=1, d=0b1111 (0xf)
    - provenance: AUTO_DERIVED
    - basis: Suggested vector interval; corresponding VCD values parsed
  - normal and recovery: [2401, 2409] ns, vector n=240; a=0b1111 (0xf), b=0b0000 (0x0) -> bor=0, d=0b1111 (0xf)
    - provenance: AUTO_DERIVED
    - basis: Suggested vector interval; corresponding VCD values parsed
  - normal and recovery: [2551, 2559] ns, vector n=255; a=0b1111 (0xf), b=0b1111 (0xf) -> bor=0, d=0b0000 (0x0)
    - provenance: AUTO_DERIVED
    - basis: Suggested vector interval; corresponding VCD values parsed
  - intentional_failure: [1, 9] ns, vector n=0; expected 0x00, actual 0x10; ends before fatal termination
    - provenance: AUTO_DERIVED
    - basis: Suggested vector interval; corresponding VCD values parsed
- VCD timescale: normal/failure/recovery: 1ps
  - provenance: TOOL_VERIFIED
  - basis: Preserved VCD $timescale declarations

#### I. Board plan

- board_status: NOT_PERFORMED
  - provenance: USER_REPORTED
  - basis: User instruction: keep board result NOT_PERFORMED
- XDC pin mapping: a[3]->Y1; a[2]->W3; a[1]->U2; a[0]->T1; b[3]->W4; b[2]->W1; b[1]->V4; b[0]->U4; d[3]->M4; d[2]->M2; d[1]->N7; d[0]->M7; bor->L4; all ports LVCMOS33
  - provenance: TOOL_VERIFIED
  - basis: LAB1/04_4bit_subtractor/constraints/sub_4bit.xdc
- planned user inputs: Apply the representative input vectors in section D via the physical controls associated with the XDC input package pins, after verifying the board mapping and polarity.
  - provenance: AUTO_DERIVED
  - basis: Proposed plan from RTL expected behavior and XDC; not a physical observation
- expected physical outputs: Design-level expected logic at output package pins follows section D. Actual LED/segment illumination is not inferred from package pins alone.
  - provenance: AUTO_DERIVED
  - basis: Proposed plan from RTL expected behavior and XDC; not a physical observation
- verification method: Confirm board model, control-to-pin mapping, output polarity and segment/digit wiring; then apply planned vectors and record actual observations/photos/measurements against section D. This is a plan only.
  - provenance: AUTO_DERIVED
  - basis: Proposed plan from RTL expected behavior and XDC; not a physical observation
- board model: UNKNOWN
  - provenance: UNKNOWN
  - basis: Board model/wiring/polarity evidence unavailable
- physical control/output mapping and polarity: UNKNOWN
  - provenance: UNKNOWN
  - basis: Board model/wiring/polarity evidence unavailable

#### J. Pre-report readiness

- design_information: READY
  - provenance: AUTO_DERIVED
  - basis: Draft-data readiness assessment; outstanding confirmations in section 4. READY does not certify student review or full verification
- expected_behavior: READY
  - provenance: AUTO_DERIVED
  - basis: Draft-data readiness assessment; outstanding confirmations in section 4. READY does not certify student review or full verification
- normal_simulation: READY
  - provenance: AUTO_DERIVED
  - basis: Draft-data readiness assessment; outstanding confirmations in section 4. READY does not certify student review or full verification
- intentional_failure: READY
  - provenance: AUTO_DERIVED
  - basis: Draft-data readiness assessment; outstanding confirmations in section 4. READY does not certify student review or full verification
- recovery: READY
  - provenance: AUTO_DERIVED
  - basis: Draft-data readiness assessment; outstanding confirmations in section 4. READY does not certify student review or full verification
- waveform_visual_evidence: MISSING
  - provenance: AUTO_DERIVED
  - basis: Draft-data readiness assessment; outstanding confirmations in section 4. READY does not certify student review or full verification
- board_plan: NEEDS_USER_CONFIRMATION
  - provenance: AUTO_DERIVED
  - basis: Draft-data readiness assessment; outstanding confirmations in section 4. READY does not certify student review or full verification
- experiment_readiness: NEEDS_USER_CONFIRMATION
  - provenance: AUTO_DERIVED
  - basis: Draft-data readiness assessment; outstanding confirmations in section 4. READY does not certify student review or full verification

#### K. QA notes

- note_id: compile_warning
  - note: All three preserved compile logs warn that design elements lack explicit time unit/time precision. Preserve this warning; no source was changed.
  - provenance: TOOL_VERIFIED
  - basis: normal/intentional_failure/recovery compile.log
- note_id: run_commit_gap
  - note: All three source commit fields remain UNKNOWN. Git change/restoration commits document source history, not direct run identity.
  - provenance: UNKNOWN
  - basis: No direct run-to-commit record in the supplied evidence
- note_id: role_provenance
  - note: Normal/failure/recovery folder roles follow the user-specified run selection. Role names are not independent proof of run source identity.
  - provenance: USER_REPORTED
  - basis: User-specified preservation run IDs and roles
- note_id: prediction_record
  - note: The predicted failing condition is a post-hoc AUTO_DERIVED calculation. A contemporaneous pre-run prediction record is not available.
  - provenance: UNKNOWN
  - basis: No pre-run prediction record in the supplied evidence
- note_id: readiness_scope
  - note: Draft factual inputs are available. Visual evidence, representative selection, student review, physical plan assumptions and source commit provenance remain unresolved.
  - provenance: AUTO_DERIVED
  - basis: Sections D/H/I/J and section 4
- historical_modification_evidence: Git change commit d316eda, file LAB1/04_4bit_subtractor/src/sub_4bit.v; preserved FAIL log and VCD TB expected / packed DUT values agree. The run-specific historical RTL snapshot is not preserved here, so the exact run source identity is unconfirmed.
  - provenance: TOOL_VERIFIED
  - basis: Historical Git diff and preserved FAIL log/VCD; the quoted source-identity limitation remains in force
- historical_restoration_evidence: Strict borrow comparison a<b restored; Git restoration commit 4fab3b3; recovery role follows user selection
  - provenance: TOOL_VERIFIED
  - basis: Git restoration history and user-selected role; not direct commit-to-run proof
- copy_integrity_audit: Prior v1 recorded original/copy equality. Current evidence SHA-256 was recomputed and matches every v1 stored hash; originals were not reread during v2 generation.
  - provenance: TOOL_VERIFIED
  - basis: Unchanged v1 audit plus current preserved evidence SHA-256

##### Evidence SHA-256 audit

| Role | File | SHA-256 | Prior original-copy match | Current evidence matches v1 hash | Provenance |
|---|---|---|---|---|---|
| normal | simulation.log | 8111dca71e88dbfd6e52db93d0e7e0951dffa58fea0590ae00592b160948fbd9 | YES | YES | TOOL_VERIFIED |
| normal | compile.log | cbd06c8e4fc8852a0aa8aaafb9acfb7a0ed518c659f2ccb311ae7c2f77ae6142 | YES | YES | TOOL_VERIFIED |
| normal | wave.vcd | 1274cf4e6b51abcc2911d1b26317fe1ef0b0eb01bc96e224d4ed970e80d1e46c | YES | YES | TOOL_VERIFIED |
| intentional_failure | simulation.log | 9a088a764d7940d13a84ac7dd5d49f724748918be8964b0580e5c4d5f6ad4296 | YES | YES | TOOL_VERIFIED |
| intentional_failure | compile.log | cbd06c8e4fc8852a0aa8aaafb9acfb7a0ed518c659f2ccb311ae7c2f77ae6142 | YES | YES | TOOL_VERIFIED |
| intentional_failure | wave.vcd | 4ecf37d4fcc0d5161689e9ac860fe97a13e07ac792f878e2482f961d0521e223 | YES | YES | TOOL_VERIFIED |
| recovery | simulation.log | 8111dca71e88dbfd6e52db93d0e7e0951dffa58fea0590ae00592b160948fbd9 | YES | YES | TOOL_VERIFIED |
| recovery | compile.log | cbd06c8e4fc8852a0aa8aaafb9acfb7a0ed518c659f2ccb311ae7c2f77ae6142 | YES | YES | TOOL_VERIFIED |
| recovery | wave.vcd | fce461d5b59c830c07e489f26e70318cdff889fcd8e5d7aa2534486ecad3205f | YES | YES | TOOL_VERIFIED |

### 05_4bit_comparator


#### A. Design identity

- experiment folder: LAB1/05_4bit_comparator
  - provenance: TOOL_VERIFIED
  - basis: LAB1/05_4bit_comparator current RTL/TB/XDC/simulation.json
- RTL file(s): LAB1/05_4bit_comparator/src/compare_4.v
  - provenance: TOOL_VERIFIED
  - basis: LAB1/05_4bit_comparator current RTL/TB/XDC/simulation.json
- RTL module(s): compare_4
  - provenance: TOOL_VERIFIED
  - basis: LAB1/05_4bit_comparator current RTL/TB/XDC/simulation.json
- Design top: compare_4
  - provenance: AUTO_DERIVED
  - basis: LAB1/05_4bit_comparator/sim/tb_compare_4.sv DUT instantiation
- TB file: LAB1/05_4bit_comparator/sim/tb_compare_4.sv
  - provenance: TOOL_VERIFIED
  - basis: LAB1/05_4bit_comparator current RTL/TB/XDC/simulation.json
- Simulation top: tb_compare_4
  - provenance: TOOL_VERIFIED
  - basis: LAB1/05_4bit_comparator current RTL/TB/XDC/simulation.json
- XDC file: LAB1/05_4bit_comparator/constraints/compare_4.xdc
  - provenance: TOOL_VERIFIED
  - basis: LAB1/05_4bit_comparator current RTL/TB/XDC/simulation.json
- simulation.json: LAB1/05_4bit_comparator/simulation.json
  - provenance: TOOL_VERIFIED
  - basis: LAB1/05_4bit_comparator current RTL/TB/XDC/simulation.json
- input ports: a, b
  - provenance: TOOL_VERIFIED
  - basis: LAB1/05_4bit_comparator current RTL/TB/XDC/simulation.json
- output ports: o
  - provenance: TOOL_VERIFIED
  - basis: LAB1/05_4bit_comparator current RTL/TB/XDC/simulation.json
- port widths: a: 4 bit(s); b: 4 bit(s); o: 3 bit(s)
  - provenance: TOOL_VERIFIED
  - basis: LAB1/05_4bit_comparator current RTL/TB/XDC/simulation.json

#### B. Functional intent

- functional description: Unsigned comparison: o[2]=a>b; o[1]=a==b; o[0]=a<b. Exactly one comparison bit is high for binary inputs.
  - provenance: AUTO_DERIVED
  - basis: LAB1/05_4bit_comparator/src/compare_4.v
- valid_input_domain: NOT_APPLICABLE
  - provenance: AUTO_DERIVED
  - basis: LAB1/05_4bit_comparator/src/compare_4.v and TB enumeration; no course material available
- invalid_input_behavior: NOT_APPLICABLE
  - provenance: AUTO_DERIVED
  - basis: No special restricted binary-input semantics identified

#### C. Testbench verification

- applied input sequence or enumeration method: {a,b}=n, n=0..255; a=n//16, b=n%16
  - provenance: TOOL_VERIFIED
  - basis: LAB1/05_4bit_comparator/sim/tb_compare_4.sv
- number of test cases: 256
  - provenance: TOOL_VERIFIED
  - basis: LAB1/05_4bit_comparator/sim/tb_compare_4.sv
- interval per case: 10 ns (#10 with 1ns time unit; observation after the delay)
  - provenance: AUTO_DERIVED
  - basis: LAB1/05_4bit_comparator/sim/tb_compare_4.sv
- total expected simulation time: 2560 ns for an uninterrupted PASS path
  - provenance: AUTO_DERIVED
  - basis: LAB1/05_4bit_comparator/sim/tb_compare_4.sv
- expected calculation method: a>b ? 4 : (a==b ? 2 : 1)
  - provenance: TOOL_VERIFIED
  - basis: LAB1/05_4bit_comparator/sim/tb_compare_4.sv
- DUT output compared against: o compared to expected with !== (case inequality, including X/Z detection)
  - provenance: TOOL_VERIFIED
  - basis: LAB1/05_4bit_comparator/sim/tb_compare_4.sv
- PASS condition: All 256 comparisons pass; checked==256; LAB1_PASS with cases=256 is printed, then $finish
  - provenance: AUTO_DERIVED
  - basis: LAB1/05_4bit_comparator/sim/tb_compare_4.sv
- FAIL condition: o !== expected -> $fatal with vector/expected/actual; checked!=256 -> Incomplete test
  - provenance: AUTO_DERIVED
  - basis: LAB1/05_4bit_comparator/sim/tb_compare_4.sv
- watchdog: At 100000 ns, $fatal(1, watchdog/Watchdog) if execution has not already ended
  - provenance: AUTO_DERIVED
  - basis: LAB1/05_4bit_comparator/sim/tb_compare_4.sv
- code basis: LAB1/05_4bit_comparator/sim/tb_compare_4.sv; timescale=1ns/1ps
  - provenance: TOOL_VERIFIED
  - basis: LAB1/05_4bit_comparator/sim/tb_compare_4.sv

#### D. Representative expected behavior

- course_required_cases: UNKNOWN
  - provenance: UNKNOWN
  - basis: No course PDF/requirements provided
- report_recorded_cases: UNKNOWN
  - provenance: UNKNOWN
  - basis: No user report provided; current cases are suggestions

##### Case 1

- selection_source: AUTO_SUGGESTED
  - provenance: AUTO_DERIVED
  - basis: Automatically selected from design/TB in v1; user approval and course-required status are not established
- input: vector n=0; a=0b0000 (0x0), b=0b0000 (0x0)
  - provenance: AUTO_DERIVED
  - basis: LAB1/05_4bit_comparator/sim/tb_compare_4.sv input enumeration; suggested representative vector
- expected output: o=0b010 (0x2)
  - provenance: AUTO_DERIVED
  - basis: LAB1/05_4bit_comparator/src/compare_4.v and TB expected calculation
- calculation/reason: o[2:0]={greater,equal,less}
  - provenance: AUTO_DERIVED
  - basis: LAB1/05_4bit_comparator/src/compare_4.v and TB expected calculation

##### Case 2

- selection_source: AUTO_SUGGESTED
  - provenance: AUTO_DERIVED
  - basis: Automatically selected from design/TB in v1; user approval and course-required status are not established
- input: vector n=1; a=0b0000 (0x0), b=0b0001 (0x1)
  - provenance: AUTO_DERIVED
  - basis: LAB1/05_4bit_comparator/sim/tb_compare_4.sv input enumeration; suggested representative vector
- expected output: o=0b001 (0x1)
  - provenance: AUTO_DERIVED
  - basis: LAB1/05_4bit_comparator/src/compare_4.v and TB expected calculation
- calculation/reason: o[2:0]={greater,equal,less}
  - provenance: AUTO_DERIVED
  - basis: LAB1/05_4bit_comparator/src/compare_4.v and TB expected calculation

##### Case 3

- selection_source: AUTO_SUGGESTED
  - provenance: AUTO_DERIVED
  - basis: Automatically selected from design/TB in v1; user approval and course-required status are not established
- input: vector n=240; a=0b1111 (0xf), b=0b0000 (0x0)
  - provenance: AUTO_DERIVED
  - basis: LAB1/05_4bit_comparator/sim/tb_compare_4.sv input enumeration; suggested representative vector
- expected output: o=0b100 (0x4)
  - provenance: AUTO_DERIVED
  - basis: LAB1/05_4bit_comparator/src/compare_4.v and TB expected calculation
- calculation/reason: o[2:0]={greater,equal,less}
  - provenance: AUTO_DERIVED
  - basis: LAB1/05_4bit_comparator/src/compare_4.v and TB expected calculation

##### Case 4

- selection_source: AUTO_SUGGESTED
  - provenance: AUTO_DERIVED
  - basis: Automatically selected from design/TB in v1; user approval and course-required status are not established
- input: vector n=255; a=0b1111 (0xf), b=0b1111 (0xf)
  - provenance: AUTO_DERIVED
  - basis: LAB1/05_4bit_comparator/sim/tb_compare_4.sv input enumeration; suggested representative vector
- expected output: o=0b010 (0x2)
  - provenance: AUTO_DERIVED
  - basis: LAB1/05_4bit_comparator/src/compare_4.v and TB expected calculation
- calculation/reason: o[2:0]={greater,equal,less}
  - provenance: AUTO_DERIVED
  - basis: LAB1/05_4bit_comparator/src/compare_4.v and TB expected calculation

#### E. Normal simulation evidence

- run ID: run-618a491854d44f08bf315a212d9c6758
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/05_4bit_comparator/normal__run-618a491854d44f08bf315a212d9c6758/simulation.log; VCD for numeric/time checks
- simulation.log path: evidence/vscode/LAB1/05_4bit_comparator/normal__run-618a491854d44f08bf315a212d9c6758/simulation.log
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/05_4bit_comparator/normal__run-618a491854d44f08bf315a212d9c6758/simulation.log; VCD for numeric/time checks
- compile.log path: evidence/vscode/LAB1/05_4bit_comparator/normal__run-618a491854d44f08bf315a212d9c6758/compile.log
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/05_4bit_comparator/normal__run-618a491854d44f08bf315a212d9c6758/simulation.log; VCD for numeric/time checks
- wave.vcd path: evidence/vscode/LAB1/05_4bit_comparator/normal__run-618a491854d44f08bf315a212d9c6758/wave.vcd
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/05_4bit_comparator/normal__run-618a491854d44f08bf315a212d9c6758/simulation.log; VCD for numeric/time checks
- PASS/FAIL: PASS
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/05_4bit_comparator/normal__run-618a491854d44f08bf315a212d9c6758/simulation.log; VCD for numeric/time checks
- cases: 256
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/05_4bit_comparator/normal__run-618a491854d44f08bf315a212d9c6758/simulation.log; VCD for numeric/time checks
- simulation end time: 2560 ns (log and final VCD timestamp agree)
  - provenance: AUTO_DERIVED
  - basis: evidence/vscode/LAB1/05_4bit_comparator/normal__run-618a491854d44f08bf315a212d9c6758/simulation.log; VCD for numeric/time checks
- source commit: UNKNOWN
  - provenance: UNKNOWN
  - basis: Direct run-to-commit record unavailable
- evidence_integrity: VERIFIED_COPY
  - provenance: TOOL_VERIFIED
  - basis: v1 same-run copy verification; current evidence hash matches v1 hash audit

#### F. Intentional failure

- run ID: run-ed6afd5d6ae749688a11f31b8a5bdc58
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/05_4bit_comparator/intentional_failure__run-ed6afd5d6ae749688a11f31b8a5bdc58/simulation.log and VCD
- RTL modification: o[1]: a==b -> a!=b
  - provenance: TOOL_VERIFIED
  - basis: Git historical RTL change (not a run-specific source attribution)
- predicted failing condition: n=0 gives a=b=0: equality output becomes 0; correct packed output is 0x2
  - provenance: AUTO_DERIVED
  - basis: Historical Git diff and current TB; post-hoc calculation, not a recorded pre-run prediction
- actual first failing vector: 0
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/05_4bit_comparator/intentional_failure__run-ed6afd5d6ae749688a11f31b8a5bdc58/simulation.log and VCD
- expected: 0x2
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/05_4bit_comparator/intentional_failure__run-ed6afd5d6ae749688a11f31b8a5bdc58/simulation.log and VCD
- actual: 0x0
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/05_4bit_comparator/intentional_failure__run-ed6afd5d6ae749688a11f31b8a5bdc58/simulation.log and VCD
- failure time: 10 ns (log interpreted using VCD timescale)
  - provenance: AUTO_DERIVED
  - basis: evidence/vscode/LAB1/05_4bit_comparator/intentional_failure__run-ed6afd5d6ae749688a11f31b8a5bdc58/simulation.log and VCD
- simulation.log path: evidence/vscode/LAB1/05_4bit_comparator/intentional_failure__run-ed6afd5d6ae749688a11f31b8a5bdc58/simulation.log
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/05_4bit_comparator/intentional_failure__run-ed6afd5d6ae749688a11f31b8a5bdc58/simulation.log and VCD
- wave.vcd path: evidence/vscode/LAB1/05_4bit_comparator/intentional_failure__run-ed6afd5d6ae749688a11f31b8a5bdc58/wave.vcd
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/05_4bit_comparator/intentional_failure__run-ed6afd5d6ae749688a11f31b8a5bdc58/simulation.log and VCD
- source commit: UNKNOWN
  - provenance: UNKNOWN
  - basis: Direct run-to-commit record unavailable

#### G. Recovery

- run ID: run-7cfa2f167dd443ab817fc9d2094f56dc
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/05_4bit_comparator/recovery__run-7cfa2f167dd443ab817fc9d2094f56dc/simulation.log and VCD
- restored behavior: Equality comparison a==b restored
  - provenance: AUTO_DERIVED
  - basis: Git restoration history plus user-designated recovery evidence; direct commit linkage unavailable
- PASS/FAIL: PASS
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/05_4bit_comparator/recovery__run-7cfa2f167dd443ab817fc9d2094f56dc/simulation.log and VCD
- cases: 256
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/05_4bit_comparator/recovery__run-7cfa2f167dd443ab817fc9d2094f56dc/simulation.log and VCD
- simulation end time: 2560 ns (log and final VCD timestamp agree)
  - provenance: AUTO_DERIVED
  - basis: evidence/vscode/LAB1/05_4bit_comparator/recovery__run-7cfa2f167dd443ab817fc9d2094f56dc/simulation.log and VCD
- simulation.log path: evidence/vscode/LAB1/05_4bit_comparator/recovery__run-7cfa2f167dd443ab817fc9d2094f56dc/simulation.log
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/05_4bit_comparator/recovery__run-7cfa2f167dd443ab817fc9d2094f56dc/simulation.log and VCD
- wave.vcd path: evidence/vscode/LAB1/05_4bit_comparator/recovery__run-7cfa2f167dd443ab817fc9d2094f56dc/wave.vcd
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/05_4bit_comparator/recovery__run-7cfa2f167dd443ab817fc9d2094f56dc/simulation.log and VCD
- source commit: UNKNOWN
  - provenance: UNKNOWN
  - basis: Direct run-to-commit record unavailable

#### H. Waveform verification

- VCD_PRESENT: YES
  - provenance: TOOL_VERIFIED
  - basis: All three preserved run VCD files exist and were parsed
- VCD_RUN_TRACEABLE: YES
  - provenance: TOOL_VERIFIED
  - basis: Evidence folder run IDs, logs and VCDs; current hashes match v1 same-run copy audit; this is not source commit traceability
- VCD_NUMERIC_CHECK: VERIFIED
  - provenance: TOOL_VERIFIED
  - basis: Actual parsing of all three VCDs: representative normal/recovery inputs and outputs at both interval endpoints; failure TB expected and packed DUT output before fatal time; log/VCD end time agreement. Limited sampled numeric check, not full waveform/visual verification.
- USER_VISUAL_CHECK: NOT_VERIFIED
  - provenance: UNKNOWN
  - basis: No explicit user visual-inspection approval is recorded in the supplied evidence
- SCREENSHOT_PRESENT: NOT_AVAILABLE
  - provenance: TOOL_VERIFIED
  - basis: Evidence contains logs/VCD only; no user-confirmed screenshot file found
- representative_intervals: Candidate intervals only; values checked numerically. Selection and intervals remain derived suggestions.
  - provenance: AUTO_DERIVED
  - basis: TB vector index and 10 ns case interval; actual VCD samples
  - normal and recovery: [1, 9] ns, vector n=0; a=0b0000 (0x0), b=0b0000 (0x0) -> o=0b010 (0x2)
    - provenance: AUTO_DERIVED
    - basis: Suggested vector interval; corresponding VCD values parsed
  - normal and recovery: [11, 19] ns, vector n=1; a=0b0000 (0x0), b=0b0001 (0x1) -> o=0b001 (0x1)
    - provenance: AUTO_DERIVED
    - basis: Suggested vector interval; corresponding VCD values parsed
  - normal and recovery: [2401, 2409] ns, vector n=240; a=0b1111 (0xf), b=0b0000 (0x0) -> o=0b100 (0x4)
    - provenance: AUTO_DERIVED
    - basis: Suggested vector interval; corresponding VCD values parsed
  - normal and recovery: [2551, 2559] ns, vector n=255; a=0b1111 (0xf), b=0b1111 (0xf) -> o=0b010 (0x2)
    - provenance: AUTO_DERIVED
    - basis: Suggested vector interval; corresponding VCD values parsed
  - intentional_failure: [1, 9] ns, vector n=0; expected 0x2, actual 0x0; ends before fatal termination
    - provenance: AUTO_DERIVED
    - basis: Suggested vector interval; corresponding VCD values parsed
- VCD timescale: normal/failure/recovery: 1ps
  - provenance: TOOL_VERIFIED
  - basis: Preserved VCD $timescale declarations

#### I. Board plan

- board_status: NOT_PERFORMED
  - provenance: USER_REPORTED
  - basis: User instruction: keep board result NOT_PERFORMED
- XDC pin mapping: a[3]->Y1; a[2]->W3; a[1]->U2; a[0]->T1; b[3]->W4; b[2]->W1; b[1]->V4; b[0]->U4; o[2]->L4; o[1]->M4; o[0]->M2; all ports LVCMOS33
  - provenance: TOOL_VERIFIED
  - basis: LAB1/05_4bit_comparator/constraints/compare_4.xdc
- planned user inputs: Apply the representative input vectors in section D via the physical controls associated with the XDC input package pins, after verifying the board mapping and polarity.
  - provenance: AUTO_DERIVED
  - basis: Proposed plan from RTL expected behavior and XDC; not a physical observation
- expected physical outputs: Design-level expected logic at output package pins follows section D. Actual LED/segment illumination is not inferred from package pins alone.
  - provenance: AUTO_DERIVED
  - basis: Proposed plan from RTL expected behavior and XDC; not a physical observation
- verification method: Confirm board model, control-to-pin mapping, output polarity and segment/digit wiring; then apply planned vectors and record actual observations/photos/measurements against section D. This is a plan only.
  - provenance: AUTO_DERIVED
  - basis: Proposed plan from RTL expected behavior and XDC; not a physical observation
- board model: UNKNOWN
  - provenance: UNKNOWN
  - basis: Board model/wiring/polarity evidence unavailable
- physical control/output mapping and polarity: UNKNOWN
  - provenance: UNKNOWN
  - basis: Board model/wiring/polarity evidence unavailable

#### J. Pre-report readiness

- design_information: READY
  - provenance: AUTO_DERIVED
  - basis: Draft-data readiness assessment; outstanding confirmations in section 4. READY does not certify student review or full verification
- expected_behavior: READY
  - provenance: AUTO_DERIVED
  - basis: Draft-data readiness assessment; outstanding confirmations in section 4. READY does not certify student review or full verification
- normal_simulation: READY
  - provenance: AUTO_DERIVED
  - basis: Draft-data readiness assessment; outstanding confirmations in section 4. READY does not certify student review or full verification
- intentional_failure: READY
  - provenance: AUTO_DERIVED
  - basis: Draft-data readiness assessment; outstanding confirmations in section 4. READY does not certify student review or full verification
- recovery: READY
  - provenance: AUTO_DERIVED
  - basis: Draft-data readiness assessment; outstanding confirmations in section 4. READY does not certify student review or full verification
- waveform_visual_evidence: MISSING
  - provenance: AUTO_DERIVED
  - basis: Draft-data readiness assessment; outstanding confirmations in section 4. READY does not certify student review or full verification
- board_plan: NEEDS_USER_CONFIRMATION
  - provenance: AUTO_DERIVED
  - basis: Draft-data readiness assessment; outstanding confirmations in section 4. READY does not certify student review or full verification
- experiment_readiness: NEEDS_USER_CONFIRMATION
  - provenance: AUTO_DERIVED
  - basis: Draft-data readiness assessment; outstanding confirmations in section 4. READY does not certify student review or full verification

#### K. QA notes

- note_id: compile_warning
  - note: All three preserved compile logs warn that design elements lack explicit time unit/time precision. Preserve this warning; no source was changed.
  - provenance: TOOL_VERIFIED
  - basis: normal/intentional_failure/recovery compile.log
- note_id: run_commit_gap
  - note: All three source commit fields remain UNKNOWN. Git change/restoration commits document source history, not direct run identity.
  - provenance: UNKNOWN
  - basis: No direct run-to-commit record in the supplied evidence
- note_id: role_provenance
  - note: Normal/failure/recovery folder roles follow the user-specified run selection. Role names are not independent proof of run source identity.
  - provenance: USER_REPORTED
  - basis: User-specified preservation run IDs and roles
- note_id: prediction_record
  - note: The predicted failing condition is a post-hoc AUTO_DERIVED calculation. A contemporaneous pre-run prediction record is not available.
  - provenance: UNKNOWN
  - basis: No pre-run prediction record in the supplied evidence
- note_id: readiness_scope
  - note: Draft factual inputs are available. Visual evidence, representative selection, student review, physical plan assumptions and source commit provenance remain unresolved.
  - provenance: AUTO_DERIVED
  - basis: Sections D/H/I/J and section 4
- historical_modification_evidence: Git change commit 0f5935a, file LAB1/05_4bit_comparator/src/compare_4.v; preserved FAIL log and VCD TB expected / packed DUT values agree. The run-specific historical RTL snapshot is not preserved here, so the exact run source identity is unconfirmed.
  - provenance: TOOL_VERIFIED
  - basis: Historical Git diff and preserved FAIL log/VCD; the quoted source-identity limitation remains in force
- historical_restoration_evidence: Equality comparison a==b restored; Git restoration commit 1cc1837; recovery role follows user selection
  - provenance: TOOL_VERIFIED
  - basis: Git restoration history and user-selected role; not direct commit-to-run proof
- copy_integrity_audit: Prior v1 recorded original/copy equality. Current evidence SHA-256 was recomputed and matches every v1 stored hash; originals were not reread during v2 generation.
  - provenance: TOOL_VERIFIED
  - basis: Unchanged v1 audit plus current preserved evidence SHA-256

##### Evidence SHA-256 audit

| Role | File | SHA-256 | Prior original-copy match | Current evidence matches v1 hash | Provenance |
|---|---|---|---|---|---|
| normal | simulation.log | 56aae9cdd9b366b633b3503c559811b920db7b05b9d4dee6254b49331ef67519 | YES | YES | TOOL_VERIFIED |
| normal | compile.log | 9e413b8dc19d36facf4f81e4842118743fe8dd6eb837e69eaf374125e09957c3 | YES | YES | TOOL_VERIFIED |
| normal | wave.vcd | 94bfb722bfd0841b54f93d709c3dac5ba253dfea1c91ee2f04a31efa49632a79 | YES | YES | TOOL_VERIFIED |
| intentional_failure | simulation.log | 74401831240e65e95b0d6f9e7d8eb8c53f60091e18fa132289910b7f1de8e2d5 | YES | YES | TOOL_VERIFIED |
| intentional_failure | compile.log | 9e413b8dc19d36facf4f81e4842118743fe8dd6eb837e69eaf374125e09957c3 | YES | YES | TOOL_VERIFIED |
| intentional_failure | wave.vcd | 0795b4d6a1b5d534c9ee30e79d01577cd958172e709dbab834a76cef586248f5 | YES | YES | TOOL_VERIFIED |
| recovery | simulation.log | 56aae9cdd9b366b633b3503c559811b920db7b05b9d4dee6254b49331ef67519 | YES | YES | TOOL_VERIFIED |
| recovery | compile.log | 9e413b8dc19d36facf4f81e4842118743fe8dd6eb837e69eaf374125e09957c3 | YES | YES | TOOL_VERIFIED |
| recovery | wave.vcd | a1b6218c0a6c371db23cd23274783cdad8d63dd1dc865f8e233909f70a4f3d6f | YES | YES | TOOL_VERIFIED |

### 06_mux


#### A. Design identity

- experiment folder: LAB1/06_mux
  - provenance: TOOL_VERIFIED
  - basis: LAB1/06_mux current RTL/TB/XDC/simulation.json
- RTL file(s): LAB1/06_mux/src/mux_4x1.v
  - provenance: TOOL_VERIFIED
  - basis: LAB1/06_mux current RTL/TB/XDC/simulation.json
- RTL module(s): mux_4x1
  - provenance: TOOL_VERIFIED
  - basis: LAB1/06_mux current RTL/TB/XDC/simulation.json
- Design top: mux_4x1
  - provenance: AUTO_DERIVED
  - basis: LAB1/06_mux/sim/tb_mux_4x1.sv DUT instantiation
- TB file: LAB1/06_mux/sim/tb_mux_4x1.sv
  - provenance: TOOL_VERIFIED
  - basis: LAB1/06_mux current RTL/TB/XDC/simulation.json
- Simulation top: tb_mux_4x1
  - provenance: TOOL_VERIFIED
  - basis: LAB1/06_mux current RTL/TB/XDC/simulation.json
- XDC file: LAB1/06_mux/constraints/mux_4x1.xdc
  - provenance: TOOL_VERIFIED
  - basis: LAB1/06_mux current RTL/TB/XDC/simulation.json
- simulation.json: LAB1/06_mux/simulation.json
  - provenance: TOOL_VERIFIED
  - basis: LAB1/06_mux current RTL/TB/XDC/simulation.json
- input ports: i, s
  - provenance: TOOL_VERIFIED
  - basis: LAB1/06_mux current RTL/TB/XDC/simulation.json
- output ports: z
  - provenance: TOOL_VERIFIED
  - basis: LAB1/06_mux current RTL/TB/XDC/simulation.json
- port widths: i: 4 bit(s); s: 2 bit(s); z: 1 bit(s)
  - provenance: TOOL_VERIFIED
  - basis: LAB1/06_mux current RTL/TB/XDC/simulation.json

#### B. Functional intent

- functional description: z=i[3-s]. s=00,01,10,11 selects i[3],i[2],i[1],i[0], respectively.
  - provenance: AUTO_DERIVED
  - basis: LAB1/06_mux/src/mux_4x1.v
- valid_input_domain: NOT_APPLICABLE
  - provenance: AUTO_DERIVED
  - basis: LAB1/06_mux/src/mux_4x1.v and TB enumeration; no course material available
- invalid_input_behavior: NOT_APPLICABLE
  - provenance: AUTO_DERIVED
  - basis: No special restricted binary-input semantics identified

#### C. Testbench verification

- applied input sequence or enumeration method: {i,s}=n, n=0..63; i=n//4, s=n%4
  - provenance: TOOL_VERIFIED
  - basis: LAB1/06_mux/sim/tb_mux_4x1.sv
- number of test cases: 64
  - provenance: TOOL_VERIFIED
  - basis: LAB1/06_mux/sim/tb_mux_4x1.sv
- interval per case: 10 ns (#10 with 1ns time unit; observation after the delay)
  - provenance: AUTO_DERIVED
  - basis: LAB1/06_mux/sim/tb_mux_4x1.sv
- total expected simulation time: 640 ns for an uninterrupted PASS path
  - provenance: AUTO_DERIVED
  - basis: LAB1/06_mux/sim/tb_mux_4x1.sv
- expected calculation method: ((n/4)>>(3-(n%4)))&1
  - provenance: TOOL_VERIFIED
  - basis: LAB1/06_mux/sim/tb_mux_4x1.sv
- DUT output compared against: z compared to expected with !== (case inequality, including X/Z detection)
  - provenance: TOOL_VERIFIED
  - basis: LAB1/06_mux/sim/tb_mux_4x1.sv
- PASS condition: All 64 comparisons pass; checked==64; LAB1_PASS with cases=64 is printed, then $finish
  - provenance: AUTO_DERIVED
  - basis: LAB1/06_mux/sim/tb_mux_4x1.sv
- FAIL condition: z !== expected -> $fatal with vector/expected/actual; checked!=64 -> Incomplete test
  - provenance: AUTO_DERIVED
  - basis: LAB1/06_mux/sim/tb_mux_4x1.sv
- watchdog: At 100000 ns, $fatal(1, watchdog/Watchdog) if execution has not already ended
  - provenance: AUTO_DERIVED
  - basis: LAB1/06_mux/sim/tb_mux_4x1.sv
- code basis: LAB1/06_mux/sim/tb_mux_4x1.sv; timescale=1ns/1ps
  - provenance: TOOL_VERIFIED
  - basis: LAB1/06_mux/sim/tb_mux_4x1.sv

#### D. Representative expected behavior

- course_required_cases: UNKNOWN
  - provenance: UNKNOWN
  - basis: No course PDF/requirements provided
- report_recorded_cases: UNKNOWN
  - provenance: UNKNOWN
  - basis: No user report provided; current cases are suggestions

##### Case 1

- selection_source: AUTO_SUGGESTED
  - provenance: AUTO_DERIVED
  - basis: Automatically selected from design/TB in v1; user approval and course-required status are not established
- input: vector n=4; i=0b0001 (0x1), s=0b00 (0x0)
  - provenance: AUTO_DERIVED
  - basis: LAB1/06_mux/sim/tb_mux_4x1.sv input enumeration; suggested representative vector
- expected output: z=0
  - provenance: AUTO_DERIVED
  - basis: LAB1/06_mux/src/mux_4x1.v and TB expected calculation
- calculation/reason: Select i[3]
  - provenance: AUTO_DERIVED
  - basis: LAB1/06_mux/src/mux_4x1.v and TB expected calculation

##### Case 2

- selection_source: AUTO_SUGGESTED
  - provenance: AUTO_DERIVED
  - basis: Automatically selected from design/TB in v1; user approval and course-required status are not established
- input: vector n=6; i=0b0001 (0x1), s=0b10 (0x2)
  - provenance: AUTO_DERIVED
  - basis: LAB1/06_mux/sim/tb_mux_4x1.sv input enumeration; suggested representative vector
- expected output: z=0
  - provenance: AUTO_DERIVED
  - basis: LAB1/06_mux/src/mux_4x1.v and TB expected calculation
- calculation/reason: Select i[1]
  - provenance: AUTO_DERIVED
  - basis: LAB1/06_mux/src/mux_4x1.v and TB expected calculation

##### Case 3

- selection_source: AUTO_SUGGESTED
  - provenance: AUTO_DERIVED
  - basis: Automatically selected from design/TB in v1; user approval and course-required status are not established
- input: vector n=32; i=0b1000 (0x8), s=0b00 (0x0)
  - provenance: AUTO_DERIVED
  - basis: LAB1/06_mux/sim/tb_mux_4x1.sv input enumeration; suggested representative vector
- expected output: z=1
  - provenance: AUTO_DERIVED
  - basis: LAB1/06_mux/src/mux_4x1.v and TB expected calculation
- calculation/reason: Select i[3]
  - provenance: AUTO_DERIVED
  - basis: LAB1/06_mux/src/mux_4x1.v and TB expected calculation

##### Case 4

- selection_source: AUTO_SUGGESTED
  - provenance: AUTO_DERIVED
  - basis: Automatically selected from design/TB in v1; user approval and course-required status are not established
- input: vector n=35; i=0b1000 (0x8), s=0b11 (0x3)
  - provenance: AUTO_DERIVED
  - basis: LAB1/06_mux/sim/tb_mux_4x1.sv input enumeration; suggested representative vector
- expected output: z=0
  - provenance: AUTO_DERIVED
  - basis: LAB1/06_mux/src/mux_4x1.v and TB expected calculation
- calculation/reason: Select i[0]
  - provenance: AUTO_DERIVED
  - basis: LAB1/06_mux/src/mux_4x1.v and TB expected calculation

#### E. Normal simulation evidence

- run ID: run-36f7a5d8e67244aab57bbea64d2a5076
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/06_mux/normal__run-36f7a5d8e67244aab57bbea64d2a5076/simulation.log; VCD for numeric/time checks
- simulation.log path: evidence/vscode/LAB1/06_mux/normal__run-36f7a5d8e67244aab57bbea64d2a5076/simulation.log
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/06_mux/normal__run-36f7a5d8e67244aab57bbea64d2a5076/simulation.log; VCD for numeric/time checks
- compile.log path: evidence/vscode/LAB1/06_mux/normal__run-36f7a5d8e67244aab57bbea64d2a5076/compile.log
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/06_mux/normal__run-36f7a5d8e67244aab57bbea64d2a5076/simulation.log; VCD for numeric/time checks
- wave.vcd path: evidence/vscode/LAB1/06_mux/normal__run-36f7a5d8e67244aab57bbea64d2a5076/wave.vcd
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/06_mux/normal__run-36f7a5d8e67244aab57bbea64d2a5076/simulation.log; VCD for numeric/time checks
- PASS/FAIL: PASS
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/06_mux/normal__run-36f7a5d8e67244aab57bbea64d2a5076/simulation.log; VCD for numeric/time checks
- cases: 64
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/06_mux/normal__run-36f7a5d8e67244aab57bbea64d2a5076/simulation.log; VCD for numeric/time checks
- simulation end time: 640 ns (log and final VCD timestamp agree)
  - provenance: AUTO_DERIVED
  - basis: evidence/vscode/LAB1/06_mux/normal__run-36f7a5d8e67244aab57bbea64d2a5076/simulation.log; VCD for numeric/time checks
- source commit: UNKNOWN
  - provenance: UNKNOWN
  - basis: Direct run-to-commit record unavailable
- evidence_integrity: VERIFIED_COPY
  - provenance: TOOL_VERIFIED
  - basis: v1 same-run copy verification; current evidence hash matches v1 hash audit

#### F. Intentional failure

- run ID: run-48e62e48ea2b4365ad925d30a2b3fad9
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/06_mux/intentional_failure__run-48e62e48ea2b4365ad925d30a2b3fad9/simulation.log and VCD
- RTL modification: z: i[3-s] -> i[s]
  - provenance: TOOL_VERIFIED
  - basis: Git historical RTL change (not a run-specific source attribution)
- predicted failing condition: First mismatch n=4 gives i=0001,s=00: correct i[3]=0; modified i[0]=1
  - provenance: AUTO_DERIVED
  - basis: Historical Git diff and current TB; post-hoc calculation, not a recorded pre-run prediction
- actual first failing vector: 4
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/06_mux/intentional_failure__run-48e62e48ea2b4365ad925d30a2b3fad9/simulation.log and VCD
- expected: 0x0
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/06_mux/intentional_failure__run-48e62e48ea2b4365ad925d30a2b3fad9/simulation.log and VCD
- actual: 0x1
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/06_mux/intentional_failure__run-48e62e48ea2b4365ad925d30a2b3fad9/simulation.log and VCD
- failure time: 50 ns (log interpreted using VCD timescale)
  - provenance: AUTO_DERIVED
  - basis: evidence/vscode/LAB1/06_mux/intentional_failure__run-48e62e48ea2b4365ad925d30a2b3fad9/simulation.log and VCD
- simulation.log path: evidence/vscode/LAB1/06_mux/intentional_failure__run-48e62e48ea2b4365ad925d30a2b3fad9/simulation.log
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/06_mux/intentional_failure__run-48e62e48ea2b4365ad925d30a2b3fad9/simulation.log and VCD
- wave.vcd path: evidence/vscode/LAB1/06_mux/intentional_failure__run-48e62e48ea2b4365ad925d30a2b3fad9/wave.vcd
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/06_mux/intentional_failure__run-48e62e48ea2b4365ad925d30a2b3fad9/simulation.log and VCD
- source commit: UNKNOWN
  - provenance: UNKNOWN
  - basis: Direct run-to-commit record unavailable

#### G. Recovery

- run ID: run-57775dd875df4406ad71c9033c956b9b
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/06_mux/recovery__run-57775dd875df4406ad71c9033c956b9b/simulation.log and VCD
- restored behavior: Reversed bit-selection order i[3-s] restored
  - provenance: AUTO_DERIVED
  - basis: Git restoration history plus user-designated recovery evidence; direct commit linkage unavailable
- PASS/FAIL: PASS
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/06_mux/recovery__run-57775dd875df4406ad71c9033c956b9b/simulation.log and VCD
- cases: 64
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/06_mux/recovery__run-57775dd875df4406ad71c9033c956b9b/simulation.log and VCD
- simulation end time: 640 ns (log and final VCD timestamp agree)
  - provenance: AUTO_DERIVED
  - basis: evidence/vscode/LAB1/06_mux/recovery__run-57775dd875df4406ad71c9033c956b9b/simulation.log and VCD
- simulation.log path: evidence/vscode/LAB1/06_mux/recovery__run-57775dd875df4406ad71c9033c956b9b/simulation.log
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/06_mux/recovery__run-57775dd875df4406ad71c9033c956b9b/simulation.log and VCD
- wave.vcd path: evidence/vscode/LAB1/06_mux/recovery__run-57775dd875df4406ad71c9033c956b9b/wave.vcd
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/06_mux/recovery__run-57775dd875df4406ad71c9033c956b9b/simulation.log and VCD
- source commit: UNKNOWN
  - provenance: UNKNOWN
  - basis: Direct run-to-commit record unavailable

#### H. Waveform verification

- VCD_PRESENT: YES
  - provenance: TOOL_VERIFIED
  - basis: All three preserved run VCD files exist and were parsed
- VCD_RUN_TRACEABLE: YES
  - provenance: TOOL_VERIFIED
  - basis: Evidence folder run IDs, logs and VCDs; current hashes match v1 same-run copy audit; this is not source commit traceability
- VCD_NUMERIC_CHECK: VERIFIED
  - provenance: TOOL_VERIFIED
  - basis: Actual parsing of all three VCDs: representative normal/recovery inputs and outputs at both interval endpoints; failure TB expected and packed DUT output before fatal time; log/VCD end time agreement. Limited sampled numeric check, not full waveform/visual verification.
- USER_VISUAL_CHECK: NOT_VERIFIED
  - provenance: UNKNOWN
  - basis: No explicit user visual-inspection approval is recorded in the supplied evidence
- SCREENSHOT_PRESENT: NOT_AVAILABLE
  - provenance: TOOL_VERIFIED
  - basis: Evidence contains logs/VCD only; no user-confirmed screenshot file found
- representative_intervals: Candidate intervals only; values checked numerically. Selection and intervals remain derived suggestions.
  - provenance: AUTO_DERIVED
  - basis: TB vector index and 10 ns case interval; actual VCD samples
  - normal and recovery: [41, 49] ns, vector n=4; i=0b0001 (0x1), s=0b00 (0x0) -> z=0
    - provenance: AUTO_DERIVED
    - basis: Suggested vector interval; corresponding VCD values parsed
  - normal and recovery: [61, 69] ns, vector n=6; i=0b0001 (0x1), s=0b10 (0x2) -> z=0
    - provenance: AUTO_DERIVED
    - basis: Suggested vector interval; corresponding VCD values parsed
  - normal and recovery: [321, 329] ns, vector n=32; i=0b1000 (0x8), s=0b00 (0x0) -> z=1
    - provenance: AUTO_DERIVED
    - basis: Suggested vector interval; corresponding VCD values parsed
  - normal and recovery: [351, 359] ns, vector n=35; i=0b1000 (0x8), s=0b11 (0x3) -> z=0
    - provenance: AUTO_DERIVED
    - basis: Suggested vector interval; corresponding VCD values parsed
  - intentional_failure: [41, 49] ns, vector n=4; expected 0x0, actual 0x1; ends before fatal termination
    - provenance: AUTO_DERIVED
    - basis: Suggested vector interval; corresponding VCD values parsed
- VCD timescale: normal/failure/recovery: 1ps
  - provenance: TOOL_VERIFIED
  - basis: Preserved VCD $timescale declarations

#### I. Board plan

- board_status: NOT_PERFORMED
  - provenance: USER_REPORTED
  - basis: User instruction: keep board result NOT_PERFORMED
- XDC pin mapping: i[3]->K4; i[2]->N8; i[1]->N4; i[0]->N1; s[1]->Y1; s[0]->W3; z->L4; all ports LVCMOS33
  - provenance: TOOL_VERIFIED
  - basis: LAB1/06_mux/constraints/mux_4x1.xdc
- planned user inputs: Apply the representative input vectors in section D via the physical controls associated with the XDC input package pins, after verifying the board mapping and polarity.
  - provenance: AUTO_DERIVED
  - basis: Proposed plan from RTL expected behavior and XDC; not a physical observation
- expected physical outputs: Design-level expected logic at output package pins follows section D. Actual LED/segment illumination is not inferred from package pins alone.
  - provenance: AUTO_DERIVED
  - basis: Proposed plan from RTL expected behavior and XDC; not a physical observation
- verification method: Confirm board model, control-to-pin mapping, output polarity and segment/digit wiring; then apply planned vectors and record actual observations/photos/measurements against section D. This is a plan only.
  - provenance: AUTO_DERIVED
  - basis: Proposed plan from RTL expected behavior and XDC; not a physical observation
- board model: UNKNOWN
  - provenance: UNKNOWN
  - basis: Board model/wiring/polarity evidence unavailable
- physical control/output mapping and polarity: UNKNOWN
  - provenance: UNKNOWN
  - basis: Board model/wiring/polarity evidence unavailable

#### J. Pre-report readiness

- design_information: READY
  - provenance: AUTO_DERIVED
  - basis: Draft-data readiness assessment; outstanding confirmations in section 4. READY does not certify student review or full verification
- expected_behavior: READY
  - provenance: AUTO_DERIVED
  - basis: Draft-data readiness assessment; outstanding confirmations in section 4. READY does not certify student review or full verification
- normal_simulation: READY
  - provenance: AUTO_DERIVED
  - basis: Draft-data readiness assessment; outstanding confirmations in section 4. READY does not certify student review or full verification
- intentional_failure: READY
  - provenance: AUTO_DERIVED
  - basis: Draft-data readiness assessment; outstanding confirmations in section 4. READY does not certify student review or full verification
- recovery: READY
  - provenance: AUTO_DERIVED
  - basis: Draft-data readiness assessment; outstanding confirmations in section 4. READY does not certify student review or full verification
- waveform_visual_evidence: MISSING
  - provenance: AUTO_DERIVED
  - basis: Draft-data readiness assessment; outstanding confirmations in section 4. READY does not certify student review or full verification
- board_plan: NEEDS_USER_CONFIRMATION
  - provenance: AUTO_DERIVED
  - basis: Draft-data readiness assessment; outstanding confirmations in section 4. READY does not certify student review or full verification
- experiment_readiness: NEEDS_USER_CONFIRMATION
  - provenance: AUTO_DERIVED
  - basis: Draft-data readiness assessment; outstanding confirmations in section 4. READY does not certify student review or full verification

#### K. QA notes

- note_id: compile_warning
  - note: All three preserved compile logs warn that design elements lack explicit time unit/time precision. Preserve this warning; no source was changed.
  - provenance: TOOL_VERIFIED
  - basis: normal/intentional_failure/recovery compile.log
- note_id: run_commit_gap
  - note: All three source commit fields remain UNKNOWN. Git change/restoration commits document source history, not direct run identity.
  - provenance: UNKNOWN
  - basis: No direct run-to-commit record in the supplied evidence
- note_id: role_provenance
  - note: Normal/failure/recovery folder roles follow the user-specified run selection. Role names are not independent proof of run source identity.
  - provenance: USER_REPORTED
  - basis: User-specified preservation run IDs and roles
- note_id: prediction_record
  - note: The predicted failing condition is a post-hoc AUTO_DERIVED calculation. A contemporaneous pre-run prediction record is not available.
  - provenance: UNKNOWN
  - basis: No pre-run prediction record in the supplied evidence
- note_id: readiness_scope
  - note: Draft factual inputs are available. Visual evidence, representative selection, student review, physical plan assumptions and source commit provenance remain unresolved.
  - provenance: AUTO_DERIVED
  - basis: Sections D/H/I/J and section 4
- historical_modification_evidence: Git change commit dae49fb, file LAB1/06_mux/src/mux_4x1.v; preserved FAIL log and VCD TB expected / packed DUT values agree. The run-specific historical RTL snapshot is not preserved here, so the exact run source identity is unconfirmed.
  - provenance: TOOL_VERIFIED
  - basis: Historical Git diff and preserved FAIL log/VCD; the quoted source-identity limitation remains in force
- historical_restoration_evidence: Reversed bit-selection order i[3-s] restored; Git restoration commit 685849c; recovery role follows user selection
  - provenance: TOOL_VERIFIED
  - basis: Git restoration history and user-selected role; not direct commit-to-run proof
- copy_integrity_audit: Prior v1 recorded original/copy equality. Current evidence SHA-256 was recomputed and matches every v1 stored hash; originals were not reread during v2 generation.
  - provenance: TOOL_VERIFIED
  - basis: Unchanged v1 audit plus current preserved evidence SHA-256

##### Evidence SHA-256 audit

| Role | File | SHA-256 | Prior original-copy match | Current evidence matches v1 hash | Provenance |
|---|---|---|---|---|---|
| normal | simulation.log | 006bb959c632e3a678c7c4b5b078c9b28b9a9a3421ea3ad1e3ceb09dc2ac7981 | YES | YES | TOOL_VERIFIED |
| normal | compile.log | c9bfbefa8e8ea338d8849b1eaec3b8cf9ac5d2d64e03191e6ec8ba2b4ab93dd8 | YES | YES | TOOL_VERIFIED |
| normal | wave.vcd | 8e4a1afb6cad4734c2ed680339e3f332179116bbfadbf2974299a0082e10b042 | YES | YES | TOOL_VERIFIED |
| intentional_failure | simulation.log | 8e08548558196bb75f5081a962c0c58b32ff2030a581df71ed073e3347106314 | YES | YES | TOOL_VERIFIED |
| intentional_failure | compile.log | c9bfbefa8e8ea338d8849b1eaec3b8cf9ac5d2d64e03191e6ec8ba2b4ab93dd8 | YES | YES | TOOL_VERIFIED |
| intentional_failure | wave.vcd | 27fe76b3c1a919e620252360e3f39aa3d2044b235fecef8acbb5f4d0e5d131e6 | YES | YES | TOOL_VERIFIED |
| recovery | simulation.log | 006bb959c632e3a678c7c4b5b078c9b28b9a9a3421ea3ad1e3ceb09dc2ac7981 | YES | YES | TOOL_VERIFIED |
| recovery | compile.log | c9bfbefa8e8ea338d8849b1eaec3b8cf9ac5d2d64e03191e6ec8ba2b4ab93dd8 | YES | YES | TOOL_VERIFIED |
| recovery | wave.vcd | 9fe41cc38393fbb44be7c147ab823856f49e73e169c812ae089c268ba54e9410 | YES | YES | TOOL_VERIFIED |

### 07_demux


#### A. Design identity

- experiment folder: LAB1/07_demux
  - provenance: TOOL_VERIFIED
  - basis: LAB1/07_demux current RTL/TB/XDC/simulation.json
- RTL file(s): LAB1/07_demux/src/demux_1x8.v
  - provenance: TOOL_VERIFIED
  - basis: LAB1/07_demux current RTL/TB/XDC/simulation.json
- RTL module(s): demux_1x8
  - provenance: TOOL_VERIFIED
  - basis: LAB1/07_demux current RTL/TB/XDC/simulation.json
- Design top: demux_1x8
  - provenance: AUTO_DERIVED
  - basis: LAB1/07_demux/sim/tb_demux_1x8.sv DUT instantiation
- TB file: LAB1/07_demux/sim/tb_demux_1x8.sv
  - provenance: TOOL_VERIFIED
  - basis: LAB1/07_demux current RTL/TB/XDC/simulation.json
- Simulation top: tb_demux_1x8
  - provenance: TOOL_VERIFIED
  - basis: LAB1/07_demux current RTL/TB/XDC/simulation.json
- XDC file: LAB1/07_demux/constraints/demux_1x8.xdc
  - provenance: TOOL_VERIFIED
  - basis: LAB1/07_demux current RTL/TB/XDC/simulation.json
- simulation.json: LAB1/07_demux/simulation.json
  - provenance: TOOL_VERIFIED
  - basis: LAB1/07_demux current RTL/TB/XDC/simulation.json
- input ports: i, s
  - provenance: TOOL_VERIFIED
  - basis: LAB1/07_demux current RTL/TB/XDC/simulation.json
- output ports: o
  - provenance: TOOL_VERIFIED
  - basis: LAB1/07_demux current RTL/TB/XDC/simulation.json
- port widths: i: 1 bit(s); s: 3 bit(s); o: 8 bit(s)
  - provenance: TOOL_VERIFIED
  - basis: LAB1/07_demux current RTL/TB/XDC/simulation.json

#### B. Functional intent

- functional description: o=i ? (8'b10000000>>s) : 0. s=000 selects o[7]; s=111 selects o[0]. i=0 clears all outputs.
  - provenance: AUTO_DERIVED
  - basis: LAB1/07_demux/src/demux_1x8.v
- valid_input_domain: NOT_APPLICABLE
  - provenance: AUTO_DERIVED
  - basis: LAB1/07_demux/src/demux_1x8.v and TB enumeration; no course material available
- invalid_input_behavior: NOT_APPLICABLE
  - provenance: AUTO_DERIVED
  - basis: No special restricted binary-input semantics identified

#### C. Testbench verification

- applied input sequence or enumeration method: {i,s}=n, n=0..15; i=n//8, s=n%8
  - provenance: TOOL_VERIFIED
  - basis: LAB1/07_demux/sim/tb_demux_1x8.sv
- number of test cases: 16
  - provenance: TOOL_VERIFIED
  - basis: LAB1/07_demux/sim/tb_demux_1x8.sv
- interval per case: 10 ns (#10 with 1ns time unit; observation after the delay)
  - provenance: AUTO_DERIVED
  - basis: LAB1/07_demux/sim/tb_demux_1x8.sv
- total expected simulation time: 160 ns for an uninterrupted PASS path
  - provenance: AUTO_DERIVED
  - basis: LAB1/07_demux/sim/tb_demux_1x8.sv
- expected calculation method: n>=8 ? (128>>(n%8)) : 0
  - provenance: TOOL_VERIFIED
  - basis: LAB1/07_demux/sim/tb_demux_1x8.sv
- DUT output compared against: o compared to expected with !== (case inequality, including X/Z detection)
  - provenance: TOOL_VERIFIED
  - basis: LAB1/07_demux/sim/tb_demux_1x8.sv
- PASS condition: All 16 comparisons pass; checked==16; LAB1_PASS with cases=16 is printed, then $finish
  - provenance: AUTO_DERIVED
  - basis: LAB1/07_demux/sim/tb_demux_1x8.sv
- FAIL condition: o !== expected -> $fatal with vector/expected/actual; checked!=16 -> Incomplete test
  - provenance: AUTO_DERIVED
  - basis: LAB1/07_demux/sim/tb_demux_1x8.sv
- watchdog: At 100000 ns, $fatal(1, watchdog/Watchdog) if execution has not already ended
  - provenance: AUTO_DERIVED
  - basis: LAB1/07_demux/sim/tb_demux_1x8.sv
- code basis: LAB1/07_demux/sim/tb_demux_1x8.sv; timescale=1ns/1ps
  - provenance: TOOL_VERIFIED
  - basis: LAB1/07_demux/sim/tb_demux_1x8.sv

#### D. Representative expected behavior

- course_required_cases: UNKNOWN
  - provenance: UNKNOWN
  - basis: No course PDF/requirements provided
- report_recorded_cases: UNKNOWN
  - provenance: UNKNOWN
  - basis: No user report provided; current cases are suggestions

##### Case 1

- selection_source: AUTO_SUGGESTED
  - provenance: AUTO_DERIVED
  - basis: Automatically selected from design/TB in v1; user approval and course-required status are not established
- input: vector n=0; i=0, s=0b000 (0x0)
  - provenance: AUTO_DERIVED
  - basis: LAB1/07_demux/sim/tb_demux_1x8.sv input enumeration; suggested representative vector
- expected output: o=0b00000000 (0x0)
  - provenance: AUTO_DERIVED
  - basis: LAB1/07_demux/src/demux_1x8.v and TB expected calculation
- calculation/reason: Input 0 clears output; input 1 selects o[7-s]
  - provenance: AUTO_DERIVED
  - basis: LAB1/07_demux/src/demux_1x8.v and TB expected calculation

##### Case 2

- selection_source: AUTO_SUGGESTED
  - provenance: AUTO_DERIVED
  - basis: Automatically selected from design/TB in v1; user approval and course-required status are not established
- input: vector n=8; i=1, s=0b000 (0x0)
  - provenance: AUTO_DERIVED
  - basis: LAB1/07_demux/sim/tb_demux_1x8.sv input enumeration; suggested representative vector
- expected output: o=0b10000000 (0x80)
  - provenance: AUTO_DERIVED
  - basis: LAB1/07_demux/src/demux_1x8.v and TB expected calculation
- calculation/reason: Input 0 clears output; input 1 selects o[7-s]
  - provenance: AUTO_DERIVED
  - basis: LAB1/07_demux/src/demux_1x8.v and TB expected calculation

##### Case 3

- selection_source: AUTO_SUGGESTED
  - provenance: AUTO_DERIVED
  - basis: Automatically selected from design/TB in v1; user approval and course-required status are not established
- input: vector n=9; i=1, s=0b001 (0x1)
  - provenance: AUTO_DERIVED
  - basis: LAB1/07_demux/sim/tb_demux_1x8.sv input enumeration; suggested representative vector
- expected output: o=0b01000000 (0x40)
  - provenance: AUTO_DERIVED
  - basis: LAB1/07_demux/src/demux_1x8.v and TB expected calculation
- calculation/reason: Input 0 clears output; input 1 selects o[7-s]
  - provenance: AUTO_DERIVED
  - basis: LAB1/07_demux/src/demux_1x8.v and TB expected calculation

##### Case 4

- selection_source: AUTO_SUGGESTED
  - provenance: AUTO_DERIVED
  - basis: Automatically selected from design/TB in v1; user approval and course-required status are not established
- input: vector n=15; i=1, s=0b111 (0x7)
  - provenance: AUTO_DERIVED
  - basis: LAB1/07_demux/sim/tb_demux_1x8.sv input enumeration; suggested representative vector
- expected output: o=0b00000001 (0x1)
  - provenance: AUTO_DERIVED
  - basis: LAB1/07_demux/src/demux_1x8.v and TB expected calculation
- calculation/reason: Input 0 clears output; input 1 selects o[7-s]
  - provenance: AUTO_DERIVED
  - basis: LAB1/07_demux/src/demux_1x8.v and TB expected calculation

#### E. Normal simulation evidence

- run ID: run-bfb14fddf74e45cc96657c160ae52673
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/07_demux/normal__run-bfb14fddf74e45cc96657c160ae52673/simulation.log; VCD for numeric/time checks
- simulation.log path: evidence/vscode/LAB1/07_demux/normal__run-bfb14fddf74e45cc96657c160ae52673/simulation.log
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/07_demux/normal__run-bfb14fddf74e45cc96657c160ae52673/simulation.log; VCD for numeric/time checks
- compile.log path: evidence/vscode/LAB1/07_demux/normal__run-bfb14fddf74e45cc96657c160ae52673/compile.log
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/07_demux/normal__run-bfb14fddf74e45cc96657c160ae52673/simulation.log; VCD for numeric/time checks
- wave.vcd path: evidence/vscode/LAB1/07_demux/normal__run-bfb14fddf74e45cc96657c160ae52673/wave.vcd
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/07_demux/normal__run-bfb14fddf74e45cc96657c160ae52673/simulation.log; VCD for numeric/time checks
- PASS/FAIL: PASS
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/07_demux/normal__run-bfb14fddf74e45cc96657c160ae52673/simulation.log; VCD for numeric/time checks
- cases: 16
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/07_demux/normal__run-bfb14fddf74e45cc96657c160ae52673/simulation.log; VCD for numeric/time checks
- simulation end time: 160 ns (log and final VCD timestamp agree)
  - provenance: AUTO_DERIVED
  - basis: evidence/vscode/LAB1/07_demux/normal__run-bfb14fddf74e45cc96657c160ae52673/simulation.log; VCD for numeric/time checks
- source commit: UNKNOWN
  - provenance: UNKNOWN
  - basis: Direct run-to-commit record unavailable
- evidence_integrity: VERIFIED_COPY
  - provenance: TOOL_VERIFIED
  - basis: v1 same-run copy verification; current evidence hash matches v1 hash audit

#### F. Intentional failure

- run ID: run-db0d2d9924cb4fe0aa36fcbc7a454e35
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/07_demux/intentional_failure__run-db0d2d9924cb4fe0aa36fcbc7a454e35/simulation.log and VCD
- RTL modification: Shift operation: right shift -> left shift
  - provenance: TOOL_VERIFIED
  - basis: Git historical RTL change (not a run-specific source attribution)
- predicted failing condition: n=9 gives i=1,s=001: correct 0x40; 8-bit left shift discards the set bit and gives 0x00
  - provenance: AUTO_DERIVED
  - basis: Historical Git diff and current TB; post-hoc calculation, not a recorded pre-run prediction
- actual first failing vector: 9
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/07_demux/intentional_failure__run-db0d2d9924cb4fe0aa36fcbc7a454e35/simulation.log and VCD
- expected: 0x40
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/07_demux/intentional_failure__run-db0d2d9924cb4fe0aa36fcbc7a454e35/simulation.log and VCD
- actual: 0x00
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/07_demux/intentional_failure__run-db0d2d9924cb4fe0aa36fcbc7a454e35/simulation.log and VCD
- failure time: 100 ns (log interpreted using VCD timescale)
  - provenance: AUTO_DERIVED
  - basis: evidence/vscode/LAB1/07_demux/intentional_failure__run-db0d2d9924cb4fe0aa36fcbc7a454e35/simulation.log and VCD
- simulation.log path: evidence/vscode/LAB1/07_demux/intentional_failure__run-db0d2d9924cb4fe0aa36fcbc7a454e35/simulation.log
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/07_demux/intentional_failure__run-db0d2d9924cb4fe0aa36fcbc7a454e35/simulation.log and VCD
- wave.vcd path: evidence/vscode/LAB1/07_demux/intentional_failure__run-db0d2d9924cb4fe0aa36fcbc7a454e35/wave.vcd
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/07_demux/intentional_failure__run-db0d2d9924cb4fe0aa36fcbc7a454e35/simulation.log and VCD
- source commit: UNKNOWN
  - provenance: UNKNOWN
  - basis: Direct run-to-commit record unavailable

#### G. Recovery

- run ID: run-8d10b461d9ec4762ba051885e020afaf
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/07_demux/recovery__run-8d10b461d9ec4762ba051885e020afaf/simulation.log and VCD
- restored behavior: Right-shift output ordering restored
  - provenance: AUTO_DERIVED
  - basis: Git restoration history plus user-designated recovery evidence; direct commit linkage unavailable
- PASS/FAIL: PASS
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/07_demux/recovery__run-8d10b461d9ec4762ba051885e020afaf/simulation.log and VCD
- cases: 16
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/07_demux/recovery__run-8d10b461d9ec4762ba051885e020afaf/simulation.log and VCD
- simulation end time: 160 ns (log and final VCD timestamp agree)
  - provenance: AUTO_DERIVED
  - basis: evidence/vscode/LAB1/07_demux/recovery__run-8d10b461d9ec4762ba051885e020afaf/simulation.log and VCD
- simulation.log path: evidence/vscode/LAB1/07_demux/recovery__run-8d10b461d9ec4762ba051885e020afaf/simulation.log
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/07_demux/recovery__run-8d10b461d9ec4762ba051885e020afaf/simulation.log and VCD
- wave.vcd path: evidence/vscode/LAB1/07_demux/recovery__run-8d10b461d9ec4762ba051885e020afaf/wave.vcd
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/07_demux/recovery__run-8d10b461d9ec4762ba051885e020afaf/simulation.log and VCD
- source commit: UNKNOWN
  - provenance: UNKNOWN
  - basis: Direct run-to-commit record unavailable

#### H. Waveform verification

- VCD_PRESENT: YES
  - provenance: TOOL_VERIFIED
  - basis: All three preserved run VCD files exist and were parsed
- VCD_RUN_TRACEABLE: YES
  - provenance: TOOL_VERIFIED
  - basis: Evidence folder run IDs, logs and VCDs; current hashes match v1 same-run copy audit; this is not source commit traceability
- VCD_NUMERIC_CHECK: VERIFIED
  - provenance: TOOL_VERIFIED
  - basis: Actual parsing of all three VCDs: representative normal/recovery inputs and outputs at both interval endpoints; failure TB expected and packed DUT output before fatal time; log/VCD end time agreement. Limited sampled numeric check, not full waveform/visual verification.
- USER_VISUAL_CHECK: NOT_VERIFIED
  - provenance: UNKNOWN
  - basis: No explicit user visual-inspection approval is recorded in the supplied evidence
- SCREENSHOT_PRESENT: NOT_AVAILABLE
  - provenance: TOOL_VERIFIED
  - basis: Evidence contains logs/VCD only; no user-confirmed screenshot file found
- representative_intervals: Candidate intervals only; values checked numerically. Selection and intervals remain derived suggestions.
  - provenance: AUTO_DERIVED
  - basis: TB vector index and 10 ns case interval; actual VCD samples
  - normal and recovery: [1, 9] ns, vector n=0; i=0, s=0b000 (0x0) -> o=0b00000000 (0x0)
    - provenance: AUTO_DERIVED
    - basis: Suggested vector interval; corresponding VCD values parsed
  - normal and recovery: [81, 89] ns, vector n=8; i=1, s=0b000 (0x0) -> o=0b10000000 (0x80)
    - provenance: AUTO_DERIVED
    - basis: Suggested vector interval; corresponding VCD values parsed
  - normal and recovery: [91, 99] ns, vector n=9; i=1, s=0b001 (0x1) -> o=0b01000000 (0x40)
    - provenance: AUTO_DERIVED
    - basis: Suggested vector interval; corresponding VCD values parsed
  - normal and recovery: [151, 159] ns, vector n=15; i=1, s=0b111 (0x7) -> o=0b00000001 (0x1)
    - provenance: AUTO_DERIVED
    - basis: Suggested vector interval; corresponding VCD values parsed
  - intentional_failure: [91, 99] ns, vector n=9; expected 0x40, actual 0x00; ends before fatal termination
    - provenance: AUTO_DERIVED
    - basis: Suggested vector interval; corresponding VCD values parsed
- VCD timescale: normal/failure/recovery: 1ps
  - provenance: TOOL_VERIFIED
  - basis: Preserved VCD $timescale declarations

#### I. Board plan

- board_status: NOT_PERFORMED
  - provenance: USER_REPORTED
  - basis: User instruction: keep board result NOT_PERFORMED
- XDC pin mapping: i->K4; s[2]->Y1; s[1]->W3; s[0]->U2; o[7]->L4; o[6]->M4; o[5]->M2; o[4]->N7; o[3]->M7; o[2]->M3; o[1]->M1; o[0]->N5; all ports LVCMOS33
  - provenance: TOOL_VERIFIED
  - basis: LAB1/07_demux/constraints/demux_1x8.xdc
- planned user inputs: Apply the representative input vectors in section D via the physical controls associated with the XDC input package pins, after verifying the board mapping and polarity.
  - provenance: AUTO_DERIVED
  - basis: Proposed plan from RTL expected behavior and XDC; not a physical observation
- expected physical outputs: Design-level expected logic at output package pins follows section D. Actual LED/segment illumination is not inferred from package pins alone.
  - provenance: AUTO_DERIVED
  - basis: Proposed plan from RTL expected behavior and XDC; not a physical observation
- verification method: Confirm board model, control-to-pin mapping, output polarity and segment/digit wiring; then apply planned vectors and record actual observations/photos/measurements against section D. This is a plan only.
  - provenance: AUTO_DERIVED
  - basis: Proposed plan from RTL expected behavior and XDC; not a physical observation
- board model: UNKNOWN
  - provenance: UNKNOWN
  - basis: Board model/wiring/polarity evidence unavailable
- physical control/output mapping and polarity: UNKNOWN
  - provenance: UNKNOWN
  - basis: Board model/wiring/polarity evidence unavailable

#### J. Pre-report readiness

- design_information: READY
  - provenance: AUTO_DERIVED
  - basis: Draft-data readiness assessment; outstanding confirmations in section 4. READY does not certify student review or full verification
- expected_behavior: READY
  - provenance: AUTO_DERIVED
  - basis: Draft-data readiness assessment; outstanding confirmations in section 4. READY does not certify student review or full verification
- normal_simulation: READY
  - provenance: AUTO_DERIVED
  - basis: Draft-data readiness assessment; outstanding confirmations in section 4. READY does not certify student review or full verification
- intentional_failure: READY
  - provenance: AUTO_DERIVED
  - basis: Draft-data readiness assessment; outstanding confirmations in section 4. READY does not certify student review or full verification
- recovery: READY
  - provenance: AUTO_DERIVED
  - basis: Draft-data readiness assessment; outstanding confirmations in section 4. READY does not certify student review or full verification
- waveform_visual_evidence: MISSING
  - provenance: AUTO_DERIVED
  - basis: Draft-data readiness assessment; outstanding confirmations in section 4. READY does not certify student review or full verification
- board_plan: NEEDS_USER_CONFIRMATION
  - provenance: AUTO_DERIVED
  - basis: Draft-data readiness assessment; outstanding confirmations in section 4. READY does not certify student review or full verification
- experiment_readiness: NEEDS_USER_CONFIRMATION
  - provenance: AUTO_DERIVED
  - basis: Draft-data readiness assessment; outstanding confirmations in section 4. READY does not certify student review or full verification

#### K. QA notes

- note_id: compile_warning
  - note: All three preserved compile logs warn that design elements lack explicit time unit/time precision. Preserve this warning; no source was changed.
  - provenance: TOOL_VERIFIED
  - basis: normal/intentional_failure/recovery compile.log
- note_id: run_commit_gap
  - note: All three source commit fields remain UNKNOWN. Git change/restoration commits document source history, not direct run identity.
  - provenance: UNKNOWN
  - basis: No direct run-to-commit record in the supplied evidence
- note_id: role_provenance
  - note: Normal/failure/recovery folder roles follow the user-specified run selection. Role names are not independent proof of run source identity.
  - provenance: USER_REPORTED
  - basis: User-specified preservation run IDs and roles
- note_id: prediction_record
  - note: The predicted failing condition is a post-hoc AUTO_DERIVED calculation. A contemporaneous pre-run prediction record is not available.
  - provenance: UNKNOWN
  - basis: No pre-run prediction record in the supplied evidence
- note_id: readiness_scope
  - note: Draft factual inputs are available. Visual evidence, representative selection, student review, physical plan assumptions and source commit provenance remain unresolved.
  - provenance: AUTO_DERIVED
  - basis: Sections D/H/I/J and section 4
- historical_modification_evidence: Git change commit 70155b7, file LAB1/07_demux/src/demux_1x8.v; preserved FAIL log and VCD TB expected / packed DUT values agree. The run-specific historical RTL snapshot is not preserved here, so the exact run source identity is unconfirmed.
  - provenance: TOOL_VERIFIED
  - basis: Historical Git diff and preserved FAIL log/VCD; the quoted source-identity limitation remains in force
- historical_restoration_evidence: Right-shift output ordering restored; Git restoration commit 07e4a29; recovery role follows user selection
  - provenance: TOOL_VERIFIED
  - basis: Git restoration history and user-selected role; not direct commit-to-run proof
- copy_integrity_audit: Prior v1 recorded original/copy equality. Current evidence SHA-256 was recomputed and matches every v1 stored hash; originals were not reread during v2 generation.
  - provenance: TOOL_VERIFIED
  - basis: Unchanged v1 audit plus current preserved evidence SHA-256

##### Evidence SHA-256 audit

| Role | File | SHA-256 | Prior original-copy match | Current evidence matches v1 hash | Provenance |
|---|---|---|---|---|---|
| normal | simulation.log | b49720036a41e4f403f972b81b47a9bc30e6923e80f5fb59e1f2a721b51333b9 | YES | YES | TOOL_VERIFIED |
| normal | compile.log | 8282ea25b1989968563a0d346e05d8f8867cfd218e4f33bcd97d5643554b61b2 | YES | YES | TOOL_VERIFIED |
| normal | wave.vcd | 50c9a9ecdacdebb041dca134c53505aa9e4e2f22b13e82d9577a0f2208ebbc90 | YES | YES | TOOL_VERIFIED |
| intentional_failure | simulation.log | 3bd6052b26855e13431307244a184605b6512d58c4b9b40ad39fe11a2e20f58e | YES | YES | TOOL_VERIFIED |
| intentional_failure | compile.log | 8282ea25b1989968563a0d346e05d8f8867cfd218e4f33bcd97d5643554b61b2 | YES | YES | TOOL_VERIFIED |
| intentional_failure | wave.vcd | 82c9a5b85c06e1c57c1cdab1e7a196265d4c19893ee17f7bab53ae5bee051562 | YES | YES | TOOL_VERIFIED |
| recovery | simulation.log | b49720036a41e4f403f972b81b47a9bc30e6923e80f5fb59e1f2a721b51333b9 | YES | YES | TOOL_VERIFIED |
| recovery | compile.log | 8282ea25b1989968563a0d346e05d8f8867cfd218e4f33bcd97d5643554b61b2 | YES | YES | TOOL_VERIFIED |
| recovery | wave.vcd | f08ae5138bf7fe19f142e585cffbe70dbf97ec228bbd8c5de97c075bc1aeb870 | YES | YES | TOOL_VERIFIED |

### 08_encoder


#### A. Design identity

- experiment folder: LAB1/08_encoder
  - provenance: TOOL_VERIFIED
  - basis: LAB1/08_encoder current RTL/TB/XDC/simulation.json
- RTL file(s): LAB1/08_encoder/src/encoder8x3.v
  - provenance: TOOL_VERIFIED
  - basis: LAB1/08_encoder current RTL/TB/XDC/simulation.json
- RTL module(s): encoder8x3
  - provenance: TOOL_VERIFIED
  - basis: LAB1/08_encoder current RTL/TB/XDC/simulation.json
- Design top: encoder8x3
  - provenance: AUTO_DERIVED
  - basis: LAB1/08_encoder/sim/tb_encoder8x3.sv DUT instantiation
- TB file: LAB1/08_encoder/sim/tb_encoder8x3.sv
  - provenance: TOOL_VERIFIED
  - basis: LAB1/08_encoder current RTL/TB/XDC/simulation.json
- Simulation top: tb_encoder8x3
  - provenance: TOOL_VERIFIED
  - basis: LAB1/08_encoder current RTL/TB/XDC/simulation.json
- XDC file: LAB1/08_encoder/constraints/encoder8x3.xdc
  - provenance: TOOL_VERIFIED
  - basis: LAB1/08_encoder current RTL/TB/XDC/simulation.json
- simulation.json: LAB1/08_encoder/simulation.json
  - provenance: TOOL_VERIFIED
  - basis: LAB1/08_encoder current RTL/TB/XDC/simulation.json
- input ports: i
  - provenance: TOOL_VERIFIED
  - basis: LAB1/08_encoder current RTL/TB/XDC/simulation.json
- output ports: a
  - provenance: TOOL_VERIFIED
  - basis: LAB1/08_encoder current RTL/TB/XDC/simulation.json
- port widths: i: 8 bit(s); a: 3 bit(s)
  - provenance: TOOL_VERIFIED
  - basis: LAB1/08_encoder current RTL/TB/XDC/simulation.json

#### B. Functional intent

- functional description: One-hot encoder: i=80,40,20,10,08,04,02,01 (hex) maps to a=0..7. Zero and multi-hot inputs return 000. This is not a priority encoder.
  - provenance: AUTO_DERIVED
  - basis: LAB1/08_encoder/src/encoder8x3.v
- valid_input_domain: One-hot binary inputs i=0x80,0x40,0x20,0x10,0x08,0x04,0x02,0x01 for meaningful encoding; RTL/TB also define fallback behavior for all other binary inputs.
  - provenance: TOOL_VERIFIED
  - basis: LAB1/08_encoder/src/encoder8x3.v and TB enumeration; no course material available
- invalid_input_behavior: Zero and multi-hot binary inputs return a=000 by default. No valid flag is provided. This is a code-defined fallback, not a course-approved invalid-input requirement.
  - provenance: TOOL_VERIFIED
  - basis: LAB1/08_encoder/src/encoder8x3.v case/default clauses

#### C. Testbench verification

- applied input sequence or enumeration method: i=n, n=0..255
  - provenance: TOOL_VERIFIED
  - basis: LAB1/08_encoder/sim/tb_encoder8x3.sv
- number of test cases: 256
  - provenance: TOOL_VERIFIED
  - basis: LAB1/08_encoder/sim/tb_encoder8x3.sv
- interval per case: 10 ns (#10 with 1ns time unit; observation after the delay)
  - provenance: AUTO_DERIVED
  - basis: LAB1/08_encoder/sim/tb_encoder8x3.sv
- total expected simulation time: 2560 ns for an uninterrupted PASS path
  - provenance: AUTO_DERIVED
  - basis: LAB1/08_encoder/sim/tb_encoder8x3.sv
- expected calculation method: Start expected=0; for k=0..7, if n==(128>>k), expected=k
  - provenance: TOOL_VERIFIED
  - basis: LAB1/08_encoder/sim/tb_encoder8x3.sv
- DUT output compared against: a compared to expected with !== (case inequality, including X/Z detection)
  - provenance: TOOL_VERIFIED
  - basis: LAB1/08_encoder/sim/tb_encoder8x3.sv
- PASS condition: All 256 comparisons pass; checked==256; LAB1_PASS with cases=256 is printed, then $finish
  - provenance: AUTO_DERIVED
  - basis: LAB1/08_encoder/sim/tb_encoder8x3.sv
- FAIL condition: a !== expected -> $fatal with vector/expected/actual; checked!=256 -> Incomplete test
  - provenance: AUTO_DERIVED
  - basis: LAB1/08_encoder/sim/tb_encoder8x3.sv
- watchdog: At 100000 ns, $fatal(1, watchdog/Watchdog) if execution has not already ended
  - provenance: AUTO_DERIVED
  - basis: LAB1/08_encoder/sim/tb_encoder8x3.sv
- code basis: LAB1/08_encoder/sim/tb_encoder8x3.sv; timescale=1ns/1ns
  - provenance: TOOL_VERIFIED
  - basis: LAB1/08_encoder/sim/tb_encoder8x3.sv

#### D. Representative expected behavior

- course_required_cases: UNKNOWN
  - provenance: UNKNOWN
  - basis: No course PDF/requirements provided
- report_recorded_cases: UNKNOWN
  - provenance: UNKNOWN
  - basis: No user report provided; current cases are suggestions

##### Case 1

- selection_source: AUTO_SUGGESTED
  - provenance: AUTO_DERIVED
  - basis: Automatically selected from design/TB in v1; user approval and course-required status are not established
- input: vector n=0; i=0b00000000 (0x0)
  - provenance: AUTO_DERIVED
  - basis: LAB1/08_encoder/sim/tb_encoder8x3.sv input enumeration; suggested representative vector
- expected output: a=0b000 (0x0)
  - provenance: AUTO_DERIVED
  - basis: LAB1/08_encoder/src/encoder8x3.v and TB expected calculation
- calculation/reason: One-hot table; zero/multi-hot default to 000
  - provenance: AUTO_DERIVED
  - basis: LAB1/08_encoder/src/encoder8x3.v and TB expected calculation

##### Case 2

- selection_source: AUTO_SUGGESTED
  - provenance: AUTO_DERIVED
  - basis: Automatically selected from design/TB in v1; user approval and course-required status are not established
- input: vector n=1; i=0b00000001 (0x1)
  - provenance: AUTO_DERIVED
  - basis: LAB1/08_encoder/sim/tb_encoder8x3.sv input enumeration; suggested representative vector
- expected output: a=0b111 (0x7)
  - provenance: AUTO_DERIVED
  - basis: LAB1/08_encoder/src/encoder8x3.v and TB expected calculation
- calculation/reason: One-hot table; zero/multi-hot default to 000
  - provenance: AUTO_DERIVED
  - basis: LAB1/08_encoder/src/encoder8x3.v and TB expected calculation

##### Case 3

- selection_source: AUTO_SUGGESTED
  - provenance: AUTO_DERIVED
  - basis: Automatically selected from design/TB in v1; user approval and course-required status are not established
- input: vector n=3; i=0b00000011 (0x3)
  - provenance: AUTO_DERIVED
  - basis: LAB1/08_encoder/sim/tb_encoder8x3.sv input enumeration; suggested representative vector
- expected output: a=0b000 (0x0)
  - provenance: AUTO_DERIVED
  - basis: LAB1/08_encoder/src/encoder8x3.v and TB expected calculation
- calculation/reason: One-hot table; zero/multi-hot default to 000
  - provenance: AUTO_DERIVED
  - basis: LAB1/08_encoder/src/encoder8x3.v and TB expected calculation

##### Case 4

- selection_source: AUTO_SUGGESTED
  - provenance: AUTO_DERIVED
  - basis: Automatically selected from design/TB in v1; user approval and course-required status are not established
- input: vector n=128; i=0b10000000 (0x80)
  - provenance: AUTO_DERIVED
  - basis: LAB1/08_encoder/sim/tb_encoder8x3.sv input enumeration; suggested representative vector
- expected output: a=0b000 (0x0)
  - provenance: AUTO_DERIVED
  - basis: LAB1/08_encoder/src/encoder8x3.v and TB expected calculation
- calculation/reason: One-hot table; zero/multi-hot default to 000
  - provenance: AUTO_DERIVED
  - basis: LAB1/08_encoder/src/encoder8x3.v and TB expected calculation

#### E. Normal simulation evidence

- run ID: run-c192938f32594b7bb22427b71cf14ef1
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/08_encoder/normal__run-c192938f32594b7bb22427b71cf14ef1/simulation.log; VCD for numeric/time checks
- simulation.log path: evidence/vscode/LAB1/08_encoder/normal__run-c192938f32594b7bb22427b71cf14ef1/simulation.log
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/08_encoder/normal__run-c192938f32594b7bb22427b71cf14ef1/simulation.log; VCD for numeric/time checks
- compile.log path: evidence/vscode/LAB1/08_encoder/normal__run-c192938f32594b7bb22427b71cf14ef1/compile.log
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/08_encoder/normal__run-c192938f32594b7bb22427b71cf14ef1/simulation.log; VCD for numeric/time checks
- wave.vcd path: evidence/vscode/LAB1/08_encoder/normal__run-c192938f32594b7bb22427b71cf14ef1/wave.vcd
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/08_encoder/normal__run-c192938f32594b7bb22427b71cf14ef1/simulation.log; VCD for numeric/time checks
- PASS/FAIL: PASS
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/08_encoder/normal__run-c192938f32594b7bb22427b71cf14ef1/simulation.log; VCD for numeric/time checks
- cases: 256
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/08_encoder/normal__run-c192938f32594b7bb22427b71cf14ef1/simulation.log; VCD for numeric/time checks
- simulation end time: 2560 ns (log and final VCD timestamp agree)
  - provenance: AUTO_DERIVED
  - basis: evidence/vscode/LAB1/08_encoder/normal__run-c192938f32594b7bb22427b71cf14ef1/simulation.log; VCD for numeric/time checks
- source commit: UNKNOWN
  - provenance: UNKNOWN
  - basis: Direct run-to-commit record unavailable
- evidence_integrity: VERIFIED_COPY
  - provenance: TOOL_VERIFIED
  - basis: v1 same-run copy verification; current evidence hash matches v1 hash audit

#### F. Intentional failure

- run ID: run-86de81e9d439420494915ca07b464d53
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/08_encoder/intentional_failure__run-86de81e9d439420494915ca07b464d53/simulation.log and VCD
- RTL modification: Mapping for i=0x01: a=7 -> a=6
  - provenance: TOOL_VERIFIED
  - basis: Git historical RTL change (not a run-specific source attribution)
- predicted failing condition: n=1 gives i=0x01: expected a=7; modified mapping gives a=6
  - provenance: AUTO_DERIVED
  - basis: Historical Git diff and current TB; post-hoc calculation, not a recorded pre-run prediction
- actual first failing vector: 1
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/08_encoder/intentional_failure__run-86de81e9d439420494915ca07b464d53/simulation.log and VCD
- expected: 0x7
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/08_encoder/intentional_failure__run-86de81e9d439420494915ca07b464d53/simulation.log and VCD
- actual: 0x6
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/08_encoder/intentional_failure__run-86de81e9d439420494915ca07b464d53/simulation.log and VCD
- failure time: 20 ns (log interpreted using VCD timescale)
  - provenance: AUTO_DERIVED
  - basis: evidence/vscode/LAB1/08_encoder/intentional_failure__run-86de81e9d439420494915ca07b464d53/simulation.log and VCD
- simulation.log path: evidence/vscode/LAB1/08_encoder/intentional_failure__run-86de81e9d439420494915ca07b464d53/simulation.log
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/08_encoder/intentional_failure__run-86de81e9d439420494915ca07b464d53/simulation.log and VCD
- wave.vcd path: evidence/vscode/LAB1/08_encoder/intentional_failure__run-86de81e9d439420494915ca07b464d53/wave.vcd
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/08_encoder/intentional_failure__run-86de81e9d439420494915ca07b464d53/simulation.log and VCD
- source commit: UNKNOWN
  - provenance: UNKNOWN
  - basis: Direct run-to-commit record unavailable

#### G. Recovery

- run ID: run-aec4953651124a6990cecdc3b1c2c0ea
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/08_encoder/recovery__run-aec4953651124a6990cecdc3b1c2c0ea/simulation.log and VCD
- restored behavior: i=0x01 mapping to a=7 restored
  - provenance: AUTO_DERIVED
  - basis: Git restoration history plus user-designated recovery evidence; direct commit linkage unavailable
- PASS/FAIL: PASS
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/08_encoder/recovery__run-aec4953651124a6990cecdc3b1c2c0ea/simulation.log and VCD
- cases: 256
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/08_encoder/recovery__run-aec4953651124a6990cecdc3b1c2c0ea/simulation.log and VCD
- simulation end time: 2560 ns (log and final VCD timestamp agree)
  - provenance: AUTO_DERIVED
  - basis: evidence/vscode/LAB1/08_encoder/recovery__run-aec4953651124a6990cecdc3b1c2c0ea/simulation.log and VCD
- simulation.log path: evidence/vscode/LAB1/08_encoder/recovery__run-aec4953651124a6990cecdc3b1c2c0ea/simulation.log
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/08_encoder/recovery__run-aec4953651124a6990cecdc3b1c2c0ea/simulation.log and VCD
- wave.vcd path: evidence/vscode/LAB1/08_encoder/recovery__run-aec4953651124a6990cecdc3b1c2c0ea/wave.vcd
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/08_encoder/recovery__run-aec4953651124a6990cecdc3b1c2c0ea/simulation.log and VCD
- source commit: UNKNOWN
  - provenance: UNKNOWN
  - basis: Direct run-to-commit record unavailable

#### H. Waveform verification

- VCD_PRESENT: YES
  - provenance: TOOL_VERIFIED
  - basis: All three preserved run VCD files exist and were parsed
- VCD_RUN_TRACEABLE: YES
  - provenance: TOOL_VERIFIED
  - basis: Evidence folder run IDs, logs and VCDs; current hashes match v1 same-run copy audit; this is not source commit traceability
- VCD_NUMERIC_CHECK: VERIFIED
  - provenance: TOOL_VERIFIED
  - basis: Actual parsing of all three VCDs: representative normal/recovery inputs and outputs at both interval endpoints; failure TB expected and packed DUT output before fatal time; log/VCD end time agreement. Limited sampled numeric check, not full waveform/visual verification.
- USER_VISUAL_CHECK: NOT_VERIFIED
  - provenance: UNKNOWN
  - basis: No explicit user visual-inspection approval is recorded in the supplied evidence
- SCREENSHOT_PRESENT: NOT_AVAILABLE
  - provenance: TOOL_VERIFIED
  - basis: Evidence contains logs/VCD only; no user-confirmed screenshot file found
- representative_intervals: Candidate intervals only; values checked numerically. Selection and intervals remain derived suggestions.
  - provenance: AUTO_DERIVED
  - basis: TB vector index and 10 ns case interval; actual VCD samples
  - normal and recovery: [1, 9] ns, vector n=0; i=0b00000000 (0x0) -> a=0b000 (0x0)
    - provenance: AUTO_DERIVED
    - basis: Suggested vector interval; corresponding VCD values parsed
  - normal and recovery: [11, 19] ns, vector n=1; i=0b00000001 (0x1) -> a=0b111 (0x7)
    - provenance: AUTO_DERIVED
    - basis: Suggested vector interval; corresponding VCD values parsed
  - normal and recovery: [31, 39] ns, vector n=3; i=0b00000011 (0x3) -> a=0b000 (0x0)
    - provenance: AUTO_DERIVED
    - basis: Suggested vector interval; corresponding VCD values parsed
  - normal and recovery: [1281, 1289] ns, vector n=128; i=0b10000000 (0x80) -> a=0b000 (0x0)
    - provenance: AUTO_DERIVED
    - basis: Suggested vector interval; corresponding VCD values parsed
  - intentional_failure: [11, 19] ns, vector n=1; expected 0x7, actual 0x6; ends before fatal termination
    - provenance: AUTO_DERIVED
    - basis: Suggested vector interval; corresponding VCD values parsed
- VCD timescale: normal/failure/recovery: 1ns
  - provenance: TOOL_VERIFIED
  - basis: Preserved VCD $timescale declarations

#### I. Board plan

- board_status: NOT_PERFORMED
  - provenance: USER_REPORTED
  - basis: User instruction: keep board result NOT_PERFORMED
- XDC pin mapping: i[7]->K4; i[6]->N8; i[5]->N4; i[4]->N1; i[3]->P6; i[2]->N6; i[1]->L5; i[0]->J2; a[2]->L4; a[1]->M4; a[0]->M2; all ports LVCMOS33; DRIVE=12 for a[0]
  - provenance: TOOL_VERIFIED
  - basis: LAB1/08_encoder/constraints/encoder8x3.xdc
- planned user inputs: Apply the representative input vectors in section D via the physical controls associated with the XDC input package pins, after verifying the board mapping and polarity.
  - provenance: AUTO_DERIVED
  - basis: Proposed plan from RTL expected behavior and XDC; not a physical observation
- expected physical outputs: Design-level expected logic at output package pins follows section D. Actual LED/segment illumination is not inferred from package pins alone.
  - provenance: AUTO_DERIVED
  - basis: Proposed plan from RTL expected behavior and XDC; not a physical observation
- verification method: Confirm board model, control-to-pin mapping, output polarity and segment/digit wiring; then apply planned vectors and record actual observations/photos/measurements against section D. This is a plan only.
  - provenance: AUTO_DERIVED
  - basis: Proposed plan from RTL expected behavior and XDC; not a physical observation
- board model: UNKNOWN
  - provenance: UNKNOWN
  - basis: Board model/wiring/polarity evidence unavailable
- physical control/output mapping and polarity: UNKNOWN
  - provenance: UNKNOWN
  - basis: Board model/wiring/polarity evidence unavailable

#### J. Pre-report readiness

- design_information: READY
  - provenance: AUTO_DERIVED
  - basis: Draft-data readiness assessment; outstanding confirmations in section 4. READY does not certify student review or full verification
- expected_behavior: READY
  - provenance: AUTO_DERIVED
  - basis: Draft-data readiness assessment; outstanding confirmations in section 4. READY does not certify student review or full verification
- normal_simulation: READY
  - provenance: AUTO_DERIVED
  - basis: Draft-data readiness assessment; outstanding confirmations in section 4. READY does not certify student review or full verification
- intentional_failure: READY
  - provenance: AUTO_DERIVED
  - basis: Draft-data readiness assessment; outstanding confirmations in section 4. READY does not certify student review or full verification
- recovery: READY
  - provenance: AUTO_DERIVED
  - basis: Draft-data readiness assessment; outstanding confirmations in section 4. READY does not certify student review or full verification
- waveform_visual_evidence: MISSING
  - provenance: AUTO_DERIVED
  - basis: Draft-data readiness assessment; outstanding confirmations in section 4. READY does not certify student review or full verification
- board_plan: NEEDS_USER_CONFIRMATION
  - provenance: AUTO_DERIVED
  - basis: Draft-data readiness assessment; outstanding confirmations in section 4. READY does not certify student review or full verification
- experiment_readiness: NEEDS_USER_CONFIRMATION
  - provenance: AUTO_DERIVED
  - basis: Draft-data readiness assessment; outstanding confirmations in section 4. READY does not certify student review or full verification

#### K. QA notes

- note_id: compile_warning
  - note: All three preserved compile logs warn that design elements lack explicit time unit/time precision. Preserve this warning; no source was changed.
  - provenance: TOOL_VERIFIED
  - basis: normal/intentional_failure/recovery compile.log
- note_id: run_commit_gap
  - note: All three source commit fields remain UNKNOWN. Git change/restoration commits document source history, not direct run identity.
  - provenance: UNKNOWN
  - basis: No direct run-to-commit record in the supplied evidence
- note_id: role_provenance
  - note: Normal/failure/recovery folder roles follow the user-specified run selection. Role names are not independent proof of run source identity.
  - provenance: USER_REPORTED
  - basis: User-specified preservation run IDs and roles
- note_id: prediction_record
  - note: The predicted failing condition is a post-hoc AUTO_DERIVED calculation. A contemporaneous pre-run prediction record is not available.
  - provenance: UNKNOWN
  - basis: No pre-run prediction record in the supplied evidence
- note_id: readiness_scope
  - note: Draft factual inputs are available. Visual evidence, representative selection, student review, physical plan assumptions and source commit provenance remain unresolved.
  - provenance: AUTO_DERIVED
  - basis: Sections D/H/I/J and section 4
- note_id: technical_1
  - note: output 000 is shared by i=0x80 and all zero/multi-hot cases; there is no valid flag. Do not describe this circuit as a priority encoder.
  - provenance: TOOL_VERIFIED
  - basis: Preserved logs or current RTL; board caveats reflect missing physical evidence
- historical_modification_evidence: Git change commit 521acca, file LAB1/08_encoder/src/encoder8x3.v; preserved FAIL log and VCD TB expected / packed DUT values agree. The run-specific historical RTL snapshot is not preserved here, so the exact run source identity is unconfirmed.
  - provenance: TOOL_VERIFIED
  - basis: Historical Git diff and preserved FAIL log/VCD; the quoted source-identity limitation remains in force
- historical_restoration_evidence: i=0x01 mapping to a=7 restored; Git restoration commit 26c0419; recovery role follows user selection
  - provenance: TOOL_VERIFIED
  - basis: Git restoration history and user-selected role; not direct commit-to-run proof
- copy_integrity_audit: Prior v1 recorded original/copy equality. Current evidence SHA-256 was recomputed and matches every v1 stored hash; originals were not reread during v2 generation.
  - provenance: TOOL_VERIFIED
  - basis: Unchanged v1 audit plus current preserved evidence SHA-256

##### Evidence SHA-256 audit

| Role | File | SHA-256 | Prior original-copy match | Current evidence matches v1 hash | Provenance |
|---|---|---|---|---|---|
| normal | simulation.log | 1bb4da6322171d2b0181088fa49b0ee9d5f0062be6637a57c65de7dfa68c1f5a | YES | YES | TOOL_VERIFIED |
| normal | compile.log | 6b377431e787c81d195296991f14287cb9e3f5012e9bbcad5db72fe0994acced | YES | YES | TOOL_VERIFIED |
| normal | wave.vcd | 5093442dc395af65303f62e683a4a6df8715bfcc48652d6ff6d24275a59059c4 | YES | YES | TOOL_VERIFIED |
| intentional_failure | simulation.log | a3defb3819b4c89b1d39a3086c80b82dee2ae13bfeedc7fa7ba9cce3589cdb42 | YES | YES | TOOL_VERIFIED |
| intentional_failure | compile.log | 6b377431e787c81d195296991f14287cb9e3f5012e9bbcad5db72fe0994acced | YES | YES | TOOL_VERIFIED |
| intentional_failure | wave.vcd | 8244c48eaf01ae576253987670f9dce9a40421855c1a3a66c168e6d3c1d775c1 | YES | YES | TOOL_VERIFIED |
| recovery | simulation.log | 1bb4da6322171d2b0181088fa49b0ee9d5f0062be6637a57c65de7dfa68c1f5a | YES | YES | TOOL_VERIFIED |
| recovery | compile.log | 6b377431e787c81d195296991f14287cb9e3f5012e9bbcad5db72fe0994acced | YES | YES | TOOL_VERIFIED |
| recovery | wave.vcd | e3697a61203b4dd07633d93ac50941defa751a584a68265f56f68138cd53e87e | YES | YES | TOOL_VERIFIED |

### 09_decoder


#### A. Design identity

- experiment folder: LAB1/09_decoder
  - provenance: TOOL_VERIFIED
  - basis: LAB1/09_decoder current RTL/TB/XDC/simulation.json
- RTL file(s): LAB1/09_decoder/src/decoder3x8.v
  - provenance: TOOL_VERIFIED
  - basis: LAB1/09_decoder current RTL/TB/XDC/simulation.json
- RTL module(s): decoder3x8
  - provenance: TOOL_VERIFIED
  - basis: LAB1/09_decoder current RTL/TB/XDC/simulation.json
- Design top: decoder3x8
  - provenance: AUTO_DERIVED
  - basis: LAB1/09_decoder/sim/tb_decoder3x8.sv DUT instantiation
- TB file: LAB1/09_decoder/sim/tb_decoder3x8.sv
  - provenance: TOOL_VERIFIED
  - basis: LAB1/09_decoder current RTL/TB/XDC/simulation.json
- Simulation top: tb_decoder3x8
  - provenance: TOOL_VERIFIED
  - basis: LAB1/09_decoder current RTL/TB/XDC/simulation.json
- XDC file: LAB1/09_decoder/constraints/decoder3x8.xdc
  - provenance: TOOL_VERIFIED
  - basis: LAB1/09_decoder current RTL/TB/XDC/simulation.json
- simulation.json: LAB1/09_decoder/simulation.json
  - provenance: TOOL_VERIFIED
  - basis: LAB1/09_decoder current RTL/TB/XDC/simulation.json
- input ports: a, b, c
  - provenance: TOOL_VERIFIED
  - basis: LAB1/09_decoder current RTL/TB/XDC/simulation.json
- output ports: o
  - provenance: TOOL_VERIFIED
  - basis: LAB1/09_decoder current RTL/TB/XDC/simulation.json
- port widths: a: 1 bit(s); b: 1 bit(s); c: 1 bit(s); o: 8 bit(s)
  - provenance: TOOL_VERIFIED
  - basis: LAB1/09_decoder current RTL/TB/XDC/simulation.json

#### B. Functional intent

- functional description: o=8'b00000001<<{a,b,c}. a,b,c are selector bits 2,1,0. Selector 000 activates o[0]; 111 activates o[7].
  - provenance: AUTO_DERIVED
  - basis: LAB1/09_decoder/src/decoder3x8.v
- valid_input_domain: NOT_APPLICABLE
  - provenance: AUTO_DERIVED
  - basis: LAB1/09_decoder/src/decoder3x8.v and TB enumeration; no course material available
- invalid_input_behavior: NOT_APPLICABLE
  - provenance: AUTO_DERIVED
  - basis: No special restricted binary-input semantics identified

#### C. Testbench verification

- applied input sequence or enumeration method: {a,b,c}=n, n=0..7
  - provenance: TOOL_VERIFIED
  - basis: LAB1/09_decoder/sim/tb_decoder3x8.sv
- number of test cases: 8
  - provenance: TOOL_VERIFIED
  - basis: LAB1/09_decoder/sim/tb_decoder3x8.sv
- interval per case: 10 ns (#10 with 1ns time unit; observation after the delay)
  - provenance: AUTO_DERIVED
  - basis: LAB1/09_decoder/sim/tb_decoder3x8.sv
- total expected simulation time: 80 ns for an uninterrupted PASS path
  - provenance: AUTO_DERIVED
  - basis: LAB1/09_decoder/sim/tb_decoder3x8.sv
- expected calculation method: 1<<n
  - provenance: TOOL_VERIFIED
  - basis: LAB1/09_decoder/sim/tb_decoder3x8.sv
- DUT output compared against: o compared to expected with !== (case inequality, including X/Z detection)
  - provenance: TOOL_VERIFIED
  - basis: LAB1/09_decoder/sim/tb_decoder3x8.sv
- PASS condition: All 8 comparisons pass; checked==8; LAB1_PASS with cases=8 is printed, then $finish
  - provenance: AUTO_DERIVED
  - basis: LAB1/09_decoder/sim/tb_decoder3x8.sv
- FAIL condition: o !== expected -> $fatal with vector/expected/actual; checked!=8 -> Incomplete test
  - provenance: AUTO_DERIVED
  - basis: LAB1/09_decoder/sim/tb_decoder3x8.sv
- watchdog: At 100000 ns, $fatal(1, watchdog/Watchdog) if execution has not already ended
  - provenance: AUTO_DERIVED
  - basis: LAB1/09_decoder/sim/tb_decoder3x8.sv
- code basis: LAB1/09_decoder/sim/tb_decoder3x8.sv; timescale=1ns/1ns
  - provenance: TOOL_VERIFIED
  - basis: LAB1/09_decoder/sim/tb_decoder3x8.sv

#### D. Representative expected behavior

- course_required_cases: UNKNOWN
  - provenance: UNKNOWN
  - basis: No course PDF/requirements provided
- report_recorded_cases: UNKNOWN
  - provenance: UNKNOWN
  - basis: No user report provided; current cases are suggestions

##### Case 1

- selection_source: AUTO_SUGGESTED
  - provenance: AUTO_DERIVED
  - basis: Automatically selected from design/TB in v1; user approval and course-required status are not established
- input: vector n=0; a=0, b=0, c=0
  - provenance: AUTO_DERIVED
  - basis: LAB1/09_decoder/sim/tb_decoder3x8.sv input enumeration; suggested representative vector
- expected output: o=0b00000001 (0x1)
  - provenance: AUTO_DERIVED
  - basis: LAB1/09_decoder/src/decoder3x8.v and TB expected calculation
- calculation/reason: 1 << 0
  - provenance: AUTO_DERIVED
  - basis: LAB1/09_decoder/src/decoder3x8.v and TB expected calculation

##### Case 2

- selection_source: AUTO_SUGGESTED
  - provenance: AUTO_DERIVED
  - basis: Automatically selected from design/TB in v1; user approval and course-required status are not established
- input: vector n=1; a=0, b=0, c=1
  - provenance: AUTO_DERIVED
  - basis: LAB1/09_decoder/sim/tb_decoder3x8.sv input enumeration; suggested representative vector
- expected output: o=0b00000010 (0x2)
  - provenance: AUTO_DERIVED
  - basis: LAB1/09_decoder/src/decoder3x8.v and TB expected calculation
- calculation/reason: 1 << 1
  - provenance: AUTO_DERIVED
  - basis: LAB1/09_decoder/src/decoder3x8.v and TB expected calculation

##### Case 3

- selection_source: AUTO_SUGGESTED
  - provenance: AUTO_DERIVED
  - basis: Automatically selected from design/TB in v1; user approval and course-required status are not established
- input: vector n=6; a=1, b=1, c=0
  - provenance: AUTO_DERIVED
  - basis: LAB1/09_decoder/sim/tb_decoder3x8.sv input enumeration; suggested representative vector
- expected output: o=0b01000000 (0x40)
  - provenance: AUTO_DERIVED
  - basis: LAB1/09_decoder/src/decoder3x8.v and TB expected calculation
- calculation/reason: 1 << 6
  - provenance: AUTO_DERIVED
  - basis: LAB1/09_decoder/src/decoder3x8.v and TB expected calculation

##### Case 4

- selection_source: AUTO_SUGGESTED
  - provenance: AUTO_DERIVED
  - basis: Automatically selected from design/TB in v1; user approval and course-required status are not established
- input: vector n=7; a=1, b=1, c=1
  - provenance: AUTO_DERIVED
  - basis: LAB1/09_decoder/sim/tb_decoder3x8.sv input enumeration; suggested representative vector
- expected output: o=0b10000000 (0x80)
  - provenance: AUTO_DERIVED
  - basis: LAB1/09_decoder/src/decoder3x8.v and TB expected calculation
- calculation/reason: 1 << 7
  - provenance: AUTO_DERIVED
  - basis: LAB1/09_decoder/src/decoder3x8.v and TB expected calculation

#### E. Normal simulation evidence

- run ID: run-d333ae080651492f8390e84e3c792ce2
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/09_decoder/normal__run-d333ae080651492f8390e84e3c792ce2/simulation.log; VCD for numeric/time checks
- simulation.log path: evidence/vscode/LAB1/09_decoder/normal__run-d333ae080651492f8390e84e3c792ce2/simulation.log
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/09_decoder/normal__run-d333ae080651492f8390e84e3c792ce2/simulation.log; VCD for numeric/time checks
- compile.log path: evidence/vscode/LAB1/09_decoder/normal__run-d333ae080651492f8390e84e3c792ce2/compile.log
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/09_decoder/normal__run-d333ae080651492f8390e84e3c792ce2/simulation.log; VCD for numeric/time checks
- wave.vcd path: evidence/vscode/LAB1/09_decoder/normal__run-d333ae080651492f8390e84e3c792ce2/wave.vcd
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/09_decoder/normal__run-d333ae080651492f8390e84e3c792ce2/simulation.log; VCD for numeric/time checks
- PASS/FAIL: PASS
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/09_decoder/normal__run-d333ae080651492f8390e84e3c792ce2/simulation.log; VCD for numeric/time checks
- cases: 8
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/09_decoder/normal__run-d333ae080651492f8390e84e3c792ce2/simulation.log; VCD for numeric/time checks
- simulation end time: 80 ns (log and final VCD timestamp agree)
  - provenance: AUTO_DERIVED
  - basis: evidence/vscode/LAB1/09_decoder/normal__run-d333ae080651492f8390e84e3c792ce2/simulation.log; VCD for numeric/time checks
- source commit: UNKNOWN
  - provenance: UNKNOWN
  - basis: Direct run-to-commit record unavailable
- evidence_integrity: VERIFIED_COPY
  - provenance: TOOL_VERIFIED
  - basis: v1 same-run copy verification; current evidence hash matches v1 hash audit

#### F. Intentional failure

- run ID: run-c9953810fc18472a80d153b38921d46c
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/09_decoder/intentional_failure__run-c9953810fc18472a80d153b38921d46c/simulation.log and VCD
- RTL modification: Shift operation: left shift -> right shift
  - provenance: TOOL_VERIFIED
  - basis: Git historical RTL change (not a run-specific source attribution)
- predicted failing condition: n=1 gives selector 001: correct 0x02; right-shifted 0x01 gives 0x00
  - provenance: AUTO_DERIVED
  - basis: Historical Git diff and current TB; post-hoc calculation, not a recorded pre-run prediction
- actual first failing vector: 1
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/09_decoder/intentional_failure__run-c9953810fc18472a80d153b38921d46c/simulation.log and VCD
- expected: 0x02
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/09_decoder/intentional_failure__run-c9953810fc18472a80d153b38921d46c/simulation.log and VCD
- actual: 0x00
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/09_decoder/intentional_failure__run-c9953810fc18472a80d153b38921d46c/simulation.log and VCD
- failure time: 20 ns (log interpreted using VCD timescale)
  - provenance: AUTO_DERIVED
  - basis: evidence/vscode/LAB1/09_decoder/intentional_failure__run-c9953810fc18472a80d153b38921d46c/simulation.log and VCD
- simulation.log path: evidence/vscode/LAB1/09_decoder/intentional_failure__run-c9953810fc18472a80d153b38921d46c/simulation.log
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/09_decoder/intentional_failure__run-c9953810fc18472a80d153b38921d46c/simulation.log and VCD
- wave.vcd path: evidence/vscode/LAB1/09_decoder/intentional_failure__run-c9953810fc18472a80d153b38921d46c/wave.vcd
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/09_decoder/intentional_failure__run-c9953810fc18472a80d153b38921d46c/simulation.log and VCD
- source commit: UNKNOWN
  - provenance: UNKNOWN
  - basis: Direct run-to-commit record unavailable

#### G. Recovery

- run ID: run-1d0930251102468e85a52b00b169fdc3
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/09_decoder/recovery__run-1d0930251102468e85a52b00b169fdc3/simulation.log and VCD
- restored behavior: Left-shift one-hot decoder restored
  - provenance: AUTO_DERIVED
  - basis: Git restoration history plus user-designated recovery evidence; direct commit linkage unavailable
- PASS/FAIL: PASS
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/09_decoder/recovery__run-1d0930251102468e85a52b00b169fdc3/simulation.log and VCD
- cases: 8
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/09_decoder/recovery__run-1d0930251102468e85a52b00b169fdc3/simulation.log and VCD
- simulation end time: 80 ns (log and final VCD timestamp agree)
  - provenance: AUTO_DERIVED
  - basis: evidence/vscode/LAB1/09_decoder/recovery__run-1d0930251102468e85a52b00b169fdc3/simulation.log and VCD
- simulation.log path: evidence/vscode/LAB1/09_decoder/recovery__run-1d0930251102468e85a52b00b169fdc3/simulation.log
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/09_decoder/recovery__run-1d0930251102468e85a52b00b169fdc3/simulation.log and VCD
- wave.vcd path: evidence/vscode/LAB1/09_decoder/recovery__run-1d0930251102468e85a52b00b169fdc3/wave.vcd
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/09_decoder/recovery__run-1d0930251102468e85a52b00b169fdc3/simulation.log and VCD
- source commit: UNKNOWN
  - provenance: UNKNOWN
  - basis: Direct run-to-commit record unavailable

#### H. Waveform verification

- VCD_PRESENT: YES
  - provenance: TOOL_VERIFIED
  - basis: All three preserved run VCD files exist and were parsed
- VCD_RUN_TRACEABLE: YES
  - provenance: TOOL_VERIFIED
  - basis: Evidence folder run IDs, logs and VCDs; current hashes match v1 same-run copy audit; this is not source commit traceability
- VCD_NUMERIC_CHECK: VERIFIED
  - provenance: TOOL_VERIFIED
  - basis: Actual parsing of all three VCDs: representative normal/recovery inputs and outputs at both interval endpoints; failure TB expected and packed DUT output before fatal time; log/VCD end time agreement. Limited sampled numeric check, not full waveform/visual verification.
- USER_VISUAL_CHECK: NOT_VERIFIED
  - provenance: UNKNOWN
  - basis: No explicit user visual-inspection approval is recorded in the supplied evidence
- SCREENSHOT_PRESENT: NOT_AVAILABLE
  - provenance: TOOL_VERIFIED
  - basis: Evidence contains logs/VCD only; no user-confirmed screenshot file found
- representative_intervals: Candidate intervals only; values checked numerically. Selection and intervals remain derived suggestions.
  - provenance: AUTO_DERIVED
  - basis: TB vector index and 10 ns case interval; actual VCD samples
  - normal and recovery: [1, 9] ns, vector n=0; a=0, b=0, c=0 -> o=0b00000001 (0x1)
    - provenance: AUTO_DERIVED
    - basis: Suggested vector interval; corresponding VCD values parsed
  - normal and recovery: [11, 19] ns, vector n=1; a=0, b=0, c=1 -> o=0b00000010 (0x2)
    - provenance: AUTO_DERIVED
    - basis: Suggested vector interval; corresponding VCD values parsed
  - normal and recovery: [61, 69] ns, vector n=6; a=1, b=1, c=0 -> o=0b01000000 (0x40)
    - provenance: AUTO_DERIVED
    - basis: Suggested vector interval; corresponding VCD values parsed
  - normal and recovery: [71, 79] ns, vector n=7; a=1, b=1, c=1 -> o=0b10000000 (0x80)
    - provenance: AUTO_DERIVED
    - basis: Suggested vector interval; corresponding VCD values parsed
  - intentional_failure: [11, 19] ns, vector n=1; expected 0x02, actual 0x00; ends before fatal termination
    - provenance: AUTO_DERIVED
    - basis: Suggested vector interval; corresponding VCD values parsed
- VCD timescale: normal/failure/recovery: 1ns
  - provenance: TOOL_VERIFIED
  - basis: Preserved VCD $timescale declarations

#### I. Board plan

- board_status: NOT_PERFORMED
  - provenance: USER_REPORTED
  - basis: User instruction: keep board result NOT_PERFORMED
- XDC pin mapping: a->K4; b->N8; c->N4; o[7]->L4; o[6]->M4; o[5]->M2; o[4]->N7; o[3]->M7; o[2]->M3; o[1]->M1; o[0]->N5; all ports LVCMOS33
  - provenance: TOOL_VERIFIED
  - basis: LAB1/09_decoder/constraints/decoder3x8.xdc
- planned user inputs: Apply the representative input vectors in section D via the physical controls associated with the XDC input package pins, after verifying the board mapping and polarity.
  - provenance: AUTO_DERIVED
  - basis: Proposed plan from RTL expected behavior and XDC; not a physical observation
- expected physical outputs: Design-level expected logic at output package pins follows section D. Actual LED/segment illumination is not inferred from package pins alone.
  - provenance: AUTO_DERIVED
  - basis: Proposed plan from RTL expected behavior and XDC; not a physical observation
- verification method: Confirm board model, control-to-pin mapping, output polarity and segment/digit wiring; then apply planned vectors and record actual observations/photos/measurements against section D. This is a plan only.
  - provenance: AUTO_DERIVED
  - basis: Proposed plan from RTL expected behavior and XDC; not a physical observation
- board model: UNKNOWN
  - provenance: UNKNOWN
  - basis: Board model/wiring/polarity evidence unavailable
- physical control/output mapping and polarity: UNKNOWN
  - provenance: UNKNOWN
  - basis: Board model/wiring/polarity evidence unavailable

#### J. Pre-report readiness

- design_information: READY
  - provenance: AUTO_DERIVED
  - basis: Draft-data readiness assessment; outstanding confirmations in section 4. READY does not certify student review or full verification
- expected_behavior: READY
  - provenance: AUTO_DERIVED
  - basis: Draft-data readiness assessment; outstanding confirmations in section 4. READY does not certify student review or full verification
- normal_simulation: READY
  - provenance: AUTO_DERIVED
  - basis: Draft-data readiness assessment; outstanding confirmations in section 4. READY does not certify student review or full verification
- intentional_failure: READY
  - provenance: AUTO_DERIVED
  - basis: Draft-data readiness assessment; outstanding confirmations in section 4. READY does not certify student review or full verification
- recovery: READY
  - provenance: AUTO_DERIVED
  - basis: Draft-data readiness assessment; outstanding confirmations in section 4. READY does not certify student review or full verification
- waveform_visual_evidence: MISSING
  - provenance: AUTO_DERIVED
  - basis: Draft-data readiness assessment; outstanding confirmations in section 4. READY does not certify student review or full verification
- board_plan: NEEDS_USER_CONFIRMATION
  - provenance: AUTO_DERIVED
  - basis: Draft-data readiness assessment; outstanding confirmations in section 4. READY does not certify student review or full verification
- experiment_readiness: NEEDS_USER_CONFIRMATION
  - provenance: AUTO_DERIVED
  - basis: Draft-data readiness assessment; outstanding confirmations in section 4. READY does not certify student review or full verification

#### K. QA notes

- note_id: compile_warning
  - note: All three preserved compile logs warn that design elements lack explicit time unit/time precision. Preserve this warning; no source was changed.
  - provenance: TOOL_VERIFIED
  - basis: normal/intentional_failure/recovery compile.log
- note_id: run_commit_gap
  - note: All three source commit fields remain UNKNOWN. Git change/restoration commits document source history, not direct run identity.
  - provenance: UNKNOWN
  - basis: No direct run-to-commit record in the supplied evidence
- note_id: role_provenance
  - note: Normal/failure/recovery folder roles follow the user-specified run selection. Role names are not independent proof of run source identity.
  - provenance: USER_REPORTED
  - basis: User-specified preservation run IDs and roles
- note_id: prediction_record
  - note: The predicted failing condition is a post-hoc AUTO_DERIVED calculation. A contemporaneous pre-run prediction record is not available.
  - provenance: UNKNOWN
  - basis: No pre-run prediction record in the supplied evidence
- note_id: readiness_scope
  - note: Draft factual inputs are available. Visual evidence, representative selection, student review, physical plan assumptions and source commit provenance remain unresolved.
  - provenance: AUTO_DERIVED
  - basis: Sections D/H/I/J and section 4
- historical_modification_evidence: Git change commit 2ea29aa, file LAB1/09_decoder/src/decoder3x8.v; preserved FAIL log and VCD TB expected / packed DUT values agree. The run-specific historical RTL snapshot is not preserved here, so the exact run source identity is unconfirmed.
  - provenance: TOOL_VERIFIED
  - basis: Historical Git diff and preserved FAIL log/VCD; the quoted source-identity limitation remains in force
- historical_restoration_evidence: Left-shift one-hot decoder restored; Git restoration commit de0b93f; recovery role follows user selection
  - provenance: TOOL_VERIFIED
  - basis: Git restoration history and user-selected role; not direct commit-to-run proof
- copy_integrity_audit: Prior v1 recorded original/copy equality. Current evidence SHA-256 was recomputed and matches every v1 stored hash; originals were not reread during v2 generation.
  - provenance: TOOL_VERIFIED
  - basis: Unchanged v1 audit plus current preserved evidence SHA-256

##### Evidence SHA-256 audit

| Role | File | SHA-256 | Prior original-copy match | Current evidence matches v1 hash | Provenance |
|---|---|---|---|---|---|
| normal | simulation.log | 628033a091a62407e2c8087c2731ff55f46b679eb44a50107165c4b91c0c35c8 | YES | YES | TOOL_VERIFIED |
| normal | compile.log | 4dfc77194afe2e693ad2712b1337dcc52be0af2e22110bb92c4eccc09bb27e08 | YES | YES | TOOL_VERIFIED |
| normal | wave.vcd | 861c4579873f8c4cc8200922678b8501b4fa96b4018d9b23ad19cb60c7d370ad | YES | YES | TOOL_VERIFIED |
| intentional_failure | simulation.log | 5cc968cbe2c40b64f023aa51687484b0623032158d1a5ffe51d5101d45bf2010 | YES | YES | TOOL_VERIFIED |
| intentional_failure | compile.log | 4dfc77194afe2e693ad2712b1337dcc52be0af2e22110bb92c4eccc09bb27e08 | YES | YES | TOOL_VERIFIED |
| intentional_failure | wave.vcd | 06d3d6746f58e05d8130c5c936b5281a4ec5719c18f3eff415971b96f118d46b | YES | YES | TOOL_VERIFIED |
| recovery | simulation.log | 628033a091a62407e2c8087c2731ff55f46b679eb44a50107165c4b91c0c35c8 | YES | YES | TOOL_VERIFIED |
| recovery | compile.log | 4dfc77194afe2e693ad2712b1337dcc52be0af2e22110bb92c4eccc09bb27e08 | YES | YES | TOOL_VERIFIED |
| recovery | wave.vcd | e885945cd9f6954b4e4b4deb0d89dd9063da6fe44e837fad965848a1a68969d9 | YES | YES | TOOL_VERIFIED |

### 10_7seg_decoder


#### A. Design identity

- experiment folder: LAB1/10_7seg_decoder
  - provenance: TOOL_VERIFIED
  - basis: LAB1/10_7seg_decoder current RTL/TB/XDC/simulation.json
- RTL file(s): LAB1/10_7seg_decoder/src/seg_decoder.v
  - provenance: TOOL_VERIFIED
  - basis: LAB1/10_7seg_decoder current RTL/TB/XDC/simulation.json
- RTL module(s): seg_decoder
  - provenance: TOOL_VERIFIED
  - basis: LAB1/10_7seg_decoder current RTL/TB/XDC/simulation.json
- Design top: seg_decoder
  - provenance: AUTO_DERIVED
  - basis: LAB1/10_7seg_decoder/sim/tb_seg_decoder.sv DUT instantiation
- TB file: LAB1/10_7seg_decoder/sim/tb_seg_decoder.sv
  - provenance: TOOL_VERIFIED
  - basis: LAB1/10_7seg_decoder current RTL/TB/XDC/simulation.json
- Simulation top: tb_seg_decoder
  - provenance: TOOL_VERIFIED
  - basis: LAB1/10_7seg_decoder current RTL/TB/XDC/simulation.json
- XDC file: LAB1/10_7seg_decoder/constraints/seg_decoder.xdc
  - provenance: TOOL_VERIFIED
  - basis: LAB1/10_7seg_decoder current RTL/TB/XDC/simulation.json
- simulation.json: LAB1/10_7seg_decoder/simulation.json
  - provenance: TOOL_VERIFIED
  - basis: LAB1/10_7seg_decoder current RTL/TB/XDC/simulation.json
- input ports: bcd
  - provenance: TOOL_VERIFIED
  - basis: LAB1/10_7seg_decoder current RTL/TB/XDC/simulation.json
- output ports: seg_data
  - provenance: TOOL_VERIFIED
  - basis: LAB1/10_7seg_decoder current RTL/TB/XDC/simulation.json
- port widths: bcd: 4 bit(s); seg_data: 8 bit(s)
  - provenance: TOOL_VERIFIED
  - basis: LAB1/10_7seg_decoder current RTL/TB/XDC/simulation.json

#### B. Functional intent

- functional description: Hexadecimal decoder for 0..F, not only decimal BCD. seg_data[7:0]={a,b,c,d,e,f,g,dp}; active-high logical segment bits; dp=0 for all 16 entries.
  - provenance: AUTO_DERIVED
  - basis: LAB1/10_7seg_decoder/src/seg_decoder.v
- valid_input_domain: All 16 binary values bcd=0..15 (hex 0..F); A..F are explicitly handled despite the bcd signal name.
  - provenance: TOOL_VERIFIED
  - basis: LAB1/10_7seg_decoder/src/seg_decoder.v and TB enumeration; no course material available
- invalid_input_behavior: No out-of-range binary input exists for the 4-bit port; unmatched four-state case values take the RTL default seg_data=0. This is not a measured board response.
  - provenance: TOOL_VERIFIED
  - basis: LAB1/10_7seg_decoder/src/seg_decoder.v case/default clauses

#### C. Testbench verification

- applied input sequence or enumeration method: bcd=n, n=0..15
  - provenance: TOOL_VERIFIED
  - basis: LAB1/10_7seg_decoder/sim/tb_seg_decoder.sv
- number of test cases: 16
  - provenance: TOOL_VERIFIED
  - basis: LAB1/10_7seg_decoder/sim/tb_seg_decoder.sv
- interval per case: 10 ns (#10 with 1ns time unit; observation after the delay)
  - provenance: AUTO_DERIVED
  - basis: LAB1/10_7seg_decoder/sim/tb_seg_decoder.sv
- total expected simulation time: 160 ns for an uninterrupted PASS path
  - provenance: AUTO_DERIVED
  - basis: LAB1/10_7seg_decoder/sim/tb_seg_decoder.sv
- expected calculation method: expected=digits[n]; TB defines an explicit 16-entry 8-bit pattern table
  - provenance: TOOL_VERIFIED
  - basis: LAB1/10_7seg_decoder/sim/tb_seg_decoder.sv
- DUT output compared against: seg_data compared to expected with !== (case inequality, including X/Z detection)
  - provenance: TOOL_VERIFIED
  - basis: LAB1/10_7seg_decoder/sim/tb_seg_decoder.sv
- PASS condition: All 16 comparisons pass; checked==16; LAB1_PASS with cases=16 is printed, then $finish
  - provenance: AUTO_DERIVED
  - basis: LAB1/10_7seg_decoder/sim/tb_seg_decoder.sv
- FAIL condition: seg_data !== expected -> $fatal with vector/expected/actual; checked!=16 -> Incomplete test
  - provenance: AUTO_DERIVED
  - basis: LAB1/10_7seg_decoder/sim/tb_seg_decoder.sv
- watchdog: At 100000 ns, $fatal(1, watchdog/Watchdog) if execution has not already ended
  - provenance: AUTO_DERIVED
  - basis: LAB1/10_7seg_decoder/sim/tb_seg_decoder.sv
- code basis: LAB1/10_7seg_decoder/sim/tb_seg_decoder.sv; timescale=1ns/1ns
  - provenance: TOOL_VERIFIED
  - basis: LAB1/10_7seg_decoder/sim/tb_seg_decoder.sv

#### D. Representative expected behavior

- course_required_cases: UNKNOWN
  - provenance: UNKNOWN
  - basis: No course PDF/requirements provided
- report_recorded_cases: UNKNOWN
  - provenance: UNKNOWN
  - basis: No user report provided; current cases are suggestions

##### Case 1

- selection_source: AUTO_SUGGESTED
  - provenance: AUTO_DERIVED
  - basis: Automatically selected from design/TB in v1; user approval and course-required status are not established
- input: vector n=0; bcd=0b0000 (0x0)
  - provenance: AUTO_DERIVED
  - basis: LAB1/10_7seg_decoder/sim/tb_seg_decoder.sv input enumeration; suggested representative vector
- expected output: seg_data=0b11111100 (0xfc)
  - provenance: AUTO_DERIVED
  - basis: LAB1/10_7seg_decoder/src/seg_decoder.v and TB expected calculation
- calculation/reason: RTL case table and TB digits table; segment bits {a,b,c,d,e,f,g,dp}
  - provenance: AUTO_DERIVED
  - basis: LAB1/10_7seg_decoder/src/seg_decoder.v and TB expected calculation

##### Case 2

- selection_source: AUTO_SUGGESTED
  - provenance: AUTO_DERIVED
  - basis: Automatically selected from design/TB in v1; user approval and course-required status are not established
- input: vector n=1; bcd=0b0001 (0x1)
  - provenance: AUTO_DERIVED
  - basis: LAB1/10_7seg_decoder/sim/tb_seg_decoder.sv input enumeration; suggested representative vector
- expected output: seg_data=0b01100000 (0x60)
  - provenance: AUTO_DERIVED
  - basis: LAB1/10_7seg_decoder/src/seg_decoder.v and TB expected calculation
- calculation/reason: RTL case table and TB digits table; segment bits {a,b,c,d,e,f,g,dp}
  - provenance: AUTO_DERIVED
  - basis: LAB1/10_7seg_decoder/src/seg_decoder.v and TB expected calculation

##### Case 3

- selection_source: AUTO_SUGGESTED
  - provenance: AUTO_DERIVED
  - basis: Automatically selected from design/TB in v1; user approval and course-required status are not established
- input: vector n=10; bcd=0b1010 (0xa)
  - provenance: AUTO_DERIVED
  - basis: LAB1/10_7seg_decoder/sim/tb_seg_decoder.sv input enumeration; suggested representative vector
- expected output: seg_data=0b11101110 (0xee)
  - provenance: AUTO_DERIVED
  - basis: LAB1/10_7seg_decoder/src/seg_decoder.v and TB expected calculation
- calculation/reason: RTL case table and TB digits table; segment bits {a,b,c,d,e,f,g,dp}
  - provenance: AUTO_DERIVED
  - basis: LAB1/10_7seg_decoder/src/seg_decoder.v and TB expected calculation

##### Case 4

- selection_source: AUTO_SUGGESTED
  - provenance: AUTO_DERIVED
  - basis: Automatically selected from design/TB in v1; user approval and course-required status are not established
- input: vector n=15; bcd=0b1111 (0xf)
  - provenance: AUTO_DERIVED
  - basis: LAB1/10_7seg_decoder/sim/tb_seg_decoder.sv input enumeration; suggested representative vector
- expected output: seg_data=0b10001110 (0x8e)
  - provenance: AUTO_DERIVED
  - basis: LAB1/10_7seg_decoder/src/seg_decoder.v and TB expected calculation
- calculation/reason: RTL case table and TB digits table; segment bits {a,b,c,d,e,f,g,dp}
  - provenance: AUTO_DERIVED
  - basis: LAB1/10_7seg_decoder/src/seg_decoder.v and TB expected calculation

#### E. Normal simulation evidence

- run ID: run-68a357e7a424458aa3262d0ea99829bd
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/10_7seg_decoder/normal__run-68a357e7a424458aa3262d0ea99829bd/simulation.log; VCD for numeric/time checks
- simulation.log path: evidence/vscode/LAB1/10_7seg_decoder/normal__run-68a357e7a424458aa3262d0ea99829bd/simulation.log
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/10_7seg_decoder/normal__run-68a357e7a424458aa3262d0ea99829bd/simulation.log; VCD for numeric/time checks
- compile.log path: evidence/vscode/LAB1/10_7seg_decoder/normal__run-68a357e7a424458aa3262d0ea99829bd/compile.log
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/10_7seg_decoder/normal__run-68a357e7a424458aa3262d0ea99829bd/simulation.log; VCD for numeric/time checks
- wave.vcd path: evidence/vscode/LAB1/10_7seg_decoder/normal__run-68a357e7a424458aa3262d0ea99829bd/wave.vcd
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/10_7seg_decoder/normal__run-68a357e7a424458aa3262d0ea99829bd/simulation.log; VCD for numeric/time checks
- PASS/FAIL: PASS
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/10_7seg_decoder/normal__run-68a357e7a424458aa3262d0ea99829bd/simulation.log; VCD for numeric/time checks
- cases: 16
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/10_7seg_decoder/normal__run-68a357e7a424458aa3262d0ea99829bd/simulation.log; VCD for numeric/time checks
- simulation end time: 160 ns (log and final VCD timestamp agree)
  - provenance: AUTO_DERIVED
  - basis: evidence/vscode/LAB1/10_7seg_decoder/normal__run-68a357e7a424458aa3262d0ea99829bd/simulation.log; VCD for numeric/time checks
- source commit: UNKNOWN
  - provenance: UNKNOWN
  - basis: Direct run-to-commit record unavailable
- evidence_integrity: VERIFIED_COPY
  - provenance: TOOL_VERIFIED
  - basis: v1 same-run copy verification; current evidence hash matches v1 hash audit

#### F. Intentional failure

- run ID: run-aa683425c13e4c53be1af160ed5187f3
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/10_7seg_decoder/intentional_failure__run-aa683425c13e4c53be1af160ed5187f3/simulation.log and VCD
- RTL modification: Pattern for bcd=0: 0xfc -> 0x60
  - provenance: TOOL_VERIFIED
  - basis: Git historical RTL change (not a run-specific source attribution)
- predicted failing condition: n=0 gives bcd=0: expected 0xfc, modified pattern 0x60 (the digit-1 pattern)
  - provenance: AUTO_DERIVED
  - basis: Historical Git diff and current TB; post-hoc calculation, not a recorded pre-run prediction
- actual first failing vector: 0
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/10_7seg_decoder/intentional_failure__run-aa683425c13e4c53be1af160ed5187f3/simulation.log and VCD
- expected: 0xfc
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/10_7seg_decoder/intentional_failure__run-aa683425c13e4c53be1af160ed5187f3/simulation.log and VCD
- actual: 0x60
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/10_7seg_decoder/intentional_failure__run-aa683425c13e4c53be1af160ed5187f3/simulation.log and VCD
- failure time: 10 ns (log interpreted using VCD timescale)
  - provenance: AUTO_DERIVED
  - basis: evidence/vscode/LAB1/10_7seg_decoder/intentional_failure__run-aa683425c13e4c53be1af160ed5187f3/simulation.log and VCD
- simulation.log path: evidence/vscode/LAB1/10_7seg_decoder/intentional_failure__run-aa683425c13e4c53be1af160ed5187f3/simulation.log
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/10_7seg_decoder/intentional_failure__run-aa683425c13e4c53be1af160ed5187f3/simulation.log and VCD
- wave.vcd path: evidence/vscode/LAB1/10_7seg_decoder/intentional_failure__run-aa683425c13e4c53be1af160ed5187f3/wave.vcd
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/10_7seg_decoder/intentional_failure__run-aa683425c13e4c53be1af160ed5187f3/simulation.log and VCD
- source commit: UNKNOWN
  - provenance: UNKNOWN
  - basis: Direct run-to-commit record unavailable

#### G. Recovery

- run ID: run-27f60921a06746d883783c9f379e8c76
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/10_7seg_decoder/recovery__run-27f60921a06746d883783c9f379e8c76/simulation.log and VCD
- restored behavior: bcd=0 pattern 0xfc restored
  - provenance: AUTO_DERIVED
  - basis: Git restoration history plus user-designated recovery evidence; direct commit linkage unavailable
- PASS/FAIL: PASS
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/10_7seg_decoder/recovery__run-27f60921a06746d883783c9f379e8c76/simulation.log and VCD
- cases: 16
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/10_7seg_decoder/recovery__run-27f60921a06746d883783c9f379e8c76/simulation.log and VCD
- simulation end time: 160 ns (log and final VCD timestamp agree)
  - provenance: AUTO_DERIVED
  - basis: evidence/vscode/LAB1/10_7seg_decoder/recovery__run-27f60921a06746d883783c9f379e8c76/simulation.log and VCD
- simulation.log path: evidence/vscode/LAB1/10_7seg_decoder/recovery__run-27f60921a06746d883783c9f379e8c76/simulation.log
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/10_7seg_decoder/recovery__run-27f60921a06746d883783c9f379e8c76/simulation.log and VCD
- wave.vcd path: evidence/vscode/LAB1/10_7seg_decoder/recovery__run-27f60921a06746d883783c9f379e8c76/wave.vcd
  - provenance: TOOL_VERIFIED
  - basis: evidence/vscode/LAB1/10_7seg_decoder/recovery__run-27f60921a06746d883783c9f379e8c76/simulation.log and VCD
- source commit: UNKNOWN
  - provenance: UNKNOWN
  - basis: Direct run-to-commit record unavailable

#### H. Waveform verification

- VCD_PRESENT: YES
  - provenance: TOOL_VERIFIED
  - basis: All three preserved run VCD files exist and were parsed
- VCD_RUN_TRACEABLE: YES
  - provenance: TOOL_VERIFIED
  - basis: Evidence folder run IDs, logs and VCDs; current hashes match v1 same-run copy audit; this is not source commit traceability
- VCD_NUMERIC_CHECK: VERIFIED
  - provenance: TOOL_VERIFIED
  - basis: Actual parsing of all three VCDs: representative normal/recovery inputs and outputs at both interval endpoints; failure TB expected and packed DUT output before fatal time; log/VCD end time agreement. Limited sampled numeric check, not full waveform/visual verification.
- USER_VISUAL_CHECK: NOT_VERIFIED
  - provenance: UNKNOWN
  - basis: No explicit user visual-inspection approval is recorded in the supplied evidence
- SCREENSHOT_PRESENT: NOT_AVAILABLE
  - provenance: TOOL_VERIFIED
  - basis: Evidence contains logs/VCD only; no user-confirmed screenshot file found
- representative_intervals: Candidate intervals only; values checked numerically. Selection and intervals remain derived suggestions.
  - provenance: AUTO_DERIVED
  - basis: TB vector index and 10 ns case interval; actual VCD samples
  - normal and recovery: [1, 9] ns, vector n=0; bcd=0b0000 (0x0) -> seg_data=0b11111100 (0xfc)
    - provenance: AUTO_DERIVED
    - basis: Suggested vector interval; corresponding VCD values parsed
  - normal and recovery: [11, 19] ns, vector n=1; bcd=0b0001 (0x1) -> seg_data=0b01100000 (0x60)
    - provenance: AUTO_DERIVED
    - basis: Suggested vector interval; corresponding VCD values parsed
  - normal and recovery: [101, 109] ns, vector n=10; bcd=0b1010 (0xa) -> seg_data=0b11101110 (0xee)
    - provenance: AUTO_DERIVED
    - basis: Suggested vector interval; corresponding VCD values parsed
  - normal and recovery: [151, 159] ns, vector n=15; bcd=0b1111 (0xf) -> seg_data=0b10001110 (0x8e)
    - provenance: AUTO_DERIVED
    - basis: Suggested vector interval; corresponding VCD values parsed
  - intentional_failure: [1, 9] ns, vector n=0; expected 0xfc, actual 0x60; ends before fatal termination
    - provenance: AUTO_DERIVED
    - basis: Suggested vector interval; corresponding VCD values parsed
- VCD timescale: normal/failure/recovery: 1ns
  - provenance: TOOL_VERIFIED
  - basis: Preserved VCD $timescale declarations

#### I. Board plan

- board_status: NOT_PERFORMED
  - provenance: USER_REPORTED
  - basis: User instruction: keep board result NOT_PERFORMED
- XDC pin mapping: bcd[3]->Y1; bcd[2]->W3; bcd[1]->U2; bcd[0]->T1; seg_data[7]->P1; seg_data[6]->P3; seg_data[5]->P7; seg_data[4]->N3; seg_data[3]->T5; seg_data[2]->R2; seg_data[1]->R4; seg_data[0]->R6; all ports LVCMOS33
  - provenance: TOOL_VERIFIED
  - basis: LAB1/10_7seg_decoder/constraints/seg_decoder.xdc
- planned user inputs: Apply the representative input vectors in section D via the physical controls associated with the XDC input package pins, after verifying the board mapping and polarity.
  - provenance: AUTO_DERIVED
  - basis: Proposed plan from RTL expected behavior and XDC; not a physical observation
- expected physical outputs: Design-level expected logic at output package pins follows section D. Actual LED/segment illumination is not inferred from package pins alone.
  - provenance: AUTO_DERIVED
  - basis: Proposed plan from RTL expected behavior and XDC; not a physical observation
- verification method: Confirm board model, control-to-pin mapping, output polarity and segment/digit wiring; then apply planned vectors and record actual observations/photos/measurements against section D. This is a plan only.
  - provenance: AUTO_DERIVED
  - basis: Proposed plan from RTL expected behavior and XDC; not a physical observation
- board model: UNKNOWN
  - provenance: UNKNOWN
  - basis: Board model/wiring/polarity evidence unavailable
- physical control/output mapping and polarity: UNKNOWN
  - provenance: UNKNOWN
  - basis: Board model/wiring/polarity evidence unavailable

#### J. Pre-report readiness

- design_information: READY
  - provenance: AUTO_DERIVED
  - basis: Draft-data readiness assessment; outstanding confirmations in section 4. READY does not certify student review or full verification
- expected_behavior: READY
  - provenance: AUTO_DERIVED
  - basis: Draft-data readiness assessment; outstanding confirmations in section 4. READY does not certify student review or full verification
- normal_simulation: READY
  - provenance: AUTO_DERIVED
  - basis: Draft-data readiness assessment; outstanding confirmations in section 4. READY does not certify student review or full verification
- intentional_failure: READY
  - provenance: AUTO_DERIVED
  - basis: Draft-data readiness assessment; outstanding confirmations in section 4. READY does not certify student review or full verification
- recovery: READY
  - provenance: AUTO_DERIVED
  - basis: Draft-data readiness assessment; outstanding confirmations in section 4. READY does not certify student review or full verification
- waveform_visual_evidence: MISSING
  - provenance: AUTO_DERIVED
  - basis: Draft-data readiness assessment; outstanding confirmations in section 4. READY does not certify student review or full verification
- board_plan: NEEDS_USER_CONFIRMATION
  - provenance: AUTO_DERIVED
  - basis: Draft-data readiness assessment; outstanding confirmations in section 4. READY does not certify student review or full verification
- experiment_readiness: NEEDS_USER_CONFIRMATION
  - provenance: AUTO_DERIVED
  - basis: Draft-data readiness assessment; outstanding confirmations in section 4. READY does not certify student review or full verification

#### K. QA notes

- note_id: compile_warning
  - note: All three preserved compile logs warn that design elements lack explicit time unit/time precision. Preserve this warning; no source was changed.
  - provenance: TOOL_VERIFIED
  - basis: normal/intentional_failure/recovery compile.log
- note_id: run_commit_gap
  - note: All three source commit fields remain UNKNOWN. Git change/restoration commits document source history, not direct run identity.
  - provenance: UNKNOWN
  - basis: No direct run-to-commit record in the supplied evidence
- note_id: role_provenance
  - note: Normal/failure/recovery folder roles follow the user-specified run selection. Role names are not independent proof of run source identity.
  - provenance: USER_REPORTED
  - basis: User-specified preservation run IDs and roles
- note_id: prediction_record
  - note: The predicted failing condition is a post-hoc AUTO_DERIVED calculation. A contemporaneous pre-run prediction record is not available.
  - provenance: UNKNOWN
  - basis: No pre-run prediction record in the supplied evidence
- note_id: readiness_scope
  - note: Draft factual inputs are available. Visual evidence, representative selection, student review, physical plan assumptions and source commit provenance remain unresolved.
  - provenance: AUTO_DERIVED
  - basis: Sections D/H/I/J and section 4
- note_id: technical_1
  - note: bcd is a signal name; the actual code covers hexadecimal A..F. RTL states active-high segment bits, but actual board/display polarity and digit enable remain unconfirmed.
  - provenance: TOOL_VERIFIED
  - basis: Preserved logs or current RTL; board caveats reflect missing physical evidence
- historical_modification_evidence: Git change commit 7e88c77, file LAB1/10_7seg_decoder/src/seg_decoder.v; preserved FAIL log and VCD TB expected / packed DUT values agree. The run-specific historical RTL snapshot is not preserved here, so the exact run source identity is unconfirmed.
  - provenance: TOOL_VERIFIED
  - basis: Historical Git diff and preserved FAIL log/VCD; the quoted source-identity limitation remains in force
- historical_restoration_evidence: bcd=0 pattern 0xfc restored; Git restoration commit f8d10c0; recovery role follows user selection
  - provenance: TOOL_VERIFIED
  - basis: Git restoration history and user-selected role; not direct commit-to-run proof
- copy_integrity_audit: Prior v1 recorded original/copy equality. Current evidence SHA-256 was recomputed and matches every v1 stored hash; originals were not reread during v2 generation.
  - provenance: TOOL_VERIFIED
  - basis: Unchanged v1 audit plus current preserved evidence SHA-256

##### Evidence SHA-256 audit

| Role | File | SHA-256 | Prior original-copy match | Current evidence matches v1 hash | Provenance |
|---|---|---|---|---|---|
| normal | simulation.log | 6dc3d8ad7512a9024b8d905c48d5b86e400f745880113489937f5eaf8a57d01e | YES | YES | TOOL_VERIFIED |
| normal | compile.log | cec11eeafb24c9387d24011f944a11f4a307847b1b8fa5d6a8602c5badf41261 | YES | YES | TOOL_VERIFIED |
| normal | wave.vcd | 1307bd86d7719b8e35ac79383a4a8716c528171086c6f7ca13374cc7be26c5aa | YES | YES | TOOL_VERIFIED |
| intentional_failure | simulation.log | db96c0ddf76e3fac3a0ca8a8e3df5d48ebc7b3d751fbbeee6abf28c78229f735 | YES | YES | TOOL_VERIFIED |
| intentional_failure | compile.log | cec11eeafb24c9387d24011f944a11f4a307847b1b8fa5d6a8602c5badf41261 | YES | YES | TOOL_VERIFIED |
| intentional_failure | wave.vcd | ecd7573ec6243889911fcb0aaabac7b622bf87fe1bbf172f907aaac91eb23563 | YES | YES | TOOL_VERIFIED |
| recovery | simulation.log | 6dc3d8ad7512a9024b8d905c48d5b86e400f745880113489937f5eaf8a57d01e | YES | YES | TOOL_VERIFIED |
| recovery | compile.log | cec11eeafb24c9387d24011f944a11f4a307847b1b8fa5d6a8602c5badf41261 | YES | YES | TOOL_VERIFIED |
| recovery | wave.vcd | 27ff0c7771fcd315f1416a71b3c4079ed9f6f733db245870be2edf514cd0d0d4 | YES | YES | TOOL_VERIFIED |

## 3. LAB1 Summary

| Experiment | Normal | Failure detected | Recovery | Waveform visual check | Board | Result provenance | Board provenance |
|---|---|---|---|---|---|---|---|
| 01_logic_gates | PASS | YES | PASS | NOT_VERIFIED | NOT_PERFORMED | TOOL_VERIFIED (logs); visual confirmation UNKNOWN | USER_REPORTED |
| 02_full_adder | PASS | YES | PASS | NOT_VERIFIED | NOT_PERFORMED | TOOL_VERIFIED (logs); visual confirmation UNKNOWN | USER_REPORTED |
| 03_4bit_adder | PASS | YES | PASS | NOT_VERIFIED | NOT_PERFORMED | TOOL_VERIFIED (logs); visual confirmation UNKNOWN | USER_REPORTED |
| 04_4bit_subtractor | PASS | YES | PASS | NOT_VERIFIED | NOT_PERFORMED | TOOL_VERIFIED (logs); visual confirmation UNKNOWN | USER_REPORTED |
| 05_4bit_comparator | PASS | YES | PASS | NOT_VERIFIED | NOT_PERFORMED | TOOL_VERIFIED (logs); visual confirmation UNKNOWN | USER_REPORTED |
| 06_mux | PASS | YES | PASS | NOT_VERIFIED | NOT_PERFORMED | TOOL_VERIFIED (logs); visual confirmation UNKNOWN | USER_REPORTED |
| 07_demux | PASS | YES | PASS | NOT_VERIFIED | NOT_PERFORMED | TOOL_VERIFIED (logs); visual confirmation UNKNOWN | USER_REPORTED |
| 08_encoder | PASS | YES | PASS | NOT_VERIFIED | NOT_PERFORMED | TOOL_VERIFIED (logs); visual confirmation UNKNOWN | USER_REPORTED |
| 09_decoder | PASS | YES | PASS | NOT_VERIFIED | NOT_PERFORMED | TOOL_VERIFIED (logs); visual confirmation UNKNOWN | USER_REPORTED |
| 10_7seg_decoder | PASS | YES | PASS | NOT_VERIFIED | NOT_PERFORMED | TOOL_VERIFIED (logs); visual confirmation UNKNOWN | USER_REPORTED |

## 4. User Confirmation Queue


### Waveform

- experiment: 01_logic_gates
  - item: User visual check and screenshot approval
  - current status: NOT_VERIFIED
  - what user must confirm: Confirm actual VaporView inspection of the required stable intervals and identify/approve the screenshots and their run IDs.
  - provenance: UNKNOWN
  - basis: No explicit confirmation for this queue item in the supplied material
- experiment: 02_full_adder
  - item: User visual check and screenshot approval
  - current status: NOT_VERIFIED
  - what user must confirm: Confirm actual VaporView inspection of the required stable intervals and identify/approve the screenshots and their run IDs.
  - provenance: UNKNOWN
  - basis: No explicit confirmation for this queue item in the supplied material
- experiment: 03_4bit_adder
  - item: User visual check and screenshot approval
  - current status: NOT_VERIFIED
  - what user must confirm: Confirm actual VaporView inspection of the required stable intervals and identify/approve the screenshots and their run IDs.
  - provenance: UNKNOWN
  - basis: No explicit confirmation for this queue item in the supplied material
- experiment: 04_4bit_subtractor
  - item: User visual check and screenshot approval
  - current status: NOT_VERIFIED
  - what user must confirm: Confirm actual VaporView inspection of the required stable intervals and identify/approve the screenshots and their run IDs.
  - provenance: UNKNOWN
  - basis: No explicit confirmation for this queue item in the supplied material
- experiment: 05_4bit_comparator
  - item: User visual check and screenshot approval
  - current status: NOT_VERIFIED
  - what user must confirm: Confirm actual VaporView inspection of the required stable intervals and identify/approve the screenshots and their run IDs.
  - provenance: UNKNOWN
  - basis: No explicit confirmation for this queue item in the supplied material
- experiment: 06_mux
  - item: User visual check and screenshot approval
  - current status: NOT_VERIFIED
  - what user must confirm: Confirm actual VaporView inspection of the required stable intervals and identify/approve the screenshots and their run IDs.
  - provenance: UNKNOWN
  - basis: No explicit confirmation for this queue item in the supplied material
- experiment: 07_demux
  - item: User visual check and screenshot approval
  - current status: NOT_VERIFIED
  - what user must confirm: Confirm actual VaporView inspection of the required stable intervals and identify/approve the screenshots and their run IDs.
  - provenance: UNKNOWN
  - basis: No explicit confirmation for this queue item in the supplied material
- experiment: 08_encoder
  - item: User visual check and screenshot approval
  - current status: NOT_VERIFIED
  - what user must confirm: Confirm actual VaporView inspection of the required stable intervals and identify/approve the screenshots and their run IDs.
  - provenance: UNKNOWN
  - basis: No explicit confirmation for this queue item in the supplied material
- experiment: 09_decoder
  - item: User visual check and screenshot approval
  - current status: NOT_VERIFIED
  - what user must confirm: Confirm actual VaporView inspection of the required stable intervals and identify/approve the screenshots and their run IDs.
  - provenance: UNKNOWN
  - basis: No explicit confirmation for this queue item in the supplied material
- experiment: 10_7seg_decoder
  - item: User visual check and screenshot approval
  - current status: NOT_VERIFIED
  - what user must confirm: Confirm actual VaporView inspection of the required stable intervals and identify/approve the screenshots and their run IDs.
  - provenance: UNKNOWN
  - basis: No explicit confirmation for this queue item in the supplied material

### Representative case selection

- experiment: 01_logic_gates
  - item: Four AUTO_SUGGESTED cases in section D
  - current status: NEEDS_USER_CONFIRMATION
  - what user must confirm: Approve, replace or identify course/report-required representative cases. Course PDF and user report content remain UNKNOWN.
  - provenance: UNKNOWN
  - basis: No explicit confirmation for this queue item in the supplied material
- experiment: 02_full_adder
  - item: Four AUTO_SUGGESTED cases in section D
  - current status: NEEDS_USER_CONFIRMATION
  - what user must confirm: Approve, replace or identify course/report-required representative cases. Course PDF and user report content remain UNKNOWN.
  - provenance: UNKNOWN
  - basis: No explicit confirmation for this queue item in the supplied material
- experiment: 03_4bit_adder
  - item: Four AUTO_SUGGESTED cases in section D
  - current status: NEEDS_USER_CONFIRMATION
  - what user must confirm: Approve, replace or identify course/report-required representative cases. Course PDF and user report content remain UNKNOWN.
  - provenance: UNKNOWN
  - basis: No explicit confirmation for this queue item in the supplied material
- experiment: 04_4bit_subtractor
  - item: Four AUTO_SUGGESTED cases in section D
  - current status: NEEDS_USER_CONFIRMATION
  - what user must confirm: Approve, replace or identify course/report-required representative cases. Course PDF and user report content remain UNKNOWN.
  - provenance: UNKNOWN
  - basis: No explicit confirmation for this queue item in the supplied material
- experiment: 05_4bit_comparator
  - item: Four AUTO_SUGGESTED cases in section D
  - current status: NEEDS_USER_CONFIRMATION
  - what user must confirm: Approve, replace or identify course/report-required representative cases. Course PDF and user report content remain UNKNOWN.
  - provenance: UNKNOWN
  - basis: No explicit confirmation for this queue item in the supplied material
- experiment: 06_mux
  - item: Four AUTO_SUGGESTED cases in section D
  - current status: NEEDS_USER_CONFIRMATION
  - what user must confirm: Approve, replace or identify course/report-required representative cases. Course PDF and user report content remain UNKNOWN.
  - provenance: UNKNOWN
  - basis: No explicit confirmation for this queue item in the supplied material
- experiment: 07_demux
  - item: Four AUTO_SUGGESTED cases in section D
  - current status: NEEDS_USER_CONFIRMATION
  - what user must confirm: Approve, replace or identify course/report-required representative cases. Course PDF and user report content remain UNKNOWN.
  - provenance: UNKNOWN
  - basis: No explicit confirmation for this queue item in the supplied material
- experiment: 08_encoder
  - item: Four AUTO_SUGGESTED cases in section D
  - current status: NEEDS_USER_CONFIRMATION
  - what user must confirm: Approve, replace or identify course/report-required representative cases. Course PDF and user report content remain UNKNOWN.
  - provenance: UNKNOWN
  - basis: No explicit confirmation for this queue item in the supplied material
- experiment: 09_decoder
  - item: Four AUTO_SUGGESTED cases in section D
  - current status: NEEDS_USER_CONFIRMATION
  - what user must confirm: Approve, replace or identify course/report-required representative cases. Course PDF and user report content remain UNKNOWN.
  - provenance: UNKNOWN
  - basis: No explicit confirmation for this queue item in the supplied material
- experiment: 10_7seg_decoder
  - item: Four AUTO_SUGGESTED cases in section D
  - current status: NEEDS_USER_CONFIRMATION
  - what user must confirm: Approve, replace or identify course/report-required representative cases. Course PDF and user report content remain UNKNOWN.
  - provenance: UNKNOWN
  - basis: No explicit confirmation for this queue item in the supplied material

### Environment

- experiment: 01_logic_gates
  - item: Execution OS/Python and per-run applicability of environment logs
  - current status: UNKNOWN
  - what user must confirm: Provide the recorded execution OS/Python version and confirm whether the environment logs apply to this experiment's preserved runs; do not substitute the current generation runtime.
  - provenance: UNKNOWN
  - basis: No explicit confirmation for this queue item in the supplied material
- experiment: 02_full_adder
  - item: Execution OS/Python and per-run applicability of environment logs
  - current status: UNKNOWN
  - what user must confirm: Provide the recorded execution OS/Python version and confirm whether the environment logs apply to this experiment's preserved runs; do not substitute the current generation runtime.
  - provenance: UNKNOWN
  - basis: No explicit confirmation for this queue item in the supplied material
- experiment: 03_4bit_adder
  - item: Execution OS/Python and per-run applicability of environment logs
  - current status: UNKNOWN
  - what user must confirm: Provide the recorded execution OS/Python version and confirm whether the environment logs apply to this experiment's preserved runs; do not substitute the current generation runtime.
  - provenance: UNKNOWN
  - basis: No explicit confirmation for this queue item in the supplied material
- experiment: 04_4bit_subtractor
  - item: Execution OS/Python and per-run applicability of environment logs
  - current status: UNKNOWN
  - what user must confirm: Provide the recorded execution OS/Python version and confirm whether the environment logs apply to this experiment's preserved runs; do not substitute the current generation runtime.
  - provenance: UNKNOWN
  - basis: No explicit confirmation for this queue item in the supplied material
- experiment: 05_4bit_comparator
  - item: Execution OS/Python and per-run applicability of environment logs
  - current status: UNKNOWN
  - what user must confirm: Provide the recorded execution OS/Python version and confirm whether the environment logs apply to this experiment's preserved runs; do not substitute the current generation runtime.
  - provenance: UNKNOWN
  - basis: No explicit confirmation for this queue item in the supplied material
- experiment: 06_mux
  - item: Execution OS/Python and per-run applicability of environment logs
  - current status: UNKNOWN
  - what user must confirm: Provide the recorded execution OS/Python version and confirm whether the environment logs apply to this experiment's preserved runs; do not substitute the current generation runtime.
  - provenance: UNKNOWN
  - basis: No explicit confirmation for this queue item in the supplied material
- experiment: 07_demux
  - item: Execution OS/Python and per-run applicability of environment logs
  - current status: UNKNOWN
  - what user must confirm: Provide the recorded execution OS/Python version and confirm whether the environment logs apply to this experiment's preserved runs; do not substitute the current generation runtime.
  - provenance: UNKNOWN
  - basis: No explicit confirmation for this queue item in the supplied material
- experiment: 08_encoder
  - item: Execution OS/Python and per-run applicability of environment logs
  - current status: UNKNOWN
  - what user must confirm: Provide the recorded execution OS/Python version and confirm whether the environment logs apply to this experiment's preserved runs; do not substitute the current generation runtime.
  - provenance: UNKNOWN
  - basis: No explicit confirmation for this queue item in the supplied material
- experiment: 09_decoder
  - item: Execution OS/Python and per-run applicability of environment logs
  - current status: UNKNOWN
  - what user must confirm: Provide the recorded execution OS/Python version and confirm whether the environment logs apply to this experiment's preserved runs; do not substitute the current generation runtime.
  - provenance: UNKNOWN
  - basis: No explicit confirmation for this queue item in the supplied material
- experiment: 10_7seg_decoder
  - item: Execution OS/Python and per-run applicability of environment logs
  - current status: UNKNOWN
  - what user must confirm: Provide the recorded execution OS/Python version and confirm whether the environment logs apply to this experiment's preserved runs; do not substitute the current generation runtime.
  - provenance: UNKNOWN
  - basis: No explicit confirmation for this queue item in the supplied material

### Board plan

- experiment: 01_logic_gates
  - item: Physical mapping/polarity and planned inputs/outputs
  - current status: NEEDS_USER_CONFIRMATION
  - what user must confirm: Confirm board model, controls-to-XDC pins, output polarity and segment/digit wiring where relevant. Board results remain NOT_PERFORMED; later observations must be separately recorded.
  - provenance: UNKNOWN
  - basis: No explicit confirmation for this queue item in the supplied material
- experiment: 02_full_adder
  - item: Physical mapping/polarity and planned inputs/outputs
  - current status: NEEDS_USER_CONFIRMATION
  - what user must confirm: Confirm board model, controls-to-XDC pins, output polarity and segment/digit wiring where relevant. Board results remain NOT_PERFORMED; later observations must be separately recorded.
  - provenance: UNKNOWN
  - basis: No explicit confirmation for this queue item in the supplied material
- experiment: 03_4bit_adder
  - item: Physical mapping/polarity and planned inputs/outputs
  - current status: NEEDS_USER_CONFIRMATION
  - what user must confirm: Confirm board model, controls-to-XDC pins, output polarity and segment/digit wiring where relevant. Board results remain NOT_PERFORMED; later observations must be separately recorded.
  - provenance: UNKNOWN
  - basis: No explicit confirmation for this queue item in the supplied material
- experiment: 04_4bit_subtractor
  - item: Physical mapping/polarity and planned inputs/outputs
  - current status: NEEDS_USER_CONFIRMATION
  - what user must confirm: Confirm board model, controls-to-XDC pins, output polarity and segment/digit wiring where relevant. Board results remain NOT_PERFORMED; later observations must be separately recorded.
  - provenance: UNKNOWN
  - basis: No explicit confirmation for this queue item in the supplied material
- experiment: 05_4bit_comparator
  - item: Physical mapping/polarity and planned inputs/outputs
  - current status: NEEDS_USER_CONFIRMATION
  - what user must confirm: Confirm board model, controls-to-XDC pins, output polarity and segment/digit wiring where relevant. Board results remain NOT_PERFORMED; later observations must be separately recorded.
  - provenance: UNKNOWN
  - basis: No explicit confirmation for this queue item in the supplied material
- experiment: 06_mux
  - item: Physical mapping/polarity and planned inputs/outputs
  - current status: NEEDS_USER_CONFIRMATION
  - what user must confirm: Confirm board model, controls-to-XDC pins, output polarity and segment/digit wiring where relevant. Board results remain NOT_PERFORMED; later observations must be separately recorded.
  - provenance: UNKNOWN
  - basis: No explicit confirmation for this queue item in the supplied material
- experiment: 07_demux
  - item: Physical mapping/polarity and planned inputs/outputs
  - current status: NEEDS_USER_CONFIRMATION
  - what user must confirm: Confirm board model, controls-to-XDC pins, output polarity and segment/digit wiring where relevant. Board results remain NOT_PERFORMED; later observations must be separately recorded.
  - provenance: UNKNOWN
  - basis: No explicit confirmation for this queue item in the supplied material
- experiment: 08_encoder
  - item: Physical mapping/polarity and planned inputs/outputs
  - current status: NEEDS_USER_CONFIRMATION
  - what user must confirm: Confirm board model, controls-to-XDC pins, output polarity and segment/digit wiring where relevant. Board results remain NOT_PERFORMED; later observations must be separately recorded.
  - provenance: UNKNOWN
  - basis: No explicit confirmation for this queue item in the supplied material
- experiment: 09_decoder
  - item: Physical mapping/polarity and planned inputs/outputs
  - current status: NEEDS_USER_CONFIRMATION
  - what user must confirm: Confirm board model, controls-to-XDC pins, output polarity and segment/digit wiring where relevant. Board results remain NOT_PERFORMED; later observations must be separately recorded.
  - provenance: UNKNOWN
  - basis: No explicit confirmation for this queue item in the supplied material
- experiment: 10_7seg_decoder
  - item: Physical mapping/polarity and planned inputs/outputs
  - current status: NEEDS_USER_CONFIRMATION
  - what user must confirm: Confirm board model, controls-to-XDC pins, output polarity and segment/digit wiring where relevant. Board results remain NOT_PERFORMED; later observations must be separately recorded.
  - provenance: UNKNOWN
  - basis: No explicit confirmation for this queue item in the supplied material

### Run-to-commit provenance

- experiment: 01_logic_gates
  - item: Source commit for normal/failure/recovery runs
  - current status: UNKNOWN
  - what user must confirm: Provide direct records linking each preserved run to its executed source revision or source hashes; change commit names alone are insufficient.
  - provenance: UNKNOWN
  - basis: No explicit confirmation for this queue item in the supplied material
- experiment: 02_full_adder
  - item: Source commit for normal/failure/recovery runs
  - current status: UNKNOWN
  - what user must confirm: Provide direct records linking each preserved run to its executed source revision or source hashes; change commit names alone are insufficient.
  - provenance: UNKNOWN
  - basis: No explicit confirmation for this queue item in the supplied material
- experiment: 03_4bit_adder
  - item: Source commit for normal/failure/recovery runs
  - current status: UNKNOWN
  - what user must confirm: Provide direct records linking each preserved run to its executed source revision or source hashes; change commit names alone are insufficient.
  - provenance: UNKNOWN
  - basis: No explicit confirmation for this queue item in the supplied material
- experiment: 04_4bit_subtractor
  - item: Source commit for normal/failure/recovery runs
  - current status: UNKNOWN
  - what user must confirm: Provide direct records linking each preserved run to its executed source revision or source hashes; change commit names alone are insufficient.
  - provenance: UNKNOWN
  - basis: No explicit confirmation for this queue item in the supplied material
- experiment: 05_4bit_comparator
  - item: Source commit for normal/failure/recovery runs
  - current status: UNKNOWN
  - what user must confirm: Provide direct records linking each preserved run to its executed source revision or source hashes; change commit names alone are insufficient.
  - provenance: UNKNOWN
  - basis: No explicit confirmation for this queue item in the supplied material
- experiment: 06_mux
  - item: Source commit for normal/failure/recovery runs
  - current status: UNKNOWN
  - what user must confirm: Provide direct records linking each preserved run to its executed source revision or source hashes; change commit names alone are insufficient.
  - provenance: UNKNOWN
  - basis: No explicit confirmation for this queue item in the supplied material
- experiment: 07_demux
  - item: Source commit for normal/failure/recovery runs
  - current status: UNKNOWN
  - what user must confirm: Provide direct records linking each preserved run to its executed source revision or source hashes; change commit names alone are insufficient.
  - provenance: UNKNOWN
  - basis: No explicit confirmation for this queue item in the supplied material
- experiment: 08_encoder
  - item: Source commit for normal/failure/recovery runs
  - current status: UNKNOWN
  - what user must confirm: Provide direct records linking each preserved run to its executed source revision or source hashes; change commit names alone are insufficient.
  - provenance: UNKNOWN
  - basis: No explicit confirmation for this queue item in the supplied material
- experiment: 09_decoder
  - item: Source commit for normal/failure/recovery runs
  - current status: UNKNOWN
  - what user must confirm: Provide direct records linking each preserved run to its executed source revision or source hashes; change commit names alone are insufficient.
  - provenance: UNKNOWN
  - basis: No explicit confirmation for this queue item in the supplied material
- experiment: 10_7seg_decoder
  - item: Source commit for normal/failure/recovery runs
  - current status: UNKNOWN
  - what user must confirm: Provide direct records linking each preserved run to its executed source revision or source hashes; change commit names alone are insufficient.
  - provenance: UNKNOWN
  - basis: No explicit confirmation for this queue item in the supplied material

### Student review

- experiment: 01_logic_gates
  - item: Understanding/review of RTL/TB/XDC
  - current status: NOT_VERIFIED
  - what user must confirm: Confirm circuit structure, behavior, TB checking logic, bit ordering and pin constraints have been understood and reviewed before promoting source state.
  - provenance: UNKNOWN
  - basis: No explicit confirmation for this queue item in the supplied material
- experiment: 02_full_adder
  - item: Understanding/review of RTL/TB/XDC
  - current status: NOT_VERIFIED
  - what user must confirm: Confirm circuit structure, behavior, TB checking logic, bit ordering and pin constraints have been understood and reviewed before promoting source state.
  - provenance: UNKNOWN
  - basis: No explicit confirmation for this queue item in the supplied material
- experiment: 03_4bit_adder
  - item: Understanding/review of RTL/TB/XDC
  - current status: NOT_VERIFIED
  - what user must confirm: Confirm circuit structure, behavior, TB checking logic, bit ordering and pin constraints have been understood and reviewed before promoting source state.
  - provenance: UNKNOWN
  - basis: No explicit confirmation for this queue item in the supplied material
- experiment: 04_4bit_subtractor
  - item: Understanding/review of RTL/TB/XDC
  - current status: NOT_VERIFIED
  - what user must confirm: Confirm circuit structure, behavior, TB checking logic, bit ordering and pin constraints have been understood and reviewed before promoting source state.
  - provenance: UNKNOWN
  - basis: No explicit confirmation for this queue item in the supplied material
- experiment: 05_4bit_comparator
  - item: Understanding/review of RTL/TB/XDC
  - current status: NOT_VERIFIED
  - what user must confirm: Confirm circuit structure, behavior, TB checking logic, bit ordering and pin constraints have been understood and reviewed before promoting source state.
  - provenance: UNKNOWN
  - basis: No explicit confirmation for this queue item in the supplied material
- experiment: 06_mux
  - item: Understanding/review of RTL/TB/XDC
  - current status: NOT_VERIFIED
  - what user must confirm: Confirm circuit structure, behavior, TB checking logic, bit ordering and pin constraints have been understood and reviewed before promoting source state.
  - provenance: UNKNOWN
  - basis: No explicit confirmation for this queue item in the supplied material
- experiment: 07_demux
  - item: Understanding/review of RTL/TB/XDC
  - current status: NOT_VERIFIED
  - what user must confirm: Confirm circuit structure, behavior, TB checking logic, bit ordering and pin constraints have been understood and reviewed before promoting source state.
  - provenance: UNKNOWN
  - basis: No explicit confirmation for this queue item in the supplied material
- experiment: 08_encoder
  - item: Understanding/review of RTL/TB/XDC
  - current status: NOT_VERIFIED
  - what user must confirm: Confirm circuit structure, behavior, TB checking logic, bit ordering and pin constraints have been understood and reviewed before promoting source state.
  - provenance: UNKNOWN
  - basis: No explicit confirmation for this queue item in the supplied material
- experiment: 09_decoder
  - item: Understanding/review of RTL/TB/XDC
  - current status: NOT_VERIFIED
  - what user must confirm: Confirm circuit structure, behavior, TB checking logic, bit ordering and pin constraints have been understood and reviewed before promoting source state.
  - provenance: UNKNOWN
  - basis: No explicit confirmation for this queue item in the supplied material
- experiment: 10_7seg_decoder
  - item: Understanding/review of RTL/TB/XDC
  - current status: NOT_VERIFIED
  - what user must confirm: Confirm circuit structure, behavior, TB checking logic, bit ordering and pin constraints have been understood and reviewed before promoting source state.
  - provenance: UNKNOWN
  - basis: No explicit confirmation for this queue item in the supplied material
