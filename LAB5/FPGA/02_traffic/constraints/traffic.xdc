# Clock/reset/button mappings are verified in LAB3 constraints.
set_property PACKAGE_PIN B6 [get_ports clk_50mhz]
set_property PACKAGE_PIN K4 [get_ports rst_p]
set_property PACKAGE_PIN N8 [get_ports flicker]
set_property IOSTANDARD LVCMOS33 [get_ports {clk_50mhz rst_p flicker}]
create_clock -name clk_50mhz -period 20.000 [get_ports clk_50mhz]
set_false_path -from [get_ports {rst_p flicker}]

# NEEDS_PIN_VERIFICATION: the repository has no verified Combo II-DLD mapping
# for these six four-bit traffic-light groups. Do not invent PACKAGE_PIN values.
set_property IOSTANDARD LVCMOS33 [get_ports {led_red[*]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led_yellow[*]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led_green[*]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led_left[*]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led_walk_red[*]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led_walk_green[*]}]
