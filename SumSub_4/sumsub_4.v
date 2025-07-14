module sumsub_4(
    input [3:0] a,
    input [3:0] b,
    input sub,
    input c_in,
    output [3:0] s,
    output c_out
    
);
    wire [3:0] b_n;
    wire [3:0] b_in;
    wire c;
   
    genvar i;
    generate
        for(i=0; i<4; i=i+1) begin: not_b
            assign b_n[i] = b[i] ^ sub; 
        end
    endgenerate
    ripple_carry_adder rca1(
        .a(b_n),
        .b(4'b0001),
        .c_in(1'b0),
        .s(b_in),
        .c_out(c)
    );


    ripple_carry_adder rca2(
        .a(a),
        .b(b_in),
        .c_in(1'b0),
        .s(s),
        .c_out(c_out)
    );

endmodule

module ripple_carry_adder(
    input   [3:0] a,
    input   [3:0] b,
    input         c_in,
    output  [3:0] s,
    output        c_out
);

    wire [4:0] temp_c;
    assign temp_c[0] = c_in;

    genvar i;
    generate
        for(i=0; i<4; i=i+1) begin : full_adder_block
            full_adder f_a(
                .a      (a[i]),
                .b      (b[i]),
                .c_in   (temp_c[i]),
                .s      (s[i]),
                .c_out  (temp_c[i+1])
            );
        end
    endgenerate
    assign c_out = temp_c[4];

endmodule


module full_adder(
    input   a,
    input   b,
    input   c_in,
    output  s,
    output  c_out
);
    assign s = a ^ b ^ c_in;
    assign c_out = a&b | a&c_in | b&c_in;

endmodule