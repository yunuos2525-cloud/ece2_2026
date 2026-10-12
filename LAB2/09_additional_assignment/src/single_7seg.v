`timescale 1ns/1ps

module single_7seg (
    input  wire [3:0] digit,
    output reg  [7:0] seg_data
);

    // [7:0] = {a,b,c,d,e,f,g,dp}; active high; dp off.
    always @* begin
        case (digit)
            4'd0: seg_data = 8'hfc;
            4'd1: seg_data = 8'h60;
            4'd2: seg_data = 8'hda;
            4'd3: seg_data = 8'hf2;
            4'd4: seg_data = 8'h66;
            4'd5: seg_data = 8'hb6;
            4'd6: seg_data = 8'hbe;
            4'd7: seg_data = 8'he0;
            4'd8: seg_data = 8'hfe;
            4'd9: seg_data = 8'hf6;
            default: seg_data = 8'h00;
        endcase
    end

endmodule
