/**
Đầu vào
- A [1:0]
- B [1:0]
Đầu ra 
- A_gt_B = 1 (A>b) 01
- A_eq_B = 1 (A==B) 00
- A_lt_B = 1 (A<B) 10
**/
module comparator_2bit(
    input [1:0] A,
    input [1:0] B,
    output A_gt_B,
    output A_eq_B,
    output A_lt_B

);

    wire eq1,eq0;

    assign eq1 = ~(A[1]^B[1]);
    assign eq0 = ~(A[0]^B[0]);


    //A>B
    assign A_gt_B = (A[1] & ~B[1]) | (eq1 & A[0] & ~B[0]);

    //A<B
    assign A_lt_B = (B[1] & ~A[1]) | (eq1 & B[0] & ~A[0]);

    //A=B
    assign A_eq_B = ~(A[1] ^ B[1]) & ~(A[0] ^ B[0]);

endmodule