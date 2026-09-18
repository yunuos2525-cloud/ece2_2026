# [LAB / 실험명] 예비보고서 초안

작성 지침: 대괄호는 확인된 자료로 채운다. 실행 전 결과는 예상과 계획으로 표현한다. 내부 상태/provenance는 제출 본문에서 제거한다. 학생 검토 전 최종 보고서로 간주하지 않는다.

## 1. 실험 목적 및 설계와 예상 동작

- 수업자료 및 요구사항: [자료/페이지, 목적, 선수지식]
- 기능과 논리식/연산: [출력 의미, bit ordering, 입력 유효 범위, 무효 입력 동작]
- 예상 동작: [실행 전 계산에 근거한 설명]

## 2. 소스와 Testbench

- RTL 파일/module/design top: [ ]
- TB 파일/simulation top: [ ]
- XDC / simulation.json / workspace: [ ]
- 학생 source review와 원리 이해: [검토할 구조와 계산]
- TB 입력 순서, cases, case 간격, timescale, 예상 총 시간: [코드 근거]
- expected 계산, 비교 출력, PASS/FAIL 및 watchdog 조건: [ ]

## 3. 대표 경계조건 및 예상 결과

추적용 case_id: [동일 입력/예상값을 simulation → Vivado → board → POST까지 유지]

- 입력 조건: [경계 전 → 후, 진법과 bit order]
- 선정 이유: [핵심 기능 격리와 한계/전환을 보여주는 이유를 자연스러운 공학 문장으로 설명]
- 검증 기능: [무엇을 검증하는가]
- 실행 전 예상 결과 및 계산 과정: [정상 설계 기준]

| TB vector | 입력 | 계산 과정 | 예상 출력 | 예상 안정 시간 구간 | 권장 안정 관찰 시점 | 확인할 신호 |
|---|---|---|---|---|---|---|
| [경계 전] | [ ] | [ ] | [ ] | [단위 포함] | [구간 내부] | [ ] |
| [경계 후] | [ ] | [ ] | [ ] | [단위 포함] | [구간 내부] | [ ] |

보조 조건: [ENDPOINT_CHECK / ENABLE_CHECK / INVALID_DOMAIN_CHECK / ADDITIONAL_CHECK / FAILURE_TRIGGER_CASE 등, PRIMARY_BOUNDARY_CASE와 별도로 선정 이유 기록]

## 4. 시뮬레이션 및 파형 검증 계획

- 도구/실행 workflow와 기록할 run/source/log/VCD: [ ]
- 전체 예상 시간 및 입력 전환 시각: [ ]
- VaporView 추가 신호와 경계 전후 표시/screenshot 범위: [ ]
- 실제로 읽을 출력 및 정상 판단 기준: [신호별 예상값 비교]
- 사용자 관찰 계획: [안정 구간 내부 sample time 확인 후 관찰값/screenshot 제공]
- 결과: [실행 및 사용자 확인 전에는 관찰 결과를 채우지 않음]

## 5. 오류 유도 및 검출 계획

- 변경할 RTL, 정상 기대값, 오류 회로 예상값: [ ]
- failure trigger 입력 및 예상 최초 failure vector: [ ]
- TB expected 유지 및 실제 expected/actual 기록 계획: [ ]
- 복구 방법과 별도 recovery run의 PASS 확인 계획: [ ]

## 6. 보드 실험 계획

- board/FPGA part 및 XDC pin mapping/polarity: [자료 근거]
- 대표 경계의 실제 스위치/버튼 입력: [ ]
- 예상 LED/7-segment 등 물리 출력: [ ]
- 관찰/측정/사진/영상 기록 방법: [ ]
- 동일 조건 재현 제약과 확인할 대안: [ ]

실제 Vivado/board 결과는 수행 전 작성하지 않는다.
