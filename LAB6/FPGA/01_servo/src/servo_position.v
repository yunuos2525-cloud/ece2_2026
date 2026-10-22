`timescale 1ns/1ps
module servo_position(
    input wire clk_50mhz,
    input wire rst_p,
    input wire left_pulse,
    input wire right_pulse,
    output reg [31:0] pulse_us
);
    always @(posedge clk_50mhz) begin
        if (rst_p)
            pulse_us <= 1500;
        else if (left_pulse && !right_pulse && pulse_us > 1000)
            pulse_us <= pulse_us - 100;
        else if (right_pulse && !left_pulse && pulse_us < 2000)
            pulse_us <= pulse_us + 100;
    end
endmodule

