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
- LAB2 실험 후 제출: **8개 실험의 실제 동작 영상을 순서대로 모두 촬영하여 결과보고서에 반영**한다. 수업 중 시연은 그중 **1개 실험**을 선택/지정하여 수행한다. 시연 실험 번호가 확인되기 전에는 DEMO_SELECTION_STATUS = NOT_SELECTED를 유지하고 임의 선택하지 않는다.
- board 사진은 영상의 대체물이 아니다. 실험별 POST 요구에서 별도 사진이 요구되면 추가하고, 그렇지 않으면 8개 동작 영상이 기본 증거다.
- 전체 실험 inclusion 및 required evidence는 PRIMARY_BOUNDARY_CASE 분석과 별도로 검사한다. PRIMARY는 각 실험의 대표 waveform 설명 구간이며 전체 실험이나 필수 증거를 대신하지 않는다.
- 모든 실험의 board raw video를 보존한다. video 존재에서 시연 실험을 추론하지 않는다. 시연 1개는 실제 수업 지시/선택 결과로만 확정한다.

### LAB2 수업자료 적용 기준

LAB2에서는 **실험별 요구사항이 서로 다를 수 있음**을 기본 전제로 한다. 공통 workflow가 특정 실험의 항목을 임의로 강제하지 않는다.

각 실험을 시작하기 전에 반드시 수업자료에서 다음 요구사항을 단계별로 분리하여 추출한다.

1. `EXPERIMENT_REQUIREMENTS`: 실제 설계·실행·검증에서 해야 할 일
2. `PRE_REPORT_REQUIREMENTS`: 실험 전에 반드시 들어가야 할 설계·예상·VS Code simulation·파형·설명
3. `POST_REPORT_REQUIREMENTS`: 실험 후에 반드시 들어가야 할 Vivado·구현·bitstream·board·GitHub·비교/해석
4. `REPORT_CAPTURE_CHECKLIST`: 실제 실험 당일 빠뜨리지 않고 수집해야 할 화면·로그·사진·영상·파일

PRE와 POST 요구를 같은 `REPORT_REQUIREMENTS`로 뭉개지 않는다. 같은 교안이라도 “실험 전 레포트”와 “실험 후 레포트” 요구가 다를 수 있고, POST는 공통 요구와 실험별 추가 요구를 모두 가진다.

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

#### PRE_REPORT_REQUIREMENTS 최소 필드

- 교수/조교가 명시한 PRE 필수 제목 또는 내용 항목
- 설명해야 할 RTL/TB/`simulation.json`/XDC 역할
- 반드시 작성할 상태표/예상표/계산 과정
- 정상 PASS log 요구 여부
- 정상 전체 waveform 요구 여부
- 확대 waveform의 필수 시점/신호/구간
- 수정/실패/복구 로그 또는 비교표 요구 여부
- 특정 시점 expected/actual 비교 요구
- Vivado 시작 전 작성해야 할 board 입력 순서/예상 LED 등
- 설정 변경/오류/도구 관련 기록 요구
- 제출 본문에 넣지 않을 내부 추적 항목
- 요구 출처(교안 페이지/슬라이드/문장)

#### POST_REPORT_REQUIREMENTS 최소 필드

POST는 `COMMON_POST_REQUIREMENTS`와 실험별 `EXPERIMENT_POST_REQUIREMENTS`를 합쳐 관리한다.

공통 요구 최소 항목:
- Vivado Functional/Behavioral Simulation의 source hierarchy 화면, PASS/정상 파형, VS Code 결과와의 비교
- synthesis/implementation 수행 결과와 각 단계의 성공/실패 근거
- 실제 warning 목록과 warning별 해석
- 사용 FPGA/device, pin/XDC, clock constraint(해당 LAB에서 요구한 값)
- `write_bitstream Complete` 화면 또는 동등한 bitstream 생성 완료 근거
- 생성 bitstream 파일명/상대경로와 실제 존재 확인
- Program Device/장치 programming 화면
- 실제 board 입력 조건과 사진/영상, 관찰 결과
- 통합판이면 mode 전환, LCD mode명, 현재 회로 출력이 한 흐름으로 확인되는 증거
- GitHub에 source/report/관찰 자료를 연결하고 README 등에서 제출 자료의 위치를 찾을 수 있게 하는 요구
- 미수행/미확인 항목을 완료처럼 쓰지 않고 구분하는 요구

