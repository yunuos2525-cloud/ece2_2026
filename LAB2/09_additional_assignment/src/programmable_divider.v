`timescale 1ns/1ps

module programmable_divider (
    input  wire       clk,
    input  wire       rst,
    input  wire [3:0] n,
    output wire       divided_out
);

    reg [8:0] counter;

    always @(posedge clk or posedge rst) begin
        if (rst)
            counter <= 9'd0;
        else
            counter <= counter + 1'b1;
    end

    assign divided_out =
        (n == 4'd0) ? clk :
        counter[n-1];

endmodule