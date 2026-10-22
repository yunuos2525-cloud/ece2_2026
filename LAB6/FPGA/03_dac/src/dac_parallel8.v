`timescale 1ns/1ps
module dac_parallel8(
    input wire clk_50mhz,
    input wire rst_p,
    input wire update,
    input wire channel,
    input wire [7:0] value,
    output wire cs_n,
    output wire ldac_n,
    output reg we_n,
    output reg a_b,
    output reg [7:0] data
);
    reg write_pending;

    assign cs_n = 1'b0;
    assign ldac_n = 1'b0;

    always @(posedge clk_50mhz) begin
        if (rst_p) begin
            we_n <= 1'b1;
            a_b <= 1'b0;
            data <= 8'b0;
            write_pending <= 1'b0;
        end else begin
            we_n <= 1'b1;
            if (write_pending) begin
                /* Data and channel were registered one full clock earlier. */
                we_n <= 1'b0;
                write_pending <= 1'b0;
            end else if (update) begin
                data <= value;
                a_b <= channel;
                write_pending <= 1'b1;
            end
        end
    end
endmodule