실험별 추가 요구 최소 항목:
- 해당 실험의 구체적인 Vivado 파형에서 보여야 할 신호/조건
- 해당 실험의 물리 pin/부품/스위치/버튼/LED 설정
- 실제 board에서 재현해야 할 동작(예: 초기화·증가·감소·순환)
- 반드시 캡처해야 하는 synthesis/implementation/bitstream 화면
- 특별히 기록해야 할 warning/constraint/설정 변경
- 사진/영상의 필수 장면과 입력 조건
- README/GitHub 연결 방식
- 요구 출처(교안 페이지/슬라이드/실험 폴더의 “실험 후 레포트” 문장)

#### 기존 `REPORT_REQUIREMENTS` 호환 규칙


기존 파일명이나 오래된 문서에서 `REPORT_REQUIREMENTS`라고만 되어 있으면 문맥에 따라 PRE 또는 POST로 분해해 갱신한다. 새 LAB에서는 모호한 단일 파일을 만들지 않는다.

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

## 9A. 실험 후 레포트 요구사항 추출

POST를 시작하기 전에 PRE 요구를 재사용하지 말고 교안의 **공통 실험 후 레포트 슬라이드 + 각 실험 폴더/슬라이드의 개별 실험 후 레포트 요구**를 다시 읽는다.

추출 순서:

1. `COMMON_POST_REQUIREMENTS` — LAB 전체에 공통으로 적용되는 요구
2. `EXPERIMENT_POST_REQUIREMENTS` — 각 실험에만 추가로 적용되는 요구
3. 둘을 합친 `POST_CAPTURE_CHECKLIST` — 실험 당일 실제로 수집할 evidence
4. 학생/ChatGPT 검수 후 Vivado/board 수행

현재 확인된 공통 POST 요구의 예시는 다음과 같다.
- Vivado 기능 simulation과 VS Code 결과 비교
- 합성·구현 결과와 warning 해석, pin/clock/timing 조건, bit 파일 기록
- Program Device 화면과 실제 입출력 사진·영상
- 통합판의 버튼 mode 전환·LCD mode명·회로 출력 동시 확인
- GitHub에 source·report·관찰 자료를 연결하고 미수행 항목을 구분

실험별 요구 예시는 다음과 같이 별도 저장한다.
- Vivado Sources hierarchy + simulation PASS waveform
- 사용 부품/pin/clock constraint와 synthesis/implementation 결과
- `write_bitstream Complete`, 생성 파일, 남은 warning 및 해석
- 해당 회로의 실제 board 동작 사진/영상
- GitHub/README에서 source/report/photo/video 연결

위 예시는 현재 제공된 LAB2 자료에서 확인된 요구를 반영한 것이며, 다음 LAB에는 자동 일반화하지 않고 새 자료에서 다시 추출한다.

권장 파일:
- `reports/_automation/LABx_COMMON_POST_REQUIREMENTS.md`
- `reports/_automation/LABx_<experiment>_POST_REQUIREMENTS.md`
- `reports/_automation/LABx_POST_CAPTURE_CHECKLIST.md`

POST 요구 추출이 끝나기 전에는 “Vivado 몇 장, board 몇 장이면 충분하다”고 임의 결정하지 않는다.

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

