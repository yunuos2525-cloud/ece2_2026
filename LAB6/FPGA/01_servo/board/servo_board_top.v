`timescale 1ns/1ps
module servo_board_top #(parameter integer CLK_HZ = 50_000_000)(
    input wire clk_50mhz,
    input wire resetn,
    input wire left_pulse,
    input wire right_pulse,
    output wire servo
);
    servo_ctrl #(.CLK_HZ(CLK_HZ)) u_servo_ctrl(
        .clk_50mhz(clk_50mhz),
        .rst_p(~resetn),
        .left_pulse(left_pulse),
        .right_pulse(right_pulse),
        .servo(servo)
    );
endmodule
