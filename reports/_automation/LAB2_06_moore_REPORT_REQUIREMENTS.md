# LAB2 06_moore — REPORT_REQUIREMENTS

상태: COURSE_EXTRACTED. 예비보고서 본문은 아직 작성하지 않았다. 출처: ZIP 내부 `05.LAB2_06_MOORE_VIVADO.pdf` 1~71쪽. 아래 REQUIRED는 특히 교안 40쪽의 **실험 전 레포트** 1~5항과 31·37~41쪽의 파형/수정 지시에 근거한다. 제출용 고정 제목·순서는 확인되지 않아 `UNKNOWN_FORMAT_AUTHORITY`이다.

| 보고서 항목 | 판정 | 교안 근거 | 필요한 계산·설명·증거 |
|---|---|---|---|
| 상태·전이표 | REQUIRED | 13~16쪽, 40쪽 1항 | S0=00, S1=01, S2=10의 의미와 `enable && advance`에서 00→01→10→00, 그 외 유지, reset→00. `case default`가 제어 유효 시 10/11→00을 처리함을 구분. |
| Moore 출력/RTL 구조 | REQUIRED | 13~16쪽, 40쪽 1~2항 | 출력 `value`는 현재 state이고 입력에 직접 의존하지 않음. 별도 next-state 조합 블록 없이 **한 순차 `always @(posedge clk)`** 안에서 `case(value)`와 nonblocking `<=`로 전이; RTL 상태 갱신에 blocking `=` 없음. 보드 N8은 clock이 아닌 enable pulse. |
| 파일·설정 역할 | REQUIRED | 9~11쪽, 16~29쪽, 40쪽 2항 | `moore_cycle`, `input_frontend`, `lab2_moore`, TB, `simulation.json`, XDC 및 design/simulation top·코어 TB 검증 범위. |
| 정상 PASS·검사 범위 | REQUIRED | 21~25쪽, 32~33쪽, 40쪽 3항 | 자기 정상 로그의 `LAB2_PASS moore_cycle checks=23`, 226 ns 종료. 첫 reset 1 + 비에지 입력 변경 1 + 순환 5검사×4 + 마지막 reset 1 계산. 교안 예시를 자기 결과로 사용하지 않음. |
| 정상/변경/복구 3행 비교표·로그 | REQUIRED | 39~41쪽 | 세 실제 실행 로그, 조건/검사 시각/expected/actual/해석. S1 전이 `2'b10`→`2'b00`, TB 유지; 첫 46 ns `S1 to S2`, expected 10 대 변경 예상 00; 원복 뒤 새 PASS 23/226 ns. |
| VS Code 전체 파형 | REQUIRED | 31쪽, 36~37쪽 | VaporView 전체 0~226 ns Zoom Fit, 시간축(ps 표시는 ns로 환산), 4회 00→01→10→00 및 hold/reset. 핵심 `clk,rst,enable,advance,value`; `value` binary 표시. `Add All Variables in Scope (Shallow)`와 Recursive 차이 확인. |
| 출력 상태 순환 증거 | REQUIRED_CONTENT; 별도 output-only screenshot NOT_REQUIRED | 31쪽 및 학생·교수 역할 ChatGPT 최종 검수 | 정상 전체와 첫 순환 확대에서 0→1→2→0을 관찰했고 본문에서는 00→01→10→00으로 해석한다. binary 표시 재캡처를 필수로 만들지 않는다. |
| 첫 순환 확대 | REQUIRED | 38쪽, 40~41쪽 | 7/16/26/36/46 ns 검사를 확대하고 56 ns 00 복귀까지 설명. 7 ns advance 입력만 변경→00 유지, 16 ns 01, 26/36 ns 각각 제어 0→01 유지, 46 ns 10, 56 ns 00. 에지 변화 시각과 `#1` 검사 시각 구분. |
| 비영 상태 reset | REQUIRED | 22쪽, 25쪽, 31쪽 | 215 ns S1=`01` 진입 뒤 reset, 225 ns 에지/226 ns `00` 검사. 전체 파형 해석에 포함; **별도 reset 확대 screenshot은 지정되지 않음.** |
| overlap/패턴 중첩 절 | NOT_REQUIRED | 13~15쪽, 21~22쪽, 40~41쪽 | 이 실험은 세 상태 순환이며 패턴 검출 overlap 요구는 없음. |
| 보드 사전 계획 | REQUIRED | 12쪽, 20쪽, 40쪽 5항, 58~59쪽, 70쪽 | B6 1 kHz, SW1 advance, N8 press/enable, K4 reset, LED[1:0] 상태·상위 6비트 0; `00→(SW1만 변경해도 00)→01→(SW1=0+N8에도 01)→10→00` 예상. 보드 실제 관찰로 쓰지 않음. |
| XDC 사용 범위 | REQUIRED | 26쪽, 40쪽 2항 | XDC는 보드 핀/클록 제약용이며 VS Code/Icarus 기능 시뮬레이션에는 사용되지 않음. |
| 설정·오류 별도 기록 | NOT_REQUIRED | 6~7쪽, 30쪽, 40쪽 | 06 교안의 실험 전 레포트 요구 목록에 없음. 실제 오류 발생 여부는 UNKNOWN; 발생 시 내부 provenance에 기록. |
| 실패/복구 waveform screenshot | NOT_REQUIRED | 39~41쪽 | FAIL/복구 PASS 로그와 비교는 요구하지만 별도 변경/복구 파형 screenshot은 지정하지 않음. |
| PRE 본문 Git hash/run ID/tag | NOT_REQUIRED | 40쪽 | 실험 전 레포트 항목에 지정되지 않음. 내부 manifest/evidence로 추적. |

## 작성 경계

- 교안의 PASS·FAIL과 226/46 ns는 기대·예시다. 자기 실행 로그와 사용자 VaporView 관찰 전에는 실제 관찰로 서술하지 않는다.
- 정상 로그·파형을 변경 전에 보존하고 정상/변경/복구를 각기 다른 실행으로 대조한다(39쪽).
- 공통 VS Code 실행 절차를 반복하지 않고 상태표, 입력만의 변화와 유효 에지, 정상/수정 예상값 및 실제 파형 해석에 집중한다(`REPORT_WORKFLOW.md`, `PRE_REPORT_TEMPLATE.md`).
