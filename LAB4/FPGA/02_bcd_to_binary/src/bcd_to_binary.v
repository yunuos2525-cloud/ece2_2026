`timescale 1ns/1ps

// The tens and ones digits are each entered as values from 0 through 9.
module bcd_to_binary(
    input wire [3:0] ten, one,
    output wire [6:0] binary,
    output wire valid
);
    assign binary = ten * 7'd10 + one;
    assign valid = (ten <= 9) && (one <= 9);
endmodule
