`timescale 1ns/1ps

// GENERATED_DRAFT: translates each valid audio sample into one DAC update.
module dac_writer (
    input  wire       clk_50mhz,
    input  wire       rst_p,
    input  wire       sample_valid,
    input  wire [7:0] sample_data,
    input  wire       channel,
    output wire       dac_csn,
    output wire       dac_ldacn,
    output wire       dac_wen,
    output wire       dac_a_b,
    output wire [7:0] dac_d,
    output reg        update_pulse,
    output reg  [7:0] last_value
);
    always @(posedge clk_50mhz) begin
        if (rst_p) begin
            update_pulse <= 1'b0;
            last_value <= 8'h00;
        end else begin
            update_pulse <= sample_valid;
            if (sample_valid)
                last_value <= sample_data;
        end
    end

    dac_parallel8 u_dac_parallel8 (
        .clk_50mhz(clk_50mhz),
        .rst_p(rst_p),
        .update(sample_valid),
        .channel(channel),
        .value(sample_data),
        .cs_n(dac_csn),
        .ldac_n(dac_ldacn),
        .we_n(dac_wen),
        .a_b(dac_a_b),
        .data(dac_d)
    );
endmodule
