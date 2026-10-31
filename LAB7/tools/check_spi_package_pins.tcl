set repo [file normalize [file join [file dirname [info script]] ../..]]
set evidence [file join $repo evidence vivado LAB7 pin_validation]
file mkdir $evidence

set checkpoint [file join $repo evidence vivado LAB7 task10 implementation post_route.dcp]
if {![file exists $checkpoint]} {
    error "required checkpoint not found: $checkpoint"
}
open_checkpoint $checkpoint
set output [open [file join $evidence package_pin_properties.txt] w]
puts $output "part=xc7s75fgga484-1"
foreach pin {F8 E8 A7} {
    set object [get_package_pins -quiet $pin]
    puts $output "\n===== PACKAGE_PIN $pin ====="
    if {[llength $object] != 1} {
        puts $output "ERROR: expected one package pin, found [llength $object]"
    } else {
        puts $output [report_property -return_string $object]
    }
}
close $output
close_project
