module and_nor_gate(input a,input b,input c,output y);

    wire m,n,o,p,q,r;

    nor(m,a,a);
    nor(n,b,b);
    nor(o,c,c);

    nor(p,m,n);
    nor(r,p,p);
    nor(y,o,r);
    
endmodule