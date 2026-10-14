`timescale 1ns/1ps

module piano #(
    parameter integer CLK_HZ = 50_000_000
) (
    input  wire       clk_50mhz,
    input  wire       rst_p,
    input  wire [7:0] key,
    output wire       piezo
);
    wire [31:0] frequency_hz;

    note_select u_note_select (
        .key(key),
        .frequency_hz(frequency_hz)
    );

    square_tone #(.CLK_HZ(CLK_HZ)) u_square_tone (
        .clk(clk_50mhz),
        .rst_p(rst_p),
        .frequency_hz(frequency_hz),
        .tone(piezo)
    );
endmodule
