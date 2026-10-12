`timescale 1ns/1ps

module uart_tx #(
    parameter integer CLK_FREQ = 50000000,
    parameter integer BAUD     = 9600
)(
    input  wire       clk,
    input  wire       rst,

    input  wire [7:0] data_in,
    input  wire       start,

    output reg        tx,
    output reg        busy,
    output reg        done
);

    localparam integer CLKS_PER_BIT = CLK_FREQ / BAUD;

    reg [31:0] clk_count;
    reg [3:0]  bit_index;
    reg [9:0]  frame;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            tx        <= 1'b1;
            busy      <= 1'b0;
            done      <= 1'b0;
            clk_count <= 0;
            bit_index <= 0;
            frame     <= 10'h3FF;
        end
        else begin
            done <= 1'b0;

            if (!busy) begin
                tx <= 1'b1;

                if (start) begin
                    // UART 8-N-1
                    // frame[0]   : start bit
                    // frame[8:1] : data, LSB first
                    // frame[9]   : stop bit
                    frame     <= {1'b1, data_in, 1'b0};
                    busy      <= 1'b1;
                    clk_count <= 0;
                    bit_index <= 0;
                    tx        <= 1'b0;
                end
            end
            else begin
                if (clk_count == CLKS_PER_BIT - 1) begin
                    clk_count <= 0;

                    if (bit_index == 9) begin
                        tx        <= 1'b1;
                        busy      <= 1'b0;
                        done      <= 1'b1;
                        bit_index <= 0;
                    end
                    else begin
                        bit_index <= bit_index + 1'b1;
                        tx        <= frame[bit_index + 1'b1];
                    end
                end
                else begin
                    clk_count <= clk_count + 1'b1;
                end
            end
        end
    end

endmodule