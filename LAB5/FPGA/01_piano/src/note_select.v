`timescale 1ns/1ps

module note_select (
    input  wire [7:0] key,
    output reg  [31:0] frequency_hz
);
    always @* begin
        case (key)
            8'h80: frequency_hz = 32'd262;
            8'h40: frequency_hz = 32'd294;
            8'h20: frequency_hz = 32'd330;
            8'h10: frequency_hz = 32'd349;
            8'h08: frequency_hz = 32'd392;
            8'h04: frequency_hz = 32'd440;
            8'h02: frequency_hz = 32'd494;
            8'h01: frequency_hz = 32'd523;
            default: frequency_hz = 32'd0;
        endcase
    end
endmodule