실제 작동 영상의 GitHub 제출 여부는 LAB별 교수·조교·수업 요구를 우선하여 결정한다. **수업 요구**인 영상 제출과 **내부 workflow**인 SHA-256/중복 검사를 구분한다. 영상 제출 요구가 없으면 raw video를 local에 보관하거나 최종 제출에 불필요할 때 Git에서 제외할 수 있다. GitHub 영상 제출이 요구되면 사용자가 선정한 최종 영상은 공식 제출 evidence이며 `evidence/board/LABx/raw_videos/`에 정리하여 POST 작성 전에 video evidence commit과 push까지 확인한다.

영상 내용의 정리와 선택은 사용자 담당이다.

1. 실제 FPGA 동작을 촬영하고 실험별 원본 영상을 분류한다.
2. 제출할 최종 영상을 선정하고 불필요한 영상의 제거 여부를 판단한다.
3. 파일명과 실험 번호 대응, 각 영상의 실제 입력·출력 동작을 확인한다.
4. 보고서용 정지 사진이 필요하면 대표 frame/capture를 직접 선택·생성한다.
5. 사진별 입력 조건과 실제 관찰 결과를 확인한다.

GitHub 영상 제출이 요구되는 LAB의 권장 구조는 다음과 같다. `raw_videos/`는 시간에 따른 입력 조작과 출력 변화를 보여주는 실제 작동 영상 제출 경로이고, `frames/`는 보고서 본문에 삽입하는 정지 이미지 경로이다. board 사진이 영상 제출을 대신하지 않으며, 영상만으로 보고서용 사진이 자동 확보된 것도 아니다.

    evidence/board/LABx/
    ├─ raw_videos/LABx_01_<experiment>_board.mp4
    ├─ raw_videos/LABx_02_<experiment>_board.mp4
    └─ frames/LABx_<experiment>_<condition>.png

`contact_sheets/`와 `classification/`은 내부 검토용 선택 자료이며 제출 폴더에 자동 포함하지 않는다. 영상 제출 요구가 없는 LAB에서 `raw_videos/`도 필수 구조가 아니다. Codex는 임의 frame 추출, 영상만 보고 실험 번호·버튼·스위치 상태 추론, 최종 영상 자동 선정, 임의 재인코딩·압축, 사용자 확인 없는 rename을 기본적으로 수행하지 않는다.

handoff 후 Codex는 파일 수·확장자·크기·SHA-256·중복, evidence 경로, fact sheet/validation summary 연결, report image/link, 캡션과 입력조건 정합성, DOCX/PDF 배치, Git 포함/제외 분류를 점검한다. 사진으로 직접 확인되지 않는 논리 극성/내부 신호값은 추론하지 않는다. 조교 선정 확인 전 DEMO_SELECTION_STATUS = NOT_SELECTED를 유지하며 해당 수업의 시연 실험 수와 실제 시연 번호를 확인한다.

### VIDEO EVIDENCE READY — 영상 제출이 요구되는 LAB

POST 본문을 쓰기 전에 요구된 실험 번호와 최종 영상의 1:1 대응을 확인한다. file count, filename, extension, 개별 bytes/MB와 전체 upload size, SHA-256, duplicate SHA, Git status, 일반 GitHub push 가능성을 점검하고 사용자가 최종 제출 대상으로 확인했는지 기록한다. 100 MB 이상 파일은 일반 GitHub repository push에 문제가 될 수 있음을 commit 전에 사용자에게 알리며 자동 압축·재인코딩하지 않는다.

명시적 Git 작업 지시가 있으면 선정된 영상만 경로별로 stage하고 `git diff --cached --name-only`를 예상 파일 목록·수와 대조한다. contact sheet, 임시 frame, 비교 이미지, 관련 없는 untracked 파일은 video commit에 자동 포함하지 않는다. VIDEO EVIDENCE COMMIT → origin/main push → GitHub 경로 접근 확인을 마쳐야 이 gate를 통과한다. 요구가 없으면 `NOT_APPLICABLE`, 요구 여부가 불명확하면 `UNKNOWN`으로 두고 수업 요구를 확인한다. gate 통과 전에는 최종 POST 영상 URL과 제출 완료 상태를 확정하지 않는다.

