set repo {C:/Users/yunji/ece2/ece2_2026}
set out [file dirname [file normalize [info script]]]

read_verilog [file join $repo LAB5 FPGA 02_traffic src second_tick.v]
read_verilog [file join $repo LAB5 FPGA 02_traffic src traffic_sequence.v]
read_verilog [file join $repo LAB5 FPGA 02_traffic src traffic_lights.v]
read_verilog [file join $repo LAB5 FPGA 02_traffic src traffic.v]
read_xdc [file join $repo LAB5 FPGA 02_traffic constraints traffic.xdc]

synth_design -top traffic -part xc7s75fgga484-1
write_checkpoint -force [file join $out traffic_synth.dcp]
report_io -file [file join $out traffic_synth_io.rpt]
report_drc -file [file join $out traffic_synth_drc.rpt]
check_timing -verbose -file [file join $out traffic_synth_check_timing.rpt]

opt_design
place_design
route_design
write_checkpoint -force [file join $out traffic_routed.dcp]
report_io -file [file join $out traffic_routed_io.rpt]
report_drc -file [file join $out traffic_routed_drc.rpt]
report_timing_summary -file [file join $out traffic_timing_summary.rpt]

set critical [get_drc_violations -quiet {UCIO-1 NSTD-1}]
puts "FINAL_CRITICAL_DRC_COUNT=[llength $critical]"
if {[llength $critical] != 0} { exit 2 }
exit 0
