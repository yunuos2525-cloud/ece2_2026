# Report Workflow

> 보고서는 마지막에 자료를 모아서 만드는 것이 아니라, 실험 시작부터 보고서에 필요한 provenance와 evidence를 함께 기록하면서 진행한다.

최종 보고서에서 사용하는 증거와 필수 검증 기록을 중심으로 수집한다. 임시 중간 자료와 최종 제출 자료를 구분하고 불필요한 이미지 복사를 줄인다. 이 문서의 gate와 QA는 내부 best practice이며 수업 필수 내용/형식의 출처와 구분한다.

LAB2 이후 새 LAB에 사용하는 일반 정책이다. 제출 완료된 LAB1은 다시 수행하거나 변경하지 않는다. LAB1 사례는 원칙의 예시이며 다음 LAB의 고정 입력값이 아니다.

제출용 문서를 만들기 전에 `reports/_automation/references/COURSE_REPORT_FORMAT.md`를 우선 확인한다. 교수/조교 자료는 명시적 형식 요구인 REQUIRED_FORMAT, 예시/샘플인 EXAMPLE_REFERENCE, 일반 작성 원칙인 GENERAL_GUIDANCE로 구분한다. 불확실하면 UNKNOWN_FORMAT_AUTHORITY로 남기고 학생 또는 ChatGPT 검토를 요청하며 강제 양식으로 임의 승격하지 않는다. 현재 기준 문서의 목차도 원본의 강제 여부가 확인되지 않은 참고 구조이다. 해당 LAB의 명시적 요구가 확인된 항목만 근거와 적용 범위를 기록하여 REQUIRED_FORMAT으로 승격할 수 있다.

제출 구성은 해당 LAB의 명시적 REQUIRED_FORMAT / 필수 요구사항 → 설계와 검증 논리를 가장 명확하게 보여주는 구성 → EXAMPLE_REFERENCE의 문체·증거 밀도·그림 사용 방식 → 일반 automation template 순으로 판단한다. GENERAL_GUIDANCE는 판단 원칙으로 적용한다. REQUIRED_FORMAT의 필수 제목/항목/순서는 엄격히 유지하되, 예시라는 이유만으로 모든 제목과 순서를 강제 복제하지 않는다. 이 workflow와 PRE/POST template은 내부 검증 구조이며 제출 목차를 대체하지 않는다. template의 일반 양식 지침도 이 형식 권한 판단에 따라 해석한다. 전체 TB 검증과 대표 사례의 상세 분석을 구분하고 내부 상태 용어를 제출용 본문 제목으로 사용하지 않는다.

형식 판단과 무관하게 PRIMARY_BOUNDARY_CASE의 근거, expected 계산, source/run/evidence 대응, 사용자 실제 파형 관찰 gate와 NOT_VERIFIED, Vivado 단계 구분, bitstream과 board 결과 구분, 수행하지 않은 결과 작성 금지, provenance와 내부 QA는 완화하지 않는다. 수정 실험(intentional modification/failure/recovery)은 해당 실험의 수업자료가 요구할 때만 필수로 적용한다.

## 1. 전체 흐름

### 수업별 REQUIRED_CONTENT 적용

`COURSE_REPORT_FORMAT.md`에 기록된 사용자 전달 수업자료의 명시적 REQUIRED_CONTENT와 해당 LAB의 실험 수를 적용한다. 필수 내용과 강제 목차·순서인 REQUIRED_FORMAT은 구분한다. 제출 완료된 LAB의 source/report/evidence는 정책 개선을 이유로 변경하지 않는다.

- PRE: 모든 실험마다 설계 내용, 핵심 코드, 입력 조건, 예상 결과, 실제 VS Code simulation, VaporView waveform screenshot 및 관찰 동작과 예상 결과의 일치 여부 설명이 필요하다. 사용자 관찰 gate와 screenshot 존재를 각각 확인하며 PASS만으로 충족 처리하지 않는다. 당일 시연 2개 선정에 대비하여 모든 실험의 실제 시연 준비 상태를 확인한다.
- POST: 모든 실험마다 Vivado simulation waveform과 해석이 필요하다. 예상/실제 비교, 수정 내용 및 수정 후 재검증 내용이 있으면 기록한다.
- Board 제출: 조교가 선정한 2개 실험의 사진만 첨부한다. 선정 확인 전 DEMO_SELECTION_STATUS = NOT_SELECTED를 유지하고 임의 선택하지 않는다. 사진별 실험 번호·입력 조건·관찰 동작과 실제 시연 번호의 대응을 확인한다. 입력 수치 미확정은 UNKNOWN과 사용자 확인 queue로 유지한다.
- 전체 실험 inclusion 및 required evidence는 PRIMARY_BOUNDARY_CASE 분석과 별도로 검사한다. PRIMARY는 각 실험의 대표 waveform 설명 구간이며 전체 실험이나 필수 증거를 대신하지 않는다.
- 모든 실험의 board raw evidence 보존과 제출 사진 선택은 별개이다. video/frame 존재에서 조교 선정을 추론하지 않는다. 기존 원본은 유지하며 선정 전 모든 실험의 제출용 board frame을 추가 생성할 필요는 없다.

### LAB2 수업자료 적용 기준

LAB2에서는 **실험별 요구사항이 서로 다를 수 있음**을 기본 전제로 한다. 공통 workflow가 특정 실험의 항목을 임의로 강제하지 않는다.

각 실험을 시작하기 전에 반드시 수업자료에서 다음 두 종류의 요구사항을 별도로 추출한다.

1. `EXPERIMENT_REQUIREMENTS`: 실제 설계·실행·검증에서 해야 할 일
2. `REPORT_REQUIREMENTS`: 예비보고서에 반드시 들어가야 할 내용·표·계산·파형·로그·설명

