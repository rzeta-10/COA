module xor_nand_gate(input a,input b,output y);

    wire not_a,not_b,and_1,and_2;
    nand(not_a,a,b);
    nand(not_b,~a,~b);
    nand(and_1,not_a,not_b);
    not(y,and_1);

endmodule