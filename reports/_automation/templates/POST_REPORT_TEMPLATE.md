# [LAB] 결과보고서 초안

작성 지침: `reports/_automation/references/COURSE_REPORT_FORMAT.md`와 해당 LAB의 REQUIRED_FORMAT / REQUIRED_CONTENT를 먼저 확인한다. 명시적 필수 형식 → 설계·검증 논리가 명확한 구성 → EXAMPLE_REFERENCE의 문체·증거 밀도·그림 방식 → 일반 template 순으로 적용한다. GENERAL_GUIDANCE는 판단 원칙이다. 예시 목차를 강제하지 않으며 아래 구성은 명시적 형식 요구가 없을 때의 기본값이다. 내부 필드·provenance·QA는 제출 본문에서 분리하고 학생 최종 검토를 받는다.

POST 작성 전에 `reports/_automation/LABx_post_fact_sheet.md`와 `reports/_automation/LABx_validation_summary.md`를 생성/갱신하고 Work에 전달한다. Work는 local repository를 자동으로 볼 수 없다. stale metadata, 추출 미완료, 없는 frame 링크, 과거 cursor/Value 설명, 실제와 다른 이미지 수는 갱신하거나 source of truth에서 제외한다. 원본 부재를 미수행으로 해석하지 않는다.

수업/교수/조교의 실제 작동 영상 및 GitHub 제출 요구를 LAB별로 먼저 확인한다. required이면 사용자가 local 최종 영상을 선정한 뒤 영상 수·크기·SHA-256·중복·Git 상태를 점검한다. 교안·제출 기준 또는 최종 PDF가 remote hyperlink를 요구할 때만 명시적 Git 지시 아래 VIDEO EVIDENCE COMMIT과 origin/main push, GitHub 경로 확인을 POST/PDF 확정 전에 끝낸다. 그 외에는 local evidence로 POST를 작성하고 remote link는 최종 제출 단계에서 확정할 수 있다.

해당 LAB의 README/GitHub 연결 요구가 교안 원문에서 확인되지 않으면 `UNKNOWN`으로 둔다. README가 required로 확인되면 제출 경로의 탐색 허브로 검수한다. commit 분리, SHA-256, 상대경로/broken-link QA, README READY gate는 **내부 workflow**이다.

실험 수와 REQUIRED_CONTENT는 해당 LAB의 기준 문서를 따른다. 교안 또는 기능 검증에 필요한 실험에 실제 Vivado waveform·해석·예상/실제 비교를 포함하며 수정/재검증이 있으면 기록한다. PRIMARY는 전체 required experiment inclusion/전체 TB 검증을 대체하지 않는다. 요구된 board video 수와 TA demo 대상 수를 분리하여 관리하고, 대상 확인 전 `DEMO_SELECTION_STATUS = NOT_SELECTED`를 유지하며 video 존재에서 시연 실험을 추론하지 않는다. 기존 제출 LAB source/evidence/report는 변경하지 않는다.

## A. POST 요구사항 추출 — 제출 본문 제외

POST 작성 전에 반드시 다음 두 층을 따로 추출한다.

### A-1. COMMON_POST_REQUIREMENTS

