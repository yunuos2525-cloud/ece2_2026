# 교수 제공 보고서 양식 기준

## 기준 출처

아래 목차는 사용자가 전달한 교수 자료에서 추출된 현재 참고 구조이다. ChatGPT Project의 교수 자료는 이 Codex 작업공간에서 자동으로 접근할 수 없으며, 원본 자료를 직접 열람한 것으로 간주하지 않는다. 원본에서 강제 양식인지 단순 예시인지 직접 확인되지 않았으므로 현재 형식 권한은 UNKNOWN_FORMAT_AUTHORITY로 관리한다. 학생 또는 ChatGPT 검토를 요청하며 REQUIRED_FORMAT으로 임의 승격하지 않는다. 각 LAB의 명시적 요구가 확인되면 그 근거와 적용 범위를 기록하고 해당 항목만 REQUIRED_FORMAT으로 승격할 수 있다.

## 교수 자료 형식 권한 분류

| 분류 | 판단 근거 | 적용 방식 |
|---|---|---|
| REQUIRED_FORMAT | “이 양식으로 제출”, “필수 항목”, “다음 순서로 작성” 등 명시적 형식 요구 | 제출 문서의 필수 제목/항목/순서를 엄격히 유지한다. |
| EXAMPLE_REFERENCE | 예시 보고서, 샘플 작성본, 참고용 완성본 | 문체, 설명 수준, 증거 밀도, 그림 사용 방식을 참고하되 명시적 요구가 없는 목차/순서는 강제 복제하지 않는다. |
| GENERAL_GUIDANCE | “설계가 잘 보이게 작성”, “예상과 결과를 비교”, “파형으로 검증” 등 일반 지침 | 보고서의 판단 원칙으로 사용한다. |

성격이 불확실한 자료는 UNKNOWN_FORMAT_AUTHORITY로 남기고 학생 또는 ChatGPT 검토를 요청한다. 한 자료에 여러 성격이 섞여 있으면 항목별 근거와 적용 범위를 구분한다.

## 제출 문서 구성 우선순위

1. 해당 LAB의 명시적 REQUIRED_FORMAT / 필수 요구사항
2. 설계와 검증 논리를 가장 명확하게 보여주는 구성
3. EXAMPLE_REFERENCE의 문체, 증거 밀도, 그림 사용 방식
4. 일반 automation template

교수 제공 예시가 있다는 이유만으로 모든 제목과 순서를 그대로 복제하지 않는다. GENERAL_GUIDANCE는 구성과 설명을 판단하는 원칙으로 적용한다.

## LAB1~LAB3 명시적 REQUIRED_CONTENT

사용자가 수업자료에서 직접 확인하여 전달한 필수 내용이다. Codex가 원본 자료를 직접 열람했다는 뜻은 아니며 출처 provenance는 USER_REPORTED이다. 내용의 필수성은 REQUIRED_CONTENT로 적용하되, 기존 참고 목차의 제목·순서 전체를 REQUIRED_FORMAT으로 승격하지 않는다.

| LAB | 반드시 포함할 실험 수 |
|---|---|
| LAB1 | 10개 |
| LAB2 | 8개 |
| LAB3 | 7개 |

### 실험 전 보고서

- 해당 LAB의 모든 실험마다 설계 내용, 핵심 코드, 입력 조건, 예상 결과를 준비한다.
- 모든 실험마다 VS Code simulation을 실제 수행하고 VaporView waveform screenshot을 포함한다.
- waveform에서 확인한 동작과 예상 결과의 일치 여부를 설명한다. simulation PASS, VCD 존재 또는 자동 numeric parsing만으로 screenshot 및 사용자 관찰 요구를 충족하지 않는다.
- 시연할 2개 실험은 당일 선정되므로 모든 실험을 실제 시연 가능한 상태로 준비한다.

### 실험 후 보고서

- 해당 LAB의 모든 실험마다 Vivado simulation waveform과 해당 waveform의 해석을 포함한다.
- 예상 결과와 실제 결과를 비교하고, 수정한 내용과 수정 후 재검증한 내용이 있으면 기록한다.
- 제출 보고서의 board 동작 사진은 조교가 선정한 2개 실험에만 첨부한다. 각 사진에 실험 번호, 입력 조건, 관찰된 동작을 명시하고 실제 시연 실험 번호와 정확히 대응시킨다.
- 선정 확인 전에는 DEMO_SELECTION_STATUS = NOT_SELECTED로 관리하며 자동화가 제출할 2개를 임의 선정하지 않는다. 기존 video/frame의 존재는 조교 선정 근거가 아니다.
- 모든 실험의 board raw evidence를 보존할 수 있지만 모든 실험의 제출용 board frame을 새로 만들 필요는 없다. 기존 LAB1 영상 10개와 evidence는 그대로 보존한다. 읽지 못한 입력값은 UNKNOWN으로 두고 사진 설명에 필요한 입력 조건은 사용자 확인 queue에 남긴다.

모든 실험의 inclusion 및 required evidence와 각 실험의 대표 분석 구간을 구분한다. PRIMARY_BOUNDARY_CASE는 설계 기능을 명확하게 설명할 waveform 구간이며 전체 실험 inclusion requirement를 대체하지 않는다. QA에서 실험 수·필수 증거 누락과 시연 실험 번호 ↔ board 사진 ↔ 보고서 설명 대응을 확인한다.

## 교수 제공 예비보고서 현재 참고 구조

실험 전 레포트: 회로 번호·이름

1. 목적 및 예상 동작
2. 소스와 테스트벤치
3. VS Code 실행 과정
4. 코드 수정 실패·복구 실험
5. 보드 실험 계획

## 교수 제공 결과보고서 현재 참고 구조

실험 후 레포트: 회로 번호·이름

1. Vivado 시뮬레이션
2. 오픈소스 실행 환경 — CLI 검토
3. 합성·구현·비트스트림
4. 실제 보드 기록·설명
5. 비교·결론
6. 제출 링크

## 양식 사용 원칙

- 제출용 문서를 만들기 전에 이 기준 문서를 우선 확인한다.
- 해당 LAB의 자료를 위 형식 권한으로 분류한 뒤 제출 문서 구성 우선순위를 적용한다. 새 자료라는 이유만으로 예시를 강제 양식으로 취급하지 않는다.
- REQUIRED_FORMAT으로 확인된 범위의 최상위 제목, 필수 항목과 순서만 엄격히 유지한다. 현재 참고 목차 전체를 강제 양식으로 단정하지 않는다.
- REPORT_WORKFLOW과 PRE/POST template의 자동화 구조는 교수 양식을 대체하는 제출 목차가 아니라, 그 양식을 정확하게 채우기 위한 내부 검증 구조이다.
- PRIMARY_BOUNDARY_CASE, case_id, provenance, evidence, NOT_VERIFIED 등의 내부 용어는 제출용 본문 제목으로 사용하지 않는다.
- 전체 TB 검증과 대표 사례의 상세 분석을 구분한다.
- 실제 수행하지 않은 시뮬레이션, Vivado, board 결과는 작성하지 않는다.
- 제출 링크에는 실제 확인된 repository/tag/commit 등만 기록한다.

## 내부 검증의 엄격성 유지

형식 권한 분류와 무관하게 PRIMARY_BOUNDARY_CASE의 근거, expected 계산, source/run/evidence 대응, 사용자 실제 파형 관찰 gate와 NOT_VERIFIED, intentional failure / recovery, Vivado 단계 구분, bitstream과 board 결과 구분, 수행하지 않은 결과 작성 금지, provenance와 내부 QA는 완화하지 않는다.
