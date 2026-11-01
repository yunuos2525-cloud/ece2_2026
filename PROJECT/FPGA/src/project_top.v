`timescale 1ns/1ps

// GENERATED_DRAFT Week 1 top.
// FILTER selects a mode register only; DSP remains a transparent path.
module project_top #(
    parameter integer SAMPLE_CLOCKS = 3125,
    parameter integer ADC_HALF_CYCLES = 25,
    parameter integer DAC_CHANNEL = 0
) (
    input  wire       clk_50mhz,
    input  wire       rst_p,
    input  wire [2:0] add_sel,
    input  wire       adc_dout,
    output wire       adc_sclk,
    output wire       adc_ncs,
    output wire       adc_din,
    output wire       dac_a_b,
    output wire       dac_csn,
    output wire       dac_ldacn,
    output wire       dac_wen,
    output wire [7:0] dac_d,
    input  wire       spi_sck,
    input  wire       spi_mosi,
    input  wire       spi_cs_n,
    output wire [7:0] led_out
);
    wire tick_16k;
    wire [7:0] adc_sample;
    wire adc_sample_valid;
    wire adc_busy;
    wire sample_drop_event;
    wire [7:0] spi_rx_data;
    wire spi_rx_valid;
    wire dac_update_pulse;
    wire [7:0] dac_last_value;
    wire [7:0] processed_sample;
    reg mode_filter;
    reg sample_drop_sticky;

    sample_tick #(
        .CLOCKS_PER_SAMPLE(SAMPLE_CLOCKS)
    ) u_sample_tick (
        .clk_50mhz(clk_50mhz),
        .rst_p(rst_p),
        .sample_tick(tick_16k)
    );

    adc_reader_16k #(
        .HALF_CYCLES(ADC_HALF_CYCLES)
    ) u_adc_reader_16k (
        .clk_50mhz(clk_50mhz),
        .rst_p(rst_p),
        .sample_tick(tick_16k),
        .channel(add_sel),
        .adc_dout(adc_dout),
        .adc_sclk(adc_sclk),
        .adc_ncs(adc_ncs),
        .adc_din(adc_din),
        .sample_data(adc_sample),
        .sample_valid(adc_sample_valid),
        .busy(adc_busy),
        .sample_drop(sample_drop_event)
    );

    // Week 1 intentionally keeps FILTER transparent until the notch is added.
    assign processed_sample = adc_sample;

    dac_writer u_dac_writer (
        .clk_50mhz(clk_50mhz),
        .rst_p(rst_p),
        .sample_valid(adc_sample_valid),
        .sample_data(processed_sample),
        .channel(DAC_CHANNEL != 0),
        .dac_csn(dac_csn),
        .dac_ldacn(dac_ldacn),
        .dac_wen(dac_wen),
        .dac_a_b(dac_a_b),
        .dac_d(dac_d),
        .update_pulse(dac_update_pulse),
        .last_value(dac_last_value)
    );

    spi_slave_rx u_spi_slave_rx (
        .clk(clk_50mhz),
        .rst_p(rst_p),
        .spi_sck(spi_sck),
        .spi_mosi(spi_mosi),
        .spi_cs_n(spi_cs_n),
        .rx_data(spi_rx_data),
        .rx_valid(spi_rx_valid)
    );

    always @(posedge clk_50mhz) begin
        if (rst_p) begin
            mode_filter <= 1'b0;
            sample_drop_sticky <= 1'b0;
        end else begin
            if (sample_drop_event)
                sample_drop_sticky <= 1'b1;

            if (spi_rx_valid) begin
                case (spi_rx_data)
                    8'h01: mode_filter <= 1'b0; // PROPOSED BYPASS
                    8'h02: mode_filter <= 1'b1; // PROPOSED FILTER mode only
                    8'h05: sample_drop_sticky <= 1'b0; // PROPOSED clear
                    default: ;
                endcase
            end
        end
    end

    // Week 1 debug: mode, sticky drop flag, and low six sample bits.
    assign led_out = {mode_filter, sample_drop_sticky, adc_sample[5:0]};

    wire _unused_ok = &{1'b0, adc_busy, dac_update_pulse,
                        dac_last_value[7:0]};
endmodule
