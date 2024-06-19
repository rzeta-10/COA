module testbench;

    reg a, b, c;
    wire y;
   
    and3 uut (
        .a(a),
        .b(b),
        .c(c),
        .y(y)
    );

    initial begin
        $display("Output:");
        $display("a b c | y");
   
        a = 0; b = 0; c = 0; #10;
        $display("%b %b %b | %b", a, b, c, y);
       
        a = 0; b = 0; c = 1;#10;
        $display("%b %b %b | %b", a, b, c, y);
       
        a = 0; b = 1; c = 0;#10;
        $display("%b %b %b | %b", a, b, c, y);
       
        a = 0; b = 1; c = 1;#10;
        $display("%b %b %b | %b", a, b, c, y);
       
        a = 1; b = 0; c = 0; #10;
        $display("%b %b %b | %b", a, b, c, y);
       
        a = 1; b = 0; c = 1; #10;
        $display("%b %b %b | %b", a, b, c, y);
       
       a = 1; b = 1; c = 0;#10;
        $display("%b %b %b | %b", a, b, c, y);
       
       a = 1; b = 1; c = 1; #10;
        $display("%b %b %b | %b", a, b, c, y);
       

        $finish;
    end
   
endmodule
