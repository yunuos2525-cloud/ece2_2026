`timescale 1ns/1ps

module button_polarity_test (
    input  wire       clk_50mhz,
    input  wire       rst_p,
    input  wire       button,
    output wire [7:0] led
);

assign led[0] = button;
assign led[7:1] = 7'b0;

endmodule
