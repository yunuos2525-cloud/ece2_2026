# COMBO II-DLD S75 project pin draft assembled from reviewed LAB5/6/7 XDCs.
# Package pins do not prove the physical analog terminal or BDIO switch path.
set_property PACKAGE_PIN B6 [get_ports clk_50mhz]
set_property PACKAGE_PIN K4 [get_ports rst_p]
set_property PACKAGE_PIN U4 [get_ports {add_sel[0]}]
set_property PACKAGE_PIN V4 [get_ports {add_sel[1]}]
set_property PACKAGE_PIN W1 [get_ports {add_sel[2]}]

set_property PACKAGE_PIN H3 [get_ports adc_ncs]
set_property PACKAGE_PIN H5 [get_ports adc_din]
set_property PACKAGE_PIN J6 [get_ports adc_dout]
set_property PACKAGE_PIN H7 [get_ports adc_sclk]

set_property PACKAGE_PIN G2 [get_ports dac_a_b]
set_property PACKAGE_PIN E1 [get_ports dac_csn]
set_property PACKAGE_PIN F4 [get_ports dac_ldacn]
set_property PACKAGE_PIN G4 [get_ports dac_wen]
set_property PACKAGE_PIN E3 [get_ports {dac_d[0]}]
set_property PACKAGE_PIN E5 [get_ports {dac_d[1]}]
set_property PACKAGE_PIN D2 [get_ports {dac_d[2]}]
set_property PACKAGE_PIN D5 [get_ports {dac_d[3]}]
set_property PACKAGE_PIN C2 [get_ports {dac_d[4]}]
set_property PACKAGE_PIN C4 [get_ports {dac_d[5]}]
set_property PACKAGE_PIN B1 [get_ports {dac_d[6]}]
set_property PACKAGE_PIN B3 [get_ports {dac_d[7]}]

set_property PACKAGE_PIN F8 [get_ports spi_sck]
set_property PACKAGE_PIN E8 [get_ports spi_mosi]
set_property PACKAGE_PIN A7 [get_ports spi_cs_n]
# MISO candidate G8/BDIO03 intentionally omitted:
# PACKAGE_PIN_CANDIDATE / NEEDS_PHYSICAL_BOARD_CHECK.

set_property PACKAGE_PIN N5 [get_ports {led_out[0]}]
set_property PACKAGE_PIN M1 [get_ports {led_out[1]}]
set_property PACKAGE_PIN M3 [get_ports {led_out[2]}]
set_property PACKAGE_PIN M7 [get_ports {led_out[3]}]
set_property PACKAGE_PIN N7 [get_ports {led_out[4]}]
set_property PACKAGE_PIN M2 [get_ports {led_out[5]}]
set_property PACKAGE_PIN M4 [get_ports {led_out[6]}]
set_property PACKAGE_PIN L4 [get_ports {led_out[7]}]

set_property IOSTANDARD LVCMOS33 [get_ports {clk_50mhz rst_p add_sel[*] led_out[*]}]
set_property IOSTANDARD LVCMOS33 [get_ports {adc_sclk adc_ncs adc_din adc_dout}]
set_property IOSTANDARD LVCMOS33 [get_ports {dac_a_b dac_csn dac_ldacn dac_wen dac_d[*]}]
set_property IOSTANDARD LVCMOS33 [get_ports {spi_sck spi_mosi spi_cs_n}]

create_clock -name clk_50mhz -period 20.000 [get_ports clk_50mhz]
set_false_path -from [get_ports {rst_p add_sel[*] adc_dout spi_sck spi_mosi spi_cs_n}]
