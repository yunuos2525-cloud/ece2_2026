`timescale 1ns/1ps
module sram_model(
    input wire cs_n,
    input wire oe_n,
    input wire we_n,
    input wire [17:0] address,
    inout wire [15:0] data
);
    reg [15:0] memory [0:15];
    assign data = (!cs_n && !oe_n && we_n) ? memory[address[3:0]] : 16'bz;

    always @(negedge we_n) begin
        #1;
        if (!cs_n && !we_n)
            memory[address[3:0]] = data;
    end
endmodule

module tb_sram;
    reg ctrl_w = 0;
    reg ctrl_r = 0;
    reg [3:0] address = 0;
    reg [3:0] data_in = 0;
    wire ram_cs;
    wire ram_oe;
    wire ram_we;
    wire [17:0] ram_address;
    wire [15:0] ram_data;
    wire [7:0] led_out;
    integer i;

    sram dut(
        .ctrl_w(ctrl_w), .ctrl_r(ctrl_r),
        .address(address), .data_in(data_in),
        .ram_cs(ram_cs), .ram_oe(ram_oe), .ram_we(ram_we),
        .ram_address(ram_address), .ram_data(ram_data), .led_out(led_out)
    );
    sram_model memory(
        .cs_n(ram_cs), .oe_n(ram_oe), .we_n(ram_we),
        .address(ram_address), .data(ram_data)
    );

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, tb_sram);
        #2;
        if (ram_data !== 16'bz || led_out !== 0 || {ram_cs, ram_oe, ram_we} !== 3'b111)
            $fatal(1, "SRAM idle or bus release failure");

        for (i = 0; i < 16; i = i + 1) begin
            address = i;
            data_in = 15 - i;
            #2;
            ctrl_w = 1;
            #2;
            if (ram_data !== (15 - i) || ram_address !== i)
                $fatal(1, "SRAM write bus address=%0d data=%h", i, ram_data);
            if ({ram_cs, ram_oe, ram_we} !== 3'b010)
                $fatal(1, "SRAM active-low write controls");
            ctrl_w = 0;
            #2;
            if (ram_data !== 16'bz)
                $fatal(1, "SRAM did not release bus after write");
        end

        for (i = 0; i < 16; i = i + 1) begin
            address = i;
            ctrl_r = 1;
            #2;
            if (led_out !== (15 - i) || ram_data !== (15 - i))
                $fatal(1, "SRAM read address=%0d bus=%h led=%h", i, ram_data, led_out);
            if ({ram_cs, ram_oe, ram_we} !== 3'b001)
                $fatal(1, "SRAM active-low read controls");
            ctrl_r = 0;
            #2;
            if (ram_data !== 16'bz)
                $fatal(1, "SRAM did not release bus after read");
        end

        ctrl_w = 1;
        ctrl_r = 1;
        #2;
        if (ram_data !== 16'bz || {ram_cs, ram_oe, ram_we} !== 3'b111)
            $fatal(1, "SRAM simultaneous request was not ignored");
        $display("LAB6_SRAM_PASS addresses=16 write/read bus_release conflict_guard");
        $finish;
    end

    initial begin
        #1000;
        $fatal(1, "timeout");
    end
endmodule

