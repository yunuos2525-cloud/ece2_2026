# LAB2 03_register — REPORT_CAPTURE_CHECKLIST

상태: EVIDENCE_VERIFIED (2026-09-19). 학생과 교수 역할 ChatGPT가 정상 VaporView 파형을 함께 관찰하고 expected와 대조했다. 정상 PASS, 지정 수정 FAIL, 별도 복구 PASS는 실제 build/sim/run-* 원본 로그로 확인했다. 원본 log/VCD는 build에 보존되어 있으며 evidence 경로 복사 여부는 REQUIRED 누락 판정에 사용하지 않는다. 아래 expected 표는 교안/TB 기준값이고, 제출 본문은 아직 작성하지 않았다.

| 증거/캡처 | 판정 | 반드시 확인할 내용 | 예정 보존 위치·파일명 | 현재 |
|---|---|---|---|---|
| 정상 `simulation.log` | REQUIRED | 새 실행의 `LAB2_PASS register_pair checks=7`, `$finish` 66 ns 예상; 일곱 검사 통과 | `evidence/vscode/LAB2/03_register/normal/<run>/simulation.log` | COMPLETED (build 원본 + evidence 로그 PNG 확인) |
| 정상 `wave.vcd` | REQUIRED | 수정 실험 전에 해당 정상 실행의 원본 VCD 별도 보관 | `evidence/vscode/LAB2/03_register/normal/<run>/wave.vcd` | COMPLETED (build 원본 보존) |
| 정상 전체 VaporView screenshot | REQUIRED | Zoom Fit 0~66 ns 예상, ns 단위; `clk,rst,load,transfer,data_in,stored,value` 이름·값 표시. 15 저장, 25 전달, 35/45 동시, 55 hold, 65 reset 확인 | `evidence/vscode/LAB2/03_register/normal/LAB2_03_register_normal_waveform_full_0-66ns.png` | COMPLETED (PNG + 학생·교수 역할 ChatGPT 공동 관찰) |
| 정상 25/35/45 ns 확대 screenshot | REQUIRED | 세 상승 에지와 직전·직후 상태가 읽히게 표시. `data_in`, `load`, `transfer`, `stored`, `value`, `clk` 필수. **권장 20~50 ns는 TB 기반 계획값이고 교안 고정 범위가 아님.** | `evidence/vscode/LAB2/03_register/normal/LAB2_03_register_normal_waveform_transfer_20-50ns.png` | COMPLETED (PNG + 학생·교수 역할 ChatGPT 공동 관찰) |
| 수정 `simulation.log` | REQUIRED | 한 줄 변경, TB 유지 후 26 ns `transfer stored not live input` FAIL. 정상 기대 `{stored,value}=AA`, 오류 예상 `A3`(`value`: A 대 3) | `evidence/vscode/LAB2/03_register/failure/<run>/simulation.log` | COMPLETED (build 원본 + evidence 로그 PNG 확인) |
| 원복 `simulation.log` | REQUIRED | 원래 줄 복원·저장 후 **새 실행**에서 PASS 7개/66 ns 예상 | `evidence/vscode/LAB2/03_register/recovery/<run>/simulation.log` | COMPLETED (build 원본 + evidence 로그 PNG 확인) |
| 정상·수정·원복 비교 | REQUIRED | 세 실행의 실제 log/검사 시각, 조건·expected·actual·원인·복구 결과 | 예비보고서 작성 단계 | PENDING_REPORT_WRITING |

`<run>`은 실제 실행 후 확인할 run 폴더를 뜻한다. 정상 log 화면 PNG, 실패/원복 waveform PNG, 별도 reset 확대 PNG는 교안에서 요구하지 않는다. 정상 파형 screenshot은 사용자의 실제 VaporView 관찰을 동반해야 하며 VCD parsing이나 PASS만으로 완료 처리하지 않는다.

## 확대 구간 expected — 관찰 전 계산

| 검사 시각 | 직전 조건/에지 | 에지 뒤 예상 `{stored,value}` | 확인할 구분 |
|---:|---|---|---|
| 16 ns | 15 ns, `load=1`, `data_in=A` | `A0` | 저장만 수행, value 0 |
| 26 ns | 25 ns, `load=0`, `transfer=1`, `data_in=3`, 이전 stored A | `AA` | 입력 3이 아닌 저장 A 전달. 수정 회로 예상 `A3` |
| 36 ns | 35 ns, `load=1`, `transfer=1`, `data_in=3`, 이전 stored A | `3A` | 두 제어 독립, 이전 stored 전달 |
| 46 ns | 45 ns, 두 제어 유지, 이전 stored 3 | `33` | 새 stored 3이 다음 에지에 value로 전달 |
| 56 ns | 55 ns, 두 제어 0, `data_in=F` | `33` | hold |
| 66 ns | 65 ns, `rst=1`, 두 제어 1 | `00` | reset 우선 |

첫 정상 리셋 확인은 6 ns의 `00`. `user_observation_status=COMPLETED (학생·교수 역할 ChatGPT 공동 관찰, 2026-09-19)`; 전체·transfer screenshot과 expected 비교를 사용자 확인에 따라 반영했다. 원본 run 파일은 삭제하지 않으며 이전 정상 log/VCD를 복구 실행의 증거로 재사용하지 않는다.
