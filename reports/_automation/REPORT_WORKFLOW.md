# Report Workflow

LAB2 이후 새 LAB에 사용하는 일반 정책이다. 제출 완료된 LAB1은 다시 수행하거나 변경하지 않는다. LAB1 사례는 원칙의 예시이며 다음 LAB의 고정 입력값이 아니다.

## 1. 전체 흐름

교수 수업자료 분석 → 요구사항 추출 → 필요한 선수지식 확인 → RTL/TB/XDC 초안 → 학생 source review 및 원리 이해 → 예상 동작 계산 → PRIMARY_BOUNDARY_CASE 선정 → 예비보고서 초안 → simulation → 사용자 실제 VaporView 관찰 → evidence 보존 → intentional failure → recovery → Vivado → FPGA board → 결과보고서 → QA → Git commit.

예비 초안은 실행 전 예상과 계획을 기록하고 실행 후 실제 증거로 보완한다. 자동화는 예상 → 실행 → 관찰 → 검증의 근거를 연결한다. Git staging/commit/push는 별도 사용자 지시가 있을 때만 수행한다.

## 2. 경계 선정

실제 RTL 기능과 TB 입력 순서를 분석하여 가장 진단력이 높은 경계를 선정한다. 기존 보고서의 대표값이나 TB 첫 입력이라는 이유만으로 선택하지 않는다.

1. 핵심 기능 격리: 한 번에 하나의 핵심 기능을 격리한다.
2. 한계/전환 표현: 회로의 한계 또는 상태 전환을 직관적으로 보여준다.
3. 명확한 예상값 계산: 논리식과 계산 과정이 명확해야 한다.
4. 파형 차이: 경계 전후 출력 차이가 뚜렷해야 한다.
5. board 재현성: 같은 조건을 실제 보드에서도 쉽게 재현할 수 있어야 한다.
6. TB 등장 시점: 빨리 등장하는지는 후순위이다.

carry/borrow 0→1, >→=→<, 최대값→overflow, selector만 바꾼 출력 위치 이동, one-hot 위치 이동, 숫자→hexadecimal 문자 경계 등이 후보이다. 여러 입력이 동시에 바뀌는 조건보다 한 변수 또는 한 기능의 변화를 격리하는 조건을 우선한다. 입력 유효 범위와 무효 입력 동작도 구분한다.

ENDPOINT_CHECK / ENABLE_CHECK / INVALID_DOMAIN_CHECK / ADDITIONAL_CHECK / FAILURE_TRIGGER_CASE는 보조 조건이며 PRIMARY_BOUNDARY_CASE와 혼동하지 않는다.

## 3. 내부 경계 기록

동일 경계에 추적용 case_id를 부여하고 다음 필드를 기록한다.

| 필드 | 기록 내용 |
|---|---|
| inputs | 경계 전후 입력, 단위, 진법, bit order |
| purpose | 격리하여 검증할 기능 |
| selection_reason | 진단력이 높은 이유 |
| expected_output | 정상 설계의 경계 전후 출력 |
| calculation | 논리식/연산과 계산 과정 |
| tb_vector | 실제 TB vector 및 index 기준 |
| stable_window | timescale을 포함한 안정 구간 |
| recommended_sample_time | 전환 경계를 피한 안정 구간 내부 시점 |
| waveform_signals | 입력/출력 및 필요한 내부 신호 |
| board_inputs | XDC에 근거한 스위치/버튼 입력 계획 |
| board_expected_output | polarity와 bit order를 반영한 예상 물리 출력 |
| user_observation_status | 사용자 확인 전 NOT_VERIFIED |

내부 선정 상태는 ENGINEERING_SELECTED_BOUNDARY를 사용할 수 있다. 계산으로 도출한 값은 AUTO_DERIVED로 구분한다. 수업자료가 없는 요구사항은 UNKNOWN이며 과목 필수 조건을 임의로 만들지 않는다.

## 4. 동일 조건의 단계별 추적

PRE의 case_id, 입력, 정상 예상값, 선정 이유를 simulation(VS Code/Icarus) → Vivado → board → POST까지 연결한다. 각 실행의 run ID, 도구 버전, source 경로/top, 실제 사용 source 식별 근거, 로그/VCD/evidence 경로를 기록한다. run과 source commit의 직접 대응 근거가 없으면 UNKNOWN으로 둔다.

같은 reviewed RTL/TB/XDC를 사용하며 변경 시 이유와 새 source/run을 기록한다. 동일 입력을 가능한 한 유지한다. 플랫폼별 시간/표시 차이는 대응표로 남긴다. 재현이 불가능하면 사유와 대체 조건을 학생이 확인해야 한다. 이유 없이 PRIMARY를 교체하지 않으며 보조 조건은 추가할 수 있다.

