`include "encoder83.v"
`timescale 1ns/1ps

module tb_encoder83;
    reg d1,d2,d3,d4,d5,d6,d7,d0;
    wire [2:0] y;

    encoder83 uut(
        .d0(d0),
        .d1(d1),
        .d2(d2),
        .d3(d3),
        .d4(d4),
        .d5(d5),
        .d6(d6),
        .d7(d7),
        .y(y)
    );
  // Lặp qua từng bit từ d0 đến d7
    integer i;
    initial begin
        $dumpfile("tb_encoder83.vcd");
        $dumpvars(0,tb_encoder83);
    end

     initial begin
    $display("Time | d7 d6 d5 d4 d3 d2 d1 d0 | y");
    $display("-----|------------------------|---");

  
    for (i = 0; i < 8; i = i + 1) begin
      {d7, d6, d5, d4, d3, d2, d1, d0} = 8'b00000000;
      case (i)
        0: d0 = 1;
        1: d1 = 1;
        2: d2 = 1;
        3: d3 = 1;
        4: d4 = 1;
        5: d5 = 1;
        6: d6 = 1;
        7: d7 = 1;
      endcase

      #10; // Chờ một chút để tín hiệu ổn định
      $display("%4t |  %b  | %b", $time, {d7,d6,d5,d4,d3,d2,d1,d0}, y);
    end

    $finish;
  end

endmodule