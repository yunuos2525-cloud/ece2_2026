`timescale 1ns/1ps

module uart_sender #(
    parameter integer MAX_DIGITS = 16
)(
    input  wire       clk,
    input  wire       rst,

    // Keypad에서 숫자키가 눌렸을 때
    input  wire [3:0] digit,
    input  wire       digit_valid,

    // '*' 키 one-pulse
    input  wire       send_pulse,

    // uart_tx와 연결
    input  wire       uart_busy,
    input  wire       uart_done,
    output reg  [7:0] uart_data,
    output reg        uart_start,

    // 상태 확인용
    output reg        sending,
    output wire [4:0] digit_count
);

    reg [3:0] buffer [0:MAX_DIGITS-1];

    reg [4:0] count;
    reg [4:0] send_index;

    integer i;

    assign digit_count = count;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            count       <= 0;
            send_index  <= 0;
            uart_data   <= 8'h00;
            uart_start  <= 1'b0;
            sending     <= 1'b0;

            for (i = 0; i < MAX_DIGITS; i = i + 1)
                buffer[i] <= 4'd0;
        end
        else begin
            // 기본적으로 start는 1 clock pulse
            uart_start <= 1'b0;

            // 전송 중이 아닐 때만 새 숫자를 buffer에 저장
            if (digit_valid && !sending) begin
                if (count < MAX_DIGITS) begin
                    buffer[count] <= digit;
                    count <= count + 1'b1;
                end
            end

            // '*' 입력 → 저장된 숫자 전송 시작
            if (send_pulse && !sending && count != 0) begin
                sending    <= 1'b1;
                send_index <= 0;
            end

            if (sending) begin

                // 현재 byte 송신 완료
                if (uart_done) begin
                    if (send_index == count - 1'b1) begin
                        // 모든 숫자 송신 완료
                        sending    <= 1'b0;
                        send_index <= 0;
                        count      <= 0;
                    end
                    else begin
                        send_index <= send_index + 1'b1;
                    end
                end

                // UART가 비어 있으면 다음 숫자 전송
                else if (!uart_busy) begin
                    // 숫자 0~9 → ASCII '0'~'9'
                    uart_data  <= 8'h30 + buffer[send_index];
                    uart_start <= 1'b1;
                end
            end
        end
    end

endmodule