| 공통 요구 | 상태 | 교안 근거 | 필요한 evidence |
|---|---|---|---|
| Vivado 기능 simulation과 VS Code 결과 비교 | [REQUIRED/...] | [공통 슬라이드] | [Sources 화면 + PASS waveform + 비교 설명] |
| synthesis / implementation 결과 | [...] | [...] | [완료 화면/report/log] |
| warning 해석 | [...] | [...] | [warning 원문 + 영향 판단] |
| pin / clock / timing 조건 | [...] | [...] | [XDC/constraint/part] |
| bitstream 생성 | [...] | [...] | [`write_bitstream Complete` + .bit 파일] |
| Program Device | [...] | [...] | [장치 programming 화면] |
| 실제 작동 영상 GitHub 제출 | [REQUIRED/NOT_REQUIRED/UNKNOWN] | [교수·조교 공지] | [요구 영상 수, 제출 경로, 사용자 선정 및 GitHub 확인] |
| `<required experiments>`의 board 실제 입출력 | [REQUIRED/OPTIONAL/NOT_REQUIRED/UNKNOWN] | [`<course-specific requirement>`] | [요구된 실험의 photo/video + 입력 조건 + 관찰] |
| `<TA demo experiments if applicable>` | [REQUIRED/OPTIONAL/NOT_REQUIRED/UNKNOWN] | [`<course-specific requirement>`] | [실제 시연 대상과 시연 조건] |
| 통합판 mode/LCD/회로 출력 | [...] | [...] | [동시에 대응 가능한 photo/video] |
| GitHub source/PRE/POST/evidence/조건부 board photo/board video 및 README 연결 | [REQUIRED/OPTIONAL/NOT_REQUIRED/UNKNOWN] | [교안 원문] | [적용되는 실제 경로 + README LAB section 링크] |
| 미수행 항목 구분 | [...] | [...] | [NOT_PERFORMED/UNKNOWN을 자연어로] |

### A-2. EXPERIMENT_POST_REQUIREMENTS

각 실험 폴더/슬라이드에 따로 적힌 “실험 후 레포트” 요구를 추출한다.

| 실험 | 요구 | 상태 | 출처 | 수집할 evidence |
|---|---|---|---|---|
| [`<experiment id>`] | [Vivado waveform/부품·pin/board 동작 등] | [REQUIRED/...] | [페이지] | [파일명/화면] |

PRE 요구사항을 그대로 복사하지 않는다. POST에 새로 생긴 구현·board·GitHub 요구를 추가한다.

### A-3. REPORT_CAPTURE_CHECKLIST — POST 항목

실험 전에 아래 체크리스트를 확정하고, 실험실에서 실제 evidence를 모으면서 체크한다.

| 실험 | stage | 캡처/파일 | 반드시 보여야 할 내용 | 저장 위치 | 완료 |
|---|---|---|---|---|---|
| [`<experiment id>`] | Vivado Simulation | [waveform] | [필수 신호/조건/PASS] | [...] | [ ] |
| [`<experiment id>`] | Synthesis/Implementation | [화면/report] | [성공 여부/warning] | [...] | [ ] |
| [`<experiment id>`] | Bitstream | [화면 + .bit] | [`write_bitstream Complete`] | [...] | [ ] |
| [`<experiment id>`] | Program Device | [화면] | [programming 완료 근거] | [...] | [ ] |
| [`<experiment id>`] | Board | [photo/video] | [입력 조건 + 실제 출력] | [...] | [ ] |

### A-4. VIDEO EVIDENCE READY — 제출 본문 제외

- Board video required: [YES / NO / UNKNOWN; 수업 요구 출처]
- Required video count: [수 / UNKNOWN]
- Final video count: [사용자가 선정한 수]
- Video path: [`evidence/board/LABx/raw_videos/` / NOT_APPLICABLE]
- Video evidence commit: [full hash / NOT_APPLICABLE / UNKNOWN]
- Video GitHub URL: [commit-fixed URL / NOT_APPLICABLE / UNKNOWN]
- Video GitHub verified: [YES / NO; 실제 확인 범위]

사용자는 촬영·실험별 분류·최종 영상 선정·삭제 판단·파일명/실험 대응·필요한 보고서용 frame 선택을 담당한다. Codex는 임의 frame 추출·영상 분류 추정·자동 선정·재인코딩·확인 없는 rename을 하지 않는다. required이면 파일 수/확장자/bytes/MB/SHA-256/중복/Git status를 확인하고 100 MB 이상 파일을 commit 전에 알린다. 영상은 `raw_videos/`, 정지 사진은 `frames/`로 구분하며 사진만으로 영상 제출을 충족했다고 판단하지 않는다.

required 영상은 먼저 local 경로, 실험 대응, 입력 조건과 관찰 결과를 확정한다. 교안·제출 기준 또는 최종 PDF가 remote hyperlink를 요구할 때만 VIDEO EVIDENCE COMMIT → push → GitHub 접근 확인을 POST/PDF 확정 조건으로 사용한다. 그 외에는 remote 확인을 최종 제출 단계로 미룰 수 있다. Git staging은 선택된 영상 경로만 명시하고 `git diff --cached --name-only`를 예상 목록과 대조하며, Git 작업은 별도 사용자 지시가 있을 때만 수행한다.

