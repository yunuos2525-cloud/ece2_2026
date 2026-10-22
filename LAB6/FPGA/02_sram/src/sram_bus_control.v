`timescale 1ns/1ps
module sram_bus_control(
    input wire ctrl_w,
    input wire ctrl_r,
    output wire drive_data,
    output wire read_data,
    output wire ram_cs,
    output wire ram_oe,
    output wire ram_we
);
    assign drive_data = ctrl_w && !ctrl_r;
    assign read_data = ctrl_r && !ctrl_w;
    assign ram_cs = !(drive_data || read_data);
    assign ram_oe = !read_data;
    assign ram_we = !drive_data;
endmodule

