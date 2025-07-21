module d_flip_flop_ms(
    input D,
    input clk,
    input R,
    output Q,
    output Qn
);

    wire Dn, S1, R1, S2, R2;
    wire Qm, Qmn;

    // master latch

    wire d_reset_applied;
    assign d_reset_applied = D & (~R);

    not(d_reset_applied, d_reset_applied);
    nand(S1,d_reset_applied,clk);
    nand(R1,)
endmodule