# Task 12 - FPGA to FPGA SPI link

Implemented files:

- `../common/src/spi_master_tx.v`: exact reviewed Task 11 master core.
- `../common/src/spi_slave_rx.v`: exact reviewed Task 10 receiver core.
- `sim/tb_task12_fpga_spi_link.sv`: end-to-end self-checking link testbench.
- `simulation.json`: verified integration-simulation configuration.

No duplicate master/receiver RTL exists. Icarus and XSim passed against the
exact Task 10/11 modules, including receiver UART output. Physical role exchange
uses the finalized Task 11 master bitstream on the transmitting board and the
finalized Task 10 slave bitstream on the receiving board. Physical connector
positions, switch paths, 3.3 V compatibility, and board behavior remain
`NOT_VERIFIED`.
