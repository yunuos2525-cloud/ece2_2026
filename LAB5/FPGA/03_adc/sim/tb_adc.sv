`timescale 1ns/1ps

module tb_adc;
    localparam integer HALF_CYCLES = 2;
    logic clk_50mhz = 1'b0;
    logic rst_p = 1'b1;
    logic [2:0] add_sel = 3'd2;
    logic adc_dout = 1'b0;
    wire adc_sclk;
    wire adc_ncs;
    wire adc_din;
    wire [11:0] sample;
    wire data_valid;
    wire [7:0] led_out;

    adc #(.HALF_CYCLES(HALF_CYCLES)) dut (.*);
    always #5 clk_50mhz = ~clk_50mhz;

    function automatic [15:0] expected_command(input logic [2:0] channel);
        expected_command = {3'b101, channel, 2'b11, 1'b0, 3'b111, 4'b0000};
    endfunction

    task automatic run_frame(input logic [2:0] channel,
                             input logic [15:0] reply);
        reg [15:0] command;
        integer bit_number;
        integer falling_edges;
        integer rising_edges;
        begin
            command = expected_command(channel);
            falling_edges = 0;
            rising_edges = 0;
            @(negedge adc_ncs);
            for (bit_number = 15; bit_number >= 0; bit_number = bit_number - 1) begin
                @(negedge adc_sclk);
                #1;
                falling_edges = falling_edges + 1;
                if (adc_ncs !== 1'b0)
                    $fatal(1, "CS inactive during frame");
                if (adc_din !== command[bit_number])
                    $fatal(1, "MOSI mismatch channel=%0d bit=%0d", channel, bit_number);
                adc_dout = reply[bit_number];

                @(posedge adc_sclk);
                #1;
                rising_edges = rising_edges + 1;
                if (bit_number != 0 && adc_ncs !== 1'b0)
                    $fatal(1, "short serial frame");
            end

            if (falling_edges != 16 || rising_edges != 16 || adc_ncs !== 1'b1)
                $fatal(1, "frame was not exactly 16 bits");

            @(posedge data_valid);
            #1;
            if (sample !== reply[11:0])
                $fatal(1, "sample mismatch channel=%0d expected=%h actual=%h",
                       channel, reply[11:0], sample);
            if (led_out !== reply[11:4])
                $fatal(1, "LED output mismatch channel=%0d", channel);
            @(posedge clk_50mhz);
            #1;
            if (data_valid !== 1'b0)
                $fatal(1, "data_valid was not a one-cycle pulse");
        end
    endtask

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, tb_adc);

        repeat (3) @(posedge clk_50mhz);
        #1;
        if (adc_sclk !== 1'b1 || adc_ncs !== 1'b1 || sample !== 12'd0 ||
            data_valid !== 1'b0 || led_out !== 8'd0)
            $fatal(1, "reset state mismatch");

        @(negedge clk_50mhz);
        rst_p = 1'b0;
        add_sel = 3'd2;
        run_frame(3'd2, 16'hA5C3);

        @(negedge clk_50mhz);
        add_sel = 3'd5;
        run_frame(3'd5, 16'h35A6);

        @(negedge clk_50mhz);
        add_sel = 3'd7;
        run_frame(3'd7, 16'hF27B);

        @(negedge clk_50mhz);
        rst_p = 1'b1;
        @(posedge clk_50mhz);
        #1;
        if (adc_sclk !== 1'b1 || adc_ncs !== 1'b1 || sample !== 12'd0 ||
            data_valid !== 1'b0 || led_out !== 8'd0)
            $fatal(1, "reset-after-data state mismatch");

        $display("PASS ADC: 3 serial frames, command bits, sample, reset");
        $finish;
    end

    initial begin
        #100000;
        $fatal(1, "timeout");
    end
endmodule
