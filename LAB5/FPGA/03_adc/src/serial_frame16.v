`timescale 1ns/1ps

module serial_frame16 #(
    parameter integer HALF_CYCLES = 25
) (
    input  wire        clk,
    input  wire        rst_p,
    input  wire        start,
    input  wire [15:0] tx_word,
    input  wire        adc_dout,
    output reg         adc_sclk,
    output reg         adc_ncs,
    output reg         adc_din,
    output reg         busy,
    output reg         done,
    output reg  [15:0] rx_word
);
    localparam integer HALF_WIDTH = (HALF_CYCLES <= 1) ? 1 : $clog2(HALF_CYCLES);
    reg [HALF_WIDTH-1:0] half_count;
    reg [4:0] bit_index;

    always @(posedge clk) begin
        if (rst_p) begin
            adc_sclk <= 1'b1;
            adc_ncs <= 1'b1;
            adc_din <= 1'b0;
            busy <= 1'b0;
            done <= 1'b0;
            rx_word <= 16'd0;
            half_count <= {HALF_WIDTH{1'b0}};
            bit_index <= 5'd15;
        end else begin
            done <= 1'b0;
            if (!busy) begin
                adc_sclk <= 1'b1;
                adc_ncs <= 1'b1;
                adc_din <= 1'b0;
                if (start) begin
                    adc_ncs <= 1'b0;
                    busy <= 1'b1;
                    half_count <= {HALF_WIDTH{1'b0}};
                    bit_index <= 5'd15;
                    rx_word <= 16'd0;
                end
            end else if (half_count == HALF_CYCLES - 1) begin
                half_count <= {HALF_WIDTH{1'b0}};
                if (adc_sclk) begin
                    /* Falling edge: prepare the next MSB-first output bit. */
                    adc_sclk <= 1'b0;
                    adc_din <= tx_word[bit_index];
                end else begin
                    /* Rising edge: sample the matching MSB-first input bit. */
                    adc_sclk <= 1'b1;
                    rx_word[bit_index] <= adc_dout;
                    if (bit_index == 0) begin
                        adc_ncs <= 1'b1;
                        busy <= 1'b0;
                        done <= 1'b1;
                    end else begin
                        bit_index <= bit_index - 1'b1;
                    end
                end
            end else begin
                half_count <= half_count + 1'b1;
            end
        end
    end
endmodule
