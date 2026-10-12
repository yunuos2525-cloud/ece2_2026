# LAB3 Post Fact Sheet

> 결과보고서 작성용 사실·evidence·제한 범위 기록. 제출 본문이 아니다. 현재 evidence 폴더 구조는 변경하지 않았다.

## 0. 기준과 provenance

- current HEAD: `fd539b320326f65146adb0926222179019a2653c`
- manual source: `C:\Users\yunji\Downloads\06.LAB3_0928_MANUALS.zip`
- manual archive SHA-256: `3AD0480369F46CEA6A4C0F8EE1AF653928B4575497211377860618E2CD5E2BDD`
- `COURSE_MATERIAL`: 위 archive의 PDF 원문에서 직접 추출한 요구.
- `LOCAL_VERIFIED`: 현재 repository 파일/log/report/image에서 직접 확인한 좁은 사실.
- `USER_CONFIRMED`: 사용자가 명시적으로 확인한 수행 또는 board 관찰.
- `PERFORMED_EXTERNALLY`: 팀원 PC에서 실제 수행됨을 사용자 확인.
- `NOT_AVAILABLE_LOCALLY`: 수행은 확인됐지만 현재 local repository에 원본 evidence가 없음.
- `UNKNOWN`: 수행 사실이 아니라 세부 값·설정·연결을 확인할 근거가 부족함.
- `NOT_VERIFIED`: 요구되는 물리값/상태를 현재 evidence로 판독하지 못함.
- XSim PASS, implementation, bitstream, Program Device, board 정상 동작은 서로 다른 단계다.
- RUN_TO_COMMIT: `UNKNOWN`. 현재 HEAD를 과거 실행 commit으로 자동 대체하지 않는다.

## 1. 공통 source / Vivado 사실

- 실험: 19 LED PWM, 20 RGB PWM, 21 Piezo, 22 Stepper, 23 MM:SS Clock, 24 Character LCD, 25 UART Echo.
- FPGA part: 7개 `.xpr` 모두 `xc7s75fgga484-1`.
- 각 `.xpr`는 현재 실험 폴더의 `$PPRDIR/src`, `$PPRDIR/sim`, `$PPRDIR/constraints` 상대 경로를 사용한다.
- 7개 XDC 모두 `LVCMOS33` 및 `create_clock -name clk_50mhz -period 20.000`을 포함한다.
- XSim PASS screenshot 7개와 원본 `simulate.log` 7개가 존재한다.
- Vivado waveform 18개가 존재하며 PRE 대표 case와 직접 대응한다.
- current evidence layout:
  - `evidence/vivado/LAB3/waveforms/`
  - `evidence/vivado/LAB3/pass_logs/`
  - `evidence/vivado/LAB3/program_device/`
  - `evidence/board/LAB3/raw_videos/`
  - `evidence/board/LAB3/frames/`

## 2. PRE -> Vivado -> Board -> 안전한 주장 범위

| 실험 | PRE representative case | Vivado evidence | USER_CONFIRMED board observation | 결과보고서에서 안전한 주장 |
| --- | --- | --- | --- | --- |
| 19 LED PWM | duty 30%; 100%->0% wrap | `LAB3_19_led_pwm_normal_waveform_duty30_850-1250ns.png`; `...wrap_100to0_3100-3500ns.png`; PASS `checks=4` | 버튼 조작에 따른 LED 밝기 변화가 관찰됨 | board에서 버튼에 따른 밝기 변화를 확인. 정확한 30% duty와 wrap은 Vivado waveform 근거로만 설명 |
| 20 RGB PWM | R/G/B 20/50/80%; R-only 2->3 | `...rgb20_50_80_3475-3875ns.png`; `...r_only_step_3750-4250ns.png`; PASS `checks=2` | RGB 색과 상대 밝기 변화가 관찰됨 | board에서 색·상대 밝기 변화 확인. 20/50/80%는 Vivado 근거로만 설명 |
| 21 Piezo | 5-clock half-period; `edges=5` | `...toggle_interval_0-551ns.png`; PASS `edges=5` | video/audio에서 실제 piezo 출력 발생 관찰 | board에서 소리 출력 발생 확인. 정확한 294 Hz와 toggle interval은 계산/simulation으로만 설명 |
| 22 Stepper | forward `6,C,9,3`; reverse `9,C`; hold `C` | `...forward_reverse_hold_0-831ns.png`; PASS `checks=8` | 실제 motor 동작과 방향/상태 변화 관찰 | board는 물리 회전·방향 변화·정지 대응 근거. 정확한 내부 state sequence는 Vivado 근거 |
| 23 MM:SS | 00:09->00:10; 00:59->01:00; 59:59->00:00 | `project3_55` 기준 세 boundary waveform과 full waveform; PASS `checks=7` | 조교 지시에 따라 약 1분간 MM:SS 표시의 정상 counting 동작 관찰 | board 요구 범위인 약 1분 counting은 `VERIFIED / USER_CONFIRMED`. 세 정확한 경계는 Vivado simulation 근거로 분리하며, board에서 59:59 rollover를 관찰하지 않은 것은 evidence 부족이나 검증 실패로 판정하지 않음 |
| 24 Character LCD | init commands; line1; `0xC0`; line2 | `...init_commands.png`; `...line1_data.png`; `...line2_transition_data.png`; PASS `bytes=40` | 최종 두 줄 문자열 표시 관찰 | board에서는 `FPGA LAB3` / `LCD CONTROLLER` 최종 표시 확인. 내부 command/data timing은 Vivado 근거 |
| 25 UART Echo | `0x41` RX -> LED -> TX; 전체 `41,5A,0A` | `...echo_0x41.png`; full waveform; PASS `checks=3` | 실제 시연 대상; COM9 open; local echo OFF 상태에서 A 송신 뒤 terminal에 A 표시; board LED2·LED8 ON = `8'b0100_0001 = 8'h41` | terminal A는 FPGA echo 결과로 해석 가능 (`USER_CONFIRMED / VERIFIED`). terminal, board LED `0x41`, Vivado 내부 echo는 서로 다른 evidence로 설명. LED는 `VERIFIED_BY_BOARD_PHOTO`; screenshot 간 동일 session 연속성은 `UNKNOWN` |

