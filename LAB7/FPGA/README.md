# LAB7 FPGA source plan

Task 10~12만 포함한다. FPGA SPI Verilog 정답은 제공되지 않으므로 학생이 직접 설계하고 검토해야 한다.

| 폴더 | 역할 | simulation 대상 |
|---|---|---|
| `common/src/` | Task 10 receiver와 Task 11 master의 단일 source of truth | 향후 `spi_slave_rx.v`, `spi_master_tx.v` |
| `03_task10_mcu_to_fpga_rx/` | MCU MOSI를 받는 FPGA slave receiver | bit order, CS, 연속 byte 재수신 |
| `04_task11_fpga_to_mcu_tx/` | FPGA master transmitter | Mode 0 edge timing, 8-bit frame, SCK <= 1 MHz |
| `05_task12_fpga_to_fpga/` | Task 11 master와 Task 10 receiver의 통합 | end-to-end byte 일치 |

각 task의 `simulation.json`은 다음 단계에서 만들 파일명을 가리키는 draft이다.
현재 해당 RTL/TB 파일은 없으므로 아직 실행 가능한 설정이 아니다.
`constraints/`에는 핀맵 근거가 확보된 뒤에만 XDC를 추가한다.
