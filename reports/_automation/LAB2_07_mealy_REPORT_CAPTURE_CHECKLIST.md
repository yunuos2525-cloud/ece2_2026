# LAB2 07_mealy — REPORT_CAPTURE_CHECKLIST

상태: EVIDENCE_VERIFIED (2026-09-19). 학생과 교수 역할 ChatGPT가 정상 VaporView 파형을 함께 관찰하고 expected와 대조했다. 정상 PASS, 지정 수정 FAIL, 별도 복구 PASS는 실제 build/sim/run-* 원본 로그로 확인했다. 원본 log/VCD는 build에 보존되어 있으며 evidence 경로 복사 여부는 REQUIRED 누락 판정에 사용하지 않는다. 아래 expected 표는 교안/TB 기준값이고, 제출 본문은 아직 작성하지 않았다.

| 증거/캡처 | 판정 | 시험 조건·보여야 할 내용 | 예정 보존 위치·파일명 | 현재 |
|---|---|---|---|---|
| 정상 `simulation.log` | REQUIRED | 자기 실행 `LAB2_PASS mealy_toggle checks=11`, `$finish` 67 ns 예상 | `evidence/vscode/LAB2/07_mealy/normal/<run>/simulation.log` | COMPLETED (build 원본 + evidence 로그 PNG 확인) |
| 정상 `wave.vcd` | REQUIRED | 출력 식 변경 전에 해당 정상 실행의 VCD/파형 원본 보관 | `evidence/vscode/LAB2/07_mealy/normal/<run>/wave.vcd` | COMPLETED (build 원본 보존) |
| 정상 전체 VaporView screenshot | REQUIRED | Zoom Fit 0~67 ns에서 `bit_in,clk,enable,rst,state,value` 및 비에지 출력 변화·reset 확인. `checks`는 정상 PASS log로 검증하며 화면 누락을 추가 캡처 조건으로 삼지 않음 | `evidence/vscode/LAB2/07_mealy/normal/LAB2_07_mealy_normal_waveform_full_0-67ns.png` | COMPLETED (PNG + 학생·교수 역할 ChatGPT 공동 관찰) |
| `state,value` 출력 관계 | REQUIRED_CONTENT; 별도 출력-only PNG는 NOT_REQUIRED | 전체+6~37 ns 입력 반응 확대를 함께 대조 | `normal_waveform_full_0-67ns.png` + `normal_waveform_input_response_6-37ns.png` | COMPLETED (학생·교수 역할 ChatGPT 공동 검수) |
| 입력 직후 확대 6~16 ns | REQUIRED_CONTENT | 6 ns 입력1 뒤 7 ns state0/value10, 15 ns enable0 에지/16 ns 유지 | `evidence/vscode/LAB2/07_mealy/normal/LAB2_07_mealy_normal_waveform_input_response_6-37ns.png` | COMPLETED (통합 확대 PNG, 공동 관찰) |
| 입력 직후 확대 26~37 ns | REQUIRED_CONTENT | 27 ns state1/value00, 37 ns state1/value01과 에지 사이 입력 변화 | 같은 6~37 ns 통합 PNG | COMPLETED (통합 확대 PNG, 공동 관찰) |
| 변경 `simulation.log` | REQUIRED | 정상 증거 보존 후 입력1에서 S0/S1 출력 교환, TB 유지. 7 ns `S0 input changes between clocks` FAIL; `{state,value}` expected `010`, 변경 예상 actual `001` | `evidence/vscode/LAB2/07_mealy/failure/<run>/simulation.log` | COMPLETED (build 원본 + evidence 로그 PNG 확인) |
| 복구 `simulation.log` | REQUIRED | 원래 출력 식 복원·저장 후 **새 실행**에서 PASS 11개/67 ns 예상 | `evidence/vscode/LAB2/07_mealy/recovery/<run>/simulation.log` | COMPLETED (build 원본 + evidence 로그 PNG 확인) |
| 정상/변경/복구 비교표 | REQUIRED | 세 실제 로그의 입력·상태·출력·검사 시각, expected/actual, 실패 원인·복구 | 예비보고서 작성 단계 | PENDING_REPORT_WRITING |

`<run>`은 실행 뒤 식별할 실제 run 폴더다. 정상 log 화면 PNG, 변경/복구 파형 PNG, 별도 reset 확대 PNG는 교안에서 요구하지 않는다. 66 ns 입력1 reset 후 `state=0,value=10`과 67 ns 입력0의 `state=0,value=00`은 전체 파형에서 설명한다. 원본을 삭제하거나 과거 정상 로그/VCD를 복구 실행의 증거로 재사용하지 않는다.

## 비에지와 에지의 교안/TB expected — 실제 파형 공동 관찰 완료

| TB 검사 | 조건 | expected `{state,value}` |
|---:|---|---:|
| 6 ns | 5 ns reset, bit_in0 | `000` |
| 7 ns | bit_in1로만 변경, state0 유지 | `010` (수정 RTL 예상 `001`) |
| 16 ns | enable0의 15 ns 에지 | `010` |
| 26 ns | enable1/bit_in1의 25 ns 에지, state1 | `101` |
| 27 ns | bit_in0로만 변경, state1 유지 | `100` |
| 36 ns | bit_in0의 35 ns 에지, state1 유지 | `100` |
| 37 ns | bit_in1로만 변경, state1 유지 | `101` |
| 46 / 56 ns | 입력1 유효 에지마다 toggle | `010 / 101` |
| 66 / 67 ns | 입력1 reset 뒤 / 입력0만 변경 뒤 | `010 / 000` |

교안 전체 파형의 12500 ps는 12.5 ns다. 입력 변경 시각과 `#1` 검사 시각, state의 에지 변화와 value의 조합 변화를 구분한다. `user_observation_status=COMPLETED (학생·교수 역할 ChatGPT 공동 관찰, 2026-09-19)`; PASS·VCD 존재·수치 parsing만으로 사용자 VaporView 관찰을 완료 처리하지 않는다.
