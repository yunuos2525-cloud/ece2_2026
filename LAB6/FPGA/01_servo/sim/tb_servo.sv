`timescale 1ns/1ps
module tb_servo;
    localparam integer TEST_CLK_HZ = 100_000;
    localparam integer FRAME_CYCLES = TEST_CLK_HZ / 50;
    reg clk_50mhz = 0;
    reg rst_p = 1;
    reg left_pulse = 0;
    reg right_pulse = 0;
    wire servo;
    integer i;
    integer high_count;
    integer frame_count;

    always #5 clk_50mhz = ~clk_50mhz;

    servo_ctrl #(.CLK_HZ(TEST_CLK_HZ)) dut(
        .clk_50mhz(clk_50mhz), .rst_p(rst_p),
        .left_pulse(left_pulse), .right_pulse(right_pulse),
        .servo(servo)
    );

    task step;
        begin @(posedge clk_50mhz); #1; end
    endtask

    task press(input bit left_button, input bit right_button);
        begin
            @(negedge clk_50mhz);
            left_pulse = left_button;
            right_pulse = right_button;
            step;
            @(negedge clk_50mhz);
            left_pulse = 0;
            right_pulse = 0;
        end
    endtask

    task check_frame(input integer expected_high);
        begin
            @(posedge servo);
            #1;
            high_count = 0;
            frame_count = 0;
            for (i = 0; i < FRAME_CYCLES; i = i + 1) begin
                if (servo)
                    high_count = high_count + 1;
                frame_count = frame_count + 1;
                step;
            end
            if (frame_count != FRAME_CYCLES)
                $fatal(1, "servo frame expected=%0d got=%0d", FRAME_CYCLES, frame_count);
            if (high_count != expected_high)
                $fatal(1, "servo width expected=%0d got=%0d", expected_high, high_count);
        end
    endtask

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, tb_servo);
        step;
        if (dut.u_position.pulse_us !== 1500 || servo !== 0)
            $fatal(1, "servo reset");
        @(negedge clk_50mhz);
        rst_p = 0;
        check_frame(150);

        repeat (8) press(1, 0);
        if (dut.u_position.pulse_us !== 1000)
            $fatal(1, "servo left limit got=%0d", dut.u_position.pulse_us);
        check_frame(100);

        repeat (15) press(0, 1);
        if (dut.u_position.pulse_us !== 2000)
            $fatal(1, "servo right limit got=%0d", dut.u_position.pulse_us);
        check_frame(200);

        press(1, 1);
        if (dut.u_position.pulse_us !== 2000)
            $fatal(1, "servo simultaneous input changed position");
        @(negedge clk_50mhz);
        rst_p = 1;
        step;
        if (dut.u_position.pulse_us !== 1500 || servo !== 0)
            $fatal(1, "servo reset after running");
        $display("LAB6_SERVO_PASS frame=%0d widths=100/150/200 limits=1000..2000", FRAME_CYCLES);
        $finish;
    end

    initial begin
        #300000;
        $fatal(1, "timeout");
    end
endmodule

