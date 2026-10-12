# LAB1 Team Evidence Request

## 0. Collection rules

- 팀 분담·여러 PC 환경: USER_REPORTED. 개별 담당자/PC는 UNKNOWN.
- 03/05/07 synthesis/implementation/DRC/timing/bitstream 수행은 사용자 확인으로 TEAM_CONFIRMED이다. 원본 evidence 직접 확인은 EVIDENCE_PENDING이다. 해당 수행 사실은 다시 요청하지 않는다.
- LOCAL_VERIFIED: 현재 파일로 직접 확인. TEAM_PROVIDED: 팀원 원본 evidence까지 직접 확인. NOT_VERIFIED: 수행 여부 자체 미확인에만 사용. NOT_APPLICABLE: 해당 없음. 세부 값/직접 연결 미확인은 UNKNOWN.
- 로컬 파일이 확인되지 않는다고 미수행이라고 쓰지 않는다. 원래 수행 PC의 기존 자료를 요청하며 재실행을 요구하지 않는다.
- 확보된 10개 최종 Vivado waveform, 현재 RTL/TB/XDC/config, VS Code 기록, 7개 구현 기록과 board 최종 사진은 재요청하지 않는다.
- 이 목록은 수집 준비 문서이며 팀원에게 메시지를 발송하지 않았다. 기존 evidence를 수정/복사/삭제하지 않았다.

## 1. 03/05/07: missing quantitative and implementation records

### 03_4bit_adder

- 수행 status: TEAM_CONFIRMED (사용자 확인); 원본 evidence status: EVIDENCE_PENDING.
- 담당 팀원 성명/자료 생성 PC 등 출처 정보와 기존 원본 전달 요청. synthesis/implementation/DRC/timing/bitstream 수행 사실은 확정되어 재확인 요청하지 않음.
- 기존 Vivado simulate.log 또는 동일 실행의 원본 log: version, design/sim top, part, PASS/FAIL, checked cases, 실제 end time. 이미 waveform은 확보되어 screenshot 중복 요청 없음.
- 가능하면 같은 실행의 VCD: VS Code 입력·출력 정량 비교용. 없다면 없다고 기록.
- 기존 synthesis/implementation/write_bitstream 성공 log 또는 원본 run-status 기록.
- 기존 routed DRC report: error/warning/rule 및 design/device/state.
- 기존 timing summary: 제약/clock과 실제 지표를 확인하며 N/A를 PASS로 처리하지 않음.
- 기존 bitstream path/size/SHA-256 기록. hash 기록이 없고 파일을 제공할 수 있으면 실제 .bit로 계산 가능.
- 수행 당시 source commit 또는 입력 RTL/TB/XDC/config hash 기록이 있으면 제공. 사후 현재 source hash를 당시 실행 hash로 작성하지 않음.
- 원본 자료의 생성 PC/전달자/실험/stage/run 대응을 확인할 수 있는 최소 설명.

### 05_4bit_comparator

- 수행 status: TEAM_CONFIRMED (사용자 확인); 원본 evidence status: EVIDENCE_PENDING.
- 담당 팀원 성명/자료 생성 PC 등 출처 정보와 기존 원본 전달 요청. synthesis/implementation/DRC/timing/bitstream 수행 사실은 확정되어 재확인 요청하지 않음.
- 기존 Vivado simulate.log 또는 동일 실행의 원본 log: version, design/sim top, part, PASS/FAIL, checked cases, 실제 end time. 이미 waveform은 확보되어 screenshot 중복 요청 없음.
- 가능하면 같은 실행의 VCD: VS Code 입력·출력 정량 비교용. 없다면 없다고 기록.
- 기존 synthesis/implementation/write_bitstream 성공 log 또는 원본 run-status 기록.
- 기존 routed DRC report: error/warning/rule 및 design/device/state.
- 기존 timing summary: 제약/clock과 실제 지표를 확인하며 N/A를 PASS로 처리하지 않음.
- 기존 bitstream path/size/SHA-256 기록. hash 기록이 없고 파일을 제공할 수 있으면 실제 .bit로 계산 가능.
- 수행 당시 source commit 또는 입력 RTL/TB/XDC/config hash 기록이 있으면 제공. 사후 현재 source hash를 당시 실행 hash로 작성하지 않음.
- 원본 자료의 생성 PC/전달자/실험/stage/run 대응을 확인할 수 있는 최소 설명.

### 07_demux

