`timescale 1ns/1ps

module adc_board_top (
    input  wire       clk_50mhz,
    input  wire       rst_p,
    input  wire [2:0] add_sel,
    input  wire       adc_dout,
    output wire       adc_sclk,
    output wire       adc_ncs,
    output wire       adc_din,
    output wire [7:0] led_out
);
    wire [11:0] sample;
    wire data_valid;
    adc u_adc (
        .clk_50mhz(clk_50mhz), .rst_p(rst_p), .add_sel(add_sel),
        .adc_dout(adc_dout), .adc_sclk(adc_sclk),
        .adc_ncs(adc_ncs), .adc_din(adc_din),
        .sample(sample), .data_valid(data_valid), .led_out(led_out)
    );
endmodule
