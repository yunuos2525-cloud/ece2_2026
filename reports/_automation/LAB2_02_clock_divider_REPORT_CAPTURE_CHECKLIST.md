# LAB2 02_clock_divider — REPORT_CAPTURE_CHECKLIST

상태: EVIDENCE_VERIFIED (2026-09-19). 학생과 교수 역할 ChatGPT가 정상 VaporView 파형을 함께 관찰하고 expected와 대조했다. 정상 PASS, 지정 수정 FAIL, 별도 복구 PASS는 실제 build/sim/run-* 원본 로그로 확인했다. 원본 log/VCD는 build에 보존되어 있으며 evidence 경로 복사 여부는 REQUIRED 누락 판정에 사용하지 않는다. 아래 expected 표는 교안/TB 기준값이고, 제출 본문은 아직 작성하지 않았다.

| 증거/캡처 | 상태 | 시험 조건 / 보여야 할 신호·내용 | 예정 보존 위치·파일명 | 현재 |
|---|---|---|---|---|
| 정상 simulation.log | REQUIRED | 자기 실행 `LAB2_PASS clock_divider checks=129`, `$finish` 436 ns 예상 | `evidence/vscode/LAB2/02_clock_divider/normal/<run>/simulation.log` | COMPLETED (build 원본 + evidence 로그 PNG 확인) |
| 정상 wave.vcd | REQUIRED | 정상 실행의 원본 VCD를 **수정 실험 전에** 별도 보관 | `evidence/vscode/LAB2/02_clock_divider/normal/<run>/wave.vcd` | COMPLETED (build 원본 보존) |
| 전체 VaporView screenshot | REQUIRED | Zoom Fit; `clk,rst,divided,tick,div2,tick2`와 ns 시간축, 전체 종료 범위 예상 0~436 ns | `evidence/vscode/LAB2/02_clock_divider/normal/LAB2_02_clock_divider_normal_waveform_full_0-436ns.png` | COMPLETED (PNG + 학생·교수 역할 ChatGPT 공동 관찰) |
| duty/위상 확대 screenshot | REQUIRED | 55 ns 상승, 105 ns 하강, 155 ns 재상승; `clk,divided,tick`, High/Low 50 ns씩. **권장 창 45~165 ns는 TB 기반 계획값이며 교안 고정 범위가 아님.** | `evidence/vscode/LAB2/02_clock_divider/normal/LAB2_02_clock_divider_normal_waveform_duty_tick_45-165ns.png` | COMPLETED (duty/tick 통합 PNG, 공동 관찰) |
| tick 확대 screenshot | REQUIRED | 95~105 ns tick 폭 10 ns와 다음 105 ns 소비 에지; `clk,divided,tick`. 다른 2회는 전체 파형에서 확인. **권장 창 85~115 ns는 계획값.** | `evidence/vscode/LAB2/02_clock_divider/normal/LAB2_02_clock_divider_normal_waveform_duty_tick_45-165ns.png` | COMPLETED (duty/tick 통합 PNG, 공동 관찰) |
| 리셋 확대 screenshot | REQUIRED | 376 ns `rst=1`, tick 즉시 0, 385 ns count/divided 리셋, 435 ns 재상승·436 ns 종료; `clk,rst,divided,tick`, 필요하면 내부 `count`를 보조 표시. **권장 창 365~436 ns는 계획값.** | `evidence/vscode/LAB2/02_clock_divider/normal/LAB2_02_clock_divider_normal_waveform_reset_restart_365-436ns.png` | COMPLETED (PNG + 학생·교수 역할 ChatGPT 공동 관찰) |
| 수정 실험 simulation.log | REQUIRED | 정상 원본 보존 후 한 줄 변경, TB expected 유지, 16 ns `minimum divisor duty` FAIL; expected `div2=1`, actual 예상 `0` | `evidence/vscode/LAB2/02_clock_divider/failure/<run>/simulation.log` | COMPLETED (build 원본 + evidence 로그 PNG 확인) |
| 원복 simulation.log | REQUIRED | 원래 줄 복원 후 **새 실행**에서 PASS 129회 확인 | `evidence/vscode/LAB2/02_clock_divider/recovery/<run>/simulation.log` | COMPLETED (build 원본 + evidence 로그 PNG 확인) |
| 정상/수정/원복 비교표 | REQUIRED | 세 로그의 조건·예상·관찰·해석, 첫 실패 시점 16 ns와 원복 PASS | 예비보고서 본문 작성 단계 | PENDING_REPORT_WRITING |

`<run>`은 확인된 build/sim/run-* 원본 폴더를 뜻한다. screenshot 파일명은 수집용 제안이고, 교안은 파일명을 고정하지 않았다. 정상 로그 화면 PNG, failure/recovery 파형 PNG는 교안에서 따로 요구하지 않는다. duty와 tick이 한 화면에서 충분히 읽히면 확대 그림을 함께 사용할 수 있으나 **두 기능의 관찰·설명은 모두 필요**하다.

## 캡처 전 expected와 사용자 관찰 gate

- 정적 계산: `count=0~4 → divided=0,tick=0`; `5~8 → 1,0`; `9 → 1,1`; 다음 에지 `0,0`(14쪽). TB 10 ns 기준 10분주 주기 100 ns, duty 50%, tick 폭 10 ns(15쪽, 42쪽).
- 수정 실험: `clock_divider.v`의 `count == DIVISOR/2 - 1`만 `count == DIVISOR/2`로 바꾸면 `DIVISOR=2`에서 15 ns 에지 뒤의 `div2`가 기대 1과 달리 0이므로 16 ns 검사에서 FAIL 예상(17쪽, 27쪽, 44쪽).
- `user_observation_status=COMPLETED (학생·교수 역할 ChatGPT 공동 관찰, 2026-09-19)`. 실제 파형을 열어 expected와 비교했다는 사용자 확인에 근거한다. VCD 생성·수치 parsing·PASS만으로 관찰 완료 처리한 것이 아니다.
- 원본 run 파일은 삭제하지 않는다. 복사 후 필요하면 SHA-256으로 원본/복사본 동일성을 확인한다. 수정 후 예전 정상 파형을 새 실행의 근거로 쓰지 않는다.
