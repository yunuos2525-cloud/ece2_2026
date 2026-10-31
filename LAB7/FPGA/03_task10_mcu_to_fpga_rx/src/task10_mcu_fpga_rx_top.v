`timescale 1ns/1ps

module task10_mcu_fpga_rx_top #(
    parameter integer CLK_HZ = 50_000_000,
    parameter integer UART_BAUD = 9_600
) (
    input  wire       clk_50mhz,
    input  wire       rst_p,
    input  wire       spi_sck,
    input  wire       spi_mosi,
    input  wire       spi_cs_n,
    output wire       uart_txd,
    output wire [7:0] led
);
    localparam integer UART_DIV = CLK_HZ / UART_BAUD;

    wire [7:0] rx_data;
    wire rx_valid;
    wire uart_ready;
    reg uart_valid;
    reg [7:0] uart_data;
    reg pending_valid;
    reg [7:0] pending_data;
    reg [7:0] last_data;

    assign led = last_data;

    spi_slave_rx spi_receiver (
        .clk(clk_50mhz),
        .rst_p(rst_p),
        .spi_sck(spi_sck),
        .spi_mosi(spi_mosi),
        .spi_cs_n(spi_cs_n),
        .rx_data(rx_data),
        .rx_valid(rx_valid)
    );

    uart_tx #(.DIV(UART_DIV)) serial_output (
        .clk(clk_50mhz),
        .rst_p(rst_p),
        .valid(uart_valid),
        .data(uart_data),
        .ready(uart_ready),
        .tx(uart_txd)
    );

    always @(posedge clk_50mhz) begin
        if (rst_p) begin
            uart_valid <= 1'b0;
            uart_data <= 8'h00;
            pending_valid <= 1'b0;
            pending_data <= 8'h00;
            last_data <= 8'h00;
        end else begin
            uart_valid <= 1'b0;

            if (rx_valid) begin
                last_data <= rx_data;
                if (uart_ready && !pending_valid) begin
                    uart_data <= rx_data;
                    uart_valid <= 1'b1;
                end else begin
                    pending_data <= rx_data;
                    pending_valid <= 1'b1;
                end
            end else if (pending_valid && uart_ready) begin
                uart_data <= pending_data;
                uart_valid <= 1'b1;
                pending_valid <= 1'b0;
            end
        end
    end
endmodule
