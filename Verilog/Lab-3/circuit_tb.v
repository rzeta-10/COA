module tb;
    reg a, b,c,d,e,f,g;
    wire y;

    circuit uut (
        .a(a),
        .b(b),
        .c(c),
        .d(d),
        .e(e),
        .f(f),
        .g(g),
        .y(y)
    );

    initial begin
        a = 0;
        b = 0;
        c = 0;
        d = 0;
        e = 0;
        f = 0;
        g = 0;

        $display("A B C D E F G| ouptut");
        $monitor("%b %b %b %b %b %b %b | %b", a, b,c,d,e,f,g,y);

        #10;
        c = 1;
        d = 1;

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
        f = 1;
        g = 1;
        e = 1;

        #10;
        e = 0;

        #10;
        c = 0;
        d = 1;
        f = 0;

        #10;

        $finish;
    end
endmodule