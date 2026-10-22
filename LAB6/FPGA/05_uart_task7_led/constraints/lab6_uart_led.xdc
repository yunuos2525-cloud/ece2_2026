# Verified COMBO II-DLD S75 clock/reset/USB-UART TX/LED mappings.
set_property PACKAGE_PIN B6 [get_ports clk_50mhz]
set_property PACKAGE_PIN K4 [get_ports rst_p]
set_property PACKAGE_PIN F6 [get_ports uart_txd]
set_property PACKAGE_PIN N5 [get_ports led]
set_property IOSTANDARD LVCMOS33 [get_ports *]
create_clock -name clk_50mhz -period 20.000 [get_ports clk_50mhz]
set_false_path -from [get_ports {rst_p uart_rxd}]

# PIN_CONFIRMATION_REQUIRED: choose a Spartan-7 S75 expansion-GPIO PACKAGE_PIN
# for uart_rxd and connect STM32 PC10(TX) to that physical header pin.
# C6 is intentionally not reused because it is the board's USB-UART RX path.

