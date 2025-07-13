`include "full_adder.v"
`timescale 1ns/1ps
module tb_full_adder;

    reg a, b, c_in;       // inputs điều khiển
    wire s, c_out;        // outputs từ full_adder

    // Instantiate the full adder module
    full_adder uut (
        .a(a),
        .b(b),
        .c_in(c_in),
        .s(s),
        .c_out(c_out)
    );

    // Dump waveform file
    initial begin
        $dumpfile("tb_full_adder.vcd");
        $dumpvars(0, tb_full_adder);

        // Test all combinations of 3 inputs (a, b, c_in)
        a = 0; b = 0; c_in = 0; #10;
        a = 0; b = 0; c_in = 1; #10;
        a = 0; b = 1; c_in = 0; #10;
        a = 0; b = 1; c_in = 1; #10;
        a = 1; b = 0; c_in = 0; #10;
        a = 1; b = 0; c_in = 1; #10;
        a = 1; b = 1; c_in = 0; #10;
        a = 1; b = 1; c_in = 1; #10;

        // Kết thúc mô phỏng
        $finish;
    end

endmodule