## 16. POST 작성 전 사실 재검사

POST 본문 작성 전에 다음을 반드시 생성/갱신한다.

- reports/_automation/LABx_post_fact_sheet.md
- reports/_automation/LABx_validation_summary.md

PRE/POST manifest는 reports/_automation/LABx_pre_manifest.md 및 LABx_post_manifest.md로 분리한다. fact sheet는 본문용 사실/근거, validation summary는 검사 결과/미확인 항목, manifest는 stage/source/run/evidence 추적을 담당한다. 같은 항목의 최신 근거와 확인 시각을 연결하며 불일치하면 먼저 해결한다.

두 POST 문서의 최소 필드는 실제 RTL 핵심 구조, simulation test condition, expected, 사용자 확인 observed waveform, PASS/case count, Vivado version, FPGA part, synthesis/implementation 상태, DRC, timing, bitstream path와 확인 범위, Programmed evidence, board evidence, team-performed stage, unknown/unverified item이다. 각 사실에 source/run/파일 또는 명시적 사용자 관찰 근거를 붙인다. Work는 전달받은 두 문서를 report draft의 우선 source of truth로 사용한다. 값이 충돌하거나 필수 사실이 없으면 추정하여 채우지 않는다.

영상 제출 판단을 위해 fact sheet/validation summary에 `Board video required: YES/NO/UNKNOWN`, `Required video count`, `Final video count`, `Video evidence commit`, `Video GitHub URL`, `Video path`, `Video GitHub verified: YES/NO`를 필요 시 기록한다. required일 때는 본문 작성 전에 최종 영상 수·실험 번호·commit·원격 URL을 확인하고, 수업 요구가 아니라 내부 점검인 SHA-256과 중복 결과는 별도 provenance로 관리한다. `UNKNOWN`이나 필수 영상 미확보 상태를 완료로 해석하지 않는다.

작성 전과 freeze 직전에 manifest/fact sheet/validation summary를 현재 파일과 다시 검사한다. 오래된 metadata, 추출 미완료 상태, 없는 frame 링크, 과거 cursor/Value 설명, 실제 이미지 수와 다른 manifest는 갱신하거나 최종 source of truth에서 제외한다. 과거 internal 문서의 상태를 최종 사실로 사용하지 않으며 원본 evidence를 삭제하지 않는다.

### POST 기본 실행 순서

1. reviewed source와 CODE COMMIT 확인
2. VS Code simulation/evidence 확인
3. Vivado simulation·implementation/evidence 확인
4. 실제 board 기능 시험과 사용자 관찰 확인
5. 사용자가 제출 영상 정리·선정
6. 사용자가 필요한 보고서용 frame/capture 정리
7. Codex가 영상 수·크기·hash·중복·Git 상태 검사
8. 영상 제출 required이면 명시적 지시 아래 VIDEO EVIDENCE COMMIT 생성
9. required이면 video commit을 origin/main에 push
10. required이면 GitHub 영상 경로와 commit-fixed URL 확인
11. fact sheet / validation summary / manifest 갱신
12. POST Markdown 작성
13. Markdown 내용·그림·링크 QA
14. 명시적 지시 아래 REPORT SOURCE COMMIT 생성
15. DOCX/PDF 생성
16. 모든 페이지 visual QA 및 Markdown과 산출물 대조
17. 명시적 지시 아래 FINAL REPORT COMMIT 생성
18. 해당 제출본을 가리키는 annotated final tag 생성
19. main push 성공 후 tag push
20. GitHub web에서 보고서·영상 경로와 tag 최종 확인

영상 제출이 required이면 8~10을 12보다 먼저 마친다. 영상 제출이 `NOT_APPLICABLE`이면 8~10을 생략하고 사유를 기록한다. 단계의 순서는 제출 기준이며 Git add/commit/push/tag는 별도 사용자 지시가 있을 때만 실행한다.

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

