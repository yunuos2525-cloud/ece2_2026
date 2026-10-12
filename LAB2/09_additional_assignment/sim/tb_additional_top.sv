`timescale 1ns/1ps

module tb_additional_top;

    reg clk = 0;
    reg key_0 = 0;
    reg key_1 = 0;
    reg key_2 = 0;
    reg key_3 = 0;
    reg key_4 = 0;
    reg key_5 = 0;
    reg key_6 = 0;
    reg key_7 = 0;
    reg key_8 = 0;
    reg key_9 = 0;
    reg key_star = 0;
    reg key_hash = 0;

    wire [7:0] seg_data;
    wire bdio0;
    wire bdio2;

    integer checks = 0;
    integer i;

    localparam integer TEST_CLK_FREQ = 100;
    localparam integer TEST_BAUD     = 10;
    localparam integer CLKS_PER_BIT  = TEST_CLK_FREQ / TEST_BAUD;

    additional_top #(
        .CLK_FREQ(TEST_CLK_FREQ),
        .UART_BAUD(TEST_BAUD)
    ) dut (
        .clk(clk),
        .key_0(key_0),
        .key_1(key_1),
        .key_2(key_2),
        .key_3(key_3),
        .key_4(key_4),
        .key_5(key_5),
        .key_6(key_6),
        .key_7(key_7),
        .key_8(key_8),
        .key_9(key_9),
        .key_star(key_star),
        .key_hash(key_hash),
        .seg_data(seg_data),
        .bdio0(bdio0),
        .bdio2(bdio2)
    );

    always #5 clk = ~clk;

    task step;
    begin
        @(posedge clk);
        #1;
    end
    endtask

    task check(
        input condition,
        input [8*120-1:0] description
    );
    begin
        checks = checks + 1;
        if (condition !== 1'b1) begin
            $display("ADDITIONAL_FAIL: %0s time=%0t", description, $time);
            $fatal(1, "check failed");
        end
    end
    endtask

    task set_key(input [3:0] code, input value);
    begin
        case (code)
            4'd0: key_0 = value;
            4'd1: key_1 = value;
            4'd2: key_2 = value;
            4'd3: key_3 = value;
            4'd4: key_4 = value;
            4'd5: key_5 = value;
            4'd6: key_6 = value;
            4'd7: key_7 = value;
            4'd8: key_8 = value;
            4'd9: key_9 = value;
            4'hA: key_star = value;
            4'hB: key_hash = value;
        endcase
    end
    endtask

    task press_key(input [3:0] code);
    begin
        set_key(code, 1'b1);
        repeat (6) step;
        set_key(code, 1'b0);
        repeat (6) step;
    end
    endtask

    task long_press_key(input [3:0] code);
    begin
        set_key(code, 1'b1);
        repeat (40) step;
        set_key(code, 1'b0);
        repeat (6) step;
    end
    endtask

    task receive_uart_byte(input [7:0] expected);
        reg [7:0] received;
        integer bit_no;
    begin
        @(negedge bdio2);
        repeat (CLKS_PER_BIT/2)
            step;
        check(bdio2 === 1'b0, "UART start bit");

        for (bit_no = 0; bit_no < 8; bit_no = bit_no + 1) begin
            repeat (CLKS_PER_BIT)
                step;
            received[bit_no] = bdio2;
        end

        repeat (CLKS_PER_BIT)
            step;
        check(bdio2 === 1'b1, "UART stop bit");
        check(received === expected, "UART expected ASCII");

        $display(
            "UART_BYTE expected=0x%02h received=0x%02h",
            expected,
            received
        );
    end
    endtask

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, tb_additional_top);
    end

    initial begin
        #20000000;
        $fatal(1, "watchdog timeout");
    end

    initial begin
        // Allow the internal power-up reset and button synchronizers to settle.
        repeat (12)
            step;

        check(dut.n === 4'd0, "power-up N = 0");
        check(seg_data === 8'hfc, "N=0 single 7-segment pattern");
        check(dut.digit_count === 0, "power-up buffer empty");
        check(bdio2 === 1'b1, "UART idle high");

        // A short # press increments once.
        press_key(4'hB);
        check(dut.n === 4'd1, "short # press increments N to 1");
        check(seg_data === 8'h60, "N=1 single 7-segment pattern");

        // A long # press adds exactly one, not one per clock.
        set_key(4'hB, 1'b1);
        repeat (6)
            step;
        check(dut.n === 4'd2, "long # press rising edge increments once");
        repeat (40)
            step;
        check(dut.n === 4'd2, "held # does not repeat");
        set_key(4'hB, 1'b0);
        repeat (6)
            step;

        // Released button can generate a new event; move from N=2 to N=9.
        for (i = 0; i < 7; i = i + 1)
            press_key(4'hB);

        check(dut.n === 4'd9, "N reaches 9");
        check(seg_data === 8'hf6, "N=9 single 7-segment pattern");

        press_key(4'hB);
        check(dut.n === 4'd0, "N wraps 9 to 0");

        // N=1 gives clk/2, so the output toggles on every clock edge.
        press_key(4'hB);
        check(dut.n === 4'd1, "N=1 divider selection");

        begin
            reg previous;
            previous = bdio0;
            repeat (4) begin
                step;
                check(bdio0 !== previous, "divide-by-2 toggles each clock");
                previous = bdio0;
            end
        end

        // Store 2,0,2,5. Holding the first digit must store it once.
        set_key(4'd2, 1'b1);
        repeat (6)
            step;
        check(dut.digit_count === 1, "digit 2 stored once");
        repeat (40)
            step;
        check(dut.digit_count === 1, "held digit does not repeat");
        set_key(4'd2, 1'b0);
        repeat (6)
            step;

        press_key(4'd0);
        press_key(4'd2);
        press_key(4'd5);
        check(dut.digit_count === 4, "four keypad digits stored");

        // A long * press starts one UART sequence.
        fork
            begin
                receive_uart_byte(8'h32);
                receive_uart_byte(8'h30);
                receive_uart_byte(8'h32);
                receive_uart_byte(8'h35);
            end
            begin
                long_press_key(4'hA);
            end
        join

        wait (dut.sending === 1'b0);
        step;

        check(dut.digit_count === 0, "buffer cleared after UART");
        check(bdio2 === 1'b1, "UART returns idle high");

        $display("ADDITIONAL_PASS checks=%0d", checks);
        $finish;
    end

endmodule
