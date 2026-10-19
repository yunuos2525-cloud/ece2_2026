`timescale 1ns/1ps

module adc #(
    parameter integer HALF_CYCLES = 25
) (
    input  wire        clk_50mhz,
    input  wire        rst_p,
    input  wire [2:0]  add_sel,
    input  wire        adc_dout,
    output wire        adc_sclk,
    output wire        adc_ncs,
    output wire        adc_din,
    output reg  [11:0] sample,
    output reg         data_valid,
    output wire [7:0]  led_out
);
    wire [15:0] command;
    wire [15:0] rx_word;
    wire busy, done;
    wire start = !busy && !done;
    reg first_frame;

    adc_command u_adc_command (
        .channel(add_sel), .command(command)
    );

    serial_frame16 #(.HALF_CYCLES(HALF_CYCLES)) u_serial_frame16 (
        .clk(clk_50mhz), .rst_p(rst_p), .start(start),
        .tx_word(command), .adc_dout(adc_dout),
        .adc_sclk(adc_sclk), .adc_ncs(adc_ncs), .adc_din(adc_din),
        .busy(busy), .done(done), .rx_word(rx_word)
    );

    always @(posedge clk_50mhz) begin
        if (rst_p) begin
            sample <= 12'b0;
            data_valid <= 1'b0;
            first_frame <= 1'b1;
        end else begin
            data_valid <= 1'b0;
            if (done) begin
                first_frame <= 1'b0;
                if (!first_frame) begin
                    sample <= rx_word[11:0];
                    data_valid <= 1'b1;
                end
            end
        end
    end

    // AD7908 RX: [15]=0, [14:12]=channel ID, [11:4]=8bit ADC, [3:0]=0000.
    assign led_out = sample[11:4];
endmodule
