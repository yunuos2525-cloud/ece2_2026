`timescale 1ns/1ps

// RANGE=0 selects 0..2*REFIN (typically 0..5V for 2.5V REFIN),
// assuming the board's ADC analog supply supports this range.
module adc_command (
    input  wire [2:0] channel,
    output wire [15:0] command
);
    assign command = {3'b101, channel, 2'b11, 1'b0, 3'b101, 4'b0000};
endmodule
