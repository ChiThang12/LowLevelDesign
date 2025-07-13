module fre_div(
    input CLK,
    output Q1,  // CLK/2
    output Q2,  // CLK/4
    output Q3   // CLK/8
);

    wire Qn1, Qn2, Qn3;

    t_flip_flop tff1(
        .CLK(CLK),
        .Q(Q1),
        .Qn(Qn1)
    );

    t_flip_flop tff2(
        .CLK(Q1),  // chia tiếp
        .Q(Q2),
        .Qn(Qn2)
    );

    t_flip_flop tff3(
        .CLK(Q2),  // chia tiếp
        .Q(Q3),
        .Qn(Qn3)
    );

endmodule


module t_flip_flop(
    input CLK,
    output Q,
    output Qn
);

    wire D;

    not (D, Q);  // T=1, nên D = ~Q (toggle)

    d_flip_flop dff (
        .D(D),
        .CLK(CLK),
        .Q(Q),
        .Qn(Qn)
    );

endmodule



module d_flip_flop(
    input D,
    input CLK,
    output reg Q,
    output Qn
);

    assign Qn = ~Q;

    initial Q = 0;

    always @(posedge CLK)
        Q <= D;

endmodule
