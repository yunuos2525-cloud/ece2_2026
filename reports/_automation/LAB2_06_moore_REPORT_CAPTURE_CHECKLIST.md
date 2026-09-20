# LAB2 06_moore — REPORT_CAPTURE_CHECKLIST

상태: EVIDENCE_VERIFIED (2026-09-19). 학생과 교수 역할 ChatGPT가 정상 VaporView 파형을 함께 관찰하고 expected와 대조했다. 정상 PASS, 지정 수정 FAIL, 별도 복구 PASS는 실제 build/sim/run-* 원본 로그로 확인했다. 원본 log/VCD는 build에 보존되어 있으며 evidence 경로 복사 여부는 REQUIRED 누락 판정에 사용하지 않는다. 아래 expected 표는 교안/TB 기준값이고, 제출 본문은 아직 작성하지 않았다.

| 증거/캡처 | 판정 | 시험 조건·보여야 할 내용 | 예정 보존 위치·파일명 | 현재 |
|---|---|---|---|---|
| 정상 `simulation.log` | REQUIRED | 자기 실행 `LAB2_PASS moore_cycle checks=23`, `$finish` 226 ns 예상 | `evidence/vscode/LAB2/06_moore/normal/<run>/simulation.log` | COMPLETED (build 원본 + evidence 로그 PNG 확인) |
| 정상 `wave.vcd` | REQUIRED | 변경 전에 해당 정상 실행의 원본 VCD/파형 별도 보관 | `evidence/vscode/LAB2/06_moore/normal/<run>/wave.vcd` | COMPLETED (build 원본 보존) |
| 정상 전체 VaporView screenshot | REQUIRED | Zoom Fit 예상 0~226 ns(교안 예시는 ps 축), 4회 순환·hold·끝 reset. 교안의 `Add All Variables in Scope (Shallow)`; 핵심 `clk,rst,enable,advance,value` 이름·값 표시 | `evidence/vscode/LAB2/06_moore/normal/LAB2_06_moore_normal_waveform_full_0-226ns.png` | COMPLETED (PNG + 학생·교수 역할 ChatGPT 공동 관찰) |
| `value[1:0]` 상태·출력 순환 | REQUIRED_CONTENT; 별도 출력-only PNG는 NOT_REQUIRED | 전체+첫 순환 확대를 함께 대조해 00→01→10→00과 유지 확인 | `normal_waveform_full_0-226ns.png` + `normal_waveform_cycle_0-60ns.png` | COMPLETED (학생·교수 역할 ChatGPT 공동 검수) |
| 정상 첫 순환 확대 screenshot | REQUIRED | `clk,rst,enable,advance,value`로 7/16/26/36/46 ns 검사와 56 ns 복귀를 확인. 화면의 0/1/2는 본문에서 00/01/10으로 해석하며 binary 표시 재캡처는 요구하지 않음 | `evidence/vscode/LAB2/06_moore/normal/LAB2_06_moore_normal_waveform_cycle_0-60ns.png` | COMPLETED (PNG + 학생·교수 역할 ChatGPT 공동 관찰) |
| 변경 `simulation.log` | REQUIRED | 정상 증거 보존 후 S1 전이 10→00, TB 유지. 46 ns `S1 to S2` FAIL; expected 10, 변경 예상 actual 00 | `evidence/vscode/LAB2/06_moore/failure/<run>/simulation.log` | COMPLETED (build 원본 + evidence 로그 PNG 확인) |
| 복구 `simulation.log` | REQUIRED | 원래 S1→S2 복원·저장 후 **새 실행**에서 PASS 23개/226 ns 예상 | `evidence/vscode/LAB2/06_moore/recovery/<run>/simulation.log` | COMPLETED (build 원본 + evidence 로그 PNG 확인) |
| 정상/변경/복구 비교표 | REQUIRED | 세 실제 로그의 입력·이전 상태·다음 상태, 검사 시각, expected/actual, 실패 원인·복구 | 예비보고서 작성 단계 | PENDING_REPORT_WRITING |

`<run>`은 실행 후 식별할 실제 run 폴더다. 정상 log 화면 PNG, 변경/복구 파형 PNG, 별도 reset 확대 PNG는 교안에서 요구하지 않는다. 마지막 비영 상태 reset은 전체 파형에서 215→225/226 ns를 읽고 설명한다. overlap 캡처는 요구되지 않는다. 원본을 삭제하거나 과거 정상 로그/VCD를 복구 실행의 증거로 재사용하지 않는다.

## 첫 순환 교안/TB expected — 실제 파형 공동 관찰 완료

| TB 검사 | 직전 조건/에지 | 예상 `value` |
|---:|---|---:|
| 6 ns | 5 ns reset 에지 | `00` |
| 7 ns | 6 ns `advance=1`로만 변경, 유효 에지 전 | `00` 유지 |
| 16 ns | 15 ns 두 제어 1, S0→S1 | `01` |
| 26 ns | 25 ns `advance=0` | `01` 유지 |
| 36 ns | 35 ns `enable=0` | `01` 유지 |
| 46 ns | 45 ns 두 제어 1, S1→S2 | `10` (수정 RTL 예상 `00`) |
| 56 ns | 55 ns 두 제어 1, S2→S0 | `00` |
| 226 ns | 215 ns S1 진입, 225 ns reset | `00` |

교안 전체 예시의 50000 ps는 50 ns이며 파형 변화 에지와 `step`의 에지 뒤 1 ns 검사 시각을 구분한다. `user_observation_status=COMPLETED (학생·교수 역할 ChatGPT 공동 관찰, 2026-09-19)`; PASS·VCD 존재·수치 parsing만으로 사용자 VaporView 관찰 완료 처리하지 않는다.
