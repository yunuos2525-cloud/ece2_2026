# LAB2 04_shift_register — REPORT_CAPTURE_CHECKLIST

상태: EVIDENCE_VERIFIED (2026-09-19). 학생과 교수 역할 ChatGPT가 정상 VaporView 파형을 함께 관찰하고 expected와 대조했다. 정상 PASS, 지정 수정 FAIL, 별도 복구 PASS는 실제 build/sim/run-* 원본 로그로 확인했다. 원본 log/VCD는 build에 보존되어 있으며 evidence 경로 복사 여부는 REQUIRED 누락 판정에 사용하지 않는다. 아래 expected 표는 교안/TB 기준값이고, 제출 본문은 아직 작성하지 않았다.

| 증거/캡처 | 판정 | 시험 조건·보여야 할 내용 | 예정 보존 위치·파일명 | 현재 |
|---|---|---|---|---|
| 정상 `simulation.log` | REQUIRED | 자기 실행 `LAB2_PASS shift_register4 checks=8`, `$finish` 106 ns 예상 | `evidence/vscode/LAB2/04_shift_register/normal/<run>/simulation.log` | COMPLETED (build 원본 + evidence 로그 PNG 확인) |
| 정상 `wave.vcd` | REQUIRED | 수정 실험 전에 해당 정상 실행의 원본 VCD 별도 보관 | `evidence/vscode/LAB2/04_shift_register/normal/<run>/wave.vcd` | COMPLETED (build 원본 보존) |
| 정상 전체 VaporView screenshot | REQUIRED | Zoom Fit 예상 0~106 ns, Time Units ns, `clk,rst,enable,serial_in,value` 이름·값; 8개 검사 구간의 입력/상태 확인 | `evidence/vscode/LAB2/04_shift_register/normal/LAB2_04_shift_register_normal_waveform_full_0-106ns.png` | COMPLETED (PNG + 학생·교수 역할 ChatGPT 공동 관찰) |
| enable 유지 확대 screenshot | REQUIRED | 25 ns `value=4`, 35 ns `enable=0,serial_in=1`인데 `4` 유지, 45 ns `enable=1`에서 `A`; 위 5개 신호 표시. **권장 20~50 ns는 TB 기반 계획값이며 교안 고정 범위가 아님.** | `evidence/vscode/LAB2/04_shift_register/normal/LAB2_04_shift_register_normal_waveform_hold_20-50ns.png` | COMPLETED (PNG + 학생·교수 역할 ChatGPT 공동 관찰) |
| reset 우선 확대 screenshot | REQUIRED | 95 ns 뒤 `value=0`, 105 ns `rst=1,enable=1,serial_in=1`, 106 ns `value=0`; 위 5개 신호 표시. **권장 90~106 ns는 계획값.** | `evidence/vscode/LAB2/04_shift_register/normal/LAB2_04_shift_register_normal_waveform_reset_90-106ns.png` | COMPLETED (PNG + 학생·교수 역할 ChatGPT 공동 관찰) |
| 수정 `simulation.log` | REQUIRED | 정상 원본 보관 후 한 식 변경, TB 그대로, 16 ns `input enters MSB` FAIL; 기대 `value=8`, 오류 예상 `value=1` | `evidence/vscode/LAB2/04_shift_register/failure/<run>/simulation.log` | COMPLETED (build 원본 + evidence 로그 PNG 확인) |
| 원복 `simulation.log` | REQUIRED | 원래 식 복원·저장 뒤 **새 실행**에서 PASS 8개/106 ns 확인 | `evidence/vscode/LAB2/04_shift_register/recovery/<run>/simulation.log` | COMPLETED (build 원본 + evidence 로그 PNG 확인) |
| 정상·수정·원복 비교 | REQUIRED | 세 실제 로그의 검사 시각·시험 조건·expected/actual·실패 원인·복구 결과 | 예비보고서 작성 단계 | PENDING_REPORT_WRITING |

`<run>`은 실행 후 확인할 실제 run 폴더 이름이다. 정상 log 화면 PNG, 별도 실패/원복 파형 PNG는 04 교안에서 요구하지 않는다. 한 화면에 enable 유지와 reset 우선이 모두 읽힐 수 있으면 이미지를 결합할 수 있으나 두 동작의 관찰·설명은 모두 필요하다. 정상 원본을 삭제하거나 과거 정상 로그/VCD를 원복 실행 증거로 재사용하지 않는다.

## 캡처 전 expected 메모

| 검사 | 에지 뒤 예상 | 관찰할 핵심 |
|---:|---:|---|
| 6 ns | `0` | 첫 5 ns 에지 reset 후 초기화. 0~5 ns X는 이전 미정 상태 |
| 16 / 26 ns | `8 / 4` | 입력 1이 bit 3으로 들어와 다음 에지에 bit 2로 이동 |
| 36 ns | `4` | `enable=0`에서 입력 1이 바뀌어도 hold |
| 46 / 56 ns | `A / 5` | 이전 비트 값의 동시 이동; `{1,010}=1010`, `{0,101}=0101` |
| 96 ns | `0` | 65/75/85/95 ns 네 번 0 입력 후 `5→2→1→0→0` |
| 106 ns | `0` | `rst=1`이 enable·serial input보다 우선 |

수정 회로의 첫 입력 1은 `[3]` 대신 `[0]`으로 들어가므로 16 ns 정상 expected `1000`과 변경 예상 `0001`이 다르다(41쪽). `user_observation_status=COMPLETED (학생·교수 역할 ChatGPT 공동 관찰, 2026-09-19)`; PASS, VCD 존재 또는 수치 parsing만으로 VaporView 관찰을 완료 처리하지 않는다.
