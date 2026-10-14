# Verified generic clock/reset/switch/LED mappings reused from LAB2/LAB3.
set_property PACKAGE_PIN B6 [get_ports clk_50mhz]
set_property PACKAGE_PIN K4 [get_ports rst_p]
set_property PACKAGE_PIN U4 [get_ports {add_sel[0]}]
set_property PACKAGE_PIN V4 [get_ports {add_sel[1]}]
set_property PACKAGE_PIN W1 [get_ports {add_sel[2]}]
set_property PACKAGE_PIN N5 [get_ports {led_out[0]}]
set_property PACKAGE_PIN M1 [get_ports {led_out[1]}]
set_property PACKAGE_PIN M3 [get_ports {led_out[2]}]
set_property PACKAGE_PIN M7 [get_ports {led_out[3]}]
set_property PACKAGE_PIN N7 [get_ports {led_out[4]}]
set_property PACKAGE_PIN M2 [get_ports {led_out[5]}]
set_property PACKAGE_PIN M4 [get_ports {led_out[6]}]
set_property PACKAGE_PIN L4 [get_ports {led_out[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {clk_50mhz rst_p add_sel[*] led_out[*]}]
create_clock -name clk_50mhz -period 20.000 [get_ports clk_50mhz]
set_false_path -from [get_ports {rst_p add_sel[*] adc_dout}]

# NEEDS_PIN_VERIFICATION: no verified external-ADC interface mapping exists in
# LAB1-LAB4. The port names are constrained electrically but left unassigned.
set_property IOSTANDARD LVCMOS33 [get_ports {adc_sclk adc_ncs adc_din adc_dout}]
