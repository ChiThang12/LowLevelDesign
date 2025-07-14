`timescale 1ns/1ps
`include "alu.v"
module tb_alu;
    reg  [3:0] a, b;
    reg  [1:0] sel;
    wire [3:0] result;
    wire carry_out;
    wire zero;

    // Instantiate ALU
    alu uut (
        .a(a),
        .b(b),
        .sel(sel),
        .result(result),
        .carry_out(carry_out),
        .zero(zero)
    );

    initial begin
        $dumpfile("tb_alu.vcd");
        $dumpvars(0,tb_alu);
    end
    initial begin
        $display("=== ALU TEST ===");
        $monitor("SEL = %b | A = %b (%0d), B = %b (%0d) --> RESULT = %b (%0d), C_OUT = %b, ZERO = %b",
                 sel, a, a, b, b, result, result, carry_out, zero);

        // ADD: 3 + 5 = 8
        sel = 2'b00; a = 4'd3; b = 4'd5; #10;

        // ADD: 15 + 1 = 16 (overflow)
        sel = 2'b00; a = 4'd15; b = 4'd1; #10;

        // SUB: 6 - 3 = 3
        sel = 2'b01; a = 4'd6; b = 4'd3; #10;

        // SUB: 2 - 4 = -2 (two's complement)
        sel = 2'b01; a = 4'd2; b = 4'd4; #10;

        // AND: 10 & 12 = 8
        sel = 2'b10; a = 4'b1010; b = 4'b1100; #10;

        // OR: 3 | 5 = 7
        sel = 2'b11; a = 4'd3; b = 4'd5; #10;

        // Check zero: 0 & 0
        sel = 2'b10; a = 4'd0; b = 4'd0; #10;

        $finish;
    end
endmodule
