# LAB2 03_register — REPORT_REQUIREMENTS

상태: COURSE_EXTRACTED. 예비보고서 본문은 아직 작성하지 않았다. 출처: `05.LAB2_03_REGISTER_VIVADO.pdf` 전체 1~79쪽(다운로드 ZIP 내부). REQUIRED의 직접 근거는 특히 교안 44쪽의 **실험 전 레포트** 1~5항과 관련 설명 쪽이다. 교안은 제출용 소제목·순서를 고정하지 않으므로 `UNKNOWN_FORMAT_AUTHORITY`로 둔다.

| 보고서 항목 | 판정 | 근거 | 필요한 내용·증거 |
|---|---|---|---|
| 제어별 다음 상태표 | REQUIRED | 13~15쪽, 44쪽 1항 | reset/load/transfer/hold 및 동시 load+transfer의 다음 `stored,value` 표. 에지 전후를 구분하고 동시 동작에서 이전 stored를 전달하는 nonblocking 계산 제시. |
| 파일 역할 | REQUIRED | 10~12쪽, 16~32쪽, 44쪽 2항 | `register_pair`, `input_frontend`, `lab2_register`, `tb_register_pair.sv`, `simulation.json`, XDC의 역할과 design/simulation top 구분. 코어 TB의 검증 범위를 설명. |
| 일곱 검사·정상 결과 | REQUIRED | 24~28쪽, 35쪽, 44쪽 3항 | 6/16/26/36/46/56/66 ns의 시험 조건과 `00/A0/AA/3A/33/33/00` 기대값. 자신의 정상 로그에서 `LAB2_PASS register_pair checks=7`와 66 ns 종료 확인. 교안 예시 로그를 자신의 관찰로 전용하지 않음. |
| 정상·변경·원복 로그 비교 | REQUIRED | 43~44쪽 | 서로 다른 실제 실행 로그와 검사 시각 비교. `value <= stored`→`value <= data_in` 한 줄 변경, TB 그대로, 26 ns `transfer stored not live input` 첫 실패, 정상 기대 `value=A`/오류 예상 `3`, 원복 뒤 새 PASS 7개 설명. |
| 전체 파형 | REQUIRED | 39~40쪽, 44쪽 4항 | VS Code/VaporView 0~66 ns 전체, ns 시간축과 `clk,rst,load,transfer,data_in,stored,value`가 읽히는 screenshot 및 해석. 실행 후 실제 끝 시각 재확인. |
| 25/35/45 ns 확대 | REQUIRED | 41~42쪽, 44쪽 4항 | 25 ns 입력 3과 무관하게 저장 A 전달; 35 ns 동시 load/transfer에서 `stored=3,value=A`; 45 ns 다음 에지에서 `value=3`. 각 에지 직전 조건 → 예상 → 실제 관찰 → 해석 순서. 하나의 화면에 세 시점이 읽히면 한 장으로 가능. 교안은 정확한 확대 시작·끝 ns와 캡처 장수를 지정하지 않음. |
| hold/reset 설명 | REQUIRED | 24쪽, 42쪽 | 55 ns 두 제어 0에서 입력 F를 무시하고 `33` 유지, 65 ns reset이 두 제어보다 우선해 `00`. 전체 파형과 상태표에서 설명 가능. **별도 hold/reset 확대 screenshot 지정은 없음.** |
| 보드 입력 순서·LED 예상 | REQUIRED | 22~23쪽, 44쪽 5항, 77~78쪽 | Vivado 시작 전 `A1→A0`, `32→AA`, `33→3A`, 같은 `33` 재실행→`33`, `F0→33`, K4→`00`을 계산. B6 1 kHz, 버튼 한 동작의 press, DIP 데이터/제어 비트 구분. 아직 board 결과로 서술하지 않음. |
| XDC 사용 범위 | REQUIRED | 29쪽, 44쪽 2항 | XDC는 보드 핀/클록 제약용이며 VS Code/Icarus 기능 시뮬레이션에는 직접 사용되지 않음. |
| 실제 설정 변경·오류 기록 | REQUIRED_IF_APPLICABLE | 7~8쪽, 33쪽, 36쪽 | Python 경로/PATH/slang 설정을 실제로 변경하거나 오류가 발생한 경우 내용·실제 버전·해결을 기록. 발생 여부는 UNKNOWN. |
| 수정 실패 waveform screenshot | NOT_REQUIRED | 43~44쪽 | 실패 확인과 로그 비교는 요구하지만 별도 실패 파형 캡처는 지정하지 않음. |
| 원복 waveform screenshot | NOT_REQUIRED | 43~44쪽 | 원복 후 새 PASS 로그는 필요하지만 별도 원복 파형 캡처는 지정하지 않음. |
| PRE 본문 commit hash/run ID/tag | NOT_REQUIRED | 44쪽 | 교안의 실험 전 레포트 항목에 지정 없음. provenance는 내부 manifest/evidence로 관리. |

## 제출 전 구분

- 교안의 PASS/FAIL 및 66/26 ns는 기대·예시다. 자신의 log와 사용자 파형 관찰 전에는 실측·관찰 결과로 쓰지 않는다.
- 정상 `wave.vcd`와 로그는 수정 전에 보존한다(43쪽). 이 보존은 정상/수정/원복 증거의 출처를 분리하기 위한 작업이다.
- 보고서의 공통 도구 실행 절차는 공통 검증 조건에서 간단히 설명하고, 이 실험에서는 저장/전달/동시 동작의 expected와 실제 증거를 중심으로 쓴다(내부 `REPORT_WORKFLOW.md` 원칙).
