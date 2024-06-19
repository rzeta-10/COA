module xor_nand_gate(input a,input b,output y);

    wire not_a,not_b,and_1,and_2,or_gate;
    assign not_a = ~(a & b);
    assign not_b = ~(~a & ~b);

    assign and_1 = ~(not_a & not_b);
    
    assign or_gate = ~and_1;
    
    assign y = or_gate;

endmodule