- 수행 status: TEAM_CONFIRMED (사용자 확인); 원본 evidence status: EVIDENCE_PENDING.
- 담당 팀원 성명/자료 생성 PC 등 출처 정보와 기존 원본 전달 요청. synthesis/implementation/DRC/timing/bitstream 수행 사실은 확정되어 재확인 요청하지 않음.
- 기존 Vivado simulate.log 또는 동일 실행의 원본 log: version, design/sim top, part, PASS/FAIL, checked cases, 실제 end time. 이미 waveform은 확보되어 screenshot 중복 요청 없음.
- 가능하면 같은 실행의 VCD: VS Code 입력·출력 정량 비교용. 없다면 없다고 기록.
- 기존 synthesis/implementation/write_bitstream 성공 log 또는 원본 run-status 기록.
- 기존 routed DRC report: error/warning/rule 및 design/device/state.
- 기존 timing summary: 제약/clock과 실제 지표를 확인하며 N/A를 PASS로 처리하지 않음.
- 기존 bitstream path/size/SHA-256 기록. hash 기록이 없고 파일을 제공할 수 있으면 실제 .bit로 계산 가능.
- 수행 당시 source commit 또는 입력 RTL/TB/XDC/config hash 기록이 있으면 제공. 사후 현재 source hash를 당시 실행 hash로 작성하지 않음.
- 원본 자료의 생성 PC/전달자/실험/stage/run 대응을 확인할 수 있는 최소 설명.

## 2. All experiments: provenance questions only

| experiment | 최소 확인/요청 | 현재 status |
| --- | --- | --- |
| 01_logic_gates | 담당자·수행 PC·stage, 확보 파일의 생성/전달 출처; 과거 source commit/input snapshot 기록이 남아 있다면 해당 원본만 | UNKNOWN |
| 02_full_adder | 담당자·수행 PC·stage, 확보 파일의 생성/전달 출처; 과거 source commit/input snapshot 기록이 남아 있다면 해당 원본만 | UNKNOWN |
| 03_4bit_adder | 담당 팀원 성명·생성 PC·원본 전달/직접 확인, 확보 파일의 출처; 과거 source commit/input snapshot 기록이 남아 있다면 해당 원본만 | TEAM_CONFIRMED + EVIDENCE_PENDING (구현 5단계); 세부 정보 UNKNOWN |
| 04_4bit_subtractor | 담당자·수행 PC·stage, 확보 파일의 생성/전달 출처; 과거 source commit/input snapshot 기록이 남아 있다면 해당 원본만 | UNKNOWN |
| 05_4bit_comparator | 담당 팀원 성명·생성 PC·원본 전달/직접 확인, 확보 파일의 출처; 과거 source commit/input snapshot 기록이 남아 있다면 해당 원본만 | TEAM_CONFIRMED + EVIDENCE_PENDING (구현 5단계); 세부 정보 UNKNOWN |
| 06_mux | 담당자·수행 PC·stage, 확보 파일의 생성/전달 출처; 과거 source commit/input snapshot 기록이 남아 있다면 해당 원본만 | UNKNOWN |
| 07_demux | 담당 팀원 성명·생성 PC·원본 전달/직접 확인, 확보 파일의 출처; 과거 source commit/input snapshot 기록이 남아 있다면 해당 원본만 | TEAM_CONFIRMED + EVIDENCE_PENDING (구현 5단계); 세부 정보 UNKNOWN |
| 08_encoder | 담당자·수행 PC·stage, 확보 파일의 생성/전달 출처; 과거 source commit/input snapshot 기록이 남아 있다면 해당 원본만 | UNKNOWN |
| 09_decoder | 담당자·수행 PC·stage, 확보 파일의 생성/전달 출처; 과거 source commit/input snapshot 기록이 남아 있다면 해당 원본만 | UNKNOWN |
| 10_7seg_decoder | 담당자·수행 PC·stage, 확보 파일의 생성/전달 출처; 과거 source commit/input snapshot 기록이 남아 있다면 해당 원본만 | UNKNOWN |

이미 source와 실행 기록이 있는 실험에서는 같은 파일을 다시 요청하지 않는다. 현재 source와 실행 당시 source가 달랐다는 확인이 있을 때만 해당 수정본/차이를 요청한다. commit-to-run 기록이 남아 있지 않다면 UNKNOWN를 유지한다.

## 3. Selected board / programming links

- 06_mux: 기존 두 사진이 각각 s=00/button1/i[3], s=11/button4/i[0] 조건에 해당하는지 사용자/시연자 확인. button 번호 mapping은 이미 USER_CONFIRMED이므로 재확정 요청 대상 아님. 실제 입력 polarity, selector 물리 대응, 점등 LED가 XDC z=L4 출력인지 남은 확인만 필요.
- 10_7seg_decoder: 입력 8/F와 사진 표시를 이미 확보했으므로 중복 사진 요청 없음.
- 선정 두 실험의 기존 programming log/screenshot에 bitstream path가 남아 있다면 해당 연결 기록만 제공. 기존 대표 Programmed 화면이나 모든 실험의 GUI screenshot을 중복 요청하지 않는다.
- 두 실험 최종 사진의 원본 영상 timestamp/직접 추출 여부 기록이 남아 있다면 확인. 없다면 UNKNOWN 유지.
- 다른 8개 raw video는 보존용이며 제출 board 사진 또는 필수 동영상으로 요청하지 않는다.

## 4. GitHub preservation follow-up

7개 로컬 구현 log/DRC/timing/bitstream hash는 이미 확인했다. 팀원 재요청 대상이 아니라, 별도 승인 작업에서 필요한 기존 기록만 evidence에 보존할 대상이다. 이번에는 복사·simulation/build·Git 작업을 수행하지 않는다.
