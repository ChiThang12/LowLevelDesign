module encoder83(
    input d0,d1,d2,d3,d4,d5,d6,d7,
    output [2:0] y
);

    assign y[0] = d1 | d3 | d5 | d7;
    assign y[1] = d2 | d3 | d6 | d7;
    assign y[2] = d4 | d5 | d6 | d7;

endmodule