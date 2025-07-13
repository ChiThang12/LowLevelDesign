`timescale 1ns/1ps
`include "ripple_carry_adder.v"
module tb_ripple_carry_adder;

    reg [3:0] a, b;
    reg       c_in;
    wire [3:0] s;
    wire       c_out;

    ripple_carry_adder uut (
        .a(a),
        .b(b),
        .c_in(c_in),
        .s(s),
        .c_out(c_out)
    );

    initial begin
        $dumpfile("tb_rca.vcd");
        $dumpvars(0, tb_ripple_carry_adder);

        a = 4'b0000; b = 4'b0000; c_in = 0; #10;
        a = 4'b0011; b = 4'b0101; c_in = 0; #10;
        a = 4'b1111; b = 4'b0001; c_in = 0; #10;
        a = 4'b1010; b = 4'b0101; c_in = 1; #10;
        a = 4'b1111; b = 4'b1111; c_in = 1; #10;

        $finish;
    end

endmodule
