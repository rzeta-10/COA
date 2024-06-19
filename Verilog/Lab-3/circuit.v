module circuit(input a,input b, input c, input d,input e, input f, input g,output y);

    wire not_c,not_e, not_f;
    wire y1,y2,y3,y4,y5,not_y5,y6;

    not(not_c,c);
    not(not_e,e);
    not(not_f,f);
    not(not_y5,y5);

    and(y1,a,b);
    and(y2,not_c,d);
    and(y3,not_e,y2);
    and(y4,y3,y1);

    xor(y5,not_f,g);
    and(y6,y4,not_y5);
    
    assign y=y6;
endmodule