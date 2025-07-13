module mux4_1(
    input  wire [1:0] sel,
    input  wire d0, d1, d2, d3,
    output wire y
);

    wire [3:0] temp_y;
    wire sel_val_3, sel_val_2, sel_val_1, sel_val_0;
    wire y2, y1;

    // Chọn d3: khi sel == 11 → sel_val_3 = sel[1] & sel[0]
    assign sel_val_3 = sel[1] & sel[0];
    assign temp_y[3] = d3 & sel_val_3;

    // Chọn giữa temp_y[3] và d2 (khi sel == 10)
    assign sel_val_2 = sel[1] & ~sel[0];
    mux2_1 mux_d2 (
        .a(temp_y[3]),
        .b(d2),
        .sel(sel_val_2),
        .y(temp_y[2])
    );

    // Chọn giữa temp_y[2] và d1 (khi sel == 01)
    assign sel_val_1 = ~sel[1] & sel[0];
    mux2_1 mux_d1 (
        .a(temp_y[2]),
        .b(d1),
        .sel(sel_val_1),
        .y(temp_y[1])
    );

    // Chọn giữa temp_y[1] và d0 (khi sel == 00)
    assign sel_val_0 = ~sel[1] & ~sel[0];
    mux2_1 mux_d0 (
        .a(temp_y[1]),
        .b(d0),
        .sel(sel_val_0),
        .y(temp_y[0])
    );

    assign y = temp_y[0];

endmodule


module mux2_1(
    input  wire a,
    input  wire b,
    input  wire sel,
    output wire y
);
    assign y = (a & ~sel) | (b & sel);
endmodule