두 문서는 같은 교안에서 추출하지만 역할이 다르다. 예를 들어 “16 ns에서 실패하는 이유를 계산한다”는 실행/검증 요구이면서 보고서 설명 요구가 될 수 있고, “전체 파형과 duty/tick/reset 확대 화면을 넣는다”는 명시적인 보고서 evidence 요구이다.

#### EXPERIMENT_REQUIREMENTS 최소 필드

- experiment_id / 실험명
- RTL/TB/XDC 및 top/module
- 핵심 기능과 학생이 이해해야 할 원리
- 정상 simulation에서 검증할 기능과 PASS 조건
- 필수 입력 순서/경계조건/특정 검사 시점
- 필수 waveform 신호와 관찰 구간
- 수정 실험 요구 상태: `REQUIRED / NOT_REQUIRED / UNKNOWN`
- 수정 실험이 REQUIRED이면: 변경 위치, 변경 내용, 예상 failure 시점/vector, expected/actual 비교 항목, 복구 조건
- Vivado 준비 항목
- board 입력/출력 사전 계산 요구
- 설정 변경/오류 기록 요구
- 아직 확인되지 않은 항목

#### REPORT_REQUIREMENTS 최소 필드

- 교수/조교가 명시한 필수 제목 또는 내용 항목
- 설명해야 할 RTL/TB/`simulation.json`/XDC 역할
- 반드시 작성할 상태표/예상표/계산 과정
- 정상 PASS log 요구 여부
- 정상 전체 waveform 요구 여부
- 확대 waveform의 필수 시점/신호/구간
- 수정/실패/복구 로그 또는 비교표 요구 여부
- 특정 시점 expected/actual 비교 요구
- 설정 변경/오류/도구 관련 기록 요구
- Vivado 시작 전 작성해야 할 board 입력 순서/예상 LED 등
- XDC가 현재 simulation에 사용되는지 여부처럼 구분해서 써야 할 사항
- 제출 본문에 넣지 않을 내부 추적 항목
- 요구 출처(교안 페이지/슬라이드/문장)

각 항목은 `REQUIRED / OPTIONAL / NOT_REQUIRED / UNKNOWN`으로 판정한다. **교안에 없는 항목을 LAB1 관행이나 automation 편의 때문에 REQUIRED로 승격하지 않는다.**

LAB2 공통 배경으로는 다음을 적용하되, 실제 해당 실험에 등장할 때만 보고서에 사용한다.

- 시작 환경: 수업자료가 지정한 template/tag, workspace, `simulation.json`, `slang` 상태
- 도구 구분: VS Code `02 Simulate` = Icarus, Vivado `Run Behavioral Simulation` = XSim
- 순차회로 시간 해석: clock period, posedge, 입력 변경, register 갱신, edge 후 검사 지연
- reset/enable 우선순위와 상태 유지
- nonblocking assignment의 이전 값 전달
- Moore/Mealy 출력 시점
- 버튼 synchronizer/debounce/one-clock pulse
- clock-enable/분주와 실제 board clock 대비 비
- simulation clock과 실제 장비 clock의 구분

수정 실험은 실험별 요구에 따라 조건부로 수행한다. 예를 들어 현재 확인된 자료에서 01 Counter는 수정 실험 요구가 없고, 02 Clock Divider와 03 Register는 수정·실패·복구 절차가 명시되어 있다. 이 사례를 다른 실험에 자동 일반화하지 않고 각 교안을 다시 확인한다.

최종 QA에 전체 실험 수, PRE screenshot/사용자 관찰/설명, POST Vivado waveform/해석, 조교 선정 근거, 실제 시연 실험 번호 ↔ board 사진 ↔ 보고서 설명 대응, 사진별 입력 조건 확인, 그리고 **해당 실험에서 요구된 경우에만** 수정/재검증 기록을 포함한다. 미확인 선정이나 입력 조건은 자동으로 채우지 않는다. PRIMARY 선정, source/run/evidence 추적, Vivado 단계 구분 및 provenance/QA는 유지하되, 수정 실험의 적용 여부와 evidence 종류는 EXPERIMENT_REQUIREMENTS/REPORT_REQUIREMENTS를 따른다.

교수 수업자료 분석 → EXPERIMENT_REQUIREMENTS 추출 → REPORT_REQUIREMENTS 추출 → 학생과 요구사항 검수 → 필요한 선수지식 확인 → 지정 template/tag clone 및 workspace 준비 → 실험별 세팅 자동화(파일명·교안 RTL/TB·XDC·simulation.json·참조 정합성) → diff 검수 → 학생 source review → expected/시간축 계산 → 필수 경계/파형 계획 확정 → 정상 simulation → 사용자 VaporView 관찰/evidence 보존 → [교안이 요구할 때만 수정 실험 → FAIL 분석 → 복구 → 재검증] → REPORT_REQUIREMENTS 충족 여부 검사 → PRE 확정 → Vivado/board/POST → QA → Git(사용자 승인 시).

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

## 6. 수정 실험 / failure / recovery — 조건부 단계

수정 실험은 `EXPERIMENT_REQUIREMENTS`에서 `MODIFICATION_REQUIRED = REQUIRED`로 확인된 실험에만 적용한다.

- `NOT_REQUIRED`: 정상 검증만으로 이 단계를 종료하며, failure/recovery evidence를 억지로 만들지 않는다.
- `UNKNOWN`: 교안을 다시 확인하기 전에는 임의로 수정 실험을 추가하지 않는다.
- `REQUIRED`: 교안이 지정한 변경만 수행하고, TB expected는 정상 설계 기준을 유지한다.

REQUIRED인 경우 다음을 기록한다.

