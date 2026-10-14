`timescale 1ns/1ps

module tb_traffic;
    localparam integer CLK_HZ = 4;
    logic clk_50mhz = 1'b0;
    logic rst_p = 1'b1;
    logic flicker = 1'b0;
    wire [3:0] led_red;
    wire [3:0] led_yellow;
    wire [3:0] led_green;
    wire [3:0] led_left;
    wire [3:0] led_walk_red;
    wire [3:0] led_walk_green;

    traffic #(.CLK_HZ(CLK_HZ)) dut (.*);
    always #5 clk_50mhz = ~clk_50mhz;

    task automatic check_normal(input integer expected_direction,
                                input integer expected_phase);
        reg [3:0] mask;
        reg [3:0] exp_red;
        reg [3:0] exp_yellow;
        reg [3:0] exp_green;
        reg [3:0] exp_walk_red;
        reg [3:0] exp_walk_green;
        begin
            mask = 4'b0001 << expected_direction;
            exp_red = 4'b1111 & ~mask;
            exp_yellow = (expected_phase >= 11) ? mask : 4'b0000;
            exp_green = (expected_phase <= 10) ? mask : 4'b0000;
            exp_walk_red = 4'b1111;
            exp_walk_green = 4'b0000;
            if (expected_phase <= 3) begin
                exp_walk_red = exp_walk_red & ~mask;
                exp_walk_green = mask;
            end else if (expected_phase <= 10) begin
                exp_walk_red = exp_walk_red & ~mask;
                exp_walk_green = dut.blink ? mask : 4'b0000;
            end

            if (dut.direction !== expected_direction[1:0] ||
                dut.phase !== expected_phase[3:0])
                $fatal(1, "sequence mismatch: got direction=%0d phase=%0d",
                       dut.direction, dut.phase);
            if (led_red !== exp_red || led_yellow !== exp_yellow ||
                led_green !== exp_green || led_walk_red !== exp_walk_red ||
                led_walk_green !== exp_walk_green)
                $fatal(1, "light mismatch at direction=%0d phase=%0d blink=%b",
                       expected_direction, expected_phase, dut.blink);
            if (led_left !== led_green)
                $fatal(1, "left output differs from green output");
        end
    endtask

    integer direction_index;
    integer phase_index;
    integer clock_index;

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, tb_traffic);

        repeat (3) @(posedge clk_50mhz);
        @(negedge clk_50mhz);
        rst_p = 1'b0;

        for (direction_index = 0; direction_index < 4; direction_index = direction_index + 1) begin
            for (phase_index = 0; phase_index < 13; phase_index = phase_index + 1) begin
                for (clock_index = 0; clock_index < CLK_HZ; clock_index = clock_index + 1) begin
                    #1;
                    check_normal(direction_index, phase_index);
                    @(posedge clk_50mhz);
                    @(negedge clk_50mhz);
                end
            end
        end

        if (dut.direction !== 2'd0 || dut.phase !== 4'd0)
            $fatal(1, "full cycle did not wrap to initial state");

        flicker = 1'b1;
        for (clock_index = 0; clock_index < 8; clock_index = clock_index + 1) begin
            #1;
            if (led_red !== 4'b0000 || led_green !== 4'b0000 ||
                led_left !== 4'b0000 || led_walk_green !== 4'b0000 ||
                led_yellow !== {4{dut.blink}} ||
                led_walk_red !== {4{dut.blink}})
                $fatal(1, "flicker output mismatch");
            @(posedge clk_50mhz);
            @(negedge clk_50mhz);
        end

        flicker = 1'b0;
        #1;
        if (dut.direction !== 2'd0 || dut.phase !== 4'd0)
            $fatal(1, "flicker did not hold initial sequence state");

        rst_p = 1'b1;
        @(posedge clk_50mhz);
        @(negedge clk_50mhz);
        if (dut.direction !== 2'd0 || dut.phase !== 4'd0)
            $fatal(1, "reset did not restore initial state");
        if (led_left !== led_green)
            $fatal(1, "left output differs from green after reset");

        $display("PASS traffic: full cycle, pedestrian blink, flicker, reset");
        $finish;
    end

    initial begin
        #100000;
        $fatal(1, "timeout");
    end
endmodule