### A-5. Submission index / README READY — 제출 본문 제외

README required: [YES / NO / UNKNOWN; 수업 요구 출처]. 원문 확인 전에는 UNKNOWN이다. 아래는 요구가 확인된 경우 사용하는 내부 checklist이며 보고서 본문에 자동 출력하지 않는다.

| README LAB section 항목 | 기본 상대경로 예시 | 적용 여부/local 확인 | push 후 GitHub 확인 |
|---|---|---|---|
| Source link | `./LABx` | [ ] | [ ] |
| PRE Report link | `./reports/pre/LABx_pre_report.pdf` | [ ] | [ ] |
| POST Report link | `./reports/post/LABx_post_report.pdf` | [ ] | [ ] |
| Evidence link | `./evidence/.../LABx` | [ ] | [ ] |
| Board photo link | `./evidence/board/LABx/frames` | [TA 시연/교안 요구 시] | [ ] |
| Board video link | `./evidence/board/LABx/raw_videos` | [ ] | [ ] |

- README LAB section 존재: [ ]
- 실제 target path/파일명 대소문자/상대경로 일치 및 broken link 0: [ ]
- 필요한 PRE/POST PDF·source directory·evidence·조건부 frames·raw_videos와 요구 파일 수 확인: [ ]
- README COMMIT: [hash / NOT_APPLICABLE / PENDING]
- 필요한 submit tag 이름과 README commit 이후 tag 대상 일치: [ ]
- remote GitHub에서 README section·해당 LAB에 적용되는 제출 링크·필수 영상·tag 직접 확인: [ ]

FINAL REPORT COMMIT으로 최종 PDF가 Git에 존재한 뒤 README를 갱신·검수·commit한다. LAB별 표시 순서는 가능한 한 Source → PRE Report → POST Report → Evidence → Board Photo(필요한 경우) → Board Videos로 통일한다. 장문 template 사용 설명은 별도 docs 문서에 둔다. README가 required이면 final annotated tag는 README COMMIT 이후 상태에 생성한다. local 경로만 있거나 보고서에 GitHub URL만 있는 상태를 README READY로 처리하지 않는다. 요구가 없는 LAB은 `NOT_APPLICABLE`로 기록한다. Git 작업은 별도 사용자 지시에만 수행한다.

# 제출 본문 구성

## 표지

- 작성일: [기존/확인된 작성일]
- GitHub repository: [확인된 repository URL]
- Source code: [가능하면 `https://github.com/<user>/<repo>/tree/<CODE_COMMIT>/LABx`]
- Source code commit: [short CODE COMMIT; RTL/TB/XDC/simulation config의 검증된 상태]
- 제출 tag: [승인된 최종 제출 tag 이름; 아직 생성 전이면 예정 상태를 내부 기록]

실제 작동 영상 GitHub 제출이 required이면 표지에 `Actual operation videos: https://github.com/<user>/<repo>/tree/<VIDEO_COMMIT>/evidence/board/LABx/raw_videos`와 `Board video commit: <short VIDEO COMMIT>`도 넣는다. 영상 제출이 요구되지 않으면 두 항목을 생략할 수 있다. CODE COMMIT을 video commit으로 바꾸지 않는다. 긴 URL은 전체 문자열을 유지하고 줄바꿈·간격을 조정하여 표지를 한 페이지에 둔다.

## 1. 실험 목적 및 검증 방법

- 목적과 설계 범위: [확인된 수업자료와 실제 회로]
- 검증 방법: [expected 계산, 전체 TB 검사, 대표 waveform 관찰, 각 실험의 물리 출력 확인을 구분]
- 검토 source와 PRE 이후 변경: [RTL/TB/XDC, top, 변경 이유·재검증; 몰래 별도 source를 쓰지 않음]

