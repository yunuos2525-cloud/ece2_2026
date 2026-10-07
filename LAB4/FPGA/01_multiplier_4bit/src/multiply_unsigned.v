`timescale 1ns/1ps

// 4-bit multiplication: multiply two inputs to produce an 8-bit result.
module multiply_unsigned #(parameter WIDTH = 4)(
    input wire [WIDTH-1:0] a, b,
    output wire [2*WIDTH-1:0] product
);
    assign product = a * b;
endmodule
