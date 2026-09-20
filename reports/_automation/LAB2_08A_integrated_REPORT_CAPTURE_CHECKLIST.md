# LAB2 08A_integrated — REPORT_CAPTURE_CHECKLIST

상태: EVIDENCE_VERIFIED (2026-09-19). 학생과 교수 역할 ChatGPT가 정상 VaporView 파형을 함께 관찰하고 expected와 대조했다. 정상 PASS, 지정 수정 FAIL, 별도 복구 PASS는 실제 build/sim/run-* 원본 로그로 확인했다. 원본 log/VCD는 build에 보존되어 있으며 evidence 경로 복사 여부는 REQUIRED 누락 판정에 사용하지 않는다. 아래 expected 표는 교안/TB 기준값이고, 제출 본문은 아직 작성하지 않았다. 공식 제출 포함 여부는 UNKNOWN이다.

| 증거/화면 | 판정 | 교안에서 확인할 시험 조건·신호 | 예정 보존 위치 / 파일명 | 현재 |
|---|---|---|---|---|
| 정상 원본 `simulation.log` | REQUIRED | 새 실행의 `LAB2_INTEGRATED_PASS modes=8 checks=2848`, `$finish` **34326 ns** 예상과 종료 상태 확인 | `evidence/vscode/LAB2/08A_integrated/normal/<run>/simulation.log` | COMPLETED (build 원본 + evidence 로그 PNG 확인) |
| 정상 원본 `wave.vcd` | REQUIRED_SOURCE | 정상 PASS log와 같은 build run의 VCD 원본 보존 확인; evidence 경로 복사는 교안 필수 아님 | `LAB2/08A_integrated/build/sim/run-*/wave.vcd` | COMPLETED (build 원본 보존) |
| 전체 VaporView waveform | REQUIRED | 0~34.326 µs 전체 mode 0→7→0 흐름을 확인. 입력·출력 세부 관계는 다른 확대 PNG와 TB 자동 검사 결과를 함께 대조 | `evidence/vscode/LAB2/08A_integrated/normal/LAB2_08A_integrated_normal_waveform_full_0-34326ns.png` | COMPLETED (PNG + 학생·교수 역할 ChatGPT 공동 관찰) |
| 제어 연결 관계 | REQUIRED_CONTENT; 전용 PNG는 NOT_REQUIRED | 전체 mode 흐름, 마지막 동시 버튼/reset 확대, 정상 TB의 내부 `dut.mode`/count 검사 결과를 함께 대조 | 기존 전체·simultaneous_reset PNG + 정상 PASS log | COMPLETED (학생·교수 역할 ChatGPT 공동 검수) |
| mode2 register 연결 확대 | REQUIRED | `A0→3A→33`의 SW/step/LED 관계를 확대 PNG와 정상 TB 검사로 확인 | `evidence/vscode/LAB2/08A_integrated/normal/LAB2_08A_integrated_normal_waveform_mode2_register_7500-8500ns.png` | COMPLETED (PNG + 학생·교수 역할 ChatGPT 공동 관찰) |
| LCD MODE05·버스 확대 | REQUIRED_CONTENT | mode=4에서 `MODE 05` 전송 시작을 확대 PNG로, 전체 byte 시퀀스 및 bus timing을 정상 TB 자동 검사로 함께 확인 | `evidence/vscode/LAB2/08A_integrated/normal/LAB2_08A_integrated_normal_waveform_lcd_mode05_17050-17250ns.png` + 정상 PASS log | COMPLETED (학생·교수 역할 ChatGPT 공동 검수) |
| mode7 scan 확대 | REQUIRED | mode7의 `seg_com` blank/활성 및 `seg_data` 전환을 PNG로, index·SW 관계를 정상 TB와 함께 검증 | `evidence/vscode/LAB2/08A_integrated/normal/LAB2_08A_integrated_normal_waveform_mode7_scan_28500-28625ns.png` + 정상 PASS log | COMPLETED (학생·교수 역할 ChatGPT 공동 검수) |
| 마지막 동시 버튼·reset 확대 | REQUIRED | N8/N4 동시 입력과 마지막 `rst` 뒤 외부 출력 초기화 관계를 확대 PNG와 정상 TB 내부 상태 검증으로 확인 | `evidence/vscode/LAB2/08A_integrated/normal/LAB2_08A_integrated_normal_waveform_simultaneous_reset_34000-34330ns.png` + 정상 PASS log | COMPLETED (학생·교수 역할 ChatGPT 공동 검수) |
| 수정 실행 원본 `simulation.log` | REQUIRED | 정상 증거 보존 뒤 `counter4.v` 증가 `4'd1→4'd2`, TB 유지. 첫 예상 **346 ns** `LAB2_INTEGRATED_FAIL counter increments once`; expected LED `01`, 변경 예상 actual `02`. 실제 log 시각·이름 확인 | `evidence/vscode/LAB2/08A_integrated/failure/<run>/simulation.log` | COMPLETED (build 원본 + evidence 로그 PNG 확인) |
| 복구 실행 원본 `simulation.log` | REQUIRED | 원래 `4'd1`로 복원·저장 후 **새 실행**에서 modes8/checks2848/34326 ns PASS 기대. 과거 정상 log를 복구 증거로 재사용 금지 | `evidence/vscode/LAB2/08A_integrated/recovery/<run>/simulation.log` | COMPLETED (build 원본 + evidence 로그 PNG 확인) |
| 정상/수정/복구 3행 비교 | REQUIRED | 세 실제 실행의 RTL 조건, 검사 이름·시각, 이전 상태/입력, expected/actual, 실패 원인·복구를 연결 | 예비보고서 작성 단계의 비교표 | PENDING_REPORT_WRITING |

