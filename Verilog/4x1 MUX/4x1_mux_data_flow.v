module mux_4x1 (
    input d00, d01, d10, d11,
    input s0, s1,               
    output wire y        
);
    wire o1,o2,o3,o4;

    assign o1=d00 & ~s0 & ~s1;
    assign o2=d01 & ~s0 & s1;
    assign o3=d10 & s0 & ~s1;
    assign o4=d11 & s0 & s1;
    assign y= o1 | o2 | o3 | o4;

endmodule