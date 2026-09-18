# LAB1 Validation Summary

## 0. Team environment and provenance policy

- inspected_at: 2026-09-18
- repository_branch: main
- current_HEAD: 246d6b621ce5b7a30d8a71a98c3e03693e69c9de
- execution_context: 팀 분담 및 여러 PC에서 수행 (USER_REPORTED)
- 담당자 / 실험별 생성 PC: UNKNOWN
- source_scope: CURRENT_SOURCE; simulation/build_scope: HISTORICAL_RUN
- RUN_TO_COMMIT: UNKNOWN
- DEMO_SELECTION_STATUS: USER_CONFIRMED
- selected_demo_experiments: 06_mux, 10_7seg_decoder
- simulation/build rerun: false
- existing source/evidence/submission report modification: false
- Git staging/commit/push: false
- reference 원본 및 교수 PPT 직접 열람: UNKNOWN; 사용자 제공 원칙과 요구사항을 적용.

| Provenance status | 판정 기준 |
| --- | --- |
| LOCAL_VERIFIED | 현재 파일/log/report에서 명시한 좁은 사실을 확인; 생성 PC 및 담당자를 뜻하지 않음 |
| TEAM_PROVIDED | 팀원 전달 출처가 확인된 원본을 직접 확인 |
| TEAM_CONFIRMED | 사용자 확인으로 팀원의 해당 실험/단계 수행 사실 확정 |
| EVIDENCE_PENDING | 수행은 확정되었으나 원본 evidence 전달/직접 확인이 남음 |
| NOT_VERIFIED | 수행 여부 자체가 확인되지 않은 경우에만 사용 |
| NOT_APPLICABLE | 항목 자체가 적용되지 않음 |

03/05/07의 synthesis/implementation/DRC/timing/bitstream 수행은 사용자 확인에 따라 TEAM_CONFIRMED이다. 원본 자료의 직접 확인은 EVIDENCE_PENDING이다. TEAM_PROVIDED 확정 항목은 아직 없으며 담당 팀원 성명/PC 및 세부 수치/hash는 UNKNOWN이다. NOT_VERIFIED는 수행 여부 자체가 불명확한 단계에만 사용한다. 로컬 자료 부재는 수행 여부 판단 근거가 아니다. 세부 값과 source/run 직접 연결의 미확인은 UNKNOWN으로 관리한다.

## 1. Evidence provenance matrix

