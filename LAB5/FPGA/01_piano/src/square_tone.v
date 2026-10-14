`timescale 1ns/1ps

module square_tone #(
    parameter integer CLK_HZ = 50_000_000
) (
    input  wire        clk,
    input  wire        rst_p,
    input  wire [31:0] frequency_hz,
    output reg         tone
);
    reg [31:0] count;
    reg [31:0] previous_frequency_hz;
    wire [31:0] half_cycles = (frequency_hz == 0)
                              ? 32'd0 : CLK_HZ / (2 * frequency_hz);

    always @(posedge clk) begin
        if (rst_p) begin
            count <= 32'd0;
            tone <= 1'b0;
            previous_frequency_hz <= 32'd0;
        end else if (frequency_hz == 0) begin
            count <= 32'd0;
            tone <= 1'b0;
            previous_frequency_hz <= 32'd0;
        end else if (frequency_hz != previous_frequency_hz) begin
            count <= 32'd0;
            tone <= 1'b0;
            previous_frequency_hz <= frequency_hz;
        end else if (count >= half_cycles - 1) begin
            count <= 32'd0;
            tone <= ~tone;
        end else begin
            count <= count + 1'b1;
        end
    end
endmodule
