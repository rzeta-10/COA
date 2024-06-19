module adder(input a, input b, input c, output sum, output carry);

    wire s;
    xor(s,a,b,c);

    wire d1,d2,d3;
    xor(d1,a,b);

    and(d2,d1,c);
    and(d3,a,b);
    or(d4,d2,d3);
    
    assign sum=s;
    assign carry=d4;
endmodule