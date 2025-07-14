`timescale 1ns/1ps
`include "sumsub_4.v"
module tb_sumsub_4;

    // Inputs
    reg [3:0] a;
    reg [3:0] b;
    reg sub;

    // Outputs
    wire [3:0] s;
    wire c_out;

    // Instantiate the DUT (Device Under Test)
    sumsub_4 uut (
        .a(a),
        .b(b),
        .sub(sub),
        .c_in(1'b0),       // Giá trị này không được dùng trong sumsub_4, có thể bỏ hoàn toàn nếu bạn sửa module
        .s(s),
        .c_out(c_out)
    );

    // Task để hiển thị kết quả rõ ràng
    task print_result;
        input [3:0] a_in;
        input [3:0] b_in;
        input sub_in;
        begin
            a = a_in;
            b = b_in;
            sub = sub_in;
            #10;
            $display("A = %b (%0d), B = %b (%0d), SUB = %b --> SUM = %b (%0d), C_out = %b", 
                      a, a, b, b, sub, s, s, c_out);
        end
    endtask

    initial begin
        $dumpfile("tb_sumsub_4.vcd");
        $dumpvars(0,tb_sumsub_4);
    end

    initial begin
        $display("==== TEST: Cộng và Trừ 4-bit ====");
        // Cộng: A + B
        print_result(4'd3, 4'd2, 1'b0);  // 3 + 2 = 5
        print_result(4'd7, 4'd8, 1'b0);  // 7 + 8 = 15
        print_result(4'd15, 4'd1, 1'b0); // 15 + 1 = 0 (carry_out = 1)

        // Trừ: A - B
        print_result(4'd5, 4'd3, 1'b1);  // 5 - 3 = 2
        print_result(4'd3, 4'd5, 1'b1);  // 3 - 5 = -2 (Kết quả bù 2)
        print_result(4'd8, 4'd8, 1'b1);  // 8 - 8 = 0

        $finish;
    end

endmodule
