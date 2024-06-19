module mux_4x1(input d00,input d01,input d10,input d11,input s0,input s1,output y);
    wire o1,o2,o3,o4;

    and(o1,d00,~s0,~s1);
    and(o2,d01,~s0,s1);
    and(o3,d10,s0,~s1);
    and(o4,d11,s0,s1);
    or (y,o1,o2,o3,o4);
    
endmodule