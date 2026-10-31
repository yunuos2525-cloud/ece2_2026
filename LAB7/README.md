# LAB7 - SPI 통신 준비 영역

LAB7의 범위는 `STM32_3.md`의 Task 8~12 다섯 과제이다.
별도의 FPGA 추가 실습은 포함하지 않는다.

- `STM32/`: Task 8~11 MCU master/slave canonical source and role mapping
- `FPGA/`: Task 10~12 SPI RTL, TB, simulation, final XDC, automation
- `BOARD_EXECUTION_GUIDE.md`: 실험 당일 파일/배선/증거 수집 순서
- 요구사항 기준: `reports/_automation/LAB7_PRE_REQUIREMENTS.md`
- 사실/상태 추적: `reports/_automation/LAB7_pre_manifest.md`

현재 상태: MCU 다섯 role Build PASS, Task 10~12 Icarus/XSim PASS,
Task 10/11 synthesis/place/route/timing/bitstream PASS. 공개 핀표와 로컬
XDC를 교차 확인해 BDIO00/F8, BDIO01/E8, BDIO02/A7을 적용했고 UCIO-1은
0건이다. Task 10~12는 구현 산출물 기준 `BOARD_READY`지만, 물리 커넥터
위치·스위치 경로·3.3 V 호환성과 실제 보드 동작은 `NOT_VERIFIED`다.

## 공통 SPI 조건

- Mode 0, 8-bit, MSB-first
- SCK idle LOW, rising edge sample, falling edge next-bit update
- 첫 rising edge 전에 MSB 준비
- CS active LOW, MISO 미사용
- FPGA master SCK 1 MHz 이하
- 시험 데이터: `0x55`, `0xA5`, `0x00`, `0xFF`

기존 clock/reset/UART/LED 제약을 보존하고 세 SPI 핀을 최종 XDC에
추가했다. DRC severity는 변경하지 않았으며 남은 CFGBVS-1 warning은
Evidence와 핀맵 조사 문서에 그대로 기록했다.
