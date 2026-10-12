`timescale 1ns/1ps

module n_controller (
    input  wire       clk,
    input  wire       rst,
    input  wire       hash_pulse,
    output reg  [3:0] n
);

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            n <= 4'd0;
        end
        else if (hash_pulse) begin
            if (n == 4'd9)
                n <= 4'd0;
            else
                n <= n + 1'b1;
        end
    end

endmodule