- 변경할 RTL 파일/위치/한 줄 또는 조건
- 변경 전 정상 기대값
- 변경 후 오류 회로의 예상 동작
- 교안이 지정한 failure 시점/vector 또는 계산으로 예상한 최초 failure
- 실제 FAIL log의 expected / actual
- 실패 원인 설명
- 정상 source 복구 내용
- 별도 recovery run의 PASS/check count
- 교안이 요구한 경우에만 failure/recovery waveform 또는 비교표

정상/변경/복구 증거의 종류도 교안 요구를 따른다. failure log만 요구되는 실험에 failure waveform을 강제하지 않는다. 과거 run을 새 실행의 증거로 재사용하지 않는다.

## 7. Evidence와 결과보고서

build 및 Vivado 생성 폴더는 임시 공간이다. `REPORT_REQUIREMENTS`에서 요구하거나 최종 검증에 필요한 실제 증거만 evidence/vscode, evidence/vivado, evidence/board에 보존하며 원본은 삭제하지 않는다. 모든 실험에 동일한 failure/recovery 파일 종류를 강제하지 않는다. LAB/실험/case/run/source의 대응을 추적한다. 자동화가 원본 evidence를 복사할 때는 필요하면 원본/복사본 hash로 무결성을 확인하되, 수업자료가 요구하지 않는 hash 값을 제출 본문에 강제하지 않는다. 수행하지 않은 로그/사진/결과를 생성하지 않는다.

POST에서 PRE 예상 ↔ VS Code 관찰 ↔ Vivado 결과 ↔ board 결과를 동일 case로 비교한다. 차이가 있으면 원인 가설 → 검사 → 수정 → 새 run 재검증을 기록한다. Behavioral Simulation, synthesis, implementation, DRC, timing, warnings, bitstream을 구분한다. 실제 수행하지 않은 Vivado/board 결과를 작성하지 않는다. bitstream 생성 성공과 board 정상 동작은 별개이다. board 결과는 실제 사용자 관찰/측정/사진/영상으로만 작성한다.

동일 case의 board 비교는 선정 시연 실험과 실제 재현한 조건에만 적용한다. PRIMARY가 촬영되지 않았다면 사용자가 확인한 실제 조건에 별도 case_id를 부여하고 대체 이유를 기록한다. 다른 조건의 사진을 PRIMARY 증거로 부르거나 입력을 출력에서 역추정하지 않는다.

## 8. 내부 정보와 제출 문장 / QA

내부 manifest는 TOOL_VERIFIED, COURSE_MATERIAL, USER_REPORTED, AUTO_DERIVED, ENGINEERING_SELECTED_BOUNDARY, UNKNOWN, NOT_VERIFIED, NOT_PERFORMED, NOT_AVAILABLE을 사용할 수 있다. 근거 없는 값은 적절한 미확인 상태로 남긴다. TOOL_VERIFIED/COURSE_MATERIAL/USER_REPORTED 또는 명시적 사용자 확인 값만 근거 범위에서 사실로 서술한다. AUTO_DERIVED 값은 계산한 예상임을 밝히거나 사용자 확인 후 사용한다.

제출 본문에는 내부 provenance 용어를 노출하지 않고 자연스러운 학생 공학 보고서 문장을 쓴다. 실행 전에는 “예상한다”, “확인할 예정이다”, “검증할 계획이다”를 사용하고 “관찰하였다”, “확인하였다”, “정상 동작하였다”를 쓰지 않는다. 미수행 결과 placeholder를 임의로 채우지 않는다. compile warning, legacy absolute path, run-to-commit 부족은 내부 QA notes로 분리한다.

최종 QA에서는 수업자료 출처, EXPERIMENT_REQUIREMENTS/REPORT_REQUIREMENTS 충족, 학생 source 이해, 정상 예상값, 동일 case 대응, run/source 근거, 사용자 파형 관찰, 교안이 요구한 경우의 수정/실패/복구, Vivado 각 단계, 실제 board 근거, evidence 무결성, 학생 최종 검토를 확인한다. 미확인 항목은 사용자 확인 queue에 남긴다.

## 9. 실험별 요구사항 추출

실험 폴더를 수정하거나 simulation을 실행하기 전에 교안에서 아래 두 파일을 생성/갱신한다.

- `reports/_automation/LABx_<experiment>_experiment_requirements.md`
- `reports/_automation/LABx_<experiment>_report_requirements.md`

`experiment_requirements`는 무엇을 설계·실행·검증해야 하는지 정의한다. `report_requirements`는 무엇을 제출 문서에 넣어야 하는지 정의한다.

추출 절차:

1. 해당 실험의 시작/설계/시뮬레이션/수정 실험/실험 전 레포트 슬라이드와 제공 README를 모두 확인한다.
2. 명시적 요구 문장을 원문 의미를 보존하여 항목화한다.
3. 각 항목에 `REQUIRED / OPTIONAL / NOT_REQUIRED / UNKNOWN`을 부여한다.
4. 실험 요구와 보고서 요구를 분리한다.
5. 필수 특정 시점, 예상 check count, 변경 한 줄, board clock 등 수치는 출처와 함께 기록한다.
6. LAB1 관행이나 다른 LAB 실험의 요구를 복사하지 않는다.
7. 추출 결과를 학생/ChatGPT가 검수한 뒤 세팅 자동화와 학습을 시작한다.

`REPORT_REQUIREMENTS`에는 최소한 다음 질문에 답이 있어야 한다.

- 어떤 표/계산을 써야 하는가?
- 어떤 PASS/FAIL/recovery 로그가 필요한가?
- 전체 파형이 필요한가?
- 어떤 확대 시점/구간이 필요한가?
- 어떤 신호 이름이 캡처에 보여야 하는가?
- 수정 실험이 있는가? 있다면 보고서에 무엇을 비교해야 하는가?
- Vivado 시작 전에 계산/작성할 board 입력·출력이 있는가?
- 설정 변경/오류 기록이 필요한가?
- XDC/도구/clock에 대해 구분해서 써야 하는 사항이 있는가?

