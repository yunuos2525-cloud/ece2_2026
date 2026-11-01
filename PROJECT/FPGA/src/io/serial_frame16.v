`timescale 1ns/1ps

// AD7908 SPI: SCLK idles high. DIN is stable before each falling edge;
// DOUT is captured just before the falling edge that shifts the next bit.
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
    reg [15:0] tx_latched;
    reg [2:0] quiet_count;

    always @(posedge clk) begin
        if (rst_p) begin
            adc_sclk   <= 1'b1;
            adc_ncs    <= 1'b1;
            adc_din    <= 1'b0;
            busy       <= 1'b0;
            done       <= 1'b0;
            rx_word    <= 16'b0;
            tx_latched <= 16'b0;
            half_count <= {HALF_WIDTH{1'b0}};
            bit_index  <= 5'd15;
            quiet_count <= 3'd4;
        end else begin
            done <= 1'b0;
            if (!busy) begin
                adc_sclk <= 1'b1;
                adc_ncs  <= 1'b1;
                adc_din  <= 1'b0;
                if (quiet_count < 3'd4)
                    quiet_count <= quiet_count + 1'b1;
                if (start && quiet_count == 3'd4) begin
                    adc_ncs    <= 1'b0;
                    adc_din    <= tx_word[15];
                    tx_latched <= tx_word;
                    busy       <= 1'b1;
                    bit_index  <= 5'd15;
                    half_count <= {HALF_WIDTH{1'b0}};
                    rx_word    <= 16'b0;
                end
            end else if (half_count == HALF_CYCLES - 1) begin
                half_count <= {HALF_WIDTH{1'b0}};
                if (adc_sclk) begin
                    // First falling edge: capture the initial leading zero.
                    // Further edges: capture the bit valid before the edge.
                    rx_word[bit_index] <= adc_dout;
                    adc_sclk <= 1'b0;
                end else begin
                    adc_sclk <= 1'b1;
                    if (bit_index == 0) begin
                        // CS rises a half-clock after the 16th falling edge.
                        adc_ncs     <= 1'b1;
                        adc_din     <= 1'b0;
                        busy        <= 1'b0;
                        done        <= 1'b1;
                        quiet_count <= 3'd0;
                    end else begin
                        bit_index <= bit_index - 1'b1;
                        // Next DIN bit is stable before the next falling edge.
                        adc_din <= tx_latched[bit_index - 1'b1];
                    end
                end
            end else begin
                half_count <= half_count + 1'b1;
            end
        end
    end
endmodule
