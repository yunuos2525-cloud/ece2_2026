`timescale 1ns/1ps

module tb_task12_fpga_spi_link;
    reg clk = 1'b0;
    reg rst_p = 1'b1;
    wire spi_sck;
    wire spi_mosi;
    wire spi_cs_n;
    wire uart_txd;
    wire [7:0] tx_led;
    wire [7:0] rx_led;

    integer errors = 0;
    integer rx_count = 0;
    reg [7:0] expected [0:3];

    always #5 clk = ~clk;

    task automatic fail(input [8*80-1:0] message);
        begin
            errors = errors + 1;
            $display("FAIL: %s at %0t", message, $time);
        end
    endtask

    always @(posedge clk) begin
        if (!rst_p && receiver.rx_valid) begin
            if (rx_count > 3)
                fail("receiver produced an extra byte");
            else if (receiver.rx_data !== expected[rx_count]) begin
                $display("LINK expected=%02X actual=%02X",
                         expected[rx_count], receiver.rx_data);
                fail("FPGA-to-FPGA received byte mismatch");
            end
            if (rx_count <= 3 && tx_led !== expected[rx_count])
                fail("transmitter debug byte did not match the active frame");
            rx_count = rx_count + 1;
        end
    end

    task automatic check_uart_byte(input [7:0] expected_byte);
        integer i;
        reg [7:0] received;
        begin
            received = 8'h00;
            @(negedge uart_txd);
            #50;
            if (uart_txd !== 1'b0)
                fail("UART start bit was not LOW");
            for (i = 0; i < 8; i = i + 1) begin
                #100;
                received[i] = uart_txd;
            end
            #100;
            if (uart_txd !== 1'b1)
                fail("UART stop bit was not HIGH");
            if (received !== expected_byte) begin
                $display("UART expected=%02X actual=%02X", expected_byte, received);
                fail("receiver UART byte mismatch");
            end
        end
    endtask

    task11_fpga_mcu_tx_top #(
        .CLK_HZ(1_000),
        .SCK_HZ(100),
        .INTERVAL_CYCLES(120)
    ) transmitter (
        .clk_50mhz(clk),
        .rst_p(rst_p),
        .spi_sck(spi_sck),
        .spi_mosi(spi_mosi),
        .spi_cs_n(spi_cs_n),
        .led(tx_led)
    );

    task10_mcu_fpga_rx_top #(
        .CLK_HZ(1_000),
        .UART_BAUD(100)
    ) receiver (
        .clk_50mhz(clk),
        .rst_p(rst_p),
        .spi_sck(spi_sck),
        .spi_mosi(spi_mosi),
        .spi_cs_n(spi_cs_n),
        .uart_txd(uart_txd),
        .led(rx_led)
    );

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, tb_task12_fpga_spi_link);
        expected[0] = 8'h55;
        expected[1] = 8'hA5;
        expected[2] = 8'h00;
        expected[3] = 8'hFF;

        repeat (5) @(posedge clk);
        rst_p = 1'b0;
        repeat (5) @(posedge clk);

        check_uart_byte(expected[0]);
        check_uart_byte(expected[1]);
        check_uart_byte(expected[2]);
        check_uart_byte(expected[3]);

        if (rx_count != 4)
            fail("link did not produce exactly four checked bytes");
        if (rx_led !== 8'hFF)
            fail("receiver LED did not retain the final received byte");

        if (errors == 0)
            $display("PASS: Task 12 reused Task 10/11 RTL and passed SPI plus receiver UART checks");
        else begin
            $display("FAIL: Task 12 completed with %0d error(s)", errors);
            $fatal(1);
        end
        $finish;
    end

    initial begin
        #100_000;
        $fatal(1, "FAIL: Task 12 timeout");
    end
endmodule
