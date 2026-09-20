# LAB2 04_shift_register — REPORT_REQUIREMENTS

상태: COURSE_EXTRACTED. 예비보고서 본문은 아직 작성하지 않았다. 출처: `05.LAB2_04_SHIFT_REGISTER_VIVADO.pdf` 1~75쪽 (`C:\Users\yunji\Downloads\05.LAB2_0921_VIVADO_8plus1.zip` 내부). 아래 REQUIRED는 특히 교안 42쪽의 **실험 전 레포트** 1~5항 및 해당 설명 쪽에 근거한다. 제출용 제목·순서 지정은 확인되지 않아 `UNKNOWN_FORMAT_AUTHORITY`이다.

| 보고서 항목 | 판정 | 교안 근거 | 필요한 계산·설명·증거 |
|---|---|---|---|
| 다음 상태·이동 방향 | REQUIRED | 13~16쪽, 42쪽 1항 | `rst`/`enable`별 상태표; `serial_in→value[3]`, 이전 `[3]→[2]→[1]→[0]`, 이전 `[0]` 폐기. nonblocking 오른쪽 항은 에지 전 값. 한 에지에 모든 단계를 통과하지 않음. |
| 대표 상태 계산 | REQUIRED | 14~15쪽, 23쪽, 39~40쪽, 42쪽 1항 | `8→4→A→5`를 각 에지 전 값과 `{serial_in,이전 value[3:1]}`로 계산. enable=0의 `4` 유지, 네 번 0 입력의 `5→2→1→0→0`, reset 우선 `0`도 시험과 연결. |
| 파일 역할 | REQUIRED | 10~12쪽, 16~31쪽, 42쪽 2항 | `shift_register4`, `input_frontend`, `lab2_shift_register`, TB, `simulation.json`, XDC 및 design/simulation top 역할. 코어 TB가 보드 버튼 처리까지 검증했다는 주장 금지. |
| 정상 PASS·검사 시각 | REQUIRED | 23~27쪽, 34쪽, 42쪽 3항 | 자기 정상 로그의 `LAB2_PASS shift_register4 checks=8`, 106 ns 종료; 6/16/26/36/46/56/96/106 ns 검사 조건과 기대값. 교안 예시를 자신의 실행으로 사용하지 않음. |
| 정상·변경·원복 로그 비교 | REQUIRED | 41~42쪽 | 세 실제 실행의 로그, 검사 시각, 기대·실제값 비교. 식 `{serial_in,value[3:1]}`→`{value[2:0],serial_in}`, TB 그대로, 16 ns `input enters MSB` 첫 실패 예상, 기대 8(1000) 대 변경 예상 1(0001), 원복 PASS 8개/106 ns. |
| VS Code 전체 waveform | REQUIRED | 37~38쪽, 42쪽 4항 | VaporView `clk,rst,enable,serial_in,value`; 0~106 ns Zoom Fit, ns 축과 신호명이 보이는 screenshot 및 해석. 실제 종료 시각은 실행 후 확인. |
| enable 유지 구간 | REQUIRED | 39쪽, 42쪽 4항 | 25 ns 입력 0으로 `4`, 35 ns `serial_in=1`이어도 `enable=0`이라 `4` 유지, 45 ns 다시 enable해 `A`. 입력·제어·출력의 에지 전후를 읽을 수 있는 확대 파형과 설명. 정확한 확대 시작/끝 ns는 교안이 지정하지 않음. |
| reset 우선 구간 | REQUIRED | 40쪽, 42쪽 4항 | 95 ns 후 0 상태, 105 ns `rst=1,enable=1,serial_in=1`에서 106 ns `value=0`; reset 우선 확인. 첫 0~5 ns X는 첫 동기 reset 에지 전 미정 상태. 별도 확대 파형의 정확한 창은 지정하지 않음. |
| 보드 사전 계획 | REQUIRED | 21~22쪽, 42쪽 5항, 73~74쪽 | Vivado 전에 SW1(serial input), N8(한 단계), K4(reset) 조작 순서와 LED 예상 `00→08→04→0A→05→02→01→00→00`, 버튼 없이 스위치만 바꾸면 유지. B6 1 kHz/20 ms 안정 검사와 LED 상위 니블 0 설명. 실제 보드 관찰로 쓰지 않음. |
| XDC 사용 범위 | REQUIRED | 28쪽, 42쪽 2항 | XDC는 보드 핀·클록 제약용; VS Code/Icarus 코어 시뮬레이션에는 사용되지 않음. |
| 04 교안의 설정·오류 기록 절 | NOT_REQUIRED | 7~8쪽, 32쪽, 42쪽 | 환경 점검·오류 해결 안내는 있으나 실험 전 레포트의 별도 기록 항목은 없음. 실제 의미 있는 문제가 생기면 내부 실행 기록으로 보존하고 필요한 경우만 본문에서 설명. |
| 실패 waveform screenshot | NOT_REQUIRED | 41~42쪽 | FAIL 로그와 기대·실제 비교는 필요하지만 별도 실패 파형 캡처는 지정하지 않음. |
| 원복 waveform screenshot | NOT_REQUIRED | 41~42쪽 | 새 원복 PASS 로그는 필요하지만 별도 원복 파형 캡처는 지정하지 않음. |
| PRE 본문 Git hash/run ID/tag | NOT_REQUIRED | 42쪽 | 실험 전 레포트 지시에 없음. 필요 출처는 내부 manifest/evidence로 관리. |

## 근거와 작성 경계

- 교안의 `checks=8`, 106 ns, 16 ns 실패는 기대/예시다. 자신의 로그·VaporView 사용자 관찰 전에는 관찰 결과로 서술하지 않는다.
- 정상 `simulation.log`와 `wave.vcd`는 한 줄 수정 전에 보관한다(41쪽). 정상/변경/원복 로그는 서로 다른 실행에서 확인한다.
- 공통 VS Code/VCD/VaporView 사용법은 반복하지 않고, 이 실험의 입력 방향·enable·reset·예상값·실제 파형 해석에 집중한다(`REPORT_WORKFLOW.md`, `PRE_REPORT_TEMPLATE.md`).
