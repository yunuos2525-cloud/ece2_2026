`timescale 1ns/1ps

module tb_audio_bypass;
    reg clk_50mhz = 1'b0;
    reg rst_p = 1'b1;
    reg [2:0] add_sel = 3'd0;
    reg adc_dout = 1'b0;
    reg spi_sck = 1'b0;
    reg spi_mosi = 1'b0;
    reg spi_cs_n = 1'b1;
    wire adc_sclk, adc_ncs, adc_din;
    wire dac_a_b, dac_csn, dac_ldacn, dac_wen;
    wire [7:0] dac_d;
    wire [7:0] led_out;

    integer response_index = 0;
    integer response_bit = 15;
    integer write_count = 0;
    reg [15:0] response_word;
    reg [7:0] expected [0:2];

    always #10 clk_50mhz = ~clk_50mhz;

    project_top #(
        .SAMPLE_CLOCKS(80),
        .ADC_HALF_CYCLES(1),
        .DAC_CHANNEL(0)
    ) dut (
        .clk_50mhz(clk_50mhz),
        .rst_p(rst_p),
        .add_sel(add_sel),
        .adc_dout(adc_dout),
        .adc_sclk(adc_sclk),
        .adc_ncs(adc_ncs),
        .adc_din(adc_din),
        .dac_a_b(dac_a_b),
        .dac_csn(dac_csn),
        .dac_ldacn(dac_ldacn),
        .dac_wen(dac_wen),
        .dac_d(dac_d),
        .spi_sck(spi_sck),
        .spi_mosi(spi_mosi),
        .spi_cs_n(spi_cs_n),
        .led_out(led_out)
    );

    function automatic [7:0] response_sample(input integer index);
        begin
            case (index)
                0: response_sample = 8'h00; // discarded first frame
                1: response_sample = 8'h12;
                2: response_sample = 8'hA5;
                default: response_sample = 8'h7E;
            endcase
        end
    endfunction

    always @(negedge adc_ncs) begin
        response_word = {1'b0, add_sel, response_sample(response_index), 4'b0000};
        response_bit = 15;
        adc_dout = response_word[response_bit];
        response_index = response_index + 1;
    end

    always @(posedge adc_sclk) begin
        if (!adc_ncs && response_bit > 0) begin
            response_bit = response_bit - 1;
            adc_dout = response_word[response_bit];
        end
    end

    always @(negedge dac_wen) begin
        if (write_count < 3) begin
            if (dac_d !== expected[write_count])
                $fatal(1, "BYPASS changed sample %0d: expected %02h got %02h",
                       write_count, expected[write_count], dac_d);
            if (dac_csn !== 1'b0 || dac_ldacn !== 1'b0 || dac_a_b !== 1'b0)
                $fatal(1, "unexpected DAC control state");
            write_count = write_count + 1;
        end
    end

    task automatic send_spi_byte(input [7:0] value);
        integer bit_index;
        begin
            spi_sck = 1'b0;
            spi_cs_n = 1'b0;
            for (bit_index = 7; bit_index >= 0; bit_index = bit_index - 1) begin
                spi_mosi = value[bit_index];
                #100 spi_sck = 1'b1;
                #100 spi_sck = 1'b0;
            end
            #100 spi_cs_n = 1'b1;
            #300;
        end
    endtask

    initial begin
        expected[0] = 8'h12;
        expected[1] = 8'hA5;
        expected[2] = 8'h7E;

        repeat (5) @(posedge clk_50mhz);
        @(negedge clk_50mhz);
        rst_p = 1'b0;

        wait (write_count == 3);
        if (led_out[6] !== 1'b0)
            $fatal(1, "sample drop flag asserted");

        send_spi_byte(8'h02);
        if (led_out[7] !== 1'b1)
            $fatal(1, "FILTER mode command not captured");

        send_spi_byte(8'h01);
        if (led_out[7] !== 1'b0)
            $fatal(1, "BYPASS mode command not captured");

        $display("PASS AUDIO_BYPASS: order, unchanged samples, DAC writes, SPI modes, no drop");
        $finish;
    end

    initial begin
        #30000;
        $fatal(1, "simulation timeout");
    end
endmodule
