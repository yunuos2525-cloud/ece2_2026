# LAB2 01_counter ~ 08A_integrated evidence inventory

검수일: 2026-09-19. 이 문서는 보고서 본문이 아닌 내부 evidence inventory다. 기준은 최신 REPORT_WORKFLOW, 실험별 REPORT_REQUIREMENTS / REPORT_CAPTURE_CHECKLIST, 실제 저장 파일, 학생과 교수 역할 ChatGPT의 공동 VaporView 관찰·expected 비교 확인이다.

## 최종 판정

- COMPLETE: 01_counter, 02_clock_divider, 03_register, 04_shift_register, 05_piso, 06_moore, 07_mealy, 08_segment_scan. 08A_integrated도 해당 교안의 evidence 검수 범위에서는 COMPLETE.
- MISSING_REQUIRED: 없음.
- UNKNOWN: 08A_integrated의 공식 제출 실험 포함 여부만 미확정.
- user_observation_status: 01~08A 모두 COMPLETED. 01은 기존 사용자 확인, 02~08A는 학생·교수 역할 ChatGPT의 공동 관찰 및 expected 대조에 관한 사용자 최종 확인에 근거한다.

## 원본과 screenshot

01의 정상 simulation.log / wave.vcd는 evidence에도 복사되어 있다. 02~08A의 정상·수정 실패·복구 simulation.log 및 정상 wave.vcd는 각 LAB2 실험의 build/sim/run-* 원본에 보존되어 있다. 지정 evidence 폴더에 복사되지 않은 사실은 교안 REQUIRED 누락이나 보고서 작성 blocker가 아니다. 정상 PASS, 수정 FAIL, 복구 PASS는 서로 다른 run에서 확인했다. 제출 본문에 Git hash나 run ID를 요구하지 않는다.

| 실험 | 정상 PASS | 정상 파형 검수 | 수정 FAIL | 복구 PASS | 판정 |
|---|---|---|---|---|---|
| 01_counter | counter4 checks=36, 356 ns | 전체, wrap, hold/reset | NOT_REQUIRED | NOT_REQUIRED | COMPLETE |
| 02_clock_divider | clock_divider checks=129, 436 ns | 전체, duty/tick 통합, reset/restart | minimum divisor duty, 16 ns | checks=129, 436 ns | COMPLETE |
| 03_register | register_pair checks=7, 66 ns | 전체, transfer 25/35/45 ns | transfer stored not live input, 26 ns | checks=7, 66 ns | COMPLETE |
| 04_shift_register | shift_register4 checks=8, 106 ns | 전체, hold, reset priority | input enters MSB, 16 ns | checks=8, 106 ns | COMPLETE |
| 05_piso | piso4 checks=114, 976 ns | 전체와 A 확대에서 value/serial_out 관계 | MSB first before edge, 86 ns | checks=114, 976 ns | COMPLETE |
| 06_moore | moore_cycle checks=23, 226 ns | 전체와 첫 순환; 화면 0/1/2는 본문에서 00/01/10으로 해석 | S1 to S2, 46 ns | checks=23, 226 ns | COMPLETE |
| 07_mealy | mealy_toggle checks=11, 67 ns | 전체와 6~37 ns 통합 입력 반응 | S0 input changes between clocks, 7 ns | checks=11, 67 ns | COMPLETE |
| 08_segment_scan | segment_scan8 checks=194, 1306 ns | 전체와 첫 두 자리; index/select/segments, blank select=00 | reset blanks digit zero, 6 ns | checks=194, 1306 ns | COMPLETE |
| 08A_integrated | modes=8 checks=2848, 34326 ns | mode 0→7→0, mode2 register, LCD MODE05, mode7 scan, simultaneous 버튼/reset; 내부 상태와 LCD bus timing은 정상 TB 검사와 함께 검증 | counter increments once, 346 ns | modes=8 checks=2848, 34326 ns | EVIDENCE COMPLETE; 제출 포함 UNKNOWN |

05~07의 출력-only 화면, 06의 binary 표시 재캡처, 07의 checks 신호 재캡처, 08의 digits/checks 신호 재캡처를 추가 REQUIRED로 판정하지 않는다. 08A는 한 PNG 안에 모든 내부 신호를 요구하지 않고, 여러 파형·정상 TB log가 함께 입증하는 범위를 사용한다. failure/recovery waveform screenshot은 02~08A에 필수로 추가하지 않는다.

## 보고서 단계

01~08의 evidence 수집 gate는 충족한다. 08A도 evidence 자체는 충족하며, 제출 본문에 포함할지는 공식 실험 수 확인 후 결정한다. 보고서 본문의 조건·expected·관찰·해석 및 정상/실패/복구 비교표는 아직 작성하지 않았다.
