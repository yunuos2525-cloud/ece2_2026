# [LABx / 실험명] 예비보고서 동적 초안

> 작성 지침 — 제출 본문에서 제거: 이 파일은 고정 목차를 강제하는 제출 양식이 아니라, 해당 실험의 교안에서 추출한 `REPORT_REQUIREMENTS`를 빠짐없이 구현하기 위한 내부 작성 템플릿이다. 수업자료에 없는 항목은 임의로 필수화하지 않는다. 아직 수행하지 않은 Vivado/board 결과는 작성하지 않는다.

## A. 교안 요구사항 추출 — 제출 본문 제외

### A-1. EXPERIMENT_REQUIREMENTS

| 항목 | 상태 | 교안 근거 | 적용 내용 |
|---|---|---|---|
| 핵심 기능/원리 | [REQUIRED/...] | [페이지/슬라이드] | [내용] |
| 정상 simulation | [...] | [...] | [PASS/check/검증 기능] |
| 필수 경계/시점 | [...] | [...] | [시간/vector] |
| 필수 waveform 신호/구간 | [...] | [...] | [신호/범위] |
| 수정 실험 | [REQUIRED/NOT_REQUIRED/UNKNOWN] | [...] | [변경/실패/복구 요구] |
| Vivado 준비 | [...] | [...] | [top/XDC/clock 등] |
| board 사전 계산 | [...] | [...] | [입력 순서/예상 출력] |
| 설정/오류 기록 | [...] | [...] | [실제 요구] |

### A-2. REPORT_REQUIREMENTS

| 보고서에 들어갈 항목 | 상태 | 교안 근거 | 필요한 evidence/계산 |
|---|---|---|---|
| [예: RTL/TB 역할 설명] | [REQUIRED/...] | [페이지] | [코드/설명] |
| [예: 예상 상태표] | [...] | [...] | [표/계산] |
| [예: 정상 PASS log] | [...] | [...] | [log/capture] |
| [예: 전체 waveform] | [...] | [...] | [신호/Zoom Fit] |
| [예: 25/35/45 ns 확대] | [...] | [...] | [각 시점 expected/observed] |
| [예: 수정/실패/복구 비교] | [...] | [...] | [normal/failure/recovery log] |
| [예: Vivado 전 board 예상] | [...] | [...] | [입력/LED 계산] |
| [예: 설정 변경/오류] | [...] | [...] | [실제 수행 내용] |

- `REQUIRED`: 반드시 제출 본문/evidence에 반영
- `OPTIONAL`: 도움이 될 때 사용
- `NOT_REQUIRED`: 제출 본문에서 생략 가능
- `UNKNOWN`: 교안 재확인 전 임의 작성 금지

### A-3. REPORT_CAPTURE_CHECKLIST — 제출 본문 제외

실행 전에 `REPORT_REQUIREMENTS`의 REQUIRED 항목만 모아 실제 수집할 증거를 고정한다.

| 증거/캡처 | REQUIRED 여부 | 시점/구간 | 보여야 할 신호/내용 | 저장 위치 | 완료 |
|---|---|---|---|---|---|
| [PASS log] | [...] | [정상 종료] | [PASS/check count] | [...] | [ ] |
| [전체 waveform] | [...] | [Zoom Fit] | [필수 신호] | [...] | [ ] |
| [확대 waveform] | [...] | [예: 25/35/45 ns] | [필수 신호/값] | [...] | [ ] |
| [failure log] | [...] | [지정 failure 시점] | [expected/actual] | [...] | [ ] |
| [recovery evidence] | [...] | [복구 후] | [PASS/check] | [...] | [ ] |

교안이 요구하지 않은 evidence는 체크리스트에 억지로 추가하지 않는다.

## B. 실험 세팅 자동화 확인 — 제출 본문 제외

[최종 RTL/TB/XDC 파일명, design module/top, TB module/simulation top]

[`simulation.json` source/testbench/simulation_top과 실제 파일/module 일치]

[교안/제공 constraint 기준 XDC 반영 근거. 근거 없는 pin/polarity는 UNKNOWN]

[placeholder 교체, README/workspace/script 참조 갱신, diff/no-index 검수]

[교안 원문 대비 누락/변형/임의 추가 여부]

## C. 학생 source review — 제출 본문 제외

학생이 실행 전에 자기 말로 설명할 수 있어야 한다.

- 회로 목적과 입출력
- 핵심 RTL 구조와 우선순위
- clock/reset/enable/상태 갱신 시점
- TB가 어떤 입력을 주고 무엇을 expected로 비교하는지
- 대표/필수 시간 구간의 예상값 계산
- 수정 실험이 REQUIRED인 경우: 왜 그 변경이 지정 시점에서 실패해야 하는지

---

# 제출 본문 구성

아래 절은 **예시 골격**이다. `REPORT_REQUIREMENTS`의 REQUIRED 항목을 가장 자연스럽게 설명하도록 합치거나 순서를 바꿀 수 있다. 교안이 필수 제목/순서를 지정하면 그 형식을 우선한다.

