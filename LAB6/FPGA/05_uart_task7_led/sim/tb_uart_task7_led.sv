`timescale 1ns/1ps
module tb_uart_task7_led;
    localparam integer DIV = 8;
    reg clk_50mhz = 0;
    reg rst_p = 1;
    reg uart_rxd = 1;
    wire uart_txd;
    wire led;
    integer i;
    integer checks = 0;
    reg [7:0] observed;

    always #10 clk_50mhz = ~clk_50mhz;
    lab6_uart_led #(.CLK_HZ(800), .BAUD(100)) dut(
        .clk_50mhz(clk_50mhz), .rst_p(rst_p), .uart_rxd(uart_rxd),
        .uart_txd(uart_txd), .led(led)
    );

    task send_byte(input [7:0] value);
        begin
            uart_rxd = 0;
            repeat (DIV) @(posedge clk_50mhz);
            for (i = 0; i < 8; i = i + 1) begin
                uart_rxd = value[i];
                repeat (DIV) @(posedge clk_50mhz);
            end
            uart_rxd = 1;
            repeat (DIV) @(posedge clk_50mhz);
        end
    endtask

    task receive_byte(input [7:0] expected, input bit expected_led);
        begin
            observed = 0;
            @(negedge uart_txd);
            repeat (DIV + DIV/2) @(posedge clk_50mhz);
            for (i = 0; i < 8; i = i + 1) begin
                observed[i] = uart_txd;
                repeat (DIV) @(posedge clk_50mhz);
            end
            if (observed !== expected)
                $fatal(1, "UART command echo=%h expected=%h", observed, expected);
            if (led !== expected_led)
                $fatal(1, "UART LED command=%h led=%b expected=%b", expected, led, expected_led);
            checks = checks + 1;
            repeat (DIV) @(posedge clk_50mhz);
        end
    endtask

    task command(input [7:0] value, input bit expected_led);
        begin
            fork send_byte(value); receive_byte(value, expected_led); join
        end
    endtask

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, tb_uart_task7_led);
        repeat (4) @(posedge clk_50mhz);
        rst_p = 0;
        if (led !== 0)
            $fatal(1, "UART LED reset");
        command(8'h30, 0);
        command(8'h31, 1);
        command(8'h31, 1);
        command(8'h32, 0);
        command(8'h32, 1);
        command(8'h58, 1);
        command(8'h30, 0);
        command(8'h32, 1);
        @(negedge clk_50mhz);
        rst_p = 1;
        @(posedge clk_50mhz);
        #1;
        if (led !== 0)
            $fatal(1, "UART LED reset after commands");
        if (dut.rx_framing_error)
            $fatal(1, "unexpected framing error");
        $display("LAB6_UART_TASK7_PASS checks=%0d commands=0/1/2/other repeat reset", checks);
        $finish;
    end

    initial begin
        #100000;
        $fatal(1, "timeout");
    end
endmodule

