# Task 12 source identity

Task 12 intentionally adds no third hardware implementation. The transmitting
FPGA uses the reviewed Task 11 top and `spi_master_tx`; the receiving FPGA uses
the reviewed Task 10 top, `spi_slave_rx`, and `uart_tx`. The Task 12 testbench
connects those exact modules so simulation and later board programming retain
source identity.
