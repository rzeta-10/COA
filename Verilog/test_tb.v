module tb;
    reg y3, y2, y1, y0;
    wire a0, a1;
    pe uut(
        .y3(y3),
        .y2(y2),
        .y1(y1),
        .y0(y0),
        .a0(a0),
        .a1(a1)
    );

    initial begin
        $display("y3 y2 y1 y0 | a1 a0");
        $monitor("%b %b %b %b | %b %b", y3, y2, y1, y0, a1, a0);

        // Test case 1: y3 has highest priority
        y3 = 1;  // y2, y1, y0 are don't care
        #10;

        // Test case 2: y2 has priority over y1 and y0
        y3 = 0; y2 = 1;  // y1, y0 are don't care
        #10;

        // Test case 3: y1 has priority over y0
        y3 = 0; y2 = 0; y1 = 1;  // y0 is don't care1
        #10;

        // Test case 4: y0 has lowest priority
        y3 = 0; y2 = 0; y1 = 0; y0 = 1; // No don't care
        #10;

        // Additional test cases can be added as needed
         
        // End simulation
        $finish;
    end
endmodule