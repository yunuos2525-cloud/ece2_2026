# Button Polarity Test

목적:
N8에 연결된 button 입력의 실제 극성을 확인한다.

판정 방법:

- N8을 누르지 않았을 때 LED0 상태 기록
- N8을 눌렀을 때 LED0 상태 기록

해석:

- 안 누름 0 / 누름 1 → active-high
- 안 누름 1 / 누름 0 → active-low

Vivado에서:

- top module: button_polarity_test
- XDC: constraints/button_polarity_test.xdc
