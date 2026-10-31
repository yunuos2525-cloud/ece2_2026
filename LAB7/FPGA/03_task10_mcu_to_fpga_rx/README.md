# Task 10 - MCU to FPGA receiver

Implemented files:

- `../common/src/spi_slave_rx.v`: student-written receiver core.
- `src/task10_mcu_fpga_rx_top.v`: receiver-to-FPGA-UART integration wrapper.
- `sim/tb_task10_spi_slave_rx.sv`: self-checking receiver testbench.
- `constraints/task10_mcu_fpga_rx.xdc`: clock/reset/UART/LED constraints plus verified SPI package assignments F8/E8/A7.
- `simulation.json`: verified Icarus source list.

Required TB scope: all four bytes, Mode 0 sampling, exactly eight rising edges per byte, ignore/reset behavior outside CS LOW, and successful next-byte receive after CS returns HIGH.
Icarus and XSim passed. Final synthesis, placement, routing, and timing passed;
UCIO-1 count is zero and the Task 10 slave bitstream was generated. Actual UART
output, physical connector selection, 3.3 V compatibility, and MCU-to-FPGA
wiring remain board-only evidence.
