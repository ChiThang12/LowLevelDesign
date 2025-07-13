module d_flip_flop(
    input D,
    input CLK,
    output Q,
    output Qn
);

    wire Dn,S1,R1,S2,R2;
    wire Qm,Qmn;

   // Master latch
   not (Dn,D);
   nand (S1, D ,CLK);
   nand (R1, Dn,CLK);
   nand (Qm, S1,Qmn);
   nand (Qmn,R1,Qm);

   // Slave latch
   nand (S2, Qm ,~CLK);
   nand (R2, Qmn,~CLK);
   nand (Q , S2 ,Qn);
   nand (Qn, R2 ,Q);

endmodule