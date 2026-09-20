# LAB2 05_piso — REPORT_CAPTURE_CHECKLIST

상태: EVIDENCE_VERIFIED (2026-09-19). 학생과 교수 역할 ChatGPT가 정상 VaporView 파형을 함께 관찰하고 expected와 대조했다. 정상 PASS, 지정 수정 FAIL, 별도 복구 PASS는 실제 build/sim/run-* 원본 로그로 확인했다. 원본 log/VCD는 build에 보존되어 있으며 evidence 경로 복사 여부는 REQUIRED 누락 판정에 사용하지 않는다. 아래 expected 표는 교안/TB 기준값이고, 제출 본문은 아직 작성하지 않았다.

| 증거/캡처 | 판정 | 시험 조건·보여야 할 내용 | 예정 보존 위치·파일명 | 현재 |
|---|---|---|---|---|
| 정상 `simulation.log` | REQUIRED | 자기 실행 `LAB2_PASS piso4 checks=114`, `$finish` 976 ns 예상. `word=0..15`의 114검사 | `evidence/vscode/LAB2/05_piso/normal/<run>/simulation.log` | COMPLETED (build 원본 + evidence 로그 PNG 확인) |
| 정상 `wave.vcd` | REQUIRED | 수정 전에 정상 실행의 VCD/파형 원본 별도 보관 | `evidence/vscode/LAB2/05_piso/normal/<run>/wave.vcd` | COMPLETED (build 원본 보존) |
| 정상 전체 VaporView screenshot | REQUIRED | Zoom Fit 예상 0~976 ns/ns 단위; `clk,rst,load,enable,data_in,value,serial_out`와 `data_in=0..F` 16개 입력, 마지막 reset/검사 시각 | `evidence/vscode/LAB2/05_piso/normal/LAB2_05_piso_normal_waveform_full_0-976ns.png` | COMPLETED (PNG + 학생·교수 역할 ChatGPT 공동 관찰) |
| `value`/`serial_out` 관계 | REQUIRED_CONTENT; 별도 출력-only PNG는 NOT_REQUIRED | 정상 전체 파형과 A 입력 확대 파형을 함께 대조 | `normal_waveform_full_0-976ns.png` + `normal_waveform_A_600-670ns.png` | COMPLETED (학생·교수 역할 ChatGPT 공동 검수) |
| 정상 A 확대 screenshot | REQUIRED | 약 600~670 ns, `clk,load,enable,data_in,value,serial_out`(reset도 표시 가능), 615 load/625 hold/635~665 shift와 shift **전** bit `1,0,1,0`을 읽을 크기. `value` binary 표시 유용 | `evidence/vscode/LAB2/05_piso/normal/LAB2_05_piso_normal_waveform_A_600-670ns.png` | COMPLETED (PNG + 학생·교수 역할 ChatGPT 공동 관찰) |
| 변경 `simulation.log` | REQUIRED | 정상 증거 보존 후 `serial_out=value[0]`, TB 유지. 86 ns `MSB first before edge` FAIL; expected 0, 변경 예상 actual 1 | `evidence/vscode/LAB2/05_piso/failure/<run>/simulation.log` | COMPLETED (build 원본 + evidence 로그 PNG 확인) |
| 복구 `simulation.log` | REQUIRED | 원래 `serial_out=value[3]` 복원·저장 후 **새 실행**의 PASS 114개/976 ns 예상 | `evidence/vscode/LAB2/05_piso/recovery/<run>/simulation.log` | COMPLETED (build 원본 + evidence 로그 PNG 확인) |
| 정상/변경/복구 비교표 | REQUIRED | 세 실행의 실제 로그, 조건, 검사 시각, expected/actual, bit 순서·실패 원인·복구 | 예비보고서 작성 단계 | PENDING_REPORT_WRITING |

`<run>`은 실행 뒤 확인할 실제 run 폴더다. 정상 log 화면 PNG와 변경/복구 waveform screenshot은 교안에서 별도로 요구하지 않는다. reset 우선·enable=0 유지·마지막 검사는 전체 파형에서 읽고 설명한다. 별도 reset 캡처는 강제하지 않는다. 출력만 본 화면과 A 확대 화면은 목적이 다르며, 교안이 지정한 필수 내용을 모두 읽을 수 있는 구성을 사용한다.

## A(`1010`) 구간의 교안/TB expected — 실제 파형 공동 관찰 완료

| TB 검사 | 에지 직전/직후 조건 | expected `value`, `serial_out` |
|---:|---|---|
| 616 ns | 615 ns load, `data_in=A`, `load=enable=1`; load 우선 | `A`, `1` |
| 626 ns | 625 ns hold 후, 첫 serial bit를 635 ns shift **전에** 읽음 | `A`, `1` |
| 636 ns | 635 ns shift 후 둘째 bit 읽음 | `4`, `0` |
| 646 ns | 645 ns shift 후 셋째 bit 읽음 | `8`, `1` |
| 656 ns | 655 ns shift 후 넷째 bit 읽음 | `0`, `0` |
| 666 ns | 665 ns 넷째 shift 후 zero fill 검사 | `0`, `0` |

VaporView 예시 커서 626.599 ns는 TB의 626 ns 비교 시각이 아니다(40쪽). `user_observation_status=COMPLETED (학생·교수 역할 ChatGPT 공동 관찰, 2026-09-19)`; PASS·VCD 존재·수치 parsing만으로 사용자 파형 관찰 완료 처리하지 않는다. 원본 파일을 삭제하거나 이전 정상 실행을 복구 실행의 증거로 재사용하지 않는다.
