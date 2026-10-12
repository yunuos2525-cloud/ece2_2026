`timescale 1ns/1ps

module additional_top #(
    parameter integer CLK_FREQ      = 50000000,
    parameter integer UART_BAUD     = 9600
)(
    input  wire       clk,
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

    // Single 7-segment
    output wire [7:0] seg_data,

    // Breadboard outputs
    output wire       bdio0,
    output wire       bdio2
);

    // ------------------------------------------------------------
    // Spartan-7 register INIT values provide a deterministic power-up reset.
    // ------------------------------------------------------------

    reg [3:0] startup_reset_pipe = 4'hf;

    always @(posedge clk)
        startup_reset_pipe <= {startup_reset_pipe[2:0], 1'b0};

    wire startup_reset = startup_reset_pipe[3];


    // ------------------------------------------------------------
    // Synchronize independent active-high buttons and create press events
    // ------------------------------------------------------------

    wire [3:0] digit;
    wire       digit_valid;
    wire       star_pulse;
    wire       hash_pulse;

    button_events key_events (
        .clk(clk),
        .rst(startup_reset),
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
        .digit(digit),
        .digit_valid(digit_valid),
        .star_pulse(star_pulse),
        .hash_pulse(hash_pulse)
    );


    // ------------------------------------------------------------
    // N = 0 ~ 9
    // ------------------------------------------------------------

    wire [3:0] n;

    n_controller n_ctrl (
        .clk(clk),
        .rst(startup_reset),
        .hash_pulse(hash_pulse),
        .n(n)
    );


    // ------------------------------------------------------------
    // BDIO0 = 50 MHz / 2^N
    // ------------------------------------------------------------

    programmable_divider prog_div (
        .clk(clk),
        .rst(startup_reset),
        .n(n),
        .divided_out(bdio0)
    );


    // ------------------------------------------------------------
    // Display N
    // ------------------------------------------------------------

    single_7seg display (
        .digit(n),
        .seg_data(seg_data)
    );


    // ------------------------------------------------------------
    // Digit buffer / UART sequence
    // ------------------------------------------------------------

    wire [7:0] uart_data;
    wire       uart_start;
    wire       uart_busy;
    wire       uart_done;
    wire       sending;
    wire [4:0] digit_count;

    uart_sender sender (
        .clk(clk),
        .rst(startup_reset),
        .digit(digit),
        .digit_valid(digit_valid),
        .send_pulse(star_pulse),
        .uart_busy(uart_busy),
        .uart_done(uart_done),
        .uart_data(uart_data),
        .uart_start(uart_start),
        .sending(sending),
        .digit_count(digit_count)
    );


    // ------------------------------------------------------------
    // UART TX → BDIO2
    // ------------------------------------------------------------

    uart_tx #(
        .CLK_FREQ(CLK_FREQ),
        .BAUD(UART_BAUD)
    ) transmitter (
        .clk(clk),
        .rst(startup_reset),
        .data_in(uart_data),
        .start(uart_start),
        .tx(bdio2),
        .busy(uart_busy),
        .done(uart_done)
    );

endmodule