## 1. 실험 목적과 설계 원리

[REPORT_REQUIREMENTS가 요구하는 목적, 기능, 상태/연산 원리]

[필요한 경우 reset/enable 우선순위, Moore/Mealy, nonblocking, divider, debounce 등 **해당 실험에 실제 적용되는 개념만** 설명]

## 2. RTL · TB · 설정 파일의 역할

[교안이 요구하는 범위에서 RTL 파일/module, TB, `simulation.json`, XDC, workspace/Vivado 등록 항목의 역할 설명]

[TB clock period, posedge 시각, 입력 변경, edge 후 검사 지연, PASS/FAIL/watchdog 등 요구된 내용]

> Git commit hash, run ID, 도구 버전 등은 `REPORT_REQUIREMENTS`가 요구할 때만 제출 본문에 넣는다. 내부 추적은 별도 manifest/evidence에서 관리할 수 있다.

## 3. 예상 동작 / 계산 / 표

[교안이 요구한 표와 계산을 그대로 구현]

예:
- 초기화/증가/감소/순환/유지 예상표
- count/divided/tick 분주 주기 계산
- 제어 입력별 다음 상태 표
- 특정 25/35/45 ns 상태 계산
- board 입력 순서와 예상 LED

교안에 요구되지 않은 “공통 표”를 억지로 추가하지 않는다.

## 4. 정상 VS Code simulation 및 파형 검증

[정상 PASS/check count. 실제 수행 후 기록]

[교안이 요구한 전체 waveform screenshot]

각 필수 확대 구간은 반드시 다음 순서를 따른다.

**시험 조건 → 예상 결과 → 관찰 결과 → 해석**

### [필수 구간/시점 1]
시험 조건: [...]
예상 결과: [...]
관찰 결과: [...]
해석: [...]
[waveform image]

### [필수 구간/시점 2 — 필요한 만큼 반복]
시험 조건: [...]
예상 결과: [...]
관찰 결과: [...]
해석: [...]
[waveform image]

PASS 로그만으로 기능 검증을 끝내지 않는다. 반대로 교안이 요구하지 않은 확대 파형을 불필요하게 늘리지 않는다.

## 5. 수정 실험 및 복구 — `MODIFICATION_REQUIRED = REQUIRED`일 때만 포함

> `NOT_REQUIRED`이면 최종 보고서에서 이 절 자체를 제거한다. `UNKNOWN`이면 교안을 다시 확인한다.

[교안이 지정한 변경 파일/한 줄/조건]

변경 전 정상 예상: [...]

변경 후 실패 예상:
- 예상 failure 시점/vector: [...]
- expected: [...]
- 오류 회로에서 예상 actual: [...]
- 실패 이유 계산: [...]

실제 변경 실행:
- 실제 FAIL 시점/vector: [...]
- expected / actual: [...]
- 교안이 요구한 failure log/capture: [...]

복구:
- 원래 코드로 복원
- 요구된 recovery PASS/check: [...]
- 교안이 요구하는 경우에만 새 waveform 첨부

### 정상 / 변경 / 복구 비교표 — 교안이 요구할 때만

| 상태 | 변경 내용 | 예상 | 실제 | 요구 evidence |
|---|---|---|---|---|
| 정상 | [정상 RTL] | [...] | [...] | [PASS log/waveform 등] |
| 변경 | [교안 지정 수정] | [...] | [...] | [FAIL log 등] |
| 복구 | [원복] | [...] | [...] | [recovery PASS 등] |

failure waveform이 교안에 없으면 만들 필요가 없다.

## 6. Vivado / 실제 보드 사전 계획 — 교안이 PRE에서 요구하는 범위만

[Vivado에 등록할 RTL/TB/XDC/top/device/clock]

[교안이 요구한 board 입력 순서, 예상 LED/7-segment, 실제 검증 방법]

[XDC가 현재 VS Code 기능 simulation에 사용되지 않는 경우 그 사실을 구분해서 설명]

아직 실제로 수행하지 않은 synthesis/implementation/bitstream/board 결과는 쓰지 않는다.

## 7. 실제 설정 변경 및 오류 기록 — 교안이 요구하거나 실제 의미 있는 변경이 있을 때만

[Python/PATH/slang/simulation.json 등 실제로 수정한 설정]

[발생한 실제 오류 → 원인 → 해결]

없었던 오류를 만들거나 사소한 내부 automation 메모를 제출 본문에 넣지 않는다.

## 참고문헌

[실제 사용한 수업자료/문서. 필요한 경우 본문과 대응]

---

## 내부 QA / 학생 검토 — 제출 본문 제외