| Experiment | 담당자/생성 환경 | source | vscode_sim | vivado_sim | synthesis | implementation | drc | timing | bitstream | programmed | board |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| 01_logic_gates | UNKNOWN / UNKNOWN | LOCAL_VERIFIED | LOCAL_VERIFIED | LOCAL_VERIFIED | LOCAL_VERIFIED | LOCAL_VERIFIED | LOCAL_VERIFIED | LOCAL_VERIFIED | LOCAL_VERIFIED | NOT_VERIFIED | LOCAL_VERIFIED |
| 02_full_adder | UNKNOWN / UNKNOWN | LOCAL_VERIFIED | LOCAL_VERIFIED | LOCAL_VERIFIED | LOCAL_VERIFIED | LOCAL_VERIFIED | LOCAL_VERIFIED | LOCAL_VERIFIED | LOCAL_VERIFIED | NOT_VERIFIED | LOCAL_VERIFIED |
| 03_4bit_adder | 팀원(성명 UNKNOWN) / PC UNKNOWN | LOCAL_VERIFIED | LOCAL_VERIFIED | LOCAL_VERIFIED | TEAM_CONFIRMED + EVIDENCE_PENDING | TEAM_CONFIRMED + EVIDENCE_PENDING | TEAM_CONFIRMED + EVIDENCE_PENDING | TEAM_CONFIRMED + EVIDENCE_PENDING | TEAM_CONFIRMED + EVIDENCE_PENDING | NOT_VERIFIED | LOCAL_VERIFIED |
| 04_4bit_subtractor | UNKNOWN / UNKNOWN | LOCAL_VERIFIED | LOCAL_VERIFIED | LOCAL_VERIFIED | LOCAL_VERIFIED | LOCAL_VERIFIED | LOCAL_VERIFIED | LOCAL_VERIFIED | LOCAL_VERIFIED | NOT_VERIFIED | LOCAL_VERIFIED |
| 05_4bit_comparator | 팀원(성명 UNKNOWN) / PC UNKNOWN | LOCAL_VERIFIED | LOCAL_VERIFIED | LOCAL_VERIFIED | TEAM_CONFIRMED + EVIDENCE_PENDING | TEAM_CONFIRMED + EVIDENCE_PENDING | TEAM_CONFIRMED + EVIDENCE_PENDING | TEAM_CONFIRMED + EVIDENCE_PENDING | TEAM_CONFIRMED + EVIDENCE_PENDING | NOT_VERIFIED | LOCAL_VERIFIED |
| 06_mux | UNKNOWN / UNKNOWN | LOCAL_VERIFIED | LOCAL_VERIFIED | LOCAL_VERIFIED | LOCAL_VERIFIED | LOCAL_VERIFIED | LOCAL_VERIFIED | LOCAL_VERIFIED | LOCAL_VERIFIED | NOT_VERIFIED | LOCAL_VERIFIED |
| 07_demux | 팀원(성명 UNKNOWN) / PC UNKNOWN | LOCAL_VERIFIED | LOCAL_VERIFIED | LOCAL_VERIFIED | TEAM_CONFIRMED + EVIDENCE_PENDING | TEAM_CONFIRMED + EVIDENCE_PENDING | TEAM_CONFIRMED + EVIDENCE_PENDING | TEAM_CONFIRMED + EVIDENCE_PENDING | TEAM_CONFIRMED + EVIDENCE_PENDING | NOT_VERIFIED | LOCAL_VERIFIED |
| 08_encoder | UNKNOWN / UNKNOWN | LOCAL_VERIFIED | LOCAL_VERIFIED | LOCAL_VERIFIED | LOCAL_VERIFIED | LOCAL_VERIFIED | LOCAL_VERIFIED | LOCAL_VERIFIED | LOCAL_VERIFIED | NOT_VERIFIED | LOCAL_VERIFIED |
| 09_decoder | UNKNOWN / UNKNOWN | LOCAL_VERIFIED | LOCAL_VERIFIED | LOCAL_VERIFIED | LOCAL_VERIFIED | LOCAL_VERIFIED | LOCAL_VERIFIED | LOCAL_VERIFIED | LOCAL_VERIFIED | NOT_VERIFIED | LOCAL_VERIFIED |
| 10_7seg_decoder | UNKNOWN / UNKNOWN | LOCAL_VERIFIED | LOCAL_VERIFIED | LOCAL_VERIFIED | LOCAL_VERIFIED | LOCAL_VERIFIED | LOCAL_VERIFIED | LOCAL_VERIFIED | LOCAL_VERIFIED | NOT_VERIFIED | LOCAL_VERIFIED |

### Matrix interpretation and supporting paths

