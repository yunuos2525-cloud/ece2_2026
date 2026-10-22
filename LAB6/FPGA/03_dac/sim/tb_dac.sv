`timescale 1ns/1ps
module tb_dac;
    reg clk_50mhz = 0;
    reg rst_p = 1;
    reg add_sel = 0;
    wire dac_csn;
    wire dac_ldacn;
    wire dac_wen;
    wire dac_a_b;
    wire [7:0] dac_d;
    wire [7:0] led_out;
    integer writes = 0;
    time last_fall;
    time last_data_change;
    reg [7:0] held_data;
    reg held_channel;

    always #5 clk_50mhz = ~clk_50mhz;

    dac #(.UPDATE_CYCLES(4)) dut(
        .clk_50mhz(clk_50mhz), .rst_p(rst_p), .add_sel(add_sel),
        .dac_csn(dac_csn), .dac_ldacn(dac_ldacn), .dac_wen(dac_wen),
        .dac_a_b(dac_a_b), .dac_d(dac_d), .led_out(led_out)
    );

    always @(dac_d or dac_a_b)
        last_data_change = $time;

    always @(negedge dac_wen) begin
        if ($time - last_data_change < 10)
            $fatal(1, "DAC setup time less than one clock");
        held_data = dac_d;
        held_channel = dac_a_b;
        last_fall = $time;
    end

    always @(posedge dac_wen) begin
        if (!rst_p) begin
            if ($time - last_fall != 10)
                $fatal(1, "DAC WE pulse width expected=10ns got=%0t", $time - last_fall);
            if (dac_d !== held_data || dac_a_b !== held_channel)
                $fatal(1, "DAC data/channel hold failure");
            if (dac_d !== (writes % 256) || led_out !== dac_d)
                $fatal(1, "DAC ramp write=%0d data=%h", writes, dac_d);
            if (dac_csn !== 0 || dac_ldacn !== 0 || dac_a_b !== add_sel)
                $fatal(1, "DAC controls or channel");
            writes = writes + 1;
        end
    end

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, tb_dac);
        repeat (2) @(negedge clk_50mhz);
        rst_p = 0;
        wait (writes == 130);
        @(negedge clk_50mhz);
        add_sel = 1;
        wait (writes == 260);
        @(negedge clk_50mhz);
        rst_p = 1;
        @(posedge clk_50mhz);
        #1;
        if (dac_wen !== 1 || dac_d !== 0)
            $fatal(1, "DAC reset");
        $display("LAB6_DAC_PASS writes=%0d wrap=255_to_0 setup_hold channel", writes);
        $finish;
    end

    initial begin
        #200000;
        $fatal(1, "timeout");
    end
endmodule

