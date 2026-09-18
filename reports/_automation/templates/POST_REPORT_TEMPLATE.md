# [LAB / 실험명] 결과보고서 초안

작성 지침: PRE에서 선정한 동일 PRIMARY_BOUNDARY_CASE를 사용한다. 실제 증거가 없는 결과는 비워 두고 미수행/미확인이라고 자연스럽게 설명한다. 내부 상태/provenance와 QA 메모는 제출 본문에서 분리한다. 학생 최종 검토가 필요하다.

## 1. 예비 예상과 사용한 설계

- PRE 문서와 대표 경계 추적용 case_id: [ ]
- 동일 입력 조건, 선정 이유, 예상 출력 및 계산: [ ]
- reviewed RTL/TB/XDC, design/simulation top, source 식별 근거: [ ]
- PRE 이후 변경 여부/이유: [별도 수정본을 몰래 사용하지 않음]

## 2. 실제 VS Code simulation 및 사용자 파형 관찰

- 도구 버전, 실제 run/source, compile/simulation 로그, PASS/FAIL/cases/종료 시간: [실제 근거]
- 실제 VCD와 사용자 관찰 기록/screenshot: [ ]
- 시험 조건: [입력, TB vector, 안정 sample time, 신호]
- 예상 결과: [계산과 expected]
- 관찰 결과: [사용자가 직접 읽은 actual, 제공한 증거 범위]
- 해석: [어떤 출력이 어떻게 일치/불일치하는지]

## 3. 오류 검출과 복구

| 변경한 RTL | 정상 기대값 | 오류 회로 예상값 | 예상 최초 failure vector | 실제 failure vector | expected | actual | 복구 방법 | recovery PASS/run |
|---|---|---|---|---|---|---|---|---|
| [ ] | [ ] | [ ] | [ ] | [실제 로그] | [ ] | [ ] | [ ] | [실제 로그] |

TB expected는 정상 설계 기준을 유지한다. 정상/실패/복구 evidence를 구분한다.

## 4. Vivado

- 버전/FPGA part/source/top/XDC 및 실제 run: [ ]
- 동일 대표 입력의 Behavioral Simulation 결과/evidence: [ ]
- synthesis / implementation / DRC / timing / warnings: [각각 실제 결과와 파일]
- bitstream 생성 여부, 경로/크기/hash: [실제 결과]

실제 수행하지 않은 Vivado 결과를 작성하지 않는다. bitstream 생성 성공과 FPGA board 정상 동작은 별개의 확인이다.

## 5. 실제 FPGA board

- board와 programming 기록: [실제 수행 근거]
- 동일 대표 입력 인가 방법과 pin/polarity 대응: [ ]
- 사용자 관찰/측정값, 사진/영상/evidence: [ ]
- 예상 물리 출력과 실제 출력의 비교: [ ]

수행하지 않았다면 board 결과를 작성하지 않는다.

## 6. 예상과 실제 비교 및 차이 분석

| 동일 case_id / 입력 | PRE 예상 및 계산 | VS Code 사용자 관찰값/run | Vivado 결과/run | FPGA board 실제 결과/evidence | 일치 여부 및 해석 |
|---|---|---|---|---|---|
| [경계 전] | [ ] | [ ] | [ ] | [ ] | [ ] |
| [경계 후] | [ ] | [ ] | [ ] | [ ] | [ ] |

- 차이 발생 시 원인 가설: [가설과 사실 구분]
- 검사와 실제 발견 근거: [ ]
- 수정 내용/source 식별: [ ]
- 새 run 재검증 및 사용자 재관찰: [ ]
- 동일 조건 재현 불가/변경 시 사유와 학생 확인: [ ]

## 내부 QA / 학생 검토 — 제출 본문 제외

- evidence와 run/source/case 대응, 사용자 직접 관찰, 미수행 항목: [ ]
- warning/절대경로/run-to-commit 부족: [ ]
- 학생 source 이해와 결과 검토, 남은 확인 항목: [ ]
