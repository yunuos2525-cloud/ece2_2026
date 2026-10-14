`timescale 1ns/1ps

module second_tick #(
    parameter integer CLK_HZ = 50_000_000
) (
    input  wire clk,
    input  wire rst_p,
    output wire tick,
    output wire blink
);
    localparam integer COUNT_WIDTH = (CLK_HZ <= 1) ? 1 : $clog2(CLK_HZ);
    reg [COUNT_WIDTH-1:0] count;

    assign tick = (count == CLK_HZ - 1);
    assign blink = (count < CLK_HZ / 2);

    always @(posedge clk) begin
        if (rst_p)
            count <= {COUNT_WIDTH{1'b0}};
        else if (tick)
            count <= {COUNT_WIDTH{1'b0}};
        else
            count <= count + 1'b1;
    end
endmodule