이 단계가 끝나기 전에는 일반 template의 빈 항목을 보고 “수업 필수”라고 판단하지 않는다.

## 10. 실험별 세팅 자동화

새 실험을 시작할 때 교안/제공 파일에 이미 존재하는 기계적 준비 작업은 Codex가 자동화한다. 목적은 학생이 단순 복사·이름 변경·경로 수정에 시간을 쓰지 않고, 회로 원리·시간 동작·검증 논리에 집중하게 하는 것이다.

자동화 범위:

1. 해당 실험의 교수 제공 RTL, TB, XDC 또는 constraint 근거를 찾는다.
2. template의 placeholder 파일을 실험 의미가 드러나는 파일명으로 변경한다.
3. 교수 제공 RTL/TB 코드를 원문 기준으로 정확히 전사한다.
4. XDC는 수업자료/제공 constraint에 근거하여 포트명·핀·IOSTANDARD 등 필요한 항목을 반영한다.
5. `simulation.json`의 source 목록, RTL/TB 경로, design top, simulation top을 실제 파일/module과 일치시킨다.
6. 파일명 변경으로 깨지는 workspace, 설정, script, source reference가 있는지 검색하고 필요한 참조만 갱신한다.
8. 교안 원문 대비 누락·변형·임의 추가가 없는지 검사한다.
9. `git diff`와 변경 파일 목록을 검수용으로 제시한다.
10. 학생 review 전에는 simulation을 실행하지 않는다.
11. git add/commit/push/tag는 별도 명시적 사용자 지시가 있을 때만 수행한다.

자동화가 임의로 결정하면 안 되는 항목:

- 수업자료에 없는 RTL 동작
- 수업자료에 없는 test vector / expected
- 근거 없는 XDC pin mapping
- 확인되지 않은 design top / simulation top
- 실험별 장비 clock 조건
- 삭제 여부가 불분명한 사용자 파일

근거가 불충분한 항목은 추정하지 않고 UNKNOWN/확인 queue로 남긴다. 특히 XDC의 핀 번호와 polarity는 자료 근거 없이 생성하지 않는다.

자동화 완료 보고에는 최소한 다음을 포함한다.

- 최종 RTL/TB/XDC 파일명
- design module / design top
- TB module / simulation top
- XDC가 대상으로 하는 top-level port
- `simulation.json` 핵심 항목
- 수정/이름변경/삭제 파일 목록
- 교안 대비 누락·변형 여부
- `git diff` 요약
- 아직 확인되지 않은 항목

이 단계의 산출물은 GENERATED_DRAFT이다. 파일이 생성되었거나 diff가 깨끗하다는 사실은 학생 source review를 대체하지 않는다. 학생은 이후 회로 목적, 입출력, 핵심 RTL, 시간 동작, expected, TB 검사 논리를 설명하여 REVIEWED 상태로 전환한다.

## 11. 역할과 SOURCE STATE

| 담당 | 역할 |
|---|---|
| ChatGPT | 개념 학습, 설계 원리 설명, expected 계산, 디버깅 사고 과정, 이해도 확인, 구두시험, 보고서 내용 논리 검수 |
| Codex | 교안 기반 EXPERIMENT_REQUIREMENTS/REPORT_REQUIREMENTS 초안 추출, 실험별 파일명 정리, 교안 RTL/TB 전사, XDC 반영, simulation.json/참조 갱신, diff 검수, local repository inspection, source/evidence provenance 확인, simulation/build/log 수집, Git 상태 확인, report용 fact/evidence 정리, Markdown/DOCX/PDF 생성 및 QA |
| Work | 보고서 본문 작성/수정, 문장 구조와 표현 정리, editable draft 관리 |
| 학생 | source 이해/검토, 실제 파형 관찰, 수업에서 요구하는 Vivado GUI 수행, 실제 board 관찰, 최종 캡처 준비 및 내용 승인 |

Work는 local repository를 자동으로 볼 수 없다. Codex가 확인한 fact sheet / validation summary를 명시적으로 전달하고, Work의 확정 본문은 final Markdown으로 repository에 인계한다.

SOURCE STATE는 GENERATED_DRAFT → REVIEWED → SIMULATED → VERIFIED로 관리한다. AI 초안은 검증된 source가 아니다. 실행 전에 학생이 회로 목적, 입력/출력, 핵심 RTL 구조, expected 계산, TB의 검사 내용을 설명하고 review를 확인해야 한다. 수정 실험이 REQUIRED인 경우에만 변경이 왜 실패해야 하는지도 설명한다. 이해 확인 전에는 실행하지 않는다. SIMULATED는 실제 실행 기록이 있는 상태이며 VERIFIED는 해당 범위의 기능 증거와 사용자 파형 확인까지 충족한 상태이다. source 검증, PDF 검증, board 검증의 범위를 서로 대체하지 않는다.

## 12. 표준 VS Code 실행 순서와 PRE

