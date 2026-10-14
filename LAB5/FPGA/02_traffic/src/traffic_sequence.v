`timescale 1ns/1ps

module traffic_sequence (
    input  wire       clk,
    input  wire       rst_p,
    input  wire       flicker,
    input  wire       tick,
    output reg  [1:0] direction,
    output reg  [3:0] phase
);
    always @(posedge clk) begin
        if (rst_p || flicker) begin
            direction <= 2'd0;
            phase <= 4'd0;
        end else if (tick) begin
            if (phase == 4'd12) begin
                phase <= 4'd0;
                direction <= direction + 1'b1;
            end else begin
                phase <= phase + 1'b1;
            end
        end
    end
endmodule
