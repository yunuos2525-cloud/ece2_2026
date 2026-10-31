`timescale 1ns/1ps

module spi_master_tx #(
    parameter integer HALF_PERIOD_CYCLES = 25
) (
    input  wire       clk,
    input  wire       rst_p,
    input  wire       start,
    input  wire [7:0] tx_data,
    output reg        spi_sck,
    output reg        spi_mosi,
    output reg        spi_cs_n,
    output reg        busy,
    output reg        done
);
    localparam integer COUNTER_WIDTH =
        (HALF_PERIOD_CYCLES <= 1) ? 1 : $clog2(HALF_PERIOD_CYCLES);

    reg [COUNTER_WIDTH-1:0] half_counter;
    reg [7:0] shift;
    reg [2:0] bit_index;

    initial begin
        if (HALF_PERIOD_CYCLES < 1)
            $error("HALF_PERIOD_CYCLES must be at least 1");
    end

    always @(posedge clk) begin
        if (rst_p) begin
            spi_sck <= 1'b0;
            spi_mosi <= 1'b0;
            spi_cs_n <= 1'b1;
            busy <= 1'b0;
            done <= 1'b0;
            half_counter <= {COUNTER_WIDTH{1'b0}};
            shift <= 8'h00;
            bit_index <= 3'd0;
        end else begin
            done <= 1'b0;

            if (!busy) begin
                spi_sck <= 1'b0;
                spi_cs_n <= 1'b1;
                half_counter <= {COUNTER_WIDTH{1'b0}};
                if (start) begin
                    shift <= tx_data;
                    bit_index <= 3'd7;
                    spi_mosi <= tx_data[7];
                    spi_cs_n <= 1'b0;
                    busy <= 1'b1;
                end
            end else if (half_counter == HALF_PERIOD_CYCLES - 1) begin
                half_counter <= {COUNTER_WIDTH{1'b0}};
                if (!spi_sck) begin
                    /* Rising edge: the receiver samples the already stable bit. */
                    spi_sck <= 1'b1;
                end else begin
                    /* Falling edge: prepare the next MSB-first bit. */
                    spi_sck <= 1'b0;
                    if (bit_index == 3'd0) begin
                        spi_cs_n <= 1'b1;
                        busy <= 1'b0;
                        done <= 1'b1;
                    end else begin
                        bit_index <= bit_index - 1'b1;
                        shift <= {shift[6:0], 1'b0};
                        spi_mosi <= shift[6];
                    end
                end
            end else begin
                half_counter <= half_counter + 1'b1;
            end
        end
    end
endmodule
