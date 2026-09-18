# [Experiment] 파형 관찰 가이드

USER_WAVEFORM_CHECK_GUIDE — 학생이 실제 VaporView에서 값을 읽고 기록한다. 자동 VCD 분석 결과는 사용자 관찰을 대신하지 않는다.

확인할 run/VCD: [run ID와 실제 VCD 경로]
source 대응 근거: [확인 불가능하면 UNKNOWN]
확인할/추가할 신호: [전체 계층 경로, 입력/출력, 표시 진법, bit order]
전체 simulation 시간: [실제 종료 시간 및 timescale; 예상 시간은 별도 표시]

## PRIMARY_BOUNDARY_CASE

case_id: [PRE와 동일]
입력 조건: [경계 전 → 후]
선정 이유: [진단력이 높은 이유]
검증 기능: [격리하는 핵심 기능]

## 실행 전 예상

| sample time | input | calculation | expected output | 실제로 읽어야 할 출력 신호 |
|---|---|---|---|---|
| [경계 전 안정 구간 내부, 단위] | [ ] | [ ] | [ ] | [ ] |
| [경계 후 안정 구간 내부, 단위] | [ ] | [ ] | [ ] | [ ] |

## VaporView 관찰

권장 표시 시간 범위 / 경계 전후 시간 구간: [ ]
입력 전환 시각 / TB vector: [ ]
안정 구간: [ ]
권장 sample time: [입력 전환 시각 자체를 피하고 안정 구간 내부에서 읽기]
확인할 신호: [위 표 입력과 출력을 함께 표시]
정상 판단 기준: [각 sample time의 실제 입력이 지정값이며 출력 신호가 expected와 일치]
screenshot 권장 범위: [run/VCD 식별, 시간 축/단위, 신호명과 경계 전후 입력/출력을 확인할 수 있는 범위]

## 사용자 기록

user_observation_status = NOT_VERIFIED

| run/VCD | sample time | 실제 입력 | 실제 관찰 출력 | expected와 일치 여부 | screenshot 경로/사용자 확인 기록 |
|---|---|---|---|---|---|
| [ ] | [ ] | [사용자 입력] | [사용자 입력] | [사용자 판단] | [ ] |

메모 / 관찰자 / 확인 시각: [ ]

사용자가 실제 관찰값 또는 확인한 screenshot을 제공하기 전까지 NOT_VERIFIED를 유지한다. 확인 후 해당 run/구간의 관찰 상태만 갱신한다. 관찰 완료와 정상 동작 판정은 구분한다. 값을 예상으로 채우거나 VCD 존재/자동 numeric parsing/simulation PASS만으로 VERIFIED로 바꾸지 않는다.

## 불일치 시 우선 점검

1. 올바른 run/VCD인지와 source 대응
2. TB vector/index 및 시간 단위 계산
3. signal order와 신호 계층
4. bit order와 표시 진법
5. 정상 설계 expected 계산
6. RTL과 유효 입력 범위
7. simulation 설정/top/source

## 파형 설명 기록

시험 조건 → 예상 결과 → 관찰 결과 → 해석 순서로 작성한다.

시험 조건: [ ]
예상 결과: [ ]
관찰 결과: [사용자 실제 기록만]
해석: [신호별 예상/실제 비교와 차이 원인; 증거 없는 확정 금지]