모든 required experiment, expected/waveform 비교, board experiments / demo experiment, 교수 요구 implementation evidence, factual uncertainty 명시, 중복 제거, inline citation, placeholder 0, broken link 0을 충족하면 기술 내용 수정을 종료한다. 영상 제출 required인 LAB에서는 사용자 선정 영상 준비, VIDEO EVIDENCE COMMIT·remote push·GitHub URL 확인, 보고서의 source/video URL 반영까지 완료되어야 POST CONTENT FROZEN을 통과한다. 이후 layout/QA로 진행한다. QA에서 사실 오류나 새 제출 요구를 발견하면 freeze를 해제하고 관련 사실/Markdown/gate를 재검사한다.

## 17A. 보고서 문체·내용 전개 고정 원칙

LAB2 PRE 작성 과정에서 확정한 다음 작성 원칙을 PRE/POST 공통 기본값으로 사용한다. 수업의 명시적 형식이 있으면 그 요구를 우선한다.

### 전체 전개
- 자료를 요약하는 문서가 아니라 **설계 목적 → 핵심 RTL → 예상 동작 → 실제 검증 → 해석**의 흐름으로 쓴다.
- 파형/보드 설명은 논리적으로 **시험 조건 → 예상 결과 → 실제 관찰 → 해석** 순서를 지키되, 매 문단마다 `시험 조건/예상/관찰/해석` 라벨을 기계적으로 반복하지 않는다.
- 예: “35 ns 상승 edge에서 load와 transfer를 동시에 1로 두었다. stored는 새 입력 3을 저장하지만 value는 edge 직전 stored=A를 사용하므로 3A가 예상된다. 실제 파형에서도 stored=3, value=A가 확인되었고 다음 edge에서 33으로 변하였다.”처럼 자연스럽게 쓴다.
- `정상이다`, `예상대로 동작했다`만 쓰지 않고 **어떤 입력에서 어떤 expected와 실제 값이 일치했는지** 명시한다.
- 같은 사실을 표·본문·결론에서 반복하지 않는다. 표는 관계/값 비교, 본문은 계산 근거와 의미 해석을 담당한다.
- PRE는 설계와 예상 중심, POST는 **PRE 예상 → Vivado 실제 → board 실제 → 비교/해석** 중심이다.

### 문체
- 자연스러운 학생 공학 보고서체를 사용하고, 보고서 제작 과정·AI/automation 내부 사정을 드러내는 문장을 삭제한다.
- 영어가 더 자연스러운 기술어(reset, enable, hold, state, clock edge, tick, load, transfer, blank, scan, PASS/FAIL, TB)는 억지 번역하지 않고 문서 안에서 통일한다.
- 다음 표현은 피하고 실제 신호/동작으로 쓴다: `상태 버스`, `비에지`, `tick masking`, `순차 상태`, `제어 중지`, `에지의 소비`, `무지연 반응`.
- `제공된 자료에서 확인되지 않는다`, `재캡처하지 않았다`, `별도 화면은 사용하지 않는다`, `이 실험에는 수정 실험이 없다`처럼 작성 과정이 드러나는 문장은 제출 본문에서 제거한다.
- 내부 provenance 상태명, QA 메모, automation 용어를 제출 본문에 노출하지 않는다.

### 코드/표/그림
- 코드 전체 listing 대신 **설계 원리를 가장 잘 보여주는 핵심 RTL 1~2개 block**만 사용한다.
- wrapper, `simulation.json`, `input_frontend`는 해당 실험 원리를 이해하는 데 필요할 때만 본문에 설명한다.
- 그림은 많이 넣는 것이 목적이 아니라 각각 무엇을 증명하는지 설명한다.
- 표에 이미 있는 내용을 바로 아래 문단에서 그대로 반복하지 않는다.
- 수정 실험은 **무엇을 수정했는가 → 왜 잘못된 결과가 예상되는가 → 동일 TB에서 어디서 FAIL했는가 → 원복 후 다시 PASS했는가** 순서로 설명한다.