- `EXPERIMENT_REQUIREMENTS`와 `REPORT_REQUIREMENTS`가 모두 추출되고 출처가 있는가?
- REQUIRED 항목이 최종 본문/evidence에 모두 반영됐는가?
- simulation 전에 REPORT_CAPTURE_CHECKLIST를 확정했고, REQUIRED 캡처가 모두 수집됐는가?
- NOT_REQUIRED 항목을 관행 때문에 억지로 넣지 않았는가?
- UNKNOWN 항목을 추정해서 채우지 않았는가?
- 자동 세팅 diff 검수 + 학생 source review가 완료됐는가?
- 정상 simulation PASS/check와 사용자 실제 필수 waveform 관찰이 완료됐는가?
- 각 waveform 설명이 시험 조건 → 예상 → 관찰 → 해석 순서인가?
- 수정 실험은 `MODIFICATION_REQUIRED=REQUIRED`인 경우에만 수행/작성했는가?
- failure/recovery의 evidence 종류가 교안 요구와 일치하는가? (예: failure log만 요구되면 waveform 강제 금지)
- 보고서에 commit hash/run ID/도구 버전을 넣는 경우 실제 수업 요구가 있는가?
- 수행하지 않은 Vivado/board 결과를 쓰지 않았는가?
- POST에서 실제 작동 영상 제출이 요구되는지 미리 확인하고, required이면 실험 중 촬영할 조건·실험 번호를 계획했는가? PRE에는 아직 수행하지 않은 board/video 결과를 쓰지 않는다.
- placeholder/broken image/link/내부 작성 메모가 제거됐는가?
- 최종 PDF layout/visual QA는 별도 workflow gate에 따라 수행한다.

## 내부 작성 스타일 / PDF 형식 — 제출 본문 제외


### 제출용 문체와 구조 세부 원칙

- 큰 구조는 `공통 목적/검증 조건 → 실험별 설계·예상·simulation → 통합 실험 → Vivado/board 사전 계획 → 참고문헌`처럼 독자가 검증 흐름을 따라가기 쉽게 구성한다.
- 실험별 소제목을 완전히 동일하게 강제하지 않는다.
- Counter/Divider/Register/Shift/PISO: 설계 목적·동작 원리 → 핵심 RTL → 예상 동작 → simulation/파형 → 오류 검출(요구 시)
- Moore/Mealy: 설계 목적 → state/output 관계 → 핵심 RTL → 예상 동작 → simulation → 오류 검출
- Segment Scan: 설계 구조 → segment pattern/scan 원리 → 핵심 RTL → 예상 동작 → simulation → 오류 검출
- Integrated: 통합 구조 → mode별 기능 → 핵심 제어 RTL → 정상 통합 simulation → 대표 동작 검증 → 오류 검출
- `시험 조건/예상/관찰/해석`의 논리는 유지하되 네 라벨을 매번 굵게 반복하지 않고 자연스러운 서술형 문단으로 쓴다.
- 어색한 번역어보다 실제 신호명과 익숙한 기술어(reset, enable, state, clock edge, tick, load, transfer, blank, scan, PASS/FAIL)를 사용한다.
- `상태 버스`, `비에지`, `tick masking`, `제어 중지`, `에지의 소비` 같은 표현은 사용하지 않는다.
- `제공된 자료에서 확인되지 않는다`, `재캡처하지 않았다`, `이 실험에는 수정 실험이 없다` 등 보고서 제작 과정이 드러나는 문장을 제출 본문에서 삭제한다.
- 코드 전체 파일 대신 핵심 RTL 1~2개 block만 넣는다.
- 표는 관계를 보여주고 본문은 중요한 경계조건과 이유를 설명한다. 같은 내용을 반복하지 않는다.
- PRE의 물리 보드 조작·1 kHz 실제 시간 계산·스위치/버튼 순서는 가능하면 보드 계획 절에 모은다.


- 보고서 전개는 **설계 목적/원리 → 시험 조건 → 예상 결과 → 실제 VS Code 관찰 → 해석**을 중심으로 한다.
- waveform 설명은 반드시 **시험 조건 → 예상 결과 → 관찰 결과 → 해석** 순서로 쓴다.
- 같은 expected/observed를 표와 본문에서 반복하지 않는다.
- 표는 값 비교에, 본문은 계산 근거와 의미 해석에 사용한다.
- 내부 automation 용어와 QA 상태명은 제출 본문에 쓰지 않는다.
- 기술 내용이 검증 완료되면 내용은 고정하고 이후 수정은 layout 중심으로 한다.
- 기본 PDF: 표지 1단 / 본문 전체 2단 / 모든 waveform·FAIL log·code·table은 각 column 안 / full-width 금지.
- 일반 본문은 양쪽 맞춤, 표·code·caption·긴 식별자는 예외 가능.
- 한국어 단어를 음절 중간에서 강제로 자르지 않는다.
- 표지에는 페이지 번호 없음, 본문 첫 페이지부터 하단 중앙 page number.
- 표지 commit/tag는 수업 요구 또는 제출 추적 필요 시 실제 값만 사용하며, code commit과 final report commit을 구분한다.

### PRE gate 요약

`GATE 0 REQUIREMENTS READY → GATE 1 SOURCE READY → GATE 2 VS CODE VERIFIED → [GATE 2B if REQUIRED] → GATE 3 PRE REPORT READY → GATE 9 PDF VERIFIED`