영상 제출 required이면 `<required experiments>`의 실제 FPGA 작동 영상이 확인된 제출 경로에 정리되었다는 짧은 문장 하나만 본문에 넣는다. remote 경로가 아직 요구되지 않은 단계에서는 local evidence 경로를 사용한다. 개별 영상 파일명은 특별히 요구될 때만 부록에 나열한다.

## 2. 실험별 설계 및 검증 결과

아래 구조를 모든 required experiment에 반복한다. PRE의 동일 PRIMARY_BOUNDARY_CASE / case_id / 입력 / 정상 expected / 선정 이유를 해당 LAB에서 요구된 VS Code → Vivado → board 단계와 POST까지 연결한다. 동일 조건 재현 불가 시 사유와 대체 조건을 학생이 확인한다. 내부 용어는 제출 본문 제목으로 쓰지 않는다.

### [실험 번호·이름]

- 설계 및 핵심 구조: [실제 RTL 식/연산, 출력 의미, bit ordering, valid/invalid input domain]
- 시험 조건: [입력, TB vector, 진법·단위, waveform 안정 구간/sample time]
- 예상 결과: [정상 source expected와 계산]
- 관찰 결과: [실제 waveform에서 확인한 값; 계산 예상과 구분]
- 해석: [예상/실제 일치 여부와 검증 범위]
- waveform: [실제 evidence를 Markdown 기준 상대경로로 직접 참조]
- caption: [그림 번호, 실험 번호, 조건/표시 구간]

설명 → waveform → caption을 연속 배치한다. 실제 사용자 관찰 전 NOT_VERIFIED이며 PASS/VCD/numeric parsing으로 관찰 완료를 대신하지 않는다.

#### 실제 FPGA 보드 검증 — 해당 실험에 요구된 범위

- 시험 조건: [실험 번호/실제 시연 여부, 사용자 확인 입력, XDC pin/버튼·스위치/polarity 대응]
- 예상 동작: [RTL과 확인된 물리 대응]
- 실제 관찰: [사용자 확인 및 최종 video/요구된 사진에서 보이는 출력]
- 비교: [직접 비교 가능한 범위; 읽지 못한 숫자 입력은 UNKNOWN]
- video/photo/caption: [`../../evidence/board/LABx/...`; 각 제출 영상에 실험 번호·입력·관찰 설명. TA 시연 대상 또는 교안/사용자 지시가 있는 실험만 별도 사진/frame 추가]

simulation → waveform → board validation을 한 실험 안에서 끝낸다. 독립 board 장을 만들지 않는다. 실제 촬영 조건이 PRIMARY와 다르면 별도 case_id와 대체 사유를 기록하며 입력/극성/내부 신호를 추론하지 않는다. 해당 LAB에서 요구된 모든 raw video를 유지하고 결과보고서와 연결한다. 수업 시연 대상과 전체 video 제출 범위는 별개의 요구로 관리한다.

사용자가 영상 정리 → 실험 분류 → 대표 장면 선택 → capture 생성 → 최종 파일명 정리 → 입력/관찰 확인을 직접 수행한다. Codex는 사용자 확인 없는 frame 추출·영상 분류·제출 사진 선정을 기본적으로 하지 않는다. 보고서용 정지 이미지 handoff는 `evidence/board/LABx/frames/`이다. GitHub 영상 제출 required이면 별도로 `evidence/board/LABx/raw_videos/`를 사용하고, 요구가 없으면 raw_videos는 필수 구조가 아니다. contact_sheets/classification은 내부 선택 자료이며 자동 제출하지 않는다.

## 3. Vivado 구현 및 검증 기록

### 구현 환경과 수행 기록

- Vivado version / FPGA part / source / top / XDC / run: [실제 근거]
- synthesis / implementation: [각각 수행 여부, 성공/실패와 original log/report]
- 팀 분담: [수행 확정 stage와 원본 확보 범위를 자연스러운 문장으로 설명]

### DRC와 timing

- DRC: [실제 error/warning/report; warning을 숨기거나 만들지 않음]
- timing: [constraint, 실제 report/수치, 적용 가능성]
- 수정/재검증: [있는 경우 가설 → 검사/발견 → source 수정 → 새 run 결과]

