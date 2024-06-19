module tb;
    reg a, b,c;
    wire y;
    kmap uut (
        .a(a),
        .b(b),
        .c(c),
        .y(y)
    );
    initial begin
        a = 0;
        b = 0;
        c = 0;
        $display("A B C | ouptut");
        $monitor("%b %b %b | %b", a, b,c,y);
        #10;

        c = 1;
        #10;
        b = 1;
        c = 0;

        #10;
        c = 1;

        #10;
        a = 1;
        b = 0;
        c = 0;
        
        #10;
        c = 1;

        #10;
        b = 1;
        c = 0;

        #10;
        c = 1;
        #10;

        $finish;
    end
endmodule