- source: 10개 현재 RTL/TB/XDC/simulation.json 및 full SHA-256. 경로와 hash는 LAB1_post_fact_sheet.md의 각 실험 B 절 참조. working tree의 해당 파일 변경 없음.
- vscode_sim: 10개 보존 정상/실패/복구 로그·VCD 확인. `evidence/vscode/LAB1/<experiment>/<category>__run-<ID>/`의 실제 경로·cases·종료·PASS/FAIL은 fact sheet C 절.
- vivado_sim: 10개 최종 waveform 경로/안정 구간은 fact sheet D 절. 03/05/07은 screenshot 확인에 한정한다. 전체 cases/end/version/part/log/VCD는 UNKNOWN이며 이미지 존재를 전체 simulation PASS로 확대하지 않는다.
- synthesis/implementation: 01/02/04/06/08/09/10의 기존 `*.runs/synth_1/runme.log`, `*.runs/impl_1/runme.log` 성공 기록. 실제 경로는 fact sheet F 절.
- drc: 같은 7개의 default routed report 확인. 모두 error 0, warning 1, rule CFGBVS-1 (CFGBVS/CONFIG_VOLTAGE 미지정). LOCAL_VERIFIED는 report 값 확인이며 clean DRC PASS를 뜻하지 않는다.
- timing: 같은 7개 timing report 존재와 WNS=inf, TNS=0.000, WHS=inf, THS=0.000 확인. 사용자 timing 제약/clock 없음. NO_USER_TIMING_CONSTRAINT이며 timing verification PASS 아님. report 확인에 LOCAL_VERIFIED, setup/hold 판정은 NOT_APPLICABLE_TO_SETUP_HOLD_AS_REPORTED로 구분한다.
- bitstream: 같은 7개 실제 .bit 경로/size/hash 확인. source commit-to-build 연결은 UNKNOWN.
- 03/05/07 synthesis/implementation/DRC/timing/bitstream: 수행 TEAM_CONFIRMED, 원본 확인 EVIDENCE_PENDING. 수행 확인을 재요청하지 않고 담당 PC에서 기존 원본을 확보한다. 확인된 원본에 한정하여 TEAM_PROVIDED로 갱신하며 수치/hash는 확인 전 UNKNOWN 유지. 재실행하지 않는다.
- programmed 수행 status: NOT_VERIFIED (특정 실험별 수행 여부 자체 미확인).
- programmed: `evidence/vivado/LAB1/support/Hardware_Properties.png` 대표 상태는 LOCAL_VERIFIED (xc7s75_0 / xc7s75 / Programmed). 특정 실험/bitstream 연결은 전부 UNKNOWN.
- board: 06/10은 최종 사진, 나머지는 `evidence/board/LAB1/raw_videos/` 파일 존재만 LOCAL_VERIFIED. 모든 실험의 board 정상 동작을 뜻하지 않는다. 제출 사진 대상은 사용자 확정 06/10만이며 다른 8개 사진 제출 요구는 NOT_APPLICABLE.
- 06/10 사진 경로와 입력/expected/visible actual은 fact sheet board 절. 8/F는 사용자 확인 입력과 표시 사진 존재. MUX 사진별 selector/polarity/LED pin 대응은 UNKNOWN.
- 현재 파일의 로컬 저장 위치에서 팀원 제공 여부를 추론하지 않는다. 팀원 제공 출처를 추가로 확인하면 확인 범위에 한정하여 provenance를 재분류한다.

## 2. 교수 PPT coverage

Coverage는 전체 LAB 요구사항 충족 범위, provenance는 근거 확인 방식을 나타낸다. 둘을 동일시하지 않는다. 실제 개별 파일 경로와 hash는 fact sheet B~F 및 board 절에 연결된다.