### 실험별 전개
- Counter/Divider/Register/Shift/PISO는 `설계 목적·동작 원리 → 핵심 RTL → 예상 동작 → simulation/파형 → 오류 검출(요구 시)`가 기본이다.
- Moore/Mealy는 `설계 목적 → state/output 관계 → 핵심 RTL → 예상 동작 → simulation → 오류 검출`.
- Segment Scan은 `설계 구조 → segment pattern/scan 원리 → 핵심 RTL → 예상 동작 → simulation → 오류 검출`.
- 08A Integrated는 `통합 구조 → mode별 기능 → 핵심 제어 RTL → 정상 통합 simulation → 대표 동작 검증 → 오류 검출`.
- 실험별 소제목은 완전히 동일하게 강제하지 않는다. 독자가 지금 무엇을 읽는지 빠르게 알 수 있도록 회로 특성에 맞게 선택한다.

### 보드 설명
- PRE에서는 N8/N4 조작, DIP/SW 설정, LED mapping, 1 kHz 실제 주기 같은 물리 조작 설명을 각 실험 본문에 흩뿌리지 않고 보드 계획 절에 모은다.
- POST에서는 각 실험의 board 결과가 실제 증거이므로 simulation → board → 비교가 자연스럽게 이어지게 하되, 공통 장비 설정은 한 번만 설명한다.
- 수행하지 않은 Vivado/board 결과는 계획 또는 미확인으로만 쓴다.

### 내용 freeze
- 기술 내용이 검증 완료되면 `CONTENT_FROZEN`으로 두고 이후에는 layout만 수정한다.
- PDF 시각 QA 때문에 검증된 expected, PASS/FAIL 시점, check 수, waveform 해석을 다시 쓰지 않는다.

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
| 제출 추적 | 수업자료/REPORT_REQUIREMENTS가 요구하는 범위의 GitHub URL, tag, CODE COMMIT을 확인. 영상 제출 required이면 VIDEO EVIDENCE COMMIT·실제 경로·요구된 영상 수·commit-fixed 영상 URL·최종 tag 이름을 대조하고 CODE COMMIT과 혼동하지 않음. 요구되지 않은 commit hash를 제출 본문에 강제하지 않음 |
| 참고문헌 | inline citation ↔ 참고문헌 항목 대응; 단순 참고문헌 존재만으로 통과시키지 않음 |
| board | POST 선정 실험의 최종 frames 존재, 실험 번호/입력/관찰/사용자 확인 대응 |
| bitstream | POST 경로와 확인 범위 명시; 생성 파일과 programming 사용 파일 구분 |
| 팀 문장 | 원본 부재를 미수행으로 오해하지 않으며 근거 범위를 넘어 성공을 주장하지 않음 |

PRE에는 실제 board evidence/bitstream 결과를 요구하지 않고 verification plan을 확인한다. POST 필수 evidence 누락을 NOT_APPLICABLE로 우회하지 않는다. 확인되지 않은 값은 정확한 한계 문장으로 쓰되 필수 증거 gate는 pending 상태로 유지한다.

submit tag/commit hash를 보고서에 넣는 것은 해당 수업자료 또는 `REPORT_REQUIREMENTS`가 요구할 때만 필수이다. 사용할 경우 승인된 예정 tag는 아직 생성되지 않았음을 명시하고 존재하는 링크로 꾸미지 않는다. PDF QA에서는 이름/계획을 확인하고 SUBMITTED gate에서 실제 tag/원격 링크를 확인한다. CODE COMMIT은 실제 확인된 source commit이며 현재 HEAD나 영상 commit을 근거 없이 source commit으로 쓰지 않는다.

## 19. Git commit/staging/tag 분리

이 절은 향후 사용자가 명시적으로 요청한 경우의 절차이다. 이번 문서 개선에서는 git add/commit/push/tag를 실행하지 않는다. reset/rebase/다른 branch checkout/삭제/중요 파일 덮어쓰기 역시 별도 명시적 지시가 필요하다.

