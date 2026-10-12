# LAB2 Common POST Requirements

> 출처: 사용자가 제공한 LAB2 「실험 후 레포트」 공통 요구사항 슬라이드, 실험별 「실험 후 레포트」 예시, 9/21 수업 진행 안내.
> 이 문서는 LAB2 POST 준비용 내부 요구사항 정리이며 제출 본문이 아니다.

## 1. 공통 결과보고서 요구

1. Vivado 기능 시뮬레이션 결과와 VS Code 결과를 비교한다.
2. synthesis/implementation 결과, warning 해석, pin 및 timing/clock 조건, bit 파일을 기록한다.
3. Program Device 화면과 실제 입출력 evidence를 첨부한다.
4. 통합판은 버튼 mode 전환, LCD mode명, 선택된 회로 출력을 함께 보여 준다.
5. GitHub에 source·report·관찰 자료를 연결하고 미수행 항목을 구분한다.

## 2. 9/21 수업에서 추가 확인된 제출/시연 요구

- 결과보고서에 담을 **8개 실험의 동작 영상을 순서대로 모두 촬영**한다.
- 그 8개 중 **1개 실험을 수업에서 시연**한다.
- 따라서 `8개 영상 확보`와 `시연 1개 선택/수행`은 서로 다른 체크 항목이다.
- 시연 대상이 확정되기 전에는 `DEMO_SELECTION_STATUS = NOT_SELECTED`.
- 영상이 존재한다는 사실만으로 시연 실험을 추론하지 않는다.
- 제공하는 추가과제 시연은 **선택**이다.
- 추가과제는 현재 확인된 힌트상 매뉴얼이 제공되지 않고, 오실로스코프 Single 기능을 사용하며 통신 관련 과제다. 구체 요구는 현장에서 확인 전 UNKNOWN으로 둔다.

## 3. 실험별 추가 요구사항 추출

각 실험 폴더/슬라이드의 「실험 후 레포트」 문장을 별도로 읽고 다음을 추출한다.

- Vivado Sources hierarchy에서 보여야 하는 source/top
- Vivado simulation PASS waveform에서 보여야 하는 신호/조건
- VS Code 결과와 비교해야 하는 동일 case
- 사용 부품, pin, 1 kHz clock 등 constraint
- synthesis / implementation 결과
- `write_bitstream Complete` 화면
- 생성된 bit 파일
- 남은 warning과 해석
- 실제 board에서 보여야 하는 기능
- photo/video 요구 장면
- GitHub/README 연결 요구

## 4. 상태

각 항목은 `REQUIRED / OPTIONAL / NOT_REQUIRED / UNKNOWN`으로 기록한다.
다른 실험의 요구를 자동 복사하지 않는다.
