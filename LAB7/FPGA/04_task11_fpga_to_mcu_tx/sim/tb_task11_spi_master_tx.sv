`timescale 1ns/1ps

module tb_task11_spi_master_tx;
    reg clk = 1'b0;
    reg rst_p = 1'b1;
    wire spi_sck;
    wire spi_mosi;
    wire spi_cs_n;
    wire [7:0] led;

    integer errors = 0;
    reg [7:0] expected [0:3];
    realtime previous_rise;
    realtime previous_frame_start = 0.0;

    always #5 clk = ~clk;

    task automatic fail(input [8*80-1:0] message);
        begin
            errors = errors + 1;
            $display("FAIL: %s at %0t", message, $time);
        end
    endtask

    task automatic check_frame(input [7:0] expected_byte);
        integer i;
        reg [7:0] received;
        realtime period;
        begin
            received = 8'h00;
            @(negedge spi_cs_n);
            if (previous_frame_start != 0.0 &&
                ($realtime - previous_frame_start < 1199.0 ||
                 $realtime - previous_frame_start > 1201.0))
                fail("frame start interval did not match INTERVAL_CYCLES");
            previous_frame_start = $realtime;
            if (spi_sck !== 1'b0)
                fail("SCK was not LOW when CS became active");
            if (spi_mosi !== expected_byte[7])
                fail("MSB was not prepared before the first rising edge");

            previous_rise = 0.0;
            for (i = 7; i >= 0; i = i - 1) begin
                @(posedge spi_sck);
                #1;
                received[i] = spi_mosi;
                if (spi_cs_n !== 1'b0)
                    fail("CS became inactive before eight rising edges");
                if (previous_rise != 0.0) begin
                    period = $realtime - previous_rise;
                    if (period < 99.0 || period > 101.0)
                        fail("unexpected SCK period");
                end
                previous_rise = $realtime;
            end
            @(posedge spi_cs_n);
            if (spi_sck !== 1'b0)
                fail("SCK did not return to idle LOW");
            if (received !== expected_byte) begin
                $display("SPI expected=%02X actual=%02X", expected_byte, received);
                fail("MSB-first frame mismatch");
            end
            if (led !== expected_byte)
                fail("LED debug byte did not identify the transmitted byte");
        end
    endtask

    task11_fpga_mcu_tx_top #(
        .CLK_HZ(1_000),
        .SCK_HZ(100),
        .INTERVAL_CYCLES(120)
    ) dut (
        .clk_50mhz(clk),
        .rst_p(rst_p),
        .spi_sck(spi_sck),
        .spi_mosi(spi_mosi),
        .spi_cs_n(spi_cs_n),
        .led(led)
    );

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, tb_task11_spi_master_tx);
        expected[0] = 8'h55;
        expected[1] = 8'hA5;
        expected[2] = 8'h00;
        expected[3] = 8'hFF;

        repeat (5) @(posedge clk);
        rst_p = 1'b0;
        repeat (5) @(posedge clk);

        check_frame(expected[0]);
        check_frame(expected[1]);
        check_frame(expected[2]);
        check_frame(expected[3]);

        if (errors == 0)
            $display("PASS: Task 11 Mode-0 master timing, interval, <=1 MHz ratio and byte sequence checks passed");
        else begin
            $display("FAIL: Task 11 completed with %0d error(s)", errors);
            $fatal(1);
        end
        #100;
        $finish;
    end

    initial begin
        #100_000;
        $fatal(1, "FAIL: Task 11 timeout");
    end
endmodule