0. 해당 실험 교안에서 `EXPERIMENT_REQUIREMENTS`와 `REPORT_REQUIREMENTS`를 먼저 추출하고 학생/ChatGPT가 검수한다.
1. 새 LAB/실험 시작 시 수업자료가 지정한 template/tag와 폴더명을 사용해 workspace를 준비한다.
2. Codex가 파일명 정리, 교수 제공 RTL/TB 전사, XDC 반영, `simulation.json` 및 참조 갱신을 자동화하고 diff를 검수한다.
3. tool check, `slang`, `simulation.json` 상태를 확인한다.
4. 학생이 회로 목적·입출력·핵심 RTL·TB 검증 논리·expected를 설명하여 source review를 완료한다.
5. `REPORT_REQUIREMENTS`에서 요구한 예상표/계산/필수 파형 구간을 simulation 전에 계산하고, 필수 캡처·로그·특정 시점 목록을 `REPORT_CAPTURE_CHECKLIST`로 확정한다.
6. VS Code `02 Simulate`로 정상 Icarus simulation을 실행한다.
7. 실제 PASS/FAIL, check count, 필요한 log/VCD를 확인한다.
8. 사용자가 VaporView에서 **교안이 요구한 전체/확대 파형과 신호**를 실제로 관찰하고 캡처한다.
9. 시험 조건 → 예상 결과 → 관찰 결과 → 해석 순서로 각 필수 구간을 설명한다.
10. `MODIFICATION_REQUIRED = REQUIRED`인 경우에만 교안 지정 변경을 수행한다.
11. 수정 실험의 예상 failure 시점/원인을 먼저 계산한 뒤 별도 run의 실제 FAIL expected/actual을 확인한다.
12. DUT를 정상 source로 복구하고 교안이 요구하는 recovery PASS/check를 별도 run에서 재확인한다.
13. 정상/변경/복구 evidence 종류는 `REPORT_REQUIREMENTS`에 명시된 범위만 필수로 보존한다.
14. `REPORT_REQUIREMENTS` 체크리스트를 다시 검사해 누락된 표·계산·로그·파형·설명·Vivado 사전 계획을 채운다.

simulation 실행 성공 ≠ 기능 검증 성공이다. PASS는 waveform 검증을 대체하지 않는다. 필수 screenshot과 설명은 모든 required experiment에 필요하며 대표 사례는 전체 TB 검사 범위를 대신하지 않는다.

PRE는 고정 목차를 기계적으로 따르지 않는다. `REPORT_REQUIREMENTS`가 지정한 항목을 우선하여 설계 원리 → RTL/TB → 시험 입력 → expected 계산 → 실제 VS Code simulation → 필수 waveform → 해석 → 필요한 Vivado/board 사전 계획 순으로 구성한다. 수정 실험이 REQUIRED이면 실제 실패/복구 기록을 포함하고, NOT_REQUIRED이면 해당 절 자체를 만들지 않는다. 아직 수행하지 않은 Vivado implementation, FPGA board 결과, 실제 측정값은 작성하지 않는다. 학생 검토와 PRE Markdown/image QA 후 PRE 문서 제작으로 진행하며 POST gate를 요구하지 않는다.

## 13. Vivado 단계별 기록

| 단계 | 확인 및 기록 |
|---|---|
| A. Behavioral Simulation | reviewed source/top/TB, 실제 run, waveform 및 사용자 관찰, expected/observed |
| B. Synthesis | 실제 상태와 log/report |
| C. Implementation | 실제 상태와 log/report |
| D. DRC | 실제 error/warning 및 report 근거 |
| E. Timing report | constraint 유무, 실제 수치와 report 적용 범위 |
| F. Bitstream generation | 생성 상태, 파일 경로/크기/SHA-256, source/run 근거 |
| G. Program Device | 실제 programming 기록/화면, 사용 파일의 직접 확인 근거 |
| H. Board functional verification | 실제 입력 조건, 사용자 관찰/측정 및 최종 선정 사진 |

수업자료가 요구하는 Vivado GUI는 학생이 수행하고 Codex는 결과 파일/report/log를 검사한다. PRE에서 검토한 동일 RTL/TB/XDC를 사용하며 변경은 이유, 변경 전후 식별, 재검증 기록을 남긴다.

bitstream 생성 ≠ board 동작 검증, Programmed 화면 ≠ 특정 회로 정상 동작, simulation PASS ≠ DRC/timing PASS, timing N/A ≠ timing 검증 완료이다. clock 없는 조합논리회로에서 사용자 timing constraint가 없고 수치가 N/A라면 그 사실만 기록하고 timing PASS라고 쓰지 않는다. 실제 확인한 DRC warning을 숨기지 않으며 없는 warning을 추정하지 않는다.

bitstream의 저장 경로가 확인되어도 실제 Program Device에 사용된 파일이라고 단정하지 않는다. 사용 파일의 직접 근거가 없으면 “생성 파일 경로 확인; programming 사용 파일 대응은 확인하지 못함”처럼 범위를 명시한다.

## 14. 팀 분담과 증거 상태

수행 사실, 원본 증거의 접근 여부, 검증 결과를 별도 필드로 기록한다. 다음 상태는 내부 evidence 상태이며 stage의 PASS를 뜻하지 않는다.

| 내부 상태 | 의미 |
|---|---|
| LOCAL_VERIFIED | 현재 PC에서 original evidence를 직접 확인함; 확인한 항목/범위를 함께 기록 |
| TEAM_CONFIRMED | 팀원이 해당 stage를 수행했다는 사실을 사용자가 확인함; 결과 성공은 별도 근거 필요 |
| TEAM_PROVIDED | 팀원이 제공한 original evidence를 현재 환경에서 직접 확인함 |
| EVIDENCE_PENDING | 수행 사실은 확인됐으나 original evidence를 아직 전달받지 못함 |
| NOT_VERIFIED | 수행 여부 자체를 확인하지 못함 |
| NOT_APPLICABLE | 해당 단계가 적용되지 않음; 수업 요구/설계 근거와 사유 필요 |

TEAM_CONFIRMED인 수행 사실과 EVIDENCE_PENDING인 원본 전달 상태는 함께 기록할 수 있다. 현재 PC에 파일이 없음 ≠ 실험을 수행하지 않음이다. 명시적인 미수행 확인에만 NOT_PERFORMED를 사용한다. 필수 증거가 pending이면 gate를 통과시키지 않는다. 팀 제공 증거의 stage/source/run/확인자/확인 범위를 기록하며 사용자 파형 확인도 별도로 유지한다.

