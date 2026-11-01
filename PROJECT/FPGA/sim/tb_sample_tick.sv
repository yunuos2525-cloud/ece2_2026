`timescale 1ns/1ps

module tb_sample_tick;
    localparam integer TEST_DIVISOR = 8;
    reg clk_50mhz = 1'b0;
    reg rst_p = 1'b1;
    wire sample_tick;
    integer i;

    always #10 clk_50mhz = ~clk_50mhz;

    sample_tick #(
        .CLOCKS_PER_SAMPLE(TEST_DIVISOR)
    ) dut (
        .clk_50mhz(clk_50mhz),
        .rst_p(rst_p),
        .sample_tick(sample_tick)
    );

    task automatic expect_tick_after_divisor;
        begin
            for (i = 1; i <= TEST_DIVISOR; i = i + 1) begin
                @(posedge clk_50mhz);
                #1;
                if (i < TEST_DIVISOR && sample_tick !== 1'b0)
                    $fatal(1, "early tick at interval clock %0d", i);
            end
            if (sample_tick !== 1'b1)
                $fatal(1, "missing tick after %0d clocks", TEST_DIVISOR);
            @(posedge clk_50mhz);
            #1;
            if (sample_tick !== 1'b0)
                $fatal(1, "tick width exceeded one clock");
        end
    endtask

    initial begin
        repeat (3) @(posedge clk_50mhz);
        #1;
        if (sample_tick !== 1'b0)
            $fatal(1, "tick active during reset");

        @(negedge clk_50mhz);
        rst_p = 1'b0;
        expect_tick_after_divisor();

        // One clock was consumed while checking pulse width. The next tick is
        // therefore seven clocks away for TEST_DIVISOR=8.
        for (i = 2; i <= TEST_DIVISOR; i = i + 1) begin
            @(posedge clk_50mhz);
            #1;
            if (i < TEST_DIVISOR && sample_tick !== 1'b0)
                $fatal(1, "early repeated tick");
        end
        if (sample_tick !== 1'b1)
            $fatal(1, "missing repeated tick");

        rst_p = 1'b1;
        @(posedge clk_50mhz);
        #1;
        if (sample_tick !== 1'b0)
            $fatal(1, "tick not cleared by reset");

        $display("PASS SAMPLE_TICK: reset, interval, one-clock pulse, repeat");
        $finish;
    end
endmodule