| Requirement | status | provenance | 확인 범위 / supporting path |
| --- | --- | --- | --- |
| Vivado version | PARTIAL | LOCAL_VERIFIED + 미확인 범위 UNKNOWN | 7개 로컬 로그에서 v2026.1; 03/05/07 실행 version UNKNOWN; 로컬 compile.log / runme.log (실험 절 참조) |
| part | PARTIAL | LOCAL_VERIFIED + 미확인 범위 UNKNOWN | 7개 project에서 xc7s75fgga484-1; 나머지 UNKNOWN; 각 .xpr 및 DRC report |
| top | PARTIAL | LOCAL_VERIFIED + 미확인 범위 UNKNOWN | 현재 RTL/TB top 10개 확인; 실행 project top 직접 확인은 7개; simulation.json, RTL 및 각 .xpr |
| pin constraint | CONFIRMED | LOCAL_VERIFIED | 10개 실제 XDC 경로·hash 수집; 각 constraints/*.xdc (fact sheet hash 표) |
| code commit | PARTIAL | LOCAL_VERIFIED + 미확인 범위 UNKNOWN | 현재 HEAD/source 확인; 과거 run ↔ commit 직접 연결 UNKNOWN; HEAD, result.json 입력 hash |
| VS Code와 Vivado의 입력 비교 | PARTIAL | LOCAL_VERIFIED + 미확인 범위 UNKNOWN | 7개 전 case 안정 시점 일치; 03/05/07은 screenshot 한정; 정상/복구 VCD 및 로컬 XSim VCD |
| 출력 비교 | PARTIAL | LOCAL_VERIFIED + 미확인 범위 UNKNOWN | 7개 입력·출력 sample 일치; 03/05/07 정량 직접 비교 불가; VCD 비교 및 Vivado 파형 10개 |
| simulation time 비교 | PARTIAL | LOCAL_VERIFIED + 미확인 범위 UNKNOWN | 7개 PASS 로그 종료 시간 일치; 나머지 Vivado 실제 종료 UNKNOWN; simulation.log 및 simulate.log |
| checked case count 비교 | PARTIAL | LOCAL_VERIFIED + 미확인 범위 UNKNOWN | 7개 PASS cases 일치; 나머지 Vivado 실제 checked 수 UNKNOWN; simulation.log 및 simulate.log |
| synthesis | PARTIAL | LOCAL_VERIFIED + TEAM_CONFIRMED / EVIDENCE_PENDING | 7개 synth_design success; 03/05/07은 현재 기록 미확인; 미수행 판정 아님; 각 .runs/synth_1/runme.log |
| implementation | PARTIAL | LOCAL_VERIFIED + TEAM_CONFIRMED / EVIDENCE_PENDING | 7개 route_design success; 03/05/07은 현재 기록 미확인; 미수행 판정 아님; 각 .runs/impl_1/runme.log |
| bitstream path | PARTIAL | LOCAL_VERIFIED + TEAM_CONFIRMED / EVIDENCE_PENDING | 7개 실제 .bit path/SHA-256 확인; 각 .runs/impl_1/*.bit |
| DRC | PARTIAL | LOCAL_VERIFIED + TEAM_CONFIRMED / EVIDENCE_PENDING | 7개 routed default DRC: error 0, CFGBVS-1 warning 1; 각 *_drc_routed.rpt (methodology 별도) |
| warning | PARTIAL | LOCAL_VERIFIED + 미확인 범위 UNKNOWN | CFGBVS/CONFIG_VOLTAGE 경고 명시; 전체 build warning 목록 검수는 별도; routed DRC 및 runme.log |
| timing | PARTIAL | LOCAL_VERIFIED + TEAM_CONFIRMED / EVIDENCE_PENDING | 7개 report 존재; 사용자 timing 제약·clock 없음, timing PASS 아님; 각 *_timing_summary_routed.rpt |
| Program Device | PARTIAL | LOCAL_VERIFIED + 미확인 범위 UNKNOWN | 대표 Status: Programmed 1개; 특정 실험/bitstream 연결 UNKNOWN; evidence/vivado/LAB1/support/Hardware_Properties.png |
| board condition | PARTIAL | LOCAL_VERIFIED + 미확인 범위 UNKNOWN | 선정 06/10 및 8/F 입력 확정; MUX 사진별 selector·polarity 추가 확인; board 최종 사진 4개 및 사용자 확인 |
| expected vs simulation vs board comparison | PARTIAL | LOCAL_VERIFIED + 미확인 범위 UNKNOWN | 계산·파형과 8/F 사진 비교 가능; MUX 전기적 수치 및 source 연결 미확정; 파형 10개, 선택 board 사진 |
| 미수행/미확인 항목 명시 | CONFIRMED | LOCAL_VERIFIED | 팀/로컬 provenance와 미확인 연결 구분; 기록 부재를 미수행으로 단정하지 않음; 이 summary 및 fact sheet |

## 3. Quantitative VS Code / Vivado comparison

기존 VCD만 파싱했다. top-level DUT 입출력의 bit 값을 시간 단위 ns로 정규화하고, 각 case의 n*10+5 ns에서 비교했다. 정상과 복구 실행을 각각 로컬 XSim VCD와 비교했으며 7개 실험에서 입력·출력 불일치 0이다. 날짜/header/scope/내부 신호 및 simulator 표현 차이가 있는 전체 VCD의 byte equality를 의미하지 않는다. 경계에서의 glitch나 모든 delta cycle equality는 비교하지 않았다. 정확한 VCD SHA-256 비교도 수행했으나 14개 비교 모두 불일치했다.

| Experiment | Normal/recovery stable-case comparison | Cases per run | Exact VCD hash equality |
| --- | --- | --- | --- |
| 01_logic_gates | FUNCTIONALLY_CONSISTENT | 4 | false |
| 02_full_adder | FUNCTIONALLY_CONSISTENT | 8 | false |
| 03_4bit_adder | NOT_DIRECTLY_COMPARABLE | UNKNOWN | UNKNOWN |
| 04_4bit_subtractor | FUNCTIONALLY_CONSISTENT | 256 | false |
| 05_4bit_comparator | NOT_DIRECTLY_COMPARABLE | UNKNOWN | UNKNOWN |
| 06_mux | FUNCTIONALLY_CONSISTENT | 64 | false |
| 07_demux | NOT_DIRECTLY_COMPARABLE | UNKNOWN | UNKNOWN |
| 08_encoder | FUNCTIONALLY_CONSISTENT | 256 | false |
| 09_decoder | FUNCTIONALLY_CONSISTENT | 8 | false |
| 10_7seg_decoder | FUNCTIONALLY_CONSISTENT | 16 | false |

08/09 XSim VCD의 마지막 timestamp는 각각 2550/70 ns이지만 simulate.log의 실제 종료는 2560/80 ns이다. 입력이 마지막 case에서 유지되는 구간의 마지막 sample은 마지막 기록값을 사용했다. VCD 마지막 event 시각을 종료 시각으로 치환하지 않는다. source 파일 경로와 기능 일치가 같아도 과거 입력 파일의 exact source hash/commit을 증명하지 않는다.

## 4. Source/run relationships and team collection

- 현재 41개 source/TB/XDC/config의 hash와 HEAD는 fact sheet B 절에 기록한다. 이 값은 현재 파일의 기록이다.
- 10개 최신 result.json 입력 hash는 현재 RTL/TB/config와 일치하지만 XDC는 입력 hash 목록에 없다. 각 기록의 해당 run에만 file-content 대응을 사용한다.
- 02 최신 run은 9fe1d57c3a1c409e82fb042989b8f0f4이고 보존 recovery 335a41eb710c467a94846bdabb4ec2c5와 다르다. 다른 9개 최신 run은 보존 recovery와 ID 및 VCD hash가 일치한다.
- 모든 과거 run-to-commit 직접 대응은 UNKNOWN. 현재 HEAD/hash를 과거 실행 provenance로 대체하지 않는다.
- 최소 팀 자료 요청: LAB1_team_evidence_request.md. 이미 확보한 10개 waveform/source/VS Code 및 7개 구현 자료는 중복 요청하지 않는다.
- 7개 로컬 Vivado 원본은 임시 생성 폴더에 있다. 이번 작업은 복사하지 않았다. GitHub 영구 보존은 별도 사용자 승인 범위에서 필요한 기록만 보존해야 한다.
- 기존 source/evidence/report 및 다른 manifest는 그대로 유지했다. 이전 로컬 중심 status를 팀 수행 결론으로 인용하지 않는다.
- 사용자 실제 waveform observation gate는 유지한다. 자동 VCD parsing으로 사용자 관찰 완료를 판정하지 않는다.
- Work: START_ALLOWED_WITH_OPEN_QA. 확인된 source·파형·7개 정량 비교/구현 기록·선정 board 사진 범위로 보완 가능. 모든 실험의 구현/programming 완료 및 timing PASS를 확정하지 않는다.
