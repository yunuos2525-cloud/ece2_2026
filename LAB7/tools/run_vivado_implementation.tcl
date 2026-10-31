if {$argc < 1 || $argc > 2} {
    error "usage: vivado -mode batch -source run_vivado_implementation.tcl -tclargs task10|task11 ?evidence_run_name?"
}

set task [lindex $argv 0]
set evidence_run_name implementation
if {$argc == 2} {
    set evidence_run_name [lindex $argv 1]
    if {![regexp {^[A-Za-z0-9_.-]+$} $evidence_run_name]} {
        error "evidence_run_name may contain only letters, digits, dot, underscore, and hyphen"
    }
}
set repo [file normalize [file join [file dirname [info script]] ../..]]
set fpga [file join $repo LAB7 FPGA]
set evidence [file join $repo evidence vivado LAB7 $task $evidence_run_name]
file mkdir $evidence

switch -- $task {
    task10 {
        set top task10_mcu_fpga_rx_top
        set files [list \
            [file join $fpga common src spi_slave_rx.v] \
            [file join $fpga common src uart.v] \
            [file join $fpga 03_task10_mcu_to_fpga_rx src task10_mcu_fpga_rx_top.v]]
        set xdc [file join $fpga 03_task10_mcu_to_fpga_rx constraints task10_mcu_fpga_rx.xdc]
    }
    task11 {
        set top task11_fpga_mcu_tx_top
        set files [list \
            [file join $fpga common src spi_master_tx.v] \
            [file join $fpga 04_task11_fpga_to_mcu_tx src task11_fpga_mcu_tx_top.v]]
        set xdc [file join $fpga 04_task11_fpga_to_mcu_tx constraints task11_fpga_mcu_tx.xdc]
    }
    default { error "unknown LAB7 implementation: $task" }
}

create_project -in_memory -part xc7s75fgga484-1
read_verilog $files
read_xdc $xdc
synth_design -top $top -part xc7s75fgga484-1
set unassigned {}
foreach port [get_ports] {
    # Capture user LOC coverage before place_design can choose provisional
    # sites for unconstrained ports.
    if {[get_property LOC $port] eq ""} {
        lappend unassigned [get_property NAME $port]
    }
}
write_checkpoint -force [file join $evidence post_synth.dcp]
report_utilization -file [file join $evidence utilization_post_synth.rpt]
report_timing_summary -delay_type min_max -report_unconstrained \
    -check_timing_verbose -file [file join $evidence timing_post_synth.rpt]

opt_design
place_design
phys_opt_design
route_design
write_checkpoint -force [file join $evidence post_route.dcp]
report_utilization -file [file join $evidence utilization_post_route.rpt]
report_timing_summary -delay_type min_max -report_unconstrained \
    -check_timing_verbose -file [file join $evidence timing_post_route.rpt]
report_drc -file [file join $evidence drc_post_route.rpt]
report_io -file [file join $evidence io_post_route.rpt]

set status [open [file join $evidence status.txt] w]
puts $status "synthesis=PASS"
puts $status "implementation_route=PASS"
puts $status "part=xc7s75fgga484-1"
puts $status "top=$top"
puts $status "unassigned_ports=[join $unassigned ,]"
puts $status "ucio_1_count=[llength $unassigned]"
if {[llength $unassigned] == 0} {
    write_bitstream -force [file join $evidence ${top}.bit]
    puts $status "bitstream=GENERATED"
} else {
    puts $status "bitstream=SKIPPED_UNASSIGNED_PORTS"
}
close $status
close_project