Behavioral Simulation / synthesis / implementation / DRC / timing / bitstream generation / Program Device / board verification을 구분한다. simulation PASS ≠ waveform 기능 검증 ≠ DRC/timing PASS이다. warning은 기능 오류와 구현/constraint warning을 구분하여 실제 영향 범위를 설명한다. clock/사용자 timing constraint가 없어 timing N/A이면 그 사실만 쓰고 timing 검증 완료라고 하지 않는다. 교안이 요구한 tool/version, source commit, XDC, bitstream/path/hash, timing, warning 항목은 간결화를 이유로 삭제하지 않으며, 확보되지 않은 값은 추정하지 않는다.

팀원이 별도 환경에서 수행한 stage는 수행 여부, 현재 저장소의 원본 산출물 확보 여부, 현재 보고서에서 검증 가능한 범위를 따로 쓴다. 원본 bitstream/timing report가 없다는 이유로 수행 자체를 미수행·누락·실패로 표현하지 않고, 존재하지 않는 hash/timing 값을 만들지 않는다.

## 4. VS Code와 Vivado 시뮬레이션 비교

- PRE expected와 실제 플랫폼 대응: [동일 case/입력, 사용자 관찰, run/source]
- 전체 TB 검사와 대표 분석 범위: [cases/종료 시간과 사용자 관찰 구분]
- 차이/변경/재검증: [실제 발견; 가설과 사실 분리]
- 오류 검출/복구: [필수 내용 또는 차이 해석에 필요한 경우만 본문 반영; 상세 내부 근거 유지]

전체 결과 반복 종합표, 별도 “추가 확인 및 정리” 절, 이미 설명한 expected/observed 반복은 기본적으로 만들지 않는다.

## 5. 결론

- 확인한 기능과 범위: [실제 근거]
- 예상/실제 비교와 한계: [simulation/구현/board 구분]
- 수정/재검증에서 얻은 판단: [실제 수행한 경우만]

## 부록 A. PASS/log 보조 evidence

- 실제 PASS/log / 검사 수 / 종료 시간: [보존 파일과 run]

PASS는 전체 test coverage 보조 evidence이며 기능 검증 핵심은 본문 waveform과 해석이다.

## 부록 B. Program Device evidence

- 실제 programming 기록/Programmed 이미지: [확인된 파일]

Programmed는 programming 보조 근거이며 특정 회로 정상 동작 증거가 아니다. bitstream 생성 성공 ≠ board 정상 동작이다.

board photo/video에서 직접 판독하거나 측정하지 않은 정확한 주파수, pulse width, 내부 state timing, scan duty/refresh timing을 board 검증 결과로 주장하지 않는다. RTL 계산 또는 simulation 파형으로 확인한 값은 그 근거를 명시하여 분리한다.

## 부록 C. 제출 및 구현 추적 기록

- Source code commit full hash: [검증된 CODE COMMIT; RTL/TB/XDC/simulation config 상태]
- Board video commit full hash: [영상 GitHub 제출 required일 때 VIDEO EVIDENCE COMMIT; source와 구분]
- Actual operation video path: [required이면 `evidence/board/LABx/raw_videos/`]
- Actual operation video GitHub URL: [required이면 확인된 commit-fixed URL]
- bitstream 상대경로 / 파일명 / 크기 / SHA-256: [원본 직접 확인 범위]
- programming 사용 파일: [직접 근거 없으면 UNKNOWN; path 존재만으로 사용 파일이라 단정 금지]
- 팀 원본 미보관: [수행은 확정; 미확인 DRC/timing/hash는 추정 금지]

### 제출 링크

- [표시명 자체에 hyperlink 적용: 예 `LABx source`; 독자에게 `../../LABx/` 같은 상대경로 문자열을 노출하지 않음]
- 실제 확인된 repository/commit GitHub 링크와 버전: [근거]
- submit tag: [승인된 예정 이름과 원격 생성/확인 상태 구분]

