`timescale 1ns/1ps

module button_events (
    input  wire       clk,
    input  wire       rst,
    input  wire       key_0,
    input  wire       key_1,
    input  wire       key_2,
    input  wire       key_3,
    input  wire       key_4,
    input  wire       key_5,
    input  wire       key_6,
    input  wire       key_7,
    input  wire       key_8,
    input  wire       key_9,
    input  wire       key_star,
    input  wire       key_hash,
    output reg  [3:0] digit,
    output reg        digit_valid,
    output reg        star_pulse,
    output reg        hash_pulse
);

    wire [11:0] keys = {
        key_hash, key_star,
        key_9, key_8, key_7, key_6, key_5,
        key_4, key_3, key_2, key_1, key_0
    };

    (* ASYNC_REG = "TRUE" *) reg [11:0] key_meta;
    (* ASYNC_REG = "TRUE" *) reg [11:0] key_sync;
    reg [11:0] key_previous;

    wire [11:0] key_pressed = key_sync & ~key_previous;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            key_meta     <= 12'b0;
            key_sync     <= 12'b0;
            key_previous <= 12'b0;
            digit        <= 4'd0;
            digit_valid  <= 1'b0;
            star_pulse   <= 1'b0;
            hash_pulse   <= 1'b0;
        end
        else begin
            key_meta     <= keys;
            key_sync     <= key_meta;
            key_previous <= key_sync;

            digit_valid <= 1'b0;
            star_pulse  <= key_pressed[10];
            hash_pulse  <= key_pressed[11];

            if (key_pressed[0]) begin
                digit <= 4'd0;
                digit_valid <= 1'b1;
            end
            else if (key_pressed[1]) begin
                digit <= 4'd1;
                digit_valid <= 1'b1;
            end
            else if (key_pressed[2]) begin
                digit <= 4'd2;
                digit_valid <= 1'b1;
            end
            else if (key_pressed[3]) begin
                digit <= 4'd3;
                digit_valid <= 1'b1;
            end
            else if (key_pressed[4]) begin
                digit <= 4'd4;
                digit_valid <= 1'b1;
            end
            else if (key_pressed[5]) begin
                digit <= 4'd5;
                digit_valid <= 1'b1;
            end
            else if (key_pressed[6]) begin
                digit <= 4'd6;
                digit_valid <= 1'b1;
            end
            else if (key_pressed[7]) begin
                digit <= 4'd7;
                digit_valid <= 1'b1;
            end
            else if (key_pressed[8]) begin
                digit <= 4'd8;
                digit_valid <= 1'b1;
            end
            else if (key_pressed[9]) begin
                digit <= 4'd9;
                digit_valid <= 1'b1;
            end
        end
    end

endmodule
