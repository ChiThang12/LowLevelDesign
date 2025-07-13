`include "fre_div.v"
`timescale 1ns/1ps

module tb_fre_div;

    reg CLK;
    wire Q1, Q2, Q3;

    fre_div uut (
        .CLK(CLK),
        .Q1(Q1),
        .Q2(Q2),
        .Q3(Q3)
    );

    // Clock 10ns period
    initial begin
        CLK = 0;
        forever #5 CLK = ~CLK;
    end

    initial begin
        $display("Time\tCLK\tQ1\tQ2\tQ3");
        $monitor("%g\t%b\t%b\t%b\t%b", $time, CLK, Q1, Q2, Q3);
        #200 $finish;
    end

    initial begin
        $dumpfile("tb_fre_div.vcd");
        $dumpvars(0, tb_fre_div);
    end

endmodule
