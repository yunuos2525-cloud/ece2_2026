# ============================================================
# LAB2 Additional Assignment
# Combo II-DLD Spartan-7
# ============================================================


# ------------------------------------------------------------
# 50 MHz FPGA clock
# FPGA_CLK1 = B6
# ------------------------------------------------------------

set_property PACKAGE_PIN B6 [get_ports {clk}]
set_property IOSTANDARD LVCMOS33 [get_ports {clk}]

create_clock -name fpga_clk_50mhz -period 20.000 [get_ports {clk}]


# ------------------------------------------------------------
# Independent active-high button inputs
# ------------------------------------------------------------

set_property PACKAGE_PIN L1 [get_ports {key_0}]
set_property PACKAGE_PIN K4 [get_ports {key_1}]
set_property PACKAGE_PIN N8 [get_ports {key_2}]
set_property PACKAGE_PIN N4 [get_ports {key_3}]
set_property PACKAGE_PIN N1 [get_ports {key_4}]
set_property PACKAGE_PIN P6 [get_ports {key_5}]
set_property PACKAGE_PIN N6 [get_ports {key_6}]
set_property PACKAGE_PIN L5 [get_ports {key_7}]
set_property PACKAGE_PIN J2 [get_ports {key_8}]
set_property PACKAGE_PIN K2 [get_ports {key_9}]
set_property PACKAGE_PIN L7 [get_ports {key_star}]
set_property PACKAGE_PIN K6 [get_ports {key_hash}]

set_property IOSTANDARD LVCMOS33 [get_ports {
    key_0 key_1 key_2 key_3 key_4 key_5
    key_6 key_7 key_8 key_9 key_star key_hash
}]


# ------------------------------------------------------------
# Single 7-Segment data
#
# seg_data = {A,B,C,D,E,F,G,DP}
# ------------------------------------------------------------

set_property PACKAGE_PIN P1 [get_ports {seg_data[7]}]
set_property PACKAGE_PIN P3 [get_ports {seg_data[6]}]
set_property PACKAGE_PIN P7 [get_ports {seg_data[5]}]
set_property PACKAGE_PIN N3 [get_ports {seg_data[4]}]
set_property PACKAGE_PIN T5 [get_ports {seg_data[3]}]
set_property PACKAGE_PIN R2 [get_ports {seg_data[2]}]
set_property PACKAGE_PIN R4 [get_ports {seg_data[1]}]
set_property PACKAGE_PIN R6 [get_ports {seg_data[0]}]

set_property IOSTANDARD LVCMOS33 [get_ports {seg_data[*]}]


# ------------------------------------------------------------
# BreadBoard I/O
#
# BDIO00 = F8 : 50 MHz / 2^N
# BDIO02 = A7 : UART TX
# ------------------------------------------------------------

set_property PACKAGE_PIN F8 [get_ports {bdio0}]
set_property IOSTANDARD LVCMOS33 [get_ports {bdio0}]

set_property PACKAGE_PIN A7 [get_ports {bdio2}]
set_property IOSTANDARD LVCMOS33 [get_ports {bdio2}]


# Asynchronous external inputs are synchronized in button_events.
set_false_path -from [get_ports {
    key_0 key_1 key_2 key_3 key_4 key_5
    key_6 key_7 key_8 key_9 key_star key_hash
}]