본문에는 내부 상태명을 노출하지 않는다. 예: “팀 분담에 따라 별도 환경에서 수행되었으며, 현재 작성 환경에는 일부 원본 구현 기록이 보관되어 있지 않다.” 증거가 없다는 이유로 미수행이라 쓰거나 팀 수행 확인만으로 정상 동작이라고 쓰지 않는다.

## 15. 사용자 board 영상/캡처 handoff

board 원본 영상 정리와 보고서용 캡처 생성은 사용자 담당이다.

1. 실험 후 촬영한 원본 영상을 정리한다.
2. 실험 번호별로 분류한다.
3. 보고서에 사용할 대표 장면을 선택한다.
4. screenshot/capture를 생성한다.
5. 최종 사진 파일명을 실험 번호와 시험 조건이 드러나게 정리한다.
6. 사진별 입력 조건과 실제 관찰 결과를 확인한다.

기본 handoff는 evidence/board/LABx/frames/이며 사용자가 최종 선택한 사진만 저장하는 것을 권장한다. 파일명 규칙은 LABx_<실험번호>_<회로명>_<시험조건>.png이다. 파일명은 조건 추적용이며 입력값의 사실 근거는 사용자 확인이다.

기본 구조:

    evidence/board/LABx/
    └─ frames/

raw_videos/, contact_sheets/, classification/은 필수 요소가 아니다. 사용자가 필요하면 별도 보관하며 자동화는 최종 선정 frames/ 기준으로 진행한다. Codex는 raw video의 대표 장면 임의 선정, 사용자 확인 없는 frame 추출, 영상에서 실험 번호/버튼/스위치 상태 추론, 제출 사진 자동 선정을 기본적으로 수행하지 않는다.

handoff 후 Codex는 파일 존재, evidence 경로, fact sheet/validation summary 연결, report image link, 캡션과 입력조건 정합성, DOCX/PDF 배치, Git 포함/제외 분류를 처리한다. 사진으로 직접 확인되지 않는 논리 극성/내부 신호값은 추론하지 않는다. 조교 선정 확인 전 DEMO_SELECTION_STATUS = NOT_SELECTED를 유지하며 해당 수업의 선정 실험 수와 실제 시연 번호를 확인한다.

## 16. POST 작성 전 사실 재검사

POST 본문 작성 전에 다음을 반드시 생성/갱신한다.

- reports/_automation/LABx_post_fact_sheet.md
- reports/_automation/LABx_validation_summary.md

PRE/POST manifest는 reports/_automation/LABx_pre_manifest.md 및 LABx_post_manifest.md로 분리한다. fact sheet는 본문용 사실/근거, validation summary는 검사 결과/미확인 항목, manifest는 stage/source/run/evidence 추적을 담당한다. 같은 항목의 최신 근거와 확인 시각을 연결하며 불일치하면 먼저 해결한다.

두 POST 문서의 최소 필드는 실제 RTL 핵심 구조, simulation test condition, expected, 사용자 확인 observed waveform, PASS/case count, Vivado version, FPGA part, synthesis/implementation 상태, DRC, timing, bitstream path와 확인 범위, Programmed evidence, board evidence, team-performed stage, unknown/unverified item이다. 각 사실에 source/run/파일 또는 명시적 사용자 관찰 근거를 붙인다. Work는 전달받은 두 문서를 report draft의 우선 source of truth로 사용한다. 값이 충돌하거나 필수 사실이 없으면 추정하여 채우지 않는다.

작성 전과 freeze 직전에 manifest/fact sheet/validation summary를 현재 파일과 다시 검사한다. 오래된 metadata, 추출 미완료 상태, 없는 frame 링크, 과거 cursor/Value 설명, 실제 이미지 수와 다른 manifest는 갱신하거나 최종 source of truth에서 제외한다. 과거 internal 문서의 상태를 최종 사실로 사용하지 않으며 원본 evidence를 삭제하지 않는다.

## 17. POST 본문 구성과 내용 종료 조건

명시적 REQUIRED_FORMAT이 없을 때 POST 기본 구성은 다음과 같다.

1. 실험 목적 및 검증 방법
2. 실험별 설계 및 검증 결과: 설계/핵심 구조 → 시험 조건 → 예상 결과 → 관찰 결과 → 해석 → waveform → 선정 실험의 board 검증
3. Vivado 구현 및 검증 기록: 구현 환경, synthesis/implementation, DRC/timing
4. VS Code와 Vivado 시뮬레이션 비교
5. 결론
6. 부록 A. PASS/log 보조 evidence
7. 부록 B. Program Device evidence
8. 부록 C. 제출 및 구현 추적 기록
9. 참고문헌

board는 해당 실험 안에서 simulation → waveform → board validation 순서로 끝낸다. 설명은 시험 조건 → 예상 동작 → 실제 관찰 → 비교로 간결하게 쓴다. 전체 결과 종합표, 별도 “추가 확인 및 정리” 절, board만 모은 독립 장, 이미 설명한 expected/observed 반복은 기본적으로 만들지 않는다. 비교 절은 플랫폼 간 대응/차이에 집중한다.

모든 required experiment, expected/waveform 비교, selected board experiment, 교수 요구 implementation evidence, factual uncertainty 명시, 중복 제거, inline citation, placeholder 0, broken link 0을 충족하면 기술 내용 수정을 종료한다. 이후 layout/QA로 진행한다. QA에서 사실 오류가 발견되면 freeze를 해제하고 관련 사실/Markdown/gate를 재검사한다.

