module pe(input y3, input y2, input y1, input y0, output a0, output a1);
not (y2n,y2);
and(and_out,y2n,y1);
or(a1,y3,y2);
or(a0,and_out,y3);
endmodule