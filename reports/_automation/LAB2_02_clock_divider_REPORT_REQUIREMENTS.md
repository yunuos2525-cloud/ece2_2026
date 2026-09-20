# LAB2 02_clock_divider — REPORT_REQUIREMENTS

상태: COURSE_EXTRACTED. 예비보고서 본문은 아직 작성하지 않았다. 출처: `05.LAB2_02_CLOCK_DIVIDER_VIVADO.pdf` 1~80쪽 (`C:\Users\yunji\Downloads\05.LAB2_0921_VIVADO_8plus1.zip` 내부). 아래의 REQUIRED는 02 교안 45쪽의 실험 전 레포트 지시와 해당 설명 페이지에 근거한다. 제출용 제목·순서의 강제 여부는 교안에서 명시되지 않아 UNKNOWN_FORMAT_AUTHORITY이다.

| 보고서 항목 | 상태 | 교안 근거 | 필요한 계산·설명·증거 |
|---|---|---|---|
| count·divided·tick 예상 상태 | REQUIRED | 13~14쪽, 45쪽 1항 | 에지 **직전** count와 에지 뒤 출력 관계, 0~4/5~8/9/다음 0의 상태표. `tick=!rst&&(count==DIVISOR-1)`과 다음 에지 소비를 설명. |
| 주기·duty 계산 | REQUIRED | 13~15쪽, 42쪽, 45쪽 1항 | `T_out=DIVISOR×T_clk`, 짝수 분주 duty 50%; TB 10 ns→10분주 100 ns(High/Low 각 50 ns), 실제 보드 1 ms→10분주 10 ms. TB와 보드 시계를 구분. |
| 파일 역할 | REQUIRED | 10~12쪽, 16~31쪽, 45쪽 2항 | `clock_divider`, `input_frontend`, `lab2_clock_divider`, TB, `simulation.json`, XDC의 역할과 두 top 구분. 코어 TB가 보드 입력 처리까지 검증했다는 주장 금지. |
| 정상 PASS/종료 | REQUIRED | 35~36쪽, 45쪽 3항 | 자신의 정상 `simulation.log`에서 PASS 129개와 436 ns 종료 확인. 교안의 예시 실행을 자신의 결과로 사용하지 않음. |
| 정상·수정·원복 로그 비교 | REQUIRED | 44~45쪽 | 세 실행의 실제 로그를 표로 비교; 한 줄 변경, 16 ns 예상/실제 `div2`, 실패 이유, 원복 후 PASS 129개를 설명. 로그는 서로 다른 실행에서 가져옴. |
| 전체 waveform | REQUIRED | 40~41쪽, 45쪽 4항 | VaporView 전체 0~436 ns를 Zoom Fit으로 관찰·캡처. `clk`, `rst`, `divided`, `tick`, `div2`, `tick2`의 이름과 ns 시간축이 보이게 함. 실제 종료 범위는 실행 후 재확인. |
| duty/위상 확대 | REQUIRED | 42쪽, 45쪽 4항 | 55 ns 첫 High, 105 ns Low, 155 ns 재상승; High/Low 각 50 ns와 100 ns 주기 확인. |
| tick 확대 | REQUIRED | 42쪽, 45쪽 4항 | 95~105, 195~205, 295~305 ns의 각 10 ns 폭과 다음 에지에서 3회 소비된 의미 설명. |
| 리셋 확대 | REQUIRED | 43쪽, 45쪽 4항 | 376 ns `rst=1` 직후 tick 마스킹, 385 ns count/divided 초기화, 435 ns 재상승, 436 ns 종료; 0~5 ns X는 첫 동기 리셋 전 미정 상태로 설명. |
| 보드 1 kHz 및 LED 예상·측정 계획 | REQUIRED | 15쪽, 23쪽, 45쪽 5항, 79쪽 | B6=1 kHz, LED[0]=500 Hz, LED[1]=100 Hz, LED[2]=20 Hz, LED[3]=1 Hz/0.5 s High·Low, LED[4]=1 ms tick, LED[7:5]=0. K4 초기화와 빠른 신호 측정 방법; N8/DIP가 분주비를 바꾸지 않음을 명시. 아직 실제 관찰로 쓰지 않음. |
| 개인 설정·오류 기록 | REQUIRED | 34~37쪽 | 실제 Python 경로/slang 설정 변경이나 오류가 있었다면 발생 내용과 수정 항목 기록. **발생 여부는 UNKNOWN**이며 발생하지 않은 오류를 꾸미지 않음. |
| XDC 사용 범위 | REQUIRED | 28쪽, 45쪽 2항 | XDC는 작성·등록 대상이나 VS Code/Icarus 기능 시뮬레이션에는 사용되지 않음. 핀·보드·타이밍 검증과 구분. |
| 실패 waveform screenshot | NOT_REQUIRED | 44~45쪽 | 수정 실험의 실패 **로그와 비교표**는 요구하지만 실패 파형 screenshot은 지정하지 않음. |
| 원복 waveform screenshot | NOT_REQUIRED | 44~45쪽 | 원복 뒤 새 PASS 로그는 필요하지만 원복 파형 screenshot은 지정하지 않음. |
| PRE 본문의 Git commit/run ID/tag | NOT_REQUIRED | 45쪽 | 교안의 실험 전 레포트 항목에 요구 없음. 필요 provenance는 내부 evidence에서 관리. |

## 수치 계산 메모 — 보고서 작성 전 기대값

- TB 주 클록은 10 ns, 상승 에지는 5, 15, 25, … ns. `step` 검사는 에지 뒤 1 ns이다(25~27쪽).
- 첫 리셋 검사는 6 ns. `DIVISOR=2`의 정상 첫 상승은 15 ns 에지 뒤이며 16 ns 검사에서 `div2=1`이다. 한 줄 수정 시 실제 예상 `div2=0`이라 첫 실패는 16 ns(17쪽 19행, 27쪽 36행, 44쪽).
- 10분주 정상 divided의 첫 상승/하강/재상승: 55/105/155 ns. tick high: 95~105, 195~205, 295~305 ns. 30클록에서 소비 횟수 3회(42쪽).
- 중간 리셋: 376 ns 입력 상승, tick 즉시 0; 385 ns 에지에서 count/divided 초기화; 435 ns divided 재상승; 436 ns 검사 후 종료(43쪽).
- 정상 검사 수 129 = 리셋 1 + 30클록×4 + tick 소비 횟수 1 + tick 마스킹 1 + 중간 리셋 1 + 재시작 low 4 + 첫 전환 1(25~27쪽).

현재 normal PASS, 지정 수정 FAIL, 복구 PASS의 별도 실행 로그와 학생·교수 역할 ChatGPT의 VaporView 공동 관찰을 확인했다. 예비보고서 본문에서는 실제 observed와 교안/TB expected를 구분한다.