## 18. Work → repository와 Markdown 최종 QA

Work 작성 완료는 local 파일 저장 완료가 아니다. 확정 내용을 export하여 PRE는 reports/pre/LABx_pre_report.md, POST는 reports/post/LABx_post_report.md에 저장한다. repository Markdown을 먼저 고정하고 PDF를 만든다.

임시 LABx_figures/를 기본 workflow로 사용하지 않는다. Markdown 파일 위치 기준 상대경로로 실제 evidence를 직접 참조한다.

- ../../evidence/vscode/LABx/...
- ../../evidence/vivado/LABx/...
- ../../evidence/board/LABx/frames/...

PDF 전 모든 image link를 해석하여 실제 파일 존재를 검사한다. missing image = 0만 진입을 허용한다. 다음 검사는 자동으로 가능한 항목과 사람 판단 항목을 구분하며, 단순 문자열 존재를 사실 확인으로 취급하지 않는다.

| QA 항목 | 방법/통과 기준 |
|---|---|
| placeholder | 대괄호 빈칸/TODO/작성용 표식 등 템플릿 placeholder count = 0; 인용 번호와 정상 HDL 문법은 구분 |
| 이미지/링크 | Markdown 기준 경로 검사, broken image = 0 및 broken link = 0 |
| 편집 메모 | HTML 편집 주석 = 0; template 지침/내부 QA 메모도 본문에서 제거 |
| 제출 추적 | 수업자료/REPORT_REQUIREMENTS가 요구하는 범위의 GitHub URL, tag, CODE COMMIT을 확인. 요구되지 않은 commit hash를 제출 본문에 강제하지 않음 |
| 참고문헌 | inline citation ↔ 참고문헌 항목 대응; 단순 참고문헌 존재만으로 통과시키지 않음 |
| board | POST 선정 실험의 최종 frames 존재, 실험 번호/입력/관찰/사용자 확인 대응 |
| bitstream | POST 경로와 확인 범위 명시; 생성 파일과 programming 사용 파일 구분 |
| 팀 문장 | 원본 부재를 미수행으로 오해하지 않으며 근거 범위를 넘어 성공을 주장하지 않음 |

PRE에는 실제 board evidence/bitstream 결과를 요구하지 않고 verification plan을 확인한다. POST 필수 evidence 누락을 NOT_APPLICABLE로 우회하지 않는다. 확인되지 않은 값은 정확한 한계 문장으로 쓰되 필수 증거 gate는 pending 상태로 유지한다.

submit tag/commit hash를 보고서에 넣는 것은 해당 수업자료 또는 `REPORT_REQUIREMENTS`가 요구할 때만 필수이다. 사용할 경우 승인된 예정 tag는 아직 생성되지 않았음을 명시하고 존재하는 링크로 꾸미지 않는다. PDF QA에서는 이름/계획을 확인하고 GATE 8에서 실제 tag/원격 링크를 확인한다. CODE COMMIT은 실제 확인된 source commit이며 현재 HEAD를 근거 없이 source commit으로 쓰지 않는다.

## 19. Git commit/staging/tag 분리

이 절은 향후 사용자가 명시적으로 요청한 경우의 절차이다. 이번 문서 개선에서는 git add/commit/push/tag를 실행하지 않는다. reset/rebase/다른 branch checkout/삭제/중요 파일 덮어쓰기 역시 별도 명시적 지시가 필요하다.

| 역할 | 포함 대상 |
|---|---|
| A. CODE COMMIT | 검증된 RTL/TB/XDC/simulation.json source 상태 |
| B. EVIDENCE COMMIT | simulation/waveform/board/fact sheet 등 근거 |
| C. REPORT SOURCE COMMIT | 최종 Markdown report |
| D. FINAL REPORT COMMIT | DOCX/PDF |

보고서의 “code commit”은 A이다. D를 code commit으로 쓰거나 문서가 자기 자신을 포함하는 commit hash를 요구하지 않는다. source commit 외 source hash/run-to-source 근거와 dirty 상태도 확인한다.

git add .은 기본적으로 사용하지 않는다. include/exclude/review 분류 → explicit path staging → git diff --cached --name-only → 예상 파일 목록/파일 수 검증 → commit 순서로 진행한다. 이미 staged된 사용자 파일도 확인하며 자동으로 섞거나 unstage하지 않는다. 의도하지 않은 파일이 있으면 commit을 멈춘다.

기본 제외 후보는 .xpr, .lnk, local generated folders, raw video, contact sheet, temporary comparison image, stale metadata, 불필요한 intermediate file이다. 수업 요구/repository 정책상 필요하면 검토 후 포함한다. raw/contact/comparison 이미지를 자동으로 제출 commit에 넣지 않는다.

PRE/POST tag는 LABx_PRE_SUBMIT / LABx_POST_SUBMIT로 구분한다. 기존 tag를 덮어쓰지 않는다. POST tag는 최종 DOCX/PDF가 포함된 FINAL REPORT COMMIT에 생성한다. 승인된 향후 제출 순서는 final report commit → annotated tag 생성 → main push → tag push → GitHub web 확인이다. 실제 branch가 main인지 확인하고 다르면 임의 checkout/push하지 않는다. 제출 gate만 통과해도 자동 Git 작업 권한이 생기지 않는다.

main push 성공 후에만 tag를 push한다. local HEAD / origin/main / 원격 tag의 peeled commit 및 ahead/behind를 확인하고 기존 modified/untracked가 그대로인지 검사한다. GitHub web 확인은 실제 웹에서 제출 파일과 해당 버전을 확인한 경우에만 완료로 기록한다.

## 20. DOCX/PDF 기본 레이아웃

다음은 내부 기본값이며 수업의 명시적 REQUIRED_FORMAT이 있으면 그 범위를 우선 적용한다.