미확인 링크/tag/commit을 완료로 작성하지 않는다. README 연결이 수업 요구이면 제출 tag는 FINAL REPORT COMMIT과 README COMMIT을 모두 포함한 이후 상태를 가리킨다. README 요구가 없으면 최종 DOCX/PDF commit에 tag를 만들 수 있다. 원격 확인은 제출 gate에서 하며 REQUIRED_FORMAT이 링크 위치를 요구하면 따른다.

## 참고문헌

- [번호] [실제 인용한 자료; 본문 inline citation과 대응]

## 내부 QA / 학생 검토 — 제출 본문 제외

### POST 문체·내용 전개 원칙

- POST의 중심은 **PRE 예상 → Vivado 실제 → board 실제 → 비교/해석**이다.
- 각 실험에서 `Vivado 파형이 정상`, `board가 동작`처럼 끝내지 말고, 입력 조건과 expected를 먼저 제시한 뒤 실제 관찰값과 비교한다.
- 요구된 board 동작 영상은 단순 첨부물이 아니라 각 영상이 어떤 동작을 검증하는지 본문/caption에서 설명한다.
- 수업 시연 대상은 별도로 표시하되, 시연 evidence가 나머지 필수 영상 evidence를 대체하지 않는다.
- synthesis/implementation/warning/bitstream/Program Device는 board 기능 검증과 구분한다.
- warning은 개수 나열보다 실제 warning의 의미와 기능 영향 범위를 설명한다.
- PRE에서 이미 충분히 설명한 RTL 원리를 길게 반복하지 않는다.
- 코드 전체 listing 대신 POST에서 비교/수정/구현 차이를 설명하는 데 필요한 핵심 코드만 사용한다.
- 메타 문장과 내부 QA/provenance 용어를 제거하고 자연스러운 학생 공학 보고서 문체를 유지한다.
- 표는 값/관계를 요약하고 본문은 이유와 해석을 담당한다.
- 각 실험은 요구된 단계에 한해 **시험 조건 → 예상 결과 → waveform 관찰 → board 관찰 → 해석**의 한 흐름으로 끝낸다.
- 공통 구현 결과는 별도 절에서 요약하되, 실험별 결과를 다시 반복하지 않는다.
- “사진/영상 첨부”로 끝내지 말고 그 장면이 어떤 입력에서 무엇을 검증하는지 쓴다.
- 내용이 검증 완료되면 `CONTENT_FROZEN`; 이후에는 layout만 수정한다.
- PDF 기본 형식: 표지 1단, 본문 전체 고정 2단, 모든 그림/표/code는 single-column width, full-width 금지.
- 일반 본문은 양쪽 맞춤. 표·caption·code는 예외 가능. 한국어 단어 중간 강제 줄바꿈은 금지.
- 표지 page number 없음, 본문 첫 페이지부터 하단 중앙 번호.
- figure/caption keep-together, 이미지 비율 유지, crop/overflow 금지. 사용자 요청 없이 특정 그림 full-width 예외나 페이지 균형용 강제 column break를 만들지 않는다.
- 판독성과 전체 layout이 충돌하면 자동 결정하지 않고 사용자 선호를 확인한다.



