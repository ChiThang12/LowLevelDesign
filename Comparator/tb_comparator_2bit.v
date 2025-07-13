`include "comparator_2bit.v"
`timescale 1ns/1ps

module tb_comparator_2bit;

    reg [1:0] A;
    reg [1:0] B;
    wire A_gt_B;
    wire A_eq_B;
    wire A_lt_B;

    comparator_2bit uut(
        .A(A),
        .B(B),
        .A_gt_B(A_gt_B),
        .A_eq_B(A_eq_B),
        .A_lt_B(A_lt_B)
    );

    integer i,j;

    initial begin
        $dumpfile("tb_comparator_2bit.vcd");
        $dumpvars(0,tb_comparator_2bit);
    end

    initial begin
        $display("Time | A  | B  | A_gt_B | A_eq_B | A_lt_B");
        $display("-----+----+----+--------+--------+--------");

        for(i=0; i<4; i=i+1) begin
            for(j=0; j<4; j=j+1) begin
                A = i[1:0];
                B = j[1:0];
                #10; // Wait 10ns for output to settle
                $display("%4dns | %2b | %2b |   %b    |   %b    |   %b", $time, A, B, A_gt_B, A_eq_B, A_lt_B);
            end
        
        end

        $finish;
    end

endmodule