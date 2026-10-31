`timescale 1ns/1ps

module tb_task10_spi_slave_rx;
    reg clk = 1'b0;
    reg rst_p = 1'b1;
    reg spi_sck = 1'b0;
    reg spi_mosi = 1'b0;
    reg spi_cs_n = 1'b1;
    wire uart_txd;
    wire [7:0] led;

    integer errors = 0;
    integer rx_count = 0;
    reg [7:0] expected_rx [0:3];

    always #5 clk = ~clk;

    task automatic fail(input [8*80-1:0] message);
        begin
            errors = errors + 1;
            $display("FAIL: %s at %0t", message, $time);
        end
    endtask

    task automatic spi_bit(input bit value);
        begin
            spi_mosi = value;
            #100;
            spi_sck = 1'b1;
            #100;
            spi_sck = 1'b0;
            #100;
        end
    endtask

    task automatic send_byte(input [7:0] value);
        integer i;
        begin
            spi_sck = 1'b0;
            spi_cs_n = 1'b0;
            #100;
            for (i = 7; i >= 0; i = i - 1)
                spi_bit(value[i]);
            spi_cs_n = 1'b1;
            #200;
        end
    endtask

    task automatic check_uart_byte(input [7:0] expected);
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
            if (received !== expected) begin
                $display("UART expected=%02X actual=%02X", expected, received);
                fail("UART byte mismatch");
            end
        end
    endtask

    always @(posedge clk) begin
        if (!rst_p && dut.rx_valid) begin
            if (rx_count > 3)
                fail("unexpected extra received byte");
            else if (dut.rx_data !== expected_rx[rx_count]) begin
                $display("SPI expected=%02X actual=%02X",
                         expected_rx[rx_count], dut.rx_data);
                fail("SPI receive byte mismatch");
            end
            rx_count = rx_count + 1;
        end
    end

    task automatic send_and_check(input [7:0] value);
        begin
            fork
                send_byte(value);
                check_uart_byte(value);
            join
            if (led !== value)
                fail("LED debug byte did not match the latest byte");
        end
    endtask

    task automatic send_partial_frame;
        integer i;
        begin
            spi_cs_n = 1'b0;
            #100;
            for (i = 7; i >= 4; i = i - 1)
                spi_bit((8'hF0 >> i) & 1'b1);
            spi_cs_n = 1'b1;
            #300;
        end
    endtask

    task10_mcu_fpga_rx_top #(
        .CLK_HZ(1_000),
        .UART_BAUD(100)
    ) dut (
        .clk_50mhz(clk),
        .rst_p(rst_p),
        .spi_sck(spi_sck),
        .spi_mosi(spi_mosi),
        .spi_cs_n(spi_cs_n),
        .uart_txd(uart_txd),
        .led(led)
    );

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, tb_task10_spi_slave_rx);
        expected_rx[0] = 8'h55;
        expected_rx[1] = 8'hA5;
        expected_rx[2] = 8'h00;
        expected_rx[3] = 8'hFF;

        repeat (5) @(posedge clk);
        rst_p = 1'b0;
        repeat (5) @(posedge clk);

        /* Clocks while CS is HIGH must be ignored. */
        repeat (3) begin
            #100 spi_sck = 1'b1;
            #100 spi_sck = 1'b0;
        end
        #200;
        if (rx_count != 0)
            fail("receiver accepted data while CS was HIGH");

        send_partial_frame();
        if (rx_count != 0)
            fail("partial frame was not aborted by CS HIGH");

        send_and_check(8'h55);
        send_and_check(8'hA5);
        send_and_check(8'h00);
        send_and_check(8'hFF);

        if (rx_count != 4)
            fail("did not receive exactly four complete frames");

        if (errors == 0)
            $display("PASS: Task 10 Mode-0 slave, frame abort, byte order, LED and UART checks passed");
        else begin
            $display("FAIL: Task 10 completed with %0d error(s)", errors);
            $fatal(1);
        end
        #100;
        $finish;
    end
endmodule