| 역할 | 포함 대상 |
|---|---|
| A. CODE COMMIT | 검증된 RTL/TB/XDC/simulation.json source 상태 |
| B. EVIDENCE COMMIT | simulation/waveform/PASS/implementation 등 근거 |
| C. VIDEO EVIDENCE COMMIT | GitHub 제출이 요구되는 실제 FPGA 작동 영상 |
| D. REPORT SOURCE COMMIT | 최종 Markdown report |
| E. FINAL REPORT COMMIT | DOCX/PDF |

보고서의 “source code commit”은 A이다. 영상 제출 commit이 새로 생겨도 source가 바뀌지 않았다면 CODE COMMIT을 영상 commit으로 바꾸지 않는다. FINAL REPORT COMMIT을 code commit으로 쓰거나 문서가 자기 자신을 포함하는 commit hash를 요구하지 않는다. source commit 외 source hash/run-to-source 근거와 dirty 상태도 확인한다.

제출 링크는 가능하면 움직이는 `main` 대신 확인된 commit-fixed URL을 사용한다. source는 `https://github.com/<user>/<repo>/tree/<CODE_COMMIT>/LABx`, 영상은 `https://github.com/<user>/<repo>/tree/<VIDEO_COMMIT>/evidence/board/LABx/raw_videos`처럼 독립된 버전을 가리킨다. URL이 실제 commit의 경로와 일치하는지 확인한다.

`git add .` 또는 `git add LABx evidence reports`처럼 범위가 넓은 staging은 기본적으로 사용하지 않는다. LAB2 PRE에서 LAB1 board 자료가 섞인 사례처럼 인접 LAB/old evidence가 함께 들어갈 수 있다. include/exclude/review 분류 → **실험/증거/보고서별 explicit path staging** → `git diff --cached --name-only` 또는 `git status`로 전체 staged 목록 확인 → 예상 파일 목록/파일 수 검증 → commit 순서로 진행한다. 이미 staged된 사용자 파일도 확인하며 자동으로 섞거나 unstage하지 않는다. 의도하지 않은 파일이 있으면 commit을 멈춘다.

기본 제외 후보는 .xpr, .lnk, local generated folders, contact sheet, temporary comparison image, stale metadata, 불필요한 intermediate file이다. raw video는 **해당 LAB의 GitHub 제출 요구에 따라 포함/제외를 결정**하며 무조건 제외하지 않는다. 영상 제출 required이면 사용자가 선정한 영상만 explicit staging하고 파일 수를 확인한다. contact/comparison 이미지를 자동으로 제출 commit에 넣지 않는다.

PRE/POST tag는 LABx_PRE_SUBMIT / LABx_POST_SUBMIT 등의 실제 승인된 이름으로 구분한다. 영상 제출 required이면 POST final tag는 VIDEO EVIDENCE COMMIT, REPORT SOURCE COMMIT, DOCX/PDF가 모두 반영된 FINAL REPORT COMMIT에 생성한다. 기존 제출 tag 뒤에 새 요구가 확인되면 기존 tag를 force-move/삭제하지 않고 별도 final tag를 만든다. 처음부터 요구를 확인한 LAB에는 불필요한 중간 제출 tag를 만들지 않는다. 승인된 향후 제출 순서는 final report commit → annotated tag 생성 → main push → tag push → GitHub web 확인이다. 실제 branch가 main인지 확인하고 다르면 임의 checkout/push하지 않는다. 제출 gate만 통과해도 자동 Git 작업 권한이 생기지 않는다.

main push 성공 후에만 tag를 push한다. local HEAD / origin/main / 원격 tag의 peeled commit 및 ahead/behind를 확인하고 기존 modified/untracked가 그대로인지 검사한다. GitHub web 확인은 실제 웹에서 제출 파일과 해당 버전을 확인한 경우에만 완료로 기록한다.

## 20. DOCX/PDF 기본 레이아웃