`<run>`은 실제 build 원본 폴더다. 교안은 실패/복구 파형의 별도 screenshot이나 정상 PASS 터미널 PNG를 지정하지 않는다. 원본 log/VCD 보존과 VaporView screenshot의 사용자 관찰은 서로 다른 확인 단계다. 확대 구간은 실제 저장된 PNG의 파일명에 기록되어 있다. 공식 제출 실험 포함 여부만 UNKNOWN이다.

## 대표 교안/TB expected — 실제 파형 공동 관찰 완료

| 구간/조건 | 예상 관계 | 출처 |
|---|---|
| TB 초기 reset | `dut.mode=0`, `led=00`; 마지막 전체 reset에서는 `lcd_e=0,seg_com=FF`도 검사 | TB 78~79행, 126~127행; 교안 58쪽, 61쪽 |
| mode0 SW0=0, N4 첫 유효 pulse | counter0→1, `led=01`; 짧은 bounce만으로는 증가하지 않음 | TB 79~82행; 교안 58~59쪽 |
| mode0 SW0=1, N4 두 번 | counter1→0→15, `led=00→0F` | TB 81~82행; 교안 59쪽 |
| mode2 동시 load/transfer | SW nibble3, 이전 stored A → `stored=3,registered=A`, `led=3A`; 다음 pulse `33` | TB 89~91행; 교안 59쪽 |
| mode6 입력 변화만 | state0에서 SW7=1이면 step 없이 `led=02`, step 뒤 `05`, SW7=0에서 `04` | TB 105~108행; 교안 60쪽 |
| mode7 SW nibble9 | `seg_com` 선택은 `8'hFF ^ (8'h80 >> led[2:0])`, blank는 FF; index0 활성 `seg_data=F6`, 64 clock 관찰 중 active32/blank32 예상 | TB 110~120행; 교안 60~61쪽 |
| mode7→0과 동시 버튼 | mode wrap 뒤 이전 counter15 대신 `led=00`; N8/N4 동시 pulse 때 새 mode1, 이전 counter0 | TB 121~125행; 교안 61쪽 |
| 지정 수정 첫 예상 FAIL | TB reset 해제·스위치 동기화·bounce task 뒤 **346 ns**의 `counter increments once`: 정상 `led=01`, 변경 예상 `02` | TB 78~80행의 step 수 정적 계산; 교안 58쪽, 85쪽 |

## 사용자 관찰 gate

1. 정상 simulation 뒤 최신 run의 PASS·종료 상태를 확인하고 같은 run의 log/VCD를 식별한다.
2. VaporView에서 전체 mode 순환을 확인한 뒤 목적별 제어·회로·LCD·scan·마지막 reset 확대를 실제로 읽고 screenshot을 저장/승인한다.
3. 각 구간은 **시험 조건 → expected → 사용자 관찰값 → 해석**으로 공동 대조했다. `user_observation_status=COMPLETED`.
4. 교안 지정 RTL 한 줄 변경의 FAIL log와 원복 뒤 새 PASS log를 각각 분리해 확인했다.
