# LAB2 08_segment_scan — REPORT_REQUIREMENTS

상태: COURSE_EXTRACTED. 보고서 본문은 작성하지 않았다. 출처: ZIP 내부 `05.LAB2_08_SEGMENT_SCAN_VIVADO.pdf` 1~82쪽, 특히 **49쪽 실험 전 레포트 1~5항**과 38~50쪽의 정상 파형·수정 지시. 이 문서는 제출 목차를 강제하지 않는다. 일반 template의 제목·순서 권한은 `UNKNOWN_FORMAT_AUTHORITY`로 유지한다.

| 보고서 내용·증거 | 판정 | 교안 근거 | 필요한 설명·예상값·실제 증거 |
|---|---|---|---|
| 목적, scan 원리, 동작표 | REQUIRED | 12~16쪽, 49쪽 1항 | 8개의 4-bit 숫자를 `index=0..7`로 번갈아 표시. 1자리 활성 뒤 blank, `enable=0`이면 현재 `index/blank` 유지, reset이면 `index=0/blank=1`. 에지 전·후 값을 구분해 상태/전이·표시 결과 표 작성. |
| 논리 출력과 보드 극성 | REQUIRED | 13~16쪽, 18~19쪽, 23~24쪽, 47쪽, 49쪽 1~2항 | `select`는 active-high one-hot, `segments`는 `{a,b,c,d,e,f,g,dp}` active-high (`dp=0`). 물리 `seg_com`은 active-low/비트 순서 역전; index 0→logical `01`/COM[7] low/`7F`, index 1→`02`/COM[6] low/`BF`; blank `00`→`FF`. `seg_data=segments`. segment와 COM 극성을 동일하게 쓰지 않음. |
| 0~F 예상표 | REQUIRED | 16쪽, 18~19쪽, 25쪽, 29쪽, 49쪽 1항 | hex `0:FC,1:60,2:DA,3:F2,4:66,5:B6,6:BE,7:E0,8:FE,9:F6,A:EE,B:3E,C:9C,D:7A,E:9E,F:8E`. `digits=76543210`은 index 0~7에서 0~7, `FEDCBA98`은 8~F. 모든 check 실행 범위와 본문 대표 사례를 구분. |
| 주기·duty/clock 계산 | REQUIRED | 15쪽, 49쪽 5항 | 보드 enable=1, B6 1 kHz → 에지 간 1 ms. 자리 활성 1 ms + blank 1 ms, 8자리 순회 16 ms, 자리당 62.5 Hz 및 on duty 1/16=6.25%. TB는 enable0 hold 때문에 실제 TB 시간축으로 보드 16 ms를 대체하지 않음. 별도 분주기/tick 없음. |
| RTL·TB·설정 역할 | REQUIRED | 9~11쪽, 17~36쪽, 49쪽 2항 | `segment_scan8`의 sequential index/blank와 combinational nibble/select/segments; `input_frontend` 동기화; `lab2_segment_scan`의 자동 enable/COM 변환/LED index; `tb_segment_scan8` 자기검사; `simulation.json` 파일·top 매칭; XDC 핀·clock 제약. |
| 정상 PASS와 검사 구조 | REQUIRED | 25~30쪽, 39~40쪽, 49쪽 3항 | **자기 실행 후** `LAB2_PASS segment_scan8 checks=194`, 실제 종료 1306 ns/1306000 ps 확인. TB clock 10 ns, posedge 후 1 ns 검사, 두 bank×두 바퀴×8자리×6검사+초기/마지막 reset=194. 교안 캡처를 자기 결과로 전용하지 않음. |
| 첫 두 자리 expected·확대 분석 | REQUIRED | 26쪽, 45쪽, 49~50쪽 | 6 ns reset blank `index0/select00`; 16 ns digit0 `01/FC`; 26 ns enable0 hold; 36 ns digit1 준비 `index1/select00`; 46 ns blank hold; 56 ns digit1 `02/60`. `clk,rst,enable,digits,index,select,segments`를 보이는 확대 파형에 시험 조건→예상→사용자 관찰→해석 순서로 대조. blank 중 `segments`를 00으로 요구하지 않음. |
| 정상 전체 waveform | REQUIRED | 38쪽, 43~46쪽, 49쪽 4항 및 최종 검수 | 전체 0~1306 ns와 첫 두 자리 확대를 통해 `index,select,segments`, blank(`select=00`), hold/reset을 사용자와 교수 역할 ChatGPT가 검수했다. `digits`·`checks`의 PNG 표시를 별도 REQUIRED로 판정하지 않는다. |
| reset 해석 | REQUIRED | 14쪽, 26쪽, 29~30쪽, 38쪽, 46쪽, 50쪽 | 최초 6 ns와 마지막 1306 ns에서 `index=0,select=00` 확인. segments가 초기화되어 00이 되는 것으로 해석하지 않음. 수정 시 reset blank도 사라져 첫 검사 실패함을 설명. 별도 reset 확대 screenshot 지정은 확인되지 않음. |
| 정상/변경/복구 3행 비교와 로그 | REQUIRED | 48~50쪽 | 정상 log·파형 보존 → `segment_scan8.v`의 `select` 한 줄에서 `blank ? 8'h00 :` 제거, TB expected 유지 → 새 실행 실제 FAIL 검사 이름/시각/조건·expected/actual → 원복·저장 후 새 실행 PASS 194/1306 ns. 정상·변경·복구 **3행 비교표와 실행 로그**. 정상 예상은 6 ns `select00,index0`, 변경 예상은 `select01,index0`, failure description `reset blanks digit zero`. 실제값은 실행 후 기입. |
| Vivado/board 사전 계획 | REQUIRED | 49쪽 5항, 51~60쪽, 80~81쪽 | Vivado 등록 RTL 3개/TB/XDC, device `xc7s75fgga484-1`, design top `lab2_segment_scan`, simulation top `tb_segment_scan8`, B6 1 kHz와 K4 reset. 보드 SW1~4=`1001`이면 COM[7]부터 `9,1,2,3,4,5,6,7`, SW 변경은 첫 자리만; LED[2:0]=index, N8은 scan 진행에 불필요. 실제 Vivado/board 결과는 수행 후에만 기록. |
| XDC 기능 simulation 범위 | REQUIRED | 31쪽, 49쪽 2항 | VS Code/Icarus 기능 simulation에서 XDC가 사용되지 않음을 명시. 핀 제약과 기능 PASS의 검증 범위를 구분. |
| 일반 환경 변경·오류 기록 | NOT_REQUIRED | 6~7쪽, 48~50쪽 | 별도 기록 절 지정 없음. 의도적 수정의 FAIL·복구 분석은 위 REQUIRED 항목. 실제 도구 오류가 생기면 사실만 내부 provenance에 기록. |
| 실패·복구 waveform screenshot | NOT_REQUIRED | 48~50쪽 | 해당 슬라이드는 세 실행의 **로그와 비교**를 요구하며 수정/복구 파형 별도 캡처를 지정하지 않음. |
| PRE 본문 commit hash/run ID/tag | NOT_REQUIRED | 49쪽 | 실험 전 레포트 1~5항에 요구되지 않음. 내부 manifest에서 출처를 추적할 수 있음. |

## 작성 경계

- 49쪽의 1~5항은 **내용 요구**이며 고정된 본문 제목·순서라는 근거는 없다. 일반 template의 모든 절을 복제하지 않는다.
- 정상 PASS, 지정 수정 FAIL, 복구 PASS와 학생·교수 역할 ChatGPT의 VaporView 공동 관찰은 확인했다. Vivado/board 결과는 아직 수행 사실로 쓰지 않는다. 교안 예시 값은 실제 실행 결과와 구분한다.
- 파형 설명은 시험 조건 → 예상 결과 → 실제 사용자 관찰 → 해석 순서. 전체 TB 검증 범위와 본문에 자세히 설명할 대표 전환 구간을 구분한다.
