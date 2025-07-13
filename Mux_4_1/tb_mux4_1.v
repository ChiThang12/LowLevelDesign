`timescale 1ns / 1ps
`include "mux4_1.v"
module tb_mux4_1;

    // Testbench signals
    reg [1:0] sel;
    reg d0, d1, d2, d3;
    wire y;

    // Instantiate DUT
    mux4_1 dut (
        .sel(sel),
        .d0(d0),
        .d1(d1),
        .d2(d2),
        .d3(d3),
        .y(y)
    );

    integer i;

    initial begin
        $dumpfile("tb_mux4_1.vcd");
        $dumpvars(0, tb_mux4_1);

        $display("=== Test Tất cả tổ hợp sel & dữ liệu ===");
        $display("sel | d0 d1 d2 d3 | y | Ghi chú");

        // Duyệt qua tất cả giá trị sel từ 00 đến 11
        for (i = 0; i < 4; i = i + 1) begin
            sel = i[1:0];
            
            // TH1: chỉ một đầu vào đúng
            d0 = 0; d1 = 0; d2 = 0; d3 = 0;
            case (sel)
                2'b00: d0 = 1;
                2'b01: d1 = 1;
                2'b10: d2 = 1;
                2'b11: d3 = 1;
            endcase
            #10;
            $display("%b   |  %b  %b  %b  %b | %b | Chọn đúng d%0d", sel, d0, d1, d2, d3, y, sel);

            // TH2: tất cả đều là 1
            d0 = 1; d1 = 1; d2 = 1; d3 = 1;
            #10;
            $display("%b   |  %b  %b  %b  %b | %b | Tất cả đầu vào là 1", sel, d0, d1, d2, d3, y);

            // TH3: đầu vào ngẫu nhiên
            d0 = $random % 2;
            d1 = $random % 2;
            d2 = $random % 2;
            d3 = $random % 2;
            #10;
            $display("%b   |  %b  %b  %b  %b | %b | Ngẫu nhiên", sel, d0, d1, d2, d3, y);
        end

        $display("=== Kết thúc kiểm thử ===");
        $finish;
    end

endmodule