## 3. XSim evidence inventory

| 실험 | PASS / 종료 | waveform 수 | 핵심 검증 |
| --- | --- | ---: | --- |
| 19 | `LAB3_LED_PWM_PASS checks=4`, 3831 ns | 3 | 30% HIGH 폭, 100%->0% wrap |
| 20 | `LAB3_RGB_PWM_PASS checks=2`, 4431 ns | 3 | RGB 20/50/80, R-only 증가 |
| 21 | `LAB3_PIEZO_PASS edges=5`, 551 ns | 1 | 5-clock toggle interval |
| 22 | `LAB3_STEPPER_PASS checks=8`, 831 ns | 1 | forward/reverse/hold |
| 23 | `LAB3_MMSS_PASS checks=7`, 144031 ns | 4 | 최종/사용 project `project3_55` 기준 세 자리올림 경계와 full run |
| 24 | `LAB3_LCD_PASS bytes=40`, 8130 ns | 4 | init, line1, line2 transition/data |
| 25 | `LAB3_UART_ECHO_PASS checks=3`, 9910 ns | 2 | 0x41 확대 및 41/5A/0A 전체 |

## 4. Implementation / DRC / timing / bitstream

| 실험 | implementation status | local evidence | 확인된 값 |
| --- | --- | --- | --- |
| 19 | `LOCAL_VERIFIED` | project run/report/bit 및 Program Device screenshot 존재 | Vivado 2026.1; synth/route/write_bitstream success; WNS 8.971 ns, TNS 0; routed DRC에 CFGBVS-1 warning 1, methodology TIMING-18 warning 8; bit 3,687,015 bytes, SHA-256 `2A86B4E7CCB5101E6F8B44F5F824C71B575D4962CDF87CF820A718DC6DF0FF52`; Programmed |
| 20 | `PERFORMED_EXTERNALLY` | `NOT_AVAILABLE_LOCALLY` | DRC/timing/warning/bitstream path·size·hash·Program Device 세부 값 `UNKNOWN` |
| 21 | `LOCAL_VERIFIED` | project run/report/bit 및 Program Device screenshot 존재 | Vivado 2026.1; synth/route/write_bitstream success; WNS 16.761 ns, TNS 0; CFGBVS-1 warning 1, TIMING-18 warning 1; bit 3,687,013 bytes, SHA-256 `E3D7066963BCD2E5B20027E58D2BCEEC0C538E8192966270E28227DAD4363669`; Programmed |
| 22 | `PERFORMED_EXTERNALLY` | `NOT_AVAILABLE_LOCALLY` | DRC/timing/warning/bitstream path·size·hash·Program Device 세부 값 `UNKNOWN` |
| 23 | `LOCAL_VERIFIED` | `project3_55` run/report/bit 및 Program Device screenshot 존재 | Vivado 2026.1; synth/route/write_bitstream success; WNS 15.118 ns, TNS 0; CFGBVS-1 warning 1, TIMING-18 warning 16; bit 3,687,018 bytes, SHA-256 `71B4495C21B7964CBA7A7DBDD84E0DE2AB20E4ADCB1C3DB02BB7E301DB02E7A7`; Programmed |
| 24 | `PERFORMED_EXTERNALLY` | `NOT_AVAILABLE_LOCALLY` | DRC/timing/warning/bitstream path·size·hash·Program Device 세부 값 `UNKNOWN` |
| 25 | `LOCAL_VERIFIED` | project run/report/bit 및 Program Device screenshot 존재 | Vivado 2026.1; synth/route/write_bitstream success; WNS 14.617 ns, TNS 0; CFGBVS-1 warning 1, TIMING-18 warning 9; bit 3,687,017 bytes, SHA-256 `6EF9864E768C7C3BFFB2CDF8856355FC5E9944E17DC710FFB915FEFF6F6FED18`; Programmed |

해석 제한:

