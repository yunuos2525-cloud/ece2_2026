`timescale 1ns/1ps

module task11_fpga_mcu_tx_top #(
    parameter integer CLK_HZ = 50_000_000,
    parameter integer SCK_HZ = 1_000_000,
    parameter integer INTERVAL_CYCLES = 50_000_000
) (
    input  wire       clk_50mhz,
    input  wire       rst_p,
    output wire       spi_sck,
    output wire       spi_mosi,
    output wire       spi_cs_n,
    output wire [7:0] led
);
    localparam integer HALF_PERIOD_CYCLES = CLK_HZ / (2 * SCK_HZ);
    localparam integer INTERVAL_WIDTH =
        (INTERVAL_CYCLES <= 1) ? 1 : $clog2(INTERVAL_CYCLES);

    reg [INTERVAL_WIDTH-1:0] interval_counter;
    reg [1:0] sequence_index;
    reg start;
    reg [7:0] tx_data;
    wire busy;
    wire done;

    assign led = tx_data;

    spi_master_tx #(.HALF_PERIOD_CYCLES(HALF_PERIOD_CYCLES)) spi_sender (
        .clk(clk_50mhz),
        .rst_p(rst_p),
        .start(start),
        .tx_data(tx_data),
        .spi_sck(spi_sck),
        .spi_mosi(spi_mosi),
        .spi_cs_n(spi_cs_n),
        .busy(busy),
        .done(done)
    );

    function [7:0] sequence_value;
        input [1:0] index;
        begin
            case (index)
                2'd0: sequence_value = 8'h55;
                2'd1: sequence_value = 8'hA5;
                2'd2: sequence_value = 8'h00;
                default: sequence_value = 8'hFF;
            endcase
        end
    endfunction

    always @(posedge clk_50mhz) begin
        if (rst_p) begin
            interval_counter <= {INTERVAL_WIDTH{1'b0}};
            sequence_index <= 2'd0;
            tx_data <= 8'h55;
            start <= 1'b0;
        end else begin
            start <= 1'b0;

            if (done) begin
                sequence_index <= sequence_index + 1'b1;
                tx_data <= sequence_value(sequence_index + 1'b1);
            end

            if (interval_counter == INTERVAL_CYCLES - 1) begin
                if (!busy) begin
                    interval_counter <= {INTERVAL_WIDTH{1'b0}};
                    start <= 1'b1;
                end
            end else begin
                interval_counter <= interval_counter + 1'b1;
            end
        end
    end
endmodule