- A4 portrait, 표지 1페이지 독립 1단.
- 본문부터 참고문헌/부록 끝까지 고정 2단, 페이지 번호는 본문부터.
- waveform도 single-column width로 배치하고 세부 값은 본문의 시험조건/예상/관찰 설명으로 보완.
- waveform 때문에 2단 → 1단 → 2단 full-width section을 기본적으로 만들지 않음.
- 최종 제출은 PDF; editable DOCX도 관리.

세로 board 사진이 column 높이를 과도하게 차지하면 원본 evidence를 수정하지 않고 DOCX 안에서 90도 회전할 수 있다. column width에 맞게 축소하고 aspect ratio를 유지하며 caption은 그림 바로 위/아래에 둔다. 사진이 본문보다 과도하게 커지지 않게 한다.

회전은 버튼/LED/표시부가 자연스러운 방향이어야 하며 crop/이미지 내용 수정/비율 왜곡을 하지 않는다. 긴 표와 bitstream path는 column 안에서 cell 줄바꿈하고 삭제/생략하지 않는다. 설명과 대응 그림을 가까이 두되 특정 페이지 수를 강제하거나 글꼴을 지나치게 작게 만들지 않는다.

일반 본문은 Justify를 기본값으로 한다. 목적, 설계/핵심 구조, 시험 조건, 예상, 관찰, 해석, board, Vivado 구현, VS Code/Vivado 비교, 결론, 부록 설명 문단에 적용한다. 표지/제목/그림 caption/표 제목/표 cell/긴 path/commit hash/독립 code string/참고문헌은 제외한다. 영문/코드가 많은 문단의 spacing이 비정상적이면 해당 문단만 left-align 예외로 처리한다.

## 21. PDF visual QA

DOCX/PDF 생성 성공만으로 완료 처리하지 않는다. PDF의 모든 페이지를 이미지로 render하고 실제로 검사한다. DOCX도 최종 PDF와 대응하는 layout을 확인한다.

검사 항목: cover 독립, 실제 고정 2단, clipping, overlap, broken Korean glyph, blank page, table overflow, image distortion, caption separation, board photo orientation, excessive whitespace, long bitstream path wrapping, 본문부터 page number, reference correspondence, justified paragraph spacing 이상.

발견한 문제는 layout을 수정하고 재생성/재render한 최종 모든 페이지를 검사한다. 이전 PDF의 QA 기록을 새 PDF에 재사용하지 않는다. 최종 파일 식별, render 경로, 검사 범위, 결과를 validation summary에 남긴다. visual QA까지 통과한 산출물만 PDF VERIFIED이다.

## 22. Workflow gates

각 gate는 충족 근거/확인자/미확인 항목을 기록한다. 조건부 gate는 해당 실험의 요구사항 상태에 따라 적용한다.

| Gate | 통과 조건 |
|---|---|
| GATE 0 — REQUIREMENTS READY | 해당 실험의 EXPERIMENT_REQUIREMENTS + REPORT_REQUIREMENTS 추출, 출처 기록, 학생/ChatGPT 검수 |
| GATE 1 — SOURCE READY | 자동 세팅 diff 검수 + 학생 이해 확인 + reviewed source |
| GATE 2A — NORMAL VS CODE VERIFIED | 정상 PASS/check + 사용자 필수 waveform 관찰/screenshot + REPORT_REQUIREMENTS의 정상 검증 항목 충족 |
| GATE 2B — MODIFICATION VERIFIED | **조건부**. MODIFICATION_REQUIRED=REQUIRED인 실험에서 교안 지정 변경 → 실제 FAIL/원인 비교 → 복구 → 요구된 recovery 확인 |
| GATE 3 — PRE REPORT READY | 해당 실험 REPORT_REQUIREMENTS 전 항목 충족 + pre Markdown/image/내용 QA |
| GATE 4 — VIVADO VERIFIED | Behavioral Simulation + 요구 implementation 단계 + DRC/timing/bitstream evidence 및 정확한 적용 범위 |
| GATE 5 — BOARD EVIDENCE READY | 사용자가 선정 실험의 최종 board frames를 준비하고 입력 조건/관찰을 확인 |
| GATE 6 — POST CONTENT FROZEN | 최신 fact sheet + validation summary + repository final Markdown + placeholder/image QA 및 내용 종료 조건 |
| GATE 7 — PDF VERIFIED | 최종 DOCX/PDF + 모든 페이지 render/visual QA |
| GATE 8 — SUBMITTED | 해당 수업의 실제 제출 방식 완료. Git/GitHub 제출이 요구되는 경우에만 명시적 사용자 승인 아래 필요한 commit/tag/push/원격 확인 |

PRE 경로는 `GATE 0 → 1 → 2A → [2B if REQUIRED] → 3 → 7`이며, 실제 제출까지 진행할 때만 `→ 8`을 추가한다. 수정 실험이 NOT_REQUIRED이면 GATE 2B를 생략하며 미통과로 취급하지 않는다. UNKNOWN이면 교안을 재확인하기 전 PRE 완료로 넘기지 않는다. POST는 동일 source와 요구사항을 기준으로 4 → 5 → 6 → 7 → 8을 추가한다. source 또는 수업 요구 해석이 바뀌면 영향받는 gate를 다시 통과한다.

문서 개선 자기 검수에서는 수업 요구와 내부 기본값 구분, 실험별 EXPERIMENT_REQUIREMENTS/REPORT_REQUIREMENTS 분리, 조건부 수정 실험, 동적 PRE 구성, 팀 원본 부재/미수행 구분, Programmed/board 구분, bitstream 사용 파일 주장 범위, Work/local handoff, Git 요구사항의 조건부 적용을 확인한다.
