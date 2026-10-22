`timescale 1ns/1ps
module dac #(parameter integer UPDATE_CYCLES = 500_000)(
    input wire clk_50mhz,
    input wire rst_p,
    input wire add_sel,
    output wire dac_csn,
    output wire dac_ldacn,
    output wire dac_wen,
    output wire dac_a_b,
    output wire [7:0] dac_d,
    output wire [7:0] led_out
);
    wire [7:0] value;
    wire update;

    ramp8 #(.UPDATE_CYCLES(UPDATE_CYCLES)) u_ramp(
        .clk_50mhz(clk_50mhz), .rst_p(rst_p),
        .value(value), .update(update)
    );
    dac_parallel8 u_bus(
        .clk_50mhz(clk_50mhz), .rst_p(rst_p),
        .update(update), .channel(add_sel), .value(value),
        .cs_n(dac_csn), .ldac_n(dac_ldacn), .we_n(dac_wen),
        .a_b(dac_a_b), .data(dac_d)
    );
    assign led_out = dac_d;
endmodule

