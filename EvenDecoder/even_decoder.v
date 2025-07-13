module even_decoder(
    input wire [3:0] a,
    output y
);

    assign y = a[0] ^ 1'b1;
    
endmodule