# Combo II-DLD S75 switch/LED pins reused from existing LAB1/LAB2 constraints.

# ten[3:0] <- switches 7:4 (same switch pins used by LAB1/03_4bit_adder a[3:0])
set_property PACKAGE_PIN Y1 [get_ports {ten[3]}]
set_property PACKAGE_PIN W3 [get_ports {ten[2]}]
set_property PACKAGE_PIN U2 [get_ports {ten[1]}]
set_property PACKAGE_PIN T1 [get_ports {ten[0]}]

# one[3:0] <- switches 3:0 (same switch pins used by LAB1/03_4bit_adder b[3:0])
set_property PACKAGE_PIN W4 [get_ports {one[3]}]
set_property PACKAGE_PIN W1 [get_ports {one[2]}]
set_property PACKAGE_PIN V4 [get_ports {one[1]}]
set_property PACKAGE_PIN U4 [get_ports {one[0]}]

# bin[6:0] -> LEDs 6:0; valid -> LED 7 (LAB2/01_counter LED pins)
set_property PACKAGE_PIN M4 [get_ports {bin[6]}]
set_property PACKAGE_PIN M2 [get_ports {bin[5]}]
set_property PACKAGE_PIN N7 [get_ports {bin[4]}]
set_property PACKAGE_PIN M7 [get_ports {bin[3]}]
set_property PACKAGE_PIN M3 [get_ports {bin[2]}]
set_property PACKAGE_PIN M1 [get_ports {bin[1]}]
set_property PACKAGE_PIN N5 [get_ports {bin[0]}]
set_property PACKAGE_PIN L4 [get_ports valid]

set_property IOSTANDARD LVCMOS33 [get_ports {ten[*] one[*] bin[*] valid}]
