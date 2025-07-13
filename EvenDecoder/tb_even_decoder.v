`timescale 1ns/1ps
`include "even_decoder.v"

module tb_even_decoder;

    reg [3:0] a;
    wire y;

    even_decoder uut (
        .a(a),
        .y(y)
    );

    initial begin
        $dumpfile("tb_even_decoder.vcd");
        $dumpvars(0,tb_even_decoder);
    end

    integer i;

      initial begin
        $display("Time |  a  | y (Even?)");
        $display("----------------------");

        for (i = 0; i < 16; i = i + 1) begin
            a = i;                // đưa giá trị vào
            #10;                  // delay để ổn định
            $display("%4t | %2d |    %b", $time, a, y);
        end

        $finish;
    end

endmodule