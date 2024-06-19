module nor_testbench;

    reg a,b;
    wire y;

    nor_gate uut(
        .a(a),
        .b(b),
        .y(y)
    );

    initial begin
        $display("Output : ");
        $display("a b | y");

        a=0 ;b=0; #10;
        $display("%b %b | %b",a,b,y);

        a=0 ;b=1; #10;
        $display("%b %b | %b",a,b,y);

        a=1 ;b=0; #10;
        $display("%b %b | %b",a,b,y);

        a=1 ;b=1; #10;
        $display("%b %b | %b",a,b,y);

        $finish;
    end
endmodule
