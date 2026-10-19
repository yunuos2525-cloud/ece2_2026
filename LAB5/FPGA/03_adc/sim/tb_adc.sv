`timescale 1ns/1ps

module tb_adc;
    // Faster than the board setting (25), but still uses a 50 MHz clock.
    localparam integer HALF_CYCLES = 4;

    logic clk_50mhz = 1'b0;
    logic rst_p = 1'b1;
    logic [2:0] add_sel = 3'd2;
    logic adc_dout = 1'b0;

    wire adc_sclk, adc_ncs, adc_din;
    wire [11:0] sample;
    wire data_valid;
    wire [7:0] led_out;

    adc #(.HALF_CYCLES(HALF_CYCLES)) dut (.*);
    always #10 clk_50mhz = ~clk_50mhz; // 50 MHz

    // Independent expected control word for the revised RANGE=0 design.
    function automatic [15:0] expected_command(input logic [2:0] channel);
        expected_command = {3'b101, channel, 2'b11, 1'b0, 3'b101, 4'b0000};
    endfunction

    // AD7908 reply format: 0 + channel ID (3) + sample (8) + 0000.
    function automatic [15:0] make_reply(
        input logic [2:0] channel,
        input logic [7:0] value
    );
        make_reply = {1'b0, channel, value, 4'b0000};
    endfunction

    // A real ADC returns data for the channel configured in the preceding
    // frame. The caller supplies that reply independently of the command.
    integer frame_count = 0;
    time last_cs_rise = 0;
    bit completed_a_frame = 0;

    always @(posedge adc_ncs) begin
        if (!rst_p) begin
            last_cs_rise = $time;
            completed_a_frame = 1;
        end
    end

    always @(negedge adc_ncs) begin
        if (!rst_p && completed_a_frame && ($time - last_cs_rise < 50))
            $fatal(1, "tQUIET too short: %0t ns", $time - last_cs_rise);
    end

    task automatic run_frame(
        input logic [2:0] tx_channel,
        input logic [15:0] adc_reply,
        input bit expect_valid,
        input logic [11:0] expected_after
    );
        logic [15:0] command;
        integer bit_number;
        integer falling_edges;
        integer rising_edges;
        begin
            add_sel = tx_channel;
            command = expected_command(tx_channel);
            falling_edges = 0;
            rising_edges = 0;

            @(negedge adc_ncs);
            // Leading zero is available as soon as CS goes LOW.
            adc_dout = adc_reply[15];

            for (bit_number = 15; bit_number >= 0; bit_number = bit_number - 1) begin
                @(negedge adc_sclk);
                #1;
                falling_edges = falling_edges + 1;
                if (adc_ncs !== 1'b0)
                    $fatal(1, "CS inactive during frame %0d", frame_count + 1);
                if (adc_din !== command[bit_number])
                    $fatal(1, "MOSI mismatch frame=%0d channel=%0d bit=%0d expected=%b actual=%b",
                           frame_count + 1, tx_channel, bit_number,
                           command[bit_number], adc_din);

                // The FPGA sampled the current DOUT bit on the falling edge;
                // the ADC model now exposes the NEXT bit for the next edge.
                if (bit_number > 0)
                    adc_dout = adc_reply[bit_number - 1];

                @(posedge adc_sclk);
                #1;
                rising_edges = rising_edges + 1;
                if (bit_number != 0 && adc_ncs !== 1'b0)
                    $fatal(1, "CS deasserted early in frame %0d", frame_count + 1);
            end

            frame_count = frame_count + 1;
            if (falling_edges != 16 || rising_edges != 16 || adc_ncs !== 1'b1)
                $fatal(1, "frame %0d not exactly 16 SCLK cycles", frame_count);

            // done goes HIGH at the final SCLK rising edge. The wrapper
            // registers sample/data_valid on the following 50 MHz clock.
            @(posedge clk_50mhz);
            #1;
            if (data_valid !== expect_valid)
                $fatal(1, "data_valid mismatch frame=%0d expected=%b actual=%b",
                       frame_count, expect_valid, data_valid);
            if (sample !== expected_after)
                $fatal(1, "sample mismatch frame=%0d expected=%h actual=%h",
                       frame_count, expected_after, sample);
            if (led_out !== expected_after[11:4])
                $fatal(1, "LED mismatch frame=%0d expected=%h actual=%h",
                       frame_count, expected_after[11:4], led_out);

            @(posedge clk_50mhz);
            #1;
            if (data_valid !== 1'b0)
                $fatal(1, "data_valid not a one-cycle pulse, frame=%0d", frame_count);
        end
    endtask

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, tb_adc);

        repeat (3) @(posedge clk_50mhz);
        #1;
        if (adc_sclk !== 1'b1 || adc_ncs !== 1'b1 ||
            sample !== 12'h000 || data_valid !== 1'b0 || led_out !== 8'h00)
            $fatal(1, "power-up reset mismatch");

        @(negedge clk_50mhz);
        rst_p = 1'b0;

        // Frame 1: power-up dummy; no valid sample should be reported.
        run_frame(3'd2, make_reply(3'd0, 8'h00), 1'b0, 12'h000);
        // Frame 2: reads channel 2 configured in frame 1.
        run_frame(3'd2, make_reply(3'd2, 8'h32), 1'b1, 12'h320);
        // Frame 3: command switches to channel 5, but response is still CH2.
        run_frame(3'd5, make_reply(3'd2, 8'h32), 1'b1, 12'h320);
        // Frame 4: response now reflects CH5.
        run_frame(3'd5, make_reply(3'd5, 8'h65), 1'b1, 12'h650);
        // Frame 5: command switches to channel 7, response is still CH5.
        run_frame(3'd7, make_reply(3'd5, 8'h65), 1'b1, 12'h650);
        // Frame 6: response now reflects CH7.
        run_frame(3'd7, make_reply(3'd7, 8'hA7), 1'b1, 12'hA70);

        // Reset after valid conversions.
        @(negedge clk_50mhz);
        rst_p = 1'b1;
        @(posedge clk_50mhz);
        #1;
        if (adc_sclk !== 1'b1 || adc_ncs !== 1'b1 ||
            sample !== 12'h000 || data_valid !== 1'b0 || led_out !== 8'h00)
            $fatal(1, "reset-after-data mismatch");

        // Reset must re-arm the dummy-frame suppression.
        @(negedge clk_50mhz);
        rst_p = 1'b0;
        run_frame(3'd2, make_reply(3'd0, 8'h00), 1'b0, 12'h000);
        run_frame(3'd2, make_reply(3'd2, 8'h32), 1'b1, 12'h320);

        $display("PASS ADC: 8 frames, CH2->5->7, MOSI, 16-bit frames, tQUIET, dummy, sample, LED, valid pulse, reset");
        $finish;
    end

    initial begin
        #100000;
        $fatal(1, "timeout");
    end
endmodule
