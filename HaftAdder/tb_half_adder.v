`include "half_adder.v"
`timescale 1ns/1ps
module tb_half_adder;

    reg a, b;        
    wire s, c;       

    // Gọi module half_adder
    half_adder uut (
        .a(a),
        .b(b),
        .s(s),
        .c(c)
    );

    initial begin
        // Ghi file VCD cho waveform
        $dumpfile("tb_half_adder.vcd");
        $dumpvars(0, tb_half_adder);

        // Test các trường hợp đầu vào
        a = 0; b = 0; #10;
        a = 0; b = 1; #10;
        a = 1; b = 0; #10;
        a = 1; b = 1; #10;

        // Kết thúc mô phỏng
        $finish;
    end

endmodule
