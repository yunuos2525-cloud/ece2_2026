# LAB2 08_segment_scan — REPORT_CAPTURE_CHECKLIST

상태: EVIDENCE_VERIFIED (2026-09-19). 학생과 교수 역할 ChatGPT가 정상 VaporView 파형을 함께 관찰하고 expected와 대조했다. 정상 PASS, 지정 수정 FAIL, 별도 복구 PASS는 실제 build/sim/run-* 원본 로그로 확인했다. 원본 log/VCD는 build에 보존되어 있으며 evidence 경로 복사 여부는 REQUIRED 누락 판정에 사용하지 않는다. 아래 expected 표는 교안/TB 기준값이고, 제출 본문은 아직 작성하지 않았다.

| 증거/캡처 | 판정 | 시험 조건·표시 내용 | 예정 보존 위치 / 파일명 | 현재 |
|---|---|---|---|---|
| 정상 원본 `simulation.log` | REQUIRED | 새 정상 실행에서 `LAB2_PASS segment_scan8 checks=194`, `$finish` 1306 ns 예상. 시작·종료 상태 확인 | `evidence/vscode/LAB2/08_segment_scan/normal/<run>/simulation.log` | COMPLETED (build 원본 + evidence 로그 PNG 확인) |
| 정상 원본 `wave.vcd` | REQUIRED_SOURCE | 정상 PASS log와 같은 build run의 VCD 원본 보존 확인; evidence 경로로 복사하는 것은 교안 필수 아님 | `LAB2/08_segment_scan/build/sim/run-*/wave.vcd` | COMPLETED (build 원본 보존) |
| 정상 전체 VaporView screenshot | REQUIRED | 0~1306 ns에서 `index,select,segments`와 blank(`select=00`), 두 bank 반복·hold·reset을 확인. `digits`와 `checks`는 이 PNG의 필수 표시 신호로 추가 요구하지 않음 | `evidence/vscode/LAB2/08_segment_scan/normal/LAB2_08_segment_scan_normal_waveform_full_0-1306ns.png` | COMPLETED (PNG + 학생·교수 역할 ChatGPT 공동 관찰) |
| 정상 scan 전환 확대 screenshot | REQUIRED | 첫 두 자리 6~56 ns의 `index,select,segments`와 reset/준비 blank(`select=00`), 활성·hold를 확인. `digits` 부재만으로 누락 판정하지 않음 | `evidence/vscode/LAB2/08_segment_scan/normal/LAB2_08_segment_scan_normal_waveform_scan_6-56ns.png` | COMPLETED (PNG + 학생·교수 역할 ChatGPT 공동 관찰) |
| 수정 실행 원본 `simulation.log` | REQUIRED | 정상 evidence 보존 뒤 `select` 식의 blank 조건만 제거, TB는 그대로. 첫 예상 `LAB2_FAIL reset blanks digit zero` **6 ns**; expected `index0/select00`, 변경 예상 actual `index0/select01`. 실제 로그의 시각·상태를 읽어 기록 | `evidence/vscode/LAB2/08_segment_scan/failure/<run>/simulation.log` | COMPLETED (build 원본 + evidence 로그 PNG 확인) |
| 복구 실행 원본 `simulation.log` | REQUIRED | 원식 복원·저장 뒤 **새 실행**에서 PASS 194개·1306 ns 기대. 수정 전 정상 로그 재사용 금지 | `evidence/vscode/LAB2/08_segment_scan/recovery/<run>/simulation.log` | COMPLETED (build 원본 + evidence 로그 PNG 확인) |
| 정상/수정/복구 3행 비교 | REQUIRED | 각 실제 실행의 RTL 조건, 검사 이름·시각, expected/actual, 원인·복구 결과를 연결 | 예비보고서 작성 단계의 비교표 | PENDING_REPORT_WRITING |

`<run>`은 실행 후 확인할 실제 run 폴더다. 실패/복구 VCD가 생성되면 원본은 보존하되, 교안 48~50쪽은 그 파형의 **별도 screenshot**을 지정하지 않는다. 정상 PASS 로그의 별도 PNG, 출력만 본 화면, 마지막 reset만의 별도 확대 screenshot도 명시되어 있지 않다. 실제 필수 캡처 범위를 임의로 늘리지 않는다.

## 정상 전환 교안/TB expected — 실제 파형 공동 관찰 완료

| 검사 시각 | TB 조건 | `index` | 논리 `select` | 논리 `segments` | 해석 |
|---:|---|---:|---:|---:|---|
| 6 ns | reset 상태의 첫 검사 | 0 | `00` | 현재 digit 0의 `FC` 가능 | reset blank; check는 `index/select` 비교 |
| 16 ns | `enable=1`, 첫 활성 에지 뒤 | 0 | `01` | `FC` | digit 0 표시; 보드 변환 시 `seg_com=7F` |
| 26 ns | `enable=0`, 에지 뒤 | 0 | `01` | `FC` | 활성 상태 유지 |
| 36 ns | `enable=1`, 다음 전환 에지 뒤 | 1 | `00` | `60` | digit 1 준비 blank; segments 자체는 0일 필요 없음 |
| 46 ns | `enable=0`, 에지 뒤 | 1 | `00` | `60` | blank 상태 유지 |
| 56 ns | `enable=1`, 다음 에지 뒤 | 1 | `02` | `60` | digit 1 표시; 보드 변환 시 `seg_com=BF` |
| 1306 ns | 마지막 reset 검사 | 0 | `00` | 마지막 digits 입력에 따른 조합값 | `index/select` reset 검증, 정상 종료 예상 |

두 bank의 digits 경계는 TB 순서에서 **646 ns 뒤 변경, 656 ns 첫 검사**로 계산된다. 마지막 reset 직전 1296 ns에는 enable1로 다시 활성화되고, 1306 ns reset 검사에서 `index=0/select=00`을 기대한다. 정상 전체·scan 확대 파형을 학생과 교수 역할 ChatGPT가 관찰해 핵심 `index/select/segments` 및 blank 관계를 검수했다.

## 사용자 관찰 gate

1. 정상 simulation을 실행한 뒤 최신 run의 PASS·종료 시각과 같은 run의 log/VCD를 식별한다.
2. VaporView에서 위 신호를 추가해 전체 및 첫 두 자리 전환을 **직접** 읽고 screenshot을 저장/승인한다.
3. `select=00`과 `segments` 값, `enable=0` hold, 첫/마지막 reset, digits 전환을 expected와 비교한다.
4. 사용자 관찰 상태는 `COMPLETED`다. 교안 지정 수정의 FAIL log와 원복 뒤 별도 PASS log도 확인했다.
