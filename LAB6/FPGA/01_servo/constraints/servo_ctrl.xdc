# COMBO II-DLD S75 mapping adapted from materials/pinmaps/servo_ctrl.xdc.
set_property PACKAGE_PIN B6   [get_ports clk_50mhz]
set_property PACKAGE_PIN K4   [get_ports left_pulse]
set_property PACKAGE_PIN N4   [get_ports right_pulse]
set_property PACKAGE_PIN N8   [get_ports resetn]
set_property PACKAGE_PIN AA22 [get_ports servo]

set_property IOSTANDARD LVCMOS33 [get_ports {clk_50mhz left_pulse right_pulse resetn servo}]

create_clock -name clk_50mhz -period 20.000 [get_ports clk_50mhz]
set_false_path -from [get_ports {resetn left_pulse right_pulse}]
