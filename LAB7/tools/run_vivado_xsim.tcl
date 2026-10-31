if {$argc != 1} {
    error "usage: vivado -mode batch -source run_vivado_xsim.tcl -tclargs task10|task11|task12"
}

set task [lindex $argv 0]
set repo [file normalize [file join [file dirname [info script]] ../..]]
set fpga [file join $repo LAB7 FPGA]
set evidence [file join $repo evidence vivado LAB7 $task xsim]
set project_dir [file join $fpga build vivado $task xsim_project]
file mkdir $evidence
file mkdir [file dirname $project_dir]

switch -- $task {
    task10 {
        set top tb_task10_spi_slave_rx
        set files [list \
            [file join $fpga common src spi_slave_rx.v] \
            [file join $fpga common src uart.v] \
            [file join $fpga 03_task10_mcu_to_fpga_rx src task10_mcu_fpga_rx_top.v]]
        set tb [file join $fpga 03_task10_mcu_to_fpga_rx sim tb_task10_spi_slave_rx.sv]
    }
    task11 {
        set top tb_task11_spi_master_tx
        set files [list \
            [file join $fpga common src spi_master_tx.v] \
            [file join $fpga 04_task11_fpga_to_mcu_tx src task11_fpga_mcu_tx_top.v]]
        set tb [file join $fpga 04_task11_fpga_to_mcu_tx sim tb_task11_spi_master_tx.sv]
    }
    task12 {
        set top tb_task12_fpga_spi_link
        set files [list \
            [file join $fpga common src spi_master_tx.v] \
            [file join $fpga common src spi_slave_rx.v] \
            [file join $fpga common src uart.v] \
            [file join $fpga 03_task10_mcu_to_fpga_rx src task10_mcu_fpga_rx_top.v] \
            [file join $fpga 04_task11_fpga_to_mcu_tx src task11_fpga_mcu_tx_top.v]]
        set tb [file join $fpga 05_task12_fpga_to_fpga sim tb_task12_fpga_spi_link.sv]
    }
    default { error "unknown LAB7 simulation: $task" }
}

create_project -force lab7_${task}_xsim $project_dir -part xc7s75fgga484-1
add_files -norecurse $files
add_files -fileset sim_1 -norecurse $tb
set_property top $top [get_filesets sim_1]
set_property -name {xsim.simulate.runtime} -value {all} -objects [get_filesets sim_1]
launch_simulation
set generated_vcd [file join $project_dir lab7_${task}_xsim.sim sim_1 behav xsim wave.vcd]
if {![file exists $generated_vcd]} {
    error "testbench did not produce the expected XSim VCD: $generated_vcd"
}
file copy -force $generated_vcd [file join $evidence wave.vcd]

set summary [open [file join $evidence status.txt] w]
puts $summary "status=XSIM_COMPLETED"
puts $summary "part=xc7s75fgga484-1"
puts $summary "simulation_top=$top"
puts $summary "note=Testbench PASS text is in the Vivado batch log; waveform visual review remains NOT_VERIFIED."
close $summary
close_sim
close_project