- 20/22/24는 수행 사실이 확인되었으므로 `NOT_PERFORMED`로 쓰지 않는다.
- 20/22/24의 local 원본 부재를 success/failure 판정으로 바꾸지 않는다.
- 19/21/23/25의 CFGBVS-1 및 TIMING-18을 숨기거나 warning-free DRC로 표현하지 않는다.
- 23의 최종 source of truth와 실제 사용 project는 `project3_55`이며 XSim 및 implementation evidence도 `project3_55` 기준으로 연결한다. `project3_5`는 최종 source of truth로 사용하지 않는다. `project3_5`의 생성 이유 또는 `project3_55`로 변경된 이유는 `UNKNOWN`이며 추정하지 않는다.

## 5. Board evidence and claim limits

| 실험 | raw video | board validation | 금지되는 확대 해석 |
| --- | --- | --- | --- |
| 19 | `LAB3_19_led_pwm_program_video.mp4` | 밝기 변화 `VERIFIED / USER_CONFIRMED` | 30% duty, 정확한 wrap 시점 |
| 20 | `LAB3_20_rgb_pwm_video.mp4` | 색·상대 밝기 변화 `VERIFIED / USER_CONFIRMED` | 정확한 20/50/80% duty |
| 21 | `LAB3_21_piezo_program_video.mp4` | 실제 piezo 출력 발생 `VERIFIED / USER_CONFIRMED` | 정확한 294 Hz, toggle interval |
| 22 | `LAB3_22_stepper_video.mp4` | motor 회전·방향/상태 변화 `VERIFIED / USER_CONFIRMED` | 내부 4상 state 순서 |
| 23 | `LAB3_23_mmss_clock_program_video.mp4` | 조교 지시에 따른 약 1분간 정상 counting 동작 `VERIFIED / USER_CONFIRMED` | board가 세 경계의 정확한 timing을 검증했다고 확대 해석하는 것. 59:59->00:00 미관찰은 실제 board 요구 범위 밖이므로 evidence 부족/실패로 분류하지 않음 |
| 24 | `LAB3_24_character_lcd_video.mp4` | 최종 두 줄 문자열 `VERIFIED / USER_CONFIRMED` | init command, line1/line2 timing |
| 25 | `LAB3_25_uart_echo_program_video.mp4` 및 frames 3개 | actual demo, COM9 open, local echo OFF에서 A 송신 뒤 FPGA echo A 표시 `USER_CONFIRMED / VERIFIED`; LED2·LED8 ON을 MSB->LSB mapping으로 해석한 `8'h41`은 `VERIFIED_BY_BOARD_PHOTO` | COM9 open 화면과 A echo 화면의 동일 session 연속성 |

## 6. UART demo facts

- actual demo: `25 UART Echo` (`USER_CONFIRMED`).
- XSim: `0x41` RX -> LED 저장 -> TX echo waveform 확인 (`LOCAL_VERIFIED`).
- Program Device: `lab3_uart_echo.bit`, device `Programmed` screenshot (`LOCAL_VERIFIED`).
- serial port: COM9 open screenshot 존재 (`LOCAL_VERIFIED`).
- terminal: 문자 A 송신 문구와 다음 줄 A 표시 screenshot 존재 (`LOCAL_VERIFIED`). 실제 board 시연 당시 local echo가 OFF였으므로 표시된 A는 FPGA echo 결과로 해석 가능 (`USER_CONFIRMED / VERIFIED`).
- board overview screenshot 존재. LCD에는 `FPGA LAB3` / `LCD CONTROLLER`가 보이지만 이 LCD 표시와 UART 기능의 관계는 `UNKNOWN`.
- board LED: LED2와 LED8 ON, 나머지 OFF (`USER_CONFIRMED`). LED1-LED8이 8-bit 출력의 MSB->LSB 순서인 현재 설계/board mapping에서 `8'b0100_0001 = 8'h41`, ASCII `A`; `VERIFIED_BY_BOARD_PHOTO`.
- terminal local echo off 설정: `USER_CONFIRMED / VERIFIED`.
- COM9 open 화면과 A echo 화면의 동일 session 연속성: `UNKNOWN`.
- 안전한 보고서 문장 범위: (1) local echo OFF 상태에서 terminal에 A를 송신한 뒤 FPGA가 반환한 A 표시, (2) board LED의 `8'h41` 표시, (3) Vivado의 `0x41` RX -> LED 저장 -> TX echo를 서로 다른 evidence로 설명한다. COM9 open 화면과 A echo 화면의 동일 session 연속성은 별도 artifact로 입증되지 않아 `UNKNOWN`으로 남긴다.

## 7. Git / submission facts

- LAB3 source와 PRE report는 current HEAD에 존재한다.
- `evidence/vivado/LAB3/`와 `evidence/board/LAB3/`는 현재 untracked이다.
- 결과보고서, README, remote GitHub URL, final commit/tag는 아직 만들거나 확인하지 않았다.
- 본 문서 작성에서 evidence 이동/rename, report/README/PDF/Git 작업은 수행하지 않았다.
