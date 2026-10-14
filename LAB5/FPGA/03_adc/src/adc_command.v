`timescale 1ns/1ps

module adc_command (
    input  wire [2:0] channel,
    output wire [15:0] command
);
    assign command = {3'b101, channel, 2'b11, 1'b0, 3'b111, 4'b0000};
endmodule
