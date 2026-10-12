# LAB3 Validation Summary

검수 기준: LAB3 매뉴얼 원문, `REPORT_WORKFLOW.md`, `POST_REPORT_TEMPLATE.md`, `COURSE_REPORT_FORMAT.md`, LAB3 PRE report, 실제 repository evidence, 사용자 확인 수행·board 관찰.

## 1. 최종 상태

- validation status: `START_ALLOWED_WITH_OPEN_QA`
- 필수 실험 19-25: 7개 모두 포함.
- PRE representative case -> Vivado waveform: 7개 모두 직접 대응.
- XSim PASS: 7개 모두 확인.
- board physical function: 사용자가 확인한 범위에서 7개 모두 `VERIFIED`.
- 20/22/24 implementation/board 적용: `PERFORMED_EXTERNALLY`.
- 20/22/24 local implementation evidence: `NOT_AVAILABLE_LOCALLY`.
- actual TA demo: `25 UART Echo`.
- evidence structure는 기존 `waveforms/pass_logs/program_device/raw_videos/frames`를 유지했다.
- 결과보고서 본문, README, PDF, Git add/commit/push/tag는 수행하지 않았다.

## 2. Requirements coverage

| Requirement | 상태 | 근거 / 제한 |
| --- | --- | --- |
| 매뉴얼 원문 및 page source | `CONFIRMED` | `06.LAB3_0928_MANUALS.zip`의 공통 및 실험별 PDF |
| 7개 실험 inclusion | `CONFIRMED` | 19-25 source, PRE, XSim, board video 존재 |
| 같은 RTL/TB로 Icarus/XSim | `CONFIRMED_WITH_PROVENANCE_LIMIT` | `.xpr` 상대 source 경로와 동일 case/PASS 확인; 과거 run-to-commit은 `UNKNOWN` |
| XSim PASS / waveform | `CONFIRMED` | PASS 7개, waveform 18개 |
| PRE 대표 조건 대응 | `CONFIRMED` | duty/RGB/toggle/stepper/boundary/LCD/UART case가 직접 대응 |
| pin / LVCMOS33 / 20 ns clock | `CONFIRMED` | 7개 XDC 직접 확인 |
| local implementation evidence | `PARTIAL` | 19/21/23/25 local; 20/22/24 `NOT_AVAILABLE_LOCALLY` |
| 20/22/24 implementation 수행 | `CONFIRMED` | `PERFORMED_EXTERNALLY / USER_CONFIRMED`; 미수행 아님 |
| DRC/timing/bitstream 세부 값 | `PARTIAL` | 19/21/23/25만 local verified; 20/22/24 `UNKNOWN` |
| Program Device evidence | `PARTIAL` | 19/21/23/25 screenshot 존재; 20/22/24 local evidence 없음 |
| board video | `CONFIRMED` | 7개 raw video 존재 |
| board 기능 관찰 | `CONFIRMED_WITH_LIMITS` | 7개 모두 사용자 확인된 물리 출력 범위만 VERIFIED |
| 실제 조교 시연 | `CONFIRMED` | 25 UART Echo (`USER_CONFIRMED`) |
| GitHub URL / final commit hash | `OPEN` | 매뉴얼 required이나 아직 제출 단계 전; 생성·추정 금지 |
| 결과보고서/README/PDF | `NOT_STARTED_BY_REQUEST` | 이번 작업 범위에서 제외 |

## 3. 실험별 validation

