module testbench;
    reg d00, d01, d10, d11, s0, s1;
    wire y;

    mux_4x1 uut (
        .d00(d00),
        .d01(d01),
        .d10(d10),
        .d11(d11),
        .s0(s0),
        .s1(s1),
        .y(y)
    );

    initial begin
       d00 = 1; d01 = 0; d10 = 0; d11 = 0; s0 = 0; s1 = 0;
        #10;
        $display("Test Case 1: d00=%b, d01=%b, d10=%b, d11=%b, s0=%b, s1=%b => y=%b", d00, d01, d10, d11, s0, s1,y);

        d00 = 0; d01 = 1; d10 = 0; d11 = 0; s0 = 1; s1 = 0;
        #10;
        $display("Test Case 2: d00=%b, d01=%b, d10=%b, d11=%b, s0=%b, s1=%b => y=%b", d00, d01, d10, d11, s0, s1, y);

        d00 = 0; d01 = 0; d10 = 1; d11 = 0; s0 = 0; s1 = 1;
        #10;
        $display("Test Case 3: d00=%b, d01=%b, d10=%b, d11=%b, s0=%b, s1=%b => y=%b", d00, d01, d10, d11, s0, s1, y);

        d00 = 0; d01 = 0; d10 = 0; d11 = 1; s0 = 1; s1 = 1;
        #10;
        $display("Test Case 4: d00=%b, d01=%b, d10=%b, d11=%b, s0=%b, s1=%b => y=%b", d00, d01, d10, d11, s0, s1, y);


        d00 = 1; d01 = 1; d10 = 1; d11 = 1; s0 = 0; s1 = 0;
        #10;
        $display("Test Case 5: d00=%b, d01=%b, d10=%b, d11=%b, s0=%b, s1=%b => y=%b", d00, d01, d10, d11, s0, s1, y);

        d00 = 1; d01 = 0; d10 = 1; d11 = 0; s0 = 1; s1 = 1;
        #10;
        $display("Test Case 6: d00=%b, d01=%b, d10=%b, d11=%b, s0=%b, s1=%b => y=%b", d00, d01, d10, d11, s0, s1, y);

        d00 = 1; d01 = 1; d10 = 1; d11 = 0; s0 = 0; s1 = 1;
        #10;
        $display("Test Case 7: d00=%b, d01=%b, d10=%b, d11=%b, s0=%b, s1=%b => y=%b", d00, d01, d10, d11, s0, s1, y);

        $finish;
    end
endmodule
