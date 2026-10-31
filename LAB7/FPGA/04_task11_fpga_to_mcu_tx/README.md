# Task 11 - FPGA to MCU transmitter

Implemented files:

- `../common/src/spi_master_tx.v`: student-written master core.
- `src/task11_fpga_mcu_tx_top.v`: board wrapper and one-second trigger integration.
- `sim/tb_task11_spi_master_tx.sv`: self-checking master testbench.
- `constraints/task11_fpga_mcu_tx.xdc`: clock/reset/LED constraints plus verified SPI package assignments F8/E8/A7.
- `simulation.json`: verified Icarus source list.

Required TB scope: SCK idle LOW and <=1 MHz under the selected parameter set, CS active LOW, MSB ready before the first rising edge, next-bit update on falling edges, eight rising edges, byte order, and inter-frame idle behavior.
Icarus and XSim passed, including the accelerated start-to-start interval check.
Final synthesis, placement, routing, and timing passed; UCIO-1 count is zero
and the Task 11 master bitstream was generated. Oscilloscope, physical connector
selection, 3.3 V compatibility, and MCU VCP receive results remain physical
evidence.
