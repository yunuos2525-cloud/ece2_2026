# LAB2 07_mealy — REPORT_REQUIREMENTS

상태: COURSE_EXTRACTED. 예비보고서 본문은 아직 작성하지 않았다. 출처: ZIP 내부 `05.LAB2_07_MEALY_VIVADO.pdf` 1~71쪽. REQUIRED는 특히 교안 42쪽의 **실험 전 레포트** 1~5항과 32·39~43쪽 파형/수정 지시에 근거한다. 제출용 고정 제목·순서는 확인되지 않아 `UNKNOWN_FORMAT_AUTHORITY`이다.

| 보고서 항목 | 판정 | 교안 근거 | 필요한 계산·설명·증거 |
|---|---|---|---|
| 상태·전이/출력 분리 표 | REQUIRED | 13~16쪽, 42쪽 1항 | S0=0, S1=1; reset→S0, `enable && bit_in`에서 toggle, 그 외 유지. 별도 출력표: bit_in0→00, bit_in1/S0→10, bit_in1/S1→01. 현재 state/input 기준 출력을 전이 뒤 출력과 구분. |
| 순차·조합 구조 | REQUIRED | 13~16쪽, 42쪽 1~2항 | `state`는 순차 `always @(posedge clk)`에서 nonblocking `<=`; `value`는 `state,bit_in`의 연속 `assign` 조합 출력. 별도 next-state 조합 always 없음. `enable=0`은 state 전이만 막음. |
| reset 뒤 조합 출력 | REQUIRED | 15쪽, 23쪽, 42~43쪽 | `bit_in=1`인 채 reset 에지를 지나면 `state=0,value=10`, 즉 `{state,value}=010`. bit_in을 0으로 내리면 상태 변화 없이 `000`. reset이 value를 무조건 00으로 만드는 것으로 쓰지 않음. |
| 파일·설정 역할 | REQUIRED | 9~11쪽, 16~30쪽, 42쪽 2항 | `mealy_toggle`, `input_frontend`, `lab2_mealy`, TB, `simulation.json`, XDC와 두 top의 역할/검증 범위. core TB의 즉시 반응과 보드 SW1 동기화 지연 구분. |
| 정상 PASS·검사 시각 | REQUIRED | 22~26쪽, 33~34쪽, 42쪽 3항 | 자기 정상 로그의 `LAB2_PASS mealy_toggle checks=11`, 67 ns 종료. 특히 **비에지** 7/27/37/67 ns의 `{state,value}` expected와 에지 16/26/36/46/56/66 ns 비교. 교안 예시를 자기 실행으로 전용하지 않음. |
| 정상/변경/복구 3행 비교표·로그 | REQUIRED | 41~43쪽 | 세 실제 실행 로그, 조건/검사 시각/expected/actual/해석. 입력1 출력 S0 `10`↔`01` 교환, TB 유지; 첫 7 ns `S0 input changes between clocks`, expected `010` 대 변경 예상 `001`; 복구 새 PASS 11/67 ns. |
| VS Code 전체 파형 | REQUIRED | 32쪽, 37~39쪽 및 최종 검수 | 정상 0~67 ns에서 `bit_in,clk,enable,rst,state,value`의 변화를 확인한다. `checks`의 값은 실제 정상 PASS log로 검증하며 PNG에 이 신호가 없다는 이유만으로 재캡처하지 않는다. |
| `state,value` 출력 관계 증거 | REQUIRED_CONTENT; 별도 output-only screenshot NOT_REQUIRED | 32쪽 및 학생·교수 역할 ChatGPT 최종 검수 | 정상 전체와 6~37 ns 통합 확대에서 비에지 입력 변화·state/value 관계를 확인한다. 별도 출력-only PNG를 추가 필수로 만들지 않는다. |
| 입력 직후 확대 1 | REQUIRED | 40쪽, 42~43쪽 | **6~16 ns**에서 6 ns 입력 0→1, 7 ns state0/value10, 15 ns `enable=0` 에지/16 ns 동일값. `clk,bit_in,enable,state,value`를 대조해 조합 반응 설명. |
| 입력 직후 확대 2 | REQUIRED | 40쪽, 42~43쪽 | **26~37 ns**에서 25 ns S0→S1 뒤 value01, 26 ns 입력 1→0/27 ns state1,value00, 35 ns 입력0 유지, 36 ns 입력1/37 ns state1,value01. 클록·상태·출력 시각을 분리. |
| 보드 사전 계획 | REQUIRED | 12쪽, 20쪽, 42쪽 5항, 58~59쪽, 70쪽 | B6 1 kHz, SW1 bit_in, N8 enable pulse, K4 reset, LED2 state/LED[1:0] value. 예상 `000→010→101→100→100→010`; SW1 변경은 `input_frontend` 동기화 뒤 반영. 아직 board 관찰로 쓰지 않음. |
| XDC 사용 범위 | REQUIRED | 27쪽, 42쪽 2항 | XDC는 보드 핀/클록 제약용이며 VS Code/Icarus 기능 시뮬레이션에는 사용되지 않음. |
| 06 Moore 실험과 직접 비교 | NOT_REQUIRED | 1~71쪽 | 07 교안에 두 실험을 나란히 비교하는 별도 제출 지시는 없음. 입력 직후 출력 변화의 Mealy 원리 설명은 REQUIRED. |
| 별도 설정·오류 기록 | NOT_REQUIRED | 6~7쪽, 31쪽, 42쪽 | 07 교안 실험 전 레포트 항목에 없음. 실제 오류 발생 여부는 UNKNOWN; 발생 시 내부 provenance에 기록. |
| 실패/복구 waveform screenshot | NOT_REQUIRED | 41~43쪽 | FAIL/복구 PASS 로그와 비교는 요구하지만 변경/복구 파형 별도 캡처 지정은 없음. |
| PRE 본문 Git hash/run ID/tag | NOT_REQUIRED | 42쪽 | 실험 전 레포트 항목에 지정되지 않음. 내부 manifest/evidence로 추적. |

## 작성 경계

- 교안의 PASS·FAIL과 67/7 ns는 기대·예시다. 자기 실행 로그와 사용자 VaporView 관찰 전에는 실제 관찰로 서술하지 않는다.
- 정상 로그·파형은 출력 식 변경 전에 보존하고 정상/변경/복구를 각기 다른 실행으로 대조한다(41쪽).
- 공통 도구 사용법을 반복하지 않고 **상태는 에지에서, 출력은 입력 변화에도** 바뀌는 이 실험의 시험 조건·예상·실제 관찰·해석에 집중한다(`REPORT_WORKFLOW.md`, `PRE_REPORT_TEMPLATE.md`).
