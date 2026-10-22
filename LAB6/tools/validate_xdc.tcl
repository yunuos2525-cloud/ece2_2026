set repo [file normalize [file join [file dirname [info script]] .. ..]]
set evidence [file join $repo evidence vivado LAB6 xdc_validation]
file mkdir $evidence

proc validate_design {repo evidence name top source_paths xdc_rel expected_ports} {
    puts "VALIDATE_BEGIN $name"
    create_project -in_memory -part xc7s75fgga484-1

    foreach rel $source_paths {
        read_verilog [file join $repo $rel]
    }
    synth_design -top $top -part xc7s75fgga484-1
    read_xdc [file join $repo $xdc_rel]

    set ports [get_ports]
    if {[llength $ports] != $expected_ports} {
        error "$name expected $expected_ports ports, found [llength $ports]"
    }

    set missing_pin {}
    set missing_iostandard {}
    set invalid_pin {}
    set seen_pins [dict create]
    set duplicate_pins {}

    foreach port $ports {
        set pin [get_property PACKAGE_PIN $port]
        set ios [get_property IOSTANDARD $port]
        if {$pin eq ""} {
            lappend missing_pin $port
        } else {
            if {[llength [get_package_pins -quiet $pin]] != 1} {
                lappend invalid_pin "$port=$pin"
            }
            if {[dict exists $seen_pins $pin]} {
                lappend duplicate_pins "$pin:[dict get $seen_pins $pin],$port"
            } else {
                dict set seen_pins $pin $port
            }
        }
        if {$ios ne "LVCMOS33"} {
            lappend missing_iostandard "$port=$ios"
        }
    }

    report_io -force -file [file join $evidence "${name}_report_io.rpt"]
    report_drc -checks [get_drc_checks {UCIO-1 NSTD-1}] \
        -force -file [file join $evidence "${name}_drc.rpt"]

    set drc_violations [get_drc_violations -quiet {UCIO-1 NSTD-1}]
    set summary [open [file join $evidence "${name}_summary.txt"] w]
    puts $summary "part=xc7s75fgga484-1"
    puts $summary "top=$top"
    puts $summary "port_count=[llength $ports]"
    puts $summary "package_pin_count=[dict size $seen_pins]"
    puts $summary "missing_package_pin=$missing_pin"
    puts $summary "invalid_package_pin=$invalid_pin"
    puts $summary "duplicate_package_pin=$duplicate_pins"
    puts $summary "non_lvcmos33=$missing_iostandard"
    puts $summary "ucio_nstd_violations=$drc_violations"
    close $summary

    if {[llength $missing_pin] || [llength $invalid_pin] ||
        [llength $duplicate_pins] || [llength $missing_iostandard] ||
        [llength $drc_violations]} {
        error "$name XDC validation failed"
    }

    puts "VALIDATE_PASS $name ports=[llength $ports] pins=[dict size $seen_pins]"
    close_project
}

validate_design $repo $evidence servo servo_board_top {
    LAB6/FPGA/01_servo/src/servo_position.v
    LAB6/FPGA/01_servo/src/servo_pwm.v
    LAB6/FPGA/01_servo/src/servo_ctrl.v
    LAB6/FPGA/01_servo/board/servo_board_top.v
} LAB6/FPGA/01_servo/constraints/servo_ctrl.xdc 5

validate_design $repo $evidence sram sram {
    LAB6/FPGA/02_sram/src/sram_bus_control.v
    LAB6/FPGA/02_sram/src/sram.v
} LAB6/FPGA/02_sram/constraints/sram.xdc 55

validate_design $repo $evidence dac dac {
    LAB6/FPGA/03_dac/src/ramp8.v
    LAB6/FPGA/03_dac/src/dac_parallel8.v
    LAB6/FPGA/03_dac/src/dac.v
} LAB6/FPGA/03_dac/constraints/dac.xdc 23

puts "ALL_XDC_VALIDATIONS_PASS"
exit 0