| 실험 | Vivado 기능 검증 | implementation | board 물리 검증 | 최종 claim status |
| --- | --- | --- | --- | --- |
| 19 LED PWM | 30%와 100->0 wrap 확인 | local reports/bit/program 확인 | 버튼에 따른 밝기 변화 VERIFIED | `READY_WITH_SCOPE_LIMIT` |
| 20 RGB PWM | 20/50/80과 R-only 확인 | `PERFORMED_EXTERNALLY / NOT_AVAILABLE_LOCALLY` | 색·상대 밝기 변화 VERIFIED | `READY_WITH_EXTERNAL_STAGE_DISCLOSURE` |
| 21 Piezo | 5-clock toggle interval 확인 | local reports/bit/program 확인 | 실제 piezo 출력 VERIFIED | `READY_WITH_SCOPE_LIMIT` |
| 22 Stepper | forward/reverse/hold 확인 | `PERFORMED_EXTERNALLY / NOT_AVAILABLE_LOCALLY` | 실제 회전·방향/상태 변화 VERIFIED | `READY_WITH_EXTERNAL_STAGE_DISCLOSURE` |
| 23 MM:SS | 최종 project `project3_55`에서 세 경계와 3600초 순환 확인 | `project3_55` local reports/bit/program 확인 | 조교 지시에 따른 약 1분 정상 counting VERIFIED | `READY` |
| 24 Character LCD | init/line1/C0/line2 확인 | `PERFORMED_EXTERNALLY / NOT_AVAILABLE_LOCALLY` | 최종 두 줄 표시 VERIFIED | `READY_WITH_EXTERNAL_STAGE_DISCLOSURE` |
| 25 UART Echo | 0x41 및 41/5A/0A echo 확인 | local reports/bit/program 확인 | local echo OFF에서 FPGA 반환 A `USER_CONFIRMED / VERIFIED`; board LED `8'h41` `VERIFIED_BY_BOARD_PHOTO`; actual demo | `READY_WITH_SESSION_PROVENANCE_LIMIT` |

## 4. Stage interpretation

- VS Code/Icarus: PRE 기능 검증 근거.
- Vivado/XSim: 동일 대표 case의 기능·내부 timing/state 검증 근거.
- synthesis/implementation/DRC/timing/bitstream: 구현 단계 기록이며 board 정상 동작을 대신하지 않는다.
- Program Device: device programming 기록이며 물리 출력 정상 동작을 대신하지 않는다.
- board video/audio/frame: 실제 물리 출력 근거이며 simulation의 내부 신호·정확한 duty/frequency/state timing을 대신하지 않는다.
- 20/22/24는 외부 수행 사실과 local evidence 부재를 함께 쓴다. 원본이 없다는 이유로 `NOT_PERFORMED` 또는 실패로 표현하지 않는다.

## 5. Open QA / remaining uncertainty

1. 25 COM9 open 화면과 A echo 화면의 동일 session 연속성: `UNKNOWN`. 실제 시연 당시 local echo OFF 및 FPGA 반환 A는 `USER_CONFIRMED / VERIFIED`.
2. 20/22/24 DRC error/warning, timing 수치, bitstream path/size/hash, Program Device 세부 값: `UNKNOWN / NOT_AVAILABLE_LOCALLY`.
3. 23 `project3_5`의 생성 이유 또는 `project3_55`로 변경된 이유: `UNKNOWN`. 최종 source of truth, XSim 및 implementation evidence 기준은 `project3_55`로 확인됨.
4. XSim/implementation 실행과 current Git commit의 직접 연결: `UNKNOWN`.
5. GitHub URL, final commit hash, README/PDF/link 상태: 아직 생성·검증하지 않음.

위 open QA는 결과보고서 작성 시작을 막지 않는다. 보고서에서는 확인된 범위와 제한을 명시하고 값을 보완하거나 추정하지 않는다.

## 6. Report start gate

`RESULT_REPORT_START = ALLOWED`

작성 시 강제할 제한:

- 20/22/24: `PERFORMED_EXTERNALLY / NOT_AVAILABLE_LOCALLY`.
- 19/20: 정확한 duty는 Vivado 근거로만 기술.
- 21: 정확한 294 Hz/toggle은 계산·simulation 근거로만 기술.
- 22: 내부 state sequence는 Vivado 근거로만 기술.
- 23: 최종/사용 project는 `project3_55`. 세 boundary는 Vivado simulation 근거이며, board는 조교 지시에 따른 약 1분간 정상 counting 동작 검증으로 구분한다. board에서 59:59 rollover를 관찰하지 않은 것은 evidence 부족이나 검증 실패가 아니다.
- 24: 내부 init/data timing은 Vivado 근거; board는 최종 문자열만.
- 25: actual demo, local echo OFF 상태에서 FPGA가 반환한 terminal A (`USER_CONFIRMED / VERIFIED`), board LED `8'h41` (`VERIFIED_BY_BOARD_PHOTO`), Vivado `0x41` RX -> LED 저장 -> TX echo를 서로 다른 evidence로 구분한다. COM9 open 화면과 A echo 화면의 동일 session 연속성만 `UNKNOWN`으로 유지한다.
