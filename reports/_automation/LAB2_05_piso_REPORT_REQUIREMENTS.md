# LAB2 05_piso — REPORT_REQUIREMENTS

상태: COURSE_EXTRACTED. 예비보고서 본문은 아직 작성하지 않았다. 출처: ZIP 내부 `05.LAB2_05_PISO_VIVADO.pdf` 1~74쪽. 아래 REQUIRED는 특히 교안 42쪽의 **실험 전 레포트** 1~5항과 32·38~43쪽의 명시적 파형/수정 지시에 근거한다. 제출용 고정 제목·순서는 확인되지 않아 `UNKNOWN_FORMAT_AUTHORITY`이다.

| 보고서 항목 | 판정 | 교안 근거 | 필요한 계산·설명·증거 |
|---|---|---|---|
| 동작 표·우선순위 | REQUIRED | 13~16쪽, 42쪽 1항 | reset > parallel load > shift enable > hold. 병렬 `data_in[3:0]→value[3:0]`, `serial_out=value[3]`, shift `{이전 value[2:0],0}`와 에지 전후/NBA 관계. |
| 출력 순서 계산 | REQUIRED | 15쪽, 22~23쪽, 42쪽 1항 | A=`1010` load 뒤 **shift 전** bit `1,0,1,0`; 저장값 `A→4→8→0→0`. shift 뒤에만 읽으면 첫 비트를 놓치는 이유. |
| RTL·TB·설정 역할 | REQUIRED | 9~11쪽, 16~30쪽, 42쪽 2항 | `piso4`, `input_frontend`, `lab2_piso`, TB, `simulation.json`, XDC와 두 top의 역할·검증 범위. XDC/Icarus 구분. |
| 정상 PASS·검사 범위 | REQUIRED | 22쪽, 24~26쪽, 33~34쪽, 42쪽 3항 | 자신의 정상 로그에서 `LAB2_PASS piso4 checks=114`와 976 ns 종료 확인. `word=0..15` 각각 7검사 + reset 2 = 114 계산 및 에지 뒤 1 ns 검사 방식. 예시 로그를 자기 실행으로 전용하지 않음. |
| 정상/변경/복구 3행 비교표·로그 | REQUIRED | 41~43쪽 | 세 실제 실행 로그, 조건/검사 시각/expected/actual/해석. `assign serial_out = value[3];`→`value[0]`, TB 유지; `word=1` 첫 serial 검사 86 ns `MSB first before edge`, expected 0/변경 예상 1; 복구 뒤 새 PASS 114/976 ns. |
| 전체 VS Code 파형 | REQUIRED | 32쪽, 37~38쪽, 42쪽 4항 | VaporView 전체 0~976 ns Zoom Fit, ns 시간축, `clk,rst,load,enable,data_in,value,serial_out` 신호명·값과 입력 0~F 확인 및 screenshot. |
| 출력 관계 증거 | REQUIRED_CONTENT; 별도 output-only screenshot NOT_REQUIRED | 32쪽 및 학생·교수 역할 ChatGPT 최종 검수 | 정상 전체와 A 확대 파형을 함께 사용해 `value`와 `serial_out` 관계를 설명한다. 별도 출력-only PNG를 추가 필수로 만들지 않는다. |
| A 입력 확대 | REQUIRED | 23쪽, 39~40쪽, 42~43쪽 | 약 600~670 ns; 615 ns load, 625 ns hold, 635/645/655/665 ns shift; 616/626/636/646/656/666 ns TB 검사를 구분. 입력·이전 상태·다음 상태·serial bit `1,0,1,0`을 해석. 교안 예시 커서 626.599 ns를 TB 검사 시각으로 혼동하지 않음. |
| reset/hold/끝 검사 해석 | REQUIRED | 22쪽, 26쪽, 32쪽 | reset 우선, enable=0 유지, 마지막 검사 시각을 정상 파형에서 확인. **별도 reset 확대 screenshot은 지정되지 않음.** |
| 장비 사전 계획 | REQUIRED | 12쪽, 20~21쪽, 42쪽 5항, 61~62쪽, 73쪽 | B6 1 kHz, K4/N8/SW1~4/SW8/LED 의미와 보드 예상 `A1→40→81→00→00`, load 후 shift 전 첫 LED0=1을 읽는 순서. Vivado/board 실제 결과로 쓰지 않음. |
| 설정·오류 별도 기록 | NOT_REQUIRED | 6~7쪽, 31쪽, 42쪽 | 05 교안의 실험 전 레포트 요구 목록에 없음. 실제 오류 발생 여부는 UNKNOWN; 발생 시 내부 provenance에 남기고 필요할 때만 설명. |
| 실패 waveform screenshot | NOT_REQUIRED | 41~43쪽 | 변경 FAIL 로그·비교는 요구하지만 실패 파형 별도 screenshot은 지정하지 않음. |
| 복구 waveform screenshot | NOT_REQUIRED | 41~43쪽 | 복구 PASS 로그는 요구하지만 복구 파형 별도 screenshot은 지정하지 않음. |
| PRE 본문의 commit hash/run ID/tag | NOT_REQUIRED | 42쪽 | 실험 전 레포트 항목에 지정되지 않음. 내부 evidence/manifest로 추적. |

## 작성 경계

- 교안의 PASS·FAIL 및 976/86 ns는 기대·예시다. 실제 자기 실행 로그와 사용자 VaporView 관찰 전에는 관찰 결과로 서술하지 않는다.
- 수정 전 정상 로그와 파형을 보존하고, 정상/변경/복구의 실행 근거를 분리한다(41쪽).
- 공통 실행 절차를 반복하지 않고 PISO의 load 우선순위, shift 전 serial 읽기, 예상 비트열과 실제 관찰의 일치를 설명한다(`REPORT_WORKFLOW.md`, `PRE_REPORT_TEMPLATE.md`).
