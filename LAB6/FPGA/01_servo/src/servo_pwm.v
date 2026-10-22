`timescale 1ns/1ps
module servo_pwm #(parameter integer CLK_HZ = 50_000_000)(
    input wire clk_50mhz,
    input wire rst_p,
    input wire [31:0] pulse_us,
    output wire servo
);
    localparam integer FRAME_CYCLES = CLK_HZ / 50;
    reg [31:0] count;
    reg [31:0] width_cycles;

    always @(posedge clk_50mhz) begin
        if (rst_p) begin
            count <= 0;
            width_cycles <= (CLK_HZ / 1000) * 3 / 2;
        end else if (count == FRAME_CYCLES - 1) begin
            count <= 0;
            width_cycles <= pulse_us * (CLK_HZ / 1000) / 1000;
        end else begin
            count <= count + 1'b1;
        end
    end

    assign servo = !rst_p && (count < width_cycles);
endmodule

