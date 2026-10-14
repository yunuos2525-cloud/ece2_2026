`timescale 1ns/1ps

module tb_piano;
    localparam integer CLK_HZ = 10_000;
    logic clk_50mhz = 1'b0;
    logic rst_p = 1'b1;
    logic [7:0] key = 8'h00;
    wire piezo;

    piano #(.CLK_HZ(CLK_HZ)) dut (.*);

    always #5 clk_50mhz = ~clk_50mhz;

    task automatic check_note(input logic [7:0] test_key,
                              input integer expected_hz);
        integer half_period_clocks;
        integer i;
        begin
            half_period_clocks = CLK_HZ / (2 * expected_hz);
            @(negedge clk_50mhz);
            key = test_key;
            @(posedge clk_50mhz);
            #1;
            if (piezo !== 1'b0)
                $fatal(1, "tone did not reset for key %h", test_key);

            for (i = 1; i <= half_period_clocks; i = i + 1) begin
                @(posedge clk_50mhz);
                #1;
                if (i < half_period_clocks && piezo !== 1'b0)
                    $fatal(1, "tone toggled early for key %h at clock %0d", test_key, i);
                if (i == half_period_clocks && piezo !== 1'b1)
                    $fatal(1, "wrong half-period for key %h: expected %0d clocks",
                           test_key, half_period_clocks);
            end
        end
    endtask

    task automatic check_silence(input logic [7:0] test_key);
        integer i;
        begin
            @(negedge clk_50mhz);
            key = test_key;
            for (i = 0; i < 12; i = i + 1) begin
                @(posedge clk_50mhz);
                #1;
                if (piezo !== 1'b0)
                    $fatal(1, "expected silence for key pattern %h", test_key);
            end
        end
    endtask

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, tb_piano);

        repeat (3) @(posedge clk_50mhz);
        rst_p = 1'b0;
        check_note(8'h80, 262);
        check_note(8'h40, 294);
        check_note(8'h20, 330);
        check_note(8'h10, 349);
        check_note(8'h08, 392);
        check_note(8'h04, 440);
        check_note(8'h02, 494);
        check_note(8'h01, 523);
        check_silence(8'h00);
        check_silence(8'h03);

        @(negedge clk_50mhz);
        key = 8'h80;
        repeat (5) @(posedge clk_50mhz);
        rst_p = 1'b1;
        @(posedge clk_50mhz);
        #1;
        if (piezo !== 1'b0)
            $fatal(1, "reset did not silence piezo");

        $display("PASS piano: all 8 tones, silence, multiple keys, reset");
        $finish;
    end

    initial begin
        #100000;
        $fatal(1, "timeout");
    end
endmodule