## 5. 사용자 파형 관찰 gate

simulation 후 WAVEFORM_CHECK_TEMPLATE으로 USER_WAVEFORM_CHECK_GUIDE를 제공한다. 실제 run/VCD, 추가할 신호, 전체 실행 시간, PRIMARY 선정 이유, 경계 전후 구간, 입력 전환 시각, 권장 안정 sample time별 입력/계산/예상 출력, 실제로 읽을 출력, 정상 판단 기준, 우선 점검 항목, screenshot 범위를 포함한다. 코드에서 계산한 예상 시간과 실제 종료 시간을 구분한다.

사용자 실제 VaporView 관찰 전에는 user_observation_status = NOT_VERIFIED를 유지한다. VCD 존재, 자동 numeric parsing, simulation PASS만으로 사용자 파형 관찰 완료로 판정하지 않는다. 사용자 실제 관찰값 또는 사용자 확인 screenshot이 제공된 후 해당 run/구간만 확인 상태로 전환한다. 관찰 완료와 정상 동작 판정은 구분한다.

미확인 상태에서는 초안을 최종 보고서로 간주하지 않는다. 파형 설명은 시험 조건 → 예상 결과 → 관찰 결과 → 해석 순서로 작성하며 어떤 신호의 예상값과 실제값이 어떻게 일치하는지 설명한다.

## 6. Intentional failure 및 recovery

필요한 실험에는 FAILURE_TRIGGER_CASE를 둔다. 변경한 RTL/위치, 정상 기대값, 오류 회로 예상값, 예상 최초 failure vector, 실제 failure vector, expected, actual, 복구 방법, recovery PASS를 기록한다. TB expected는 항상 정상 설계 기준을 유지한다. DUT와 expected를 동시에 바꾸지 않는다. 정상/오류/복구 run을 구분하고 오래된 실행을 새 실행의 증거로 사용하지 않는다.

## 7. Evidence와 결과보고서

build 및 Vivado 생성 폴더는 임시 공간이다. 중요한 실제 증거만 evidence/vscode, evidence/vivado, evidence/board에 보존하며 원본은 삭제하지 않는다. LAB/실험/case/run/source를 추적하고 복사 시 원본/복사본 SHA-256을 검증한다. 수행하지 않은 로그/사진/결과를 생성하지 않는다.

POST에서 PRE 예상 ↔ VS Code 관찰 ↔ Vivado 결과 ↔ board 결과를 동일 case로 비교한다. 차이가 있으면 원인 가설 → 검사 → 수정 → 새 run 재검증을 기록한다. Behavioral Simulation, synthesis, implementation, DRC, timing, warnings, bitstream을 구분한다. 실제 수행하지 않은 Vivado/board 결과를 작성하지 않는다. bitstream 생성 성공과 board 정상 동작은 별개이다. board 결과는 실제 사용자 관찰/측정/사진/영상으로만 작성한다.

## 8. 내부 정보와 제출 문장 / QA

내부 manifest는 TOOL_VERIFIED, COURSE_MATERIAL, USER_REPORTED, AUTO_DERIVED, ENGINEERING_SELECTED_BOUNDARY, UNKNOWN, NOT_VERIFIED, NOT_PERFORMED, NOT_AVAILABLE을 사용할 수 있다. 근거 없는 값은 적절한 미확인 상태로 남긴다. TOOL_VERIFIED/COURSE_MATERIAL/USER_REPORTED 또는 명시적 사용자 확인 값만 근거 범위에서 사실로 서술한다. AUTO_DERIVED 값은 계산한 예상임을 밝히거나 사용자 확인 후 사용한다.

제출 본문에는 내부 provenance 용어를 노출하지 않고 자연스러운 학생 공학 보고서 문장을 쓴다. 실행 전에는 “예상한다”, “확인할 예정이다”, “검증할 계획이다”를 사용하고 “관찰하였다”, “확인하였다”, “정상 동작하였다”를 쓰지 않는다. 미수행 결과 placeholder를 임의로 채우지 않는다. compile warning, legacy absolute path, run-to-commit 부족은 내부 QA notes로 분리한다.

최종 QA에서는 수업자료 출처, 학생 source 이해, 정상 예상값, 동일 case 대응, run/source 근거, 사용자 파형 관찰, 실패/복구, Vivado 각 단계, 실제 board 근거, evidence 무결성, 학생 최종 검토를 확인한다. 미확인 항목은 사용자 확인 queue에 남긴다.