- 최신 fact sheet / validation summary / manifest: [확인 시각·범위와 실제 파일/그림 수·경로]
- 전체 실험 inclusion / 필수 waveform·해석·비교: [기준 문서 실험 수와 대응]
- PRIMARY: [핵심 기능 격리 → 한계/전환 → 명확한 expected 계산 → 파형 차이 → board 재현성 → TB 등장 시점]
- 보조 조건: [ENDPOINT_CHECK / ENABLE_CHECK / INVALID_DOMAIN_CHECK / ADDITIONAL_CHECK / FAILURE_TRIGGER_CASE를 PRIMARY와 구분]
- source/run/case/evidence: [reviewed source, 실제 source 식별, logs/VCD/screenshot, 복사 SHA-256; 직접 run↔commit 근거 없으면 UNKNOWN]
- VS Code: [버전, compile/simulation log, PASS/FAIL/cases/종료 시간, 사용자 실제 관찰/screenshot]
- waveform: [실제 관찰 전 NOT_VERIFIED; 시험 조건 → 예상 결과 → 관찰 결과 → 해석]
- intentional failure: [변경 RTL/위치, 정상 expected, 오류 예상, predicted/actual 최초 vector, expected/actual, failure run]
- recovery: [복구 source/방법, 별도 run/PASS/cases/종료 시간; DUT만 변경하고 TB expected 정상 기준 유지]
- 내부 플랫폼 대응표: [동일 case/입력의 PRE expected ↔ VS Code/run ↔ Vivado/run ↔ 해당 board evidence; 본문 반복표로 쓰지 않음]
- 팀 stage: [수행 사실 / 원본 확보 / 검증 결과 별도; LOCAL_VERIFIED / TEAM_CONFIRMED / TEAM_PROVIDED / EVIDENCE_PENDING / NOT_VERIFIED / NOT_APPLICABLE]
- 팀 원본 부재: [미수행 해석 금지; TEAM_CONFIRMED + EVIDENCE_PENDING; 원본 미확인 수치는 UNKNOWN]
- 선정: [DEMO_SELECTION_STATUS, 실제 TA demo 대상의 선택/지시 근거; 선정 전 NOT_SELECTED]
- required video ↔ 실험 번호 ↔ 입력 조건 ↔ 실제 관찰 ↔ caption/설명: [각 실험의 사용자 확인 결과; 별도 사진은 TA 시연/교안 요구 시]
- 수업 시연 대상 ↔ 실제 선택/지시 결과: [전체 required video 대응과 별도로 확인]
- provenance/QA notes: [TOOL_VERIFIED / COURSE_MATERIAL / USER_REPORTED / AUTO_DERIVED / UNKNOWN; compile warning/legacy absolute path/run-to-commit 부족은 본문과 분리]
- 학생 이해/최종 검토와 queue: [미확인 항목과 확인할 사람]
- Work export: [`reports/post/LABx_post_report.md`; 실제 evidence 직접 상대경로, 임시 LABx_figures 기본 사용 금지]
- 내용 종료/Markdown gate: [required evidence, uncertainty, 중복 제거, citation, placeholder 0 / broken image·link 0 / HTML 편집 주석 0 / 영상 요구 여부 / required 영상 수·local 경로 / remote hyperlink required일 때만 VIDEO COMMIT·URL / tag 이름 / CODE COMMIT과 VIDEO COMMIT 구분]
- layout/PDF QA: [독립 cover 1단, 이후 고정 2단, single-column 그림·표, board 문서 내부 회전·비율, 본문 Justify/code-heavy left 예외, 모든 페이지 render/검수]
- Git: [CODE → EVIDENCE → remote video 제출 required일 때 VIDEO EVIDENCE commit·push → REPORT SOURCE → FINAL REPORT commit → README required이면 SUBMISSION INDEX commit; include/exclude/review → explicit path staging → 전체 staged 목록/예상 수 검사 → 승인된 commit]
- 제출: [README required이면 최종 report PDF가 Git에 존재한 뒤 해당 LAB에 적용되는 제출 링크 갱신·검수·commit → 새 annotated POST tag → main push 성공 → tag push → GitHub web에서 적용 링크 확인; 기존 tag 덮어쓰기 금지]
- gates: [POST REQUIREMENTS CONFIRMED / SOURCE READY / VS CODE VERIFIED / PRE REPORT READY / VIVADO VERIFIED(if applicable) / BOARD FUNCTION VERIFIED(if required) / BOARD MEDIA READY(if required) / VIDEO EVIDENCE READY(required일 때) / POST CONTENT FROZEN / PDF VERIFIED / README READY(required일 때) / SUBMITTED]

필수 증거 pending이면 다음 gate로 자동 진행하지 않는다. 내용 검사 완료 후 본문을 고정하고 layout/QA만 진행하며 사실 오류 발견 시 내용 gate를 다시 연다. 내부 지침/QA는 제출 본문에서 제거한다. Git 작업은 별도 사용자 지시에만 수행한다.
