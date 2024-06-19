module kmap(input a,input b, input c,output y);

    wire not_a, not_b, not_c ;
    wire y1,y2,y3,y4,y5;

    not(not_a,a);
    not(not_b,b);
    not(not_c,c);

    and(y1,not_b,c);
    and(y2,a,not_b);
    and(y3,a,c);

    and(y4,not_a,b,not_c);

    or(y5,y1,y2,y3,y4);
    
    assign y=y5;
endmodule