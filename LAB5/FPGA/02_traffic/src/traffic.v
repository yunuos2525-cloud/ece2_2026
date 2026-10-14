`timescale 1ns/1ps

module traffic #(
    parameter integer CLK_HZ = 50_000_000
) (
    input  wire       clk_50mhz,
    input  wire       rst_p,
    input  wire       flicker,
    output wire [3:0] led_red,
    output wire [3:0] led_yellow,
    output wire [3:0] led_green,
    output wire [3:0] led_left,
    output wire [3:0] led_walk_red,
    output wire [3:0] led_walk_green
);
    wire tick;
    wire blink;
    wire [1:0] direction;
    wire [3:0] phase;

    second_tick #(.CLK_HZ(CLK_HZ)) u_second_tick (
        .clk(clk_50mhz), .rst_p(rst_p), .tick(tick), .blink(blink)
    );

    traffic_sequence u_traffic_sequence (
        .clk(clk_50mhz), .rst_p(rst_p), .flicker(flicker), .tick(tick),
        .direction(direction), .phase(phase)
    );

    traffic_lights u_traffic_lights (
        .direction(direction), .phase(phase), .flicker(flicker), .blink(blink),
        .led_red(led_red), .led_yellow(led_yellow), .led_green(led_green),
        .led_left(led_left), .led_walk_red(led_walk_red),
        .led_walk_green(led_walk_green)
    );
endmodule
