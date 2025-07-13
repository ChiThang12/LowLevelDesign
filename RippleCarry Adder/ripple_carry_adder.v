module ripple_carry_adder(
    input  wire [3:0] a,
    input  wire [3:0] b,
    input  wire       c_in,
    output wire [3:0] s,
    output wire       c_out
);

    wire [4:0] c;  
    assign c[0] = c_in;

    genvar k;
    generate
        for (k = 0; k < 4; k = k + 1) begin : full_adder_block
            full_adder fa (
                .a     (a[k]),
                .b     (b[k]),
                .c_in  (c[k]),
                .s     (s[k]),
                .c_out (c[k+1])
            );
        end
    endgenerate

    assign c_out = c[4];

endmodule


module full_adder(
    input  wire a,
    input  wire b,
    input  wire c_in,
    output wire s,
    output wire c_out
);
    assign s     = a ^ b ^ c_in;
    assign c_out = (a & b) | (b & c_in) | (a & c_in);
endmodule