다음은 내부 기본값이며 수업의 명시적 REQUIRED_FORMAT이 있으면 그 범위를 우선 적용한다.

- A4 portrait, 표지 1페이지 독립 1단.
- 표지는 과도한 장식 없이 큰 제목 + 간단한 정보표 중심으로 구성한다. 기준 commit/tag가 수업상 필요할 때는 실제 값만 넣고 미생성 tag를 완료처럼 쓰지 않는다.
- 본문부터 참고문헌/부록 끝까지 고정 2단, 페이지 번호는 표지에는 넣지 않고 본문 첫 페이지부터 하단 중앙에 배치한다.
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
| GATE 2 — VS CODE VERIFIED | 정상 PASS/check + 사용자 필수 waveform 관찰/screenshot + REPORT_REQUIREMENTS의 정상 검증 항목 충족 |
| GATE 2B — MODIFICATION VERIFIED | **조건부**. MODIFICATION_REQUIRED=REQUIRED인 실험에서 교안 지정 변경 → 실제 FAIL/원인 비교 → 복구 → 요구된 recovery 확인 |
| GATE 3 — PRE REPORT READY | 해당 실험 REPORT_REQUIREMENTS 전 항목 충족 + pre Markdown/image/내용 QA |
| GATE 4 — VIVADO VERIFIED | Behavioral Simulation + 요구 implementation 단계 + DRC/timing/bitstream evidence 및 정확한 적용 범위 |
| GATE 5 — BOARD FUNCTION VERIFIED | 실제 FPGA 기능을 사용자 관찰/측정과 입력 조건으로 확인; bitstream/Programmed 화면만으로 통과 불가 |
| GATE 6 — BOARD MEDIA READY | 사용자가 제출 영상과 필요한 보고서용 frame을 정리·선정하고 실험 번호/관찰 대응을 확인 |
| GATE 7 — VIDEO EVIDENCE READY | **조건부**. 영상 GitHub 제출 required이면 영상 수·파일·hash·사용자 선정 확인 → VIDEO EVIDENCE COMMIT → push → GitHub URL 확인; 요구가 없으면 NOT_APPLICABLE |
| GATE 8 — POST CONTENT FROZEN | 최신 fact sheet + validation summary + final Markdown + placeholder/image/link QA; required 영상의 URL·commit·수 충족 |
| GATE 9 — PDF VERIFIED | 최종 DOCX/PDF + 모든 페이지 render/visual QA + Markdown 내용 대조 |
| GATE 10 — SUBMITTED | FINAL REPORT COMMIT + annotated final tag + main/tag push + GitHub web 확인. Git 작업은 별도 명시적 사용자 지시가 있을 때만 수행 |

PRE 경로는 `GATE 0 → 1 → 2 → [2B if REQUIRED] → 3 → 9`이며, 실제 제출까지 진행할 때만 `→ 10`을 추가한다. PRE에는 board/video 결과를 요구하지 않는다. 수정 실험이 NOT_REQUIRED이면 GATE 2B를 생략하며 미통과로 취급하지 않는다. UNKNOWN이면 교안을 재확인하기 전 PRE 완료로 넘기지 않는다. POST는 동일 source와 요구사항을 기준으로 `4 → 5 → 6 → [7 if video required] → 8 → 9 → 10`을 추가한다. 영상 제출이 요구되지 않으면 GATE 7을 NOT_APPLICABLE로 기록한다. source 또는 수업 요구 해석이 바뀌면 영향받는 gate를 다시 통과한다.

문서 개선 자기 검수에서는 수업 요구와 내부 기본값 구분, 실험별 EXPERIMENT_REQUIREMENTS/REPORT_REQUIREMENTS 분리, 조건부 수정 실험, 동적 PRE 구성, 팀 원본 부재/미수행 구분, Programmed/board 구분, bitstream 사용 파일 주장 범위, Work/local handoff, Git 요구사항의 조건부 적용을 확인한다.
