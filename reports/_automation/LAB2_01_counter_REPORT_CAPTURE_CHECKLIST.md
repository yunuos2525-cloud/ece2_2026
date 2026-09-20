# LAB2 01_counter — REPORT_CAPTURE_CHECKLIST

상태: 정상 simulation 후 작성한 내부 수집 목록. 교안 요구의 **사전 확정 여부는 UNKNOWN**이다. 이후 사용자가 전체·순환·유지/리셋 파형 관찰 완료를 명시하고 세 screenshot을 제공했다. `user_observation_status=USER_CONFIRMED` (이 세 구간에 한함).

## REPORT_REQUIREMENTS 재확인

출처: `C:\Users\yunji\Downloads\05.LAB2_0921_VIVADO_8plus1.zip` 안의 `05.LAB2_01_COUNTER_VIVADO.pdf`.

| 항목 | 상태 | 교안 근거 | 이 실험에서 필요한 내용 |
|---|---|---|---|
| RTL과 TB 역할 | REQUIRED | 40쪽 1항 | `counter4`, `input_frontend`, `lab2_counter`와 `tb_counter4`의 역할 설명 |
| 예상 결과 표 | REQUIRED | 14쪽, 34쪽, 40쪽 2항 | 리셋, 증가, 15→0, 감소, 0→15, `enable=0` 유지, 리셋 우선순위 |
| 정상 PASS log | REQUIRED | 33~34쪽, 40쪽 3항 | 자기 실행의 `LAB2_PASS counter4 checks=36`와 356 ns 종료 |
| 정상 전체 waveform | REQUIRED | 37~40쪽 | `clk`, `rst`, `enable`, `down`, `value[3:0]`; Zoom Fit, 0~356 ns; 신호명·시간축·입출력 표시 |
| 정상 확대 관찰 | REQUIRED | 34쪽, 39쪽 1~4항, 40쪽 3항 | 증가/감소 순환, `enable=0` 유지, 마지막 `rst=1`과 356 ns 종료. 아래 두 확대 범위가 이를 포함한다. |
| 설정 변경과 오류 | REQUIRED | 40쪽 4항 | 본인에게 실제로 발생한 변경/오류만 기록; 내용은 아직 UNKNOWN |
| XDC 검증 범위 구분 | REQUIRED | 23쪽, 40쪽 5항 | XDC는 이번 Icarus 기능 simulation의 입력이 아님 |
| 수정/실패/복구 waveform | NOT_REQUIRED | 01_counter 교안 1~76쪽에 요구 없음 | 캡처 목록에 추가하지 않음 |

## 정상 run 근거

- Run: `run-e62d1563ef5f4e0e86e6d6f5c7e4e8c1` (`LAB2/01_counter/build/sim/result.json`의 최신 run; 확인 당시 run 폴더 1개).
- `result.json`: `status=SIMULATED`, `functional_correctness=NOT_ASSESSED`. 기록된 입력 SHA-256은 현재 `simulation.json` 및 RTL/TB 4개와 모두 일치한다. `wave_sha256`도 run VCD와 일치한다.
- `simulation.log`: `LAB2_PASS counter4 checks=36`; `$finish called at 356000 (1ps)` = 356 ns. `tools/lab1.py`는 `vvp`의 비정상 종료 코드이면 예외를 내므로 `SIMULATED` 기록은 `vvp` 정상 반환을 뒷받침한다. 로그 자체에는 숫자 종료 코드가 없다.
- VCD: `$timescale 1ps`, `tb_counter4` 신호 포함. `value`의 마지막 변경은 355 ns, VCD의 마지막 타임스탬프와 로그 종료 시각은 356 ns이다.
- 보존 복사본: `evidence/vscode/LAB2/01_counter/normal/run-e62d1563ef5f4e0e86e6d6f5c7e4e8c1/simulation.log`, `wave.vcd`. 원본과 복사본 SHA-256 일치.
- 기존 사용자 PASS 화면: `evidence/vscode/LAB2/01_counter/normal/LAB2_01_counter_normal_pass_log.png`에서 PASS/종료 문구 확인. 파형 캡처로 간주하지 않는다.

## REPORT_CAPTURE_CHECKLIST

