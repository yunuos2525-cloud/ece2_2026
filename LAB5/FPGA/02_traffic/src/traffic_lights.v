`timescale 1ns/1ps

module traffic_lights (
    input  wire [1:0] direction,
    input  wire [3:0] phase,
    input  wire       flicker,
    input  wire       blink,
    output reg  [3:0] led_red,
    output reg  [3:0] led_yellow,
    output reg  [3:0] led_green,
    output reg  [3:0] led_left,
    output reg  [3:0] led_walk_red,
    output reg  [3:0] led_walk_green
);
    always @* begin
        led_red = 4'b1111;
        led_yellow = 4'b0000;
        led_green = 4'b0000;
        led_walk_red = 4'b1111;
        led_walk_green = 4'b0000;

        if (flicker) begin
            led_red = 4'b0000;
            led_yellow = {4{blink}};
            led_walk_red = {4{blink}};
        end else begin
            led_red[direction] = 1'b0;
            if (phase <= 4'd10)
                led_green[direction] = 1'b1;
            else
                led_yellow[direction] = 1'b1;

            if (phase <= 4'd3) begin
                led_walk_red[direction] = 1'b0;
                led_walk_green[direction] = 1'b1;
            end else if (phase <= 4'd10) begin
                led_walk_red[direction] = 1'b0;
                led_walk_green[direction] = blink;
            end
        end

        led_left = led_green;
    end
endmodule
