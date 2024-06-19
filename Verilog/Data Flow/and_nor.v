module and_nor_gate(input a,input b,input c,output y);

    wire m,n,o,p,q,r;

    assign m = ~(a | a);
    assign n = ~(b | b);
    assign o = ~(c | c);

    assign p = ~(m|n);
    assign r = ~(p|p);
    assign q = ~(o|r);

    assign y = q;

endmodule