| 증거/캡처 | REQUIRED | 범위/내용 | 저장 위치 | 현재 상태 |
|---|---|---|---|---|
| PASS log 원본 | 예 | checks=36, `$finish` 356 ns | `normal/run-e62d1563ef5f4e0e86e6d6f5c7e4e8c1/simulation.log` | 복사 완료 |
| 정상 VCD 원본 | 예 | 같은 run, 1 ps timescale | `normal/run-e62d1563ef5f4e0e86e6d6f5c7e4e8c1/wave.vcd` | 복사 완료; 사용자 관찰 완료 |
| PASS 화면 | 예 | PASS 36회, 356 ns 종료 | `normal/LAB2_01_counter_normal_pass_log.png` | 기존 파일 확인 |
| 전체 파형 화면 | 예 | Zoom Fit, 0~356 ns, 필수 신호 5개와 시간축 | `normal/LAB2_01_counter_normal_waveform_full_0-356ns.png` | 사용자 관찰 확인, 파일 있음; 왼쪽 신호명 일부 잘림 |
| 순환 확대 화면 | 예 | 150~178 ns, 증가 15→0 및 감소 0→15 | `normal/LAB2_01_counter_normal_waveform_wrap_150-178ns.png` | 사용자 관찰 확인, 파일 있음; 왼쪽 신호명 일부 잘림 |
| 유지·리셋 확대 화면 | 예 | 320~356 ns, 유지·감소 순환·마지막 리셋 | `normal/LAB2_01_counter_normal_waveform_hold_reset_320-356ns.png` | 사용자 관찰 확인, 파일 있음; 왼쪽 신호명 일부 잘림 |

`normal/`의 상대 경로 기준점은 `evidence/vscode/LAB2/01_counter/`이다. 교안이 별도 failure/recovery 파형 캡처를 요구하지 않으므로 넣지 않았다.

## USER_WAVEFORM_CHECK_GUIDE — 실행 전 expected와 이후 사용자 관찰

VaporView Netlist View의 `tb_counter4`에서 `clk`, `rst`, `enable`, `down`, `value[3:0]`를 추가한다. `value`는 4비트 값이며 15는 16진 표시에서 `f`이다. 신호명 열을 넓히고 시간 단위를 ns로 표시한다.

전체 0~356 ns에서 리셋 후 0, `down=0` 증가, 15→0, `down=1` 감소, 0→15, `enable=0` 유지, 마지막 동기 리셋을 입력과 함께 확인한다. TB의 `step`은 상승 에지 뒤 1 ns에 검사한다. `down`, `enable`, `rst`가 검사 직후 같은 시각에 바뀌므로 경계 입력을 읽을 때는 아래의 안정 구간을 사용한다.

| 확대 범위 | 시험 조건과 시점 | expected `value` | 계산/주의 |
|---|---|---|---|
| 150~178 ns | 156 ns: `rst=0`, `enable=1`, `down=0` | 15 (`f`) | 155 ns 상승 에지에서 15번째 증가 |
| 150~178 ns | 165~166 ns 미만: `down=0` | 0 | 165 ns 상승 에지에서 15→0. **166 ns에는 TB가 `down=1`로 변경**하므로 그 직전 구간을 읽음 |
| 150~178 ns | 176 ns: `rst=0`, `enable=1`, `down=1` | 15 (`f`) | 175 ns 상승 에지에서 0→15 |
| 320~356 ns | 325~326 ns 미만: `enable=1`, `down=1` | 0 | 감소 루프의 마지막 상승 에지 325 ns |
| 320~356 ns | 326~336 ns 미만: `enable=0`, `down=1`; 335 ns 상승 에지 뒤 | 0 | 336 ns 검사 후 `enable=1`로 변경. 유지 확인은 335~336 ns 미만에서 읽음 |
| 320~356 ns | 345~346 ns 미만: `enable=1`, `down=1`, `rst=0` | 15 (`f`) | 345 ns 상승 에지에서 0→15 재순환 |
| 320~356 ns | 346~355 ns 미만: `rst=1` | 15 (`f`) | 리셋 입력은 346 ns에 올라가지만 코어 출력은 다음 상승 에지까지 유지 |
| 320~356 ns | 355~356 ns: `rst=1`, `enable=1` | 0 | 355 ns 상승 에지에서 리셋 우선; 356 ns `$finish` |

위 expected는 TB/RTL 시간 계산이며 VCD의 숫자 이벤트로 교차 확인했다. 이후 사용자가 세 파형의 관찰 완료를 명시했고 해당 screenshot에서 `f→0→f`, 유지 0, 재순환 `f`, 최종 0이 보인다. PDF용 이미지 QA에서는 왼쪽 신호명 잘림을 보완할 필요가 있다.

## 남은 확인

- PDF용 screenshot의 왼쪽 신호명 가독성 개선 여부.
- 학생의 source/TB 이해·검토 상태.
- 실제 Python 경로 수정 또는 오류 발생 여부와 기록.
- 이 체크리스트가 simulation 전에 확정되었는지 여부: UNKNOWN (현재 문서는 사후 작성).
- Vivado/보드 동작: 이번 정상 Icarus evidence의 검증 범위 밖.
