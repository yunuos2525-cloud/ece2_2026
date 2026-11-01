`timescale 1ns/1ps

// GENERATED_DRAFT: one-cycle sample enable in the 50 MHz clock domain.
module sample_tick #(
    parameter integer CLOCKS_PER_SAMPLE = 3125
) (
    input  wire clk_50mhz,
    input  wire rst_p,
    output reg  sample_tick
);
    localparam integer COUNT_WIDTH =
        (CLOCKS_PER_SAMPLE <= 2) ? 1 : $clog2(CLOCKS_PER_SAMPLE);

    reg [COUNT_WIDTH-1:0] count;

    always @(posedge clk_50mhz) begin
        if (rst_p) begin
            count       <= {COUNT_WIDTH{1'b0}};
            sample_tick <= 1'b0;
        end else if (count == CLOCKS_PER_SAMPLE - 1) begin
            count       <= {COUNT_WIDTH{1'b0}};
            sample_tick <= 1'b1;
        end else begin
            count       <= count + 1'b1;
            sample_tick <= 1'b0;
        end
    end
endmodule
