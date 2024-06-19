`timescale 1ns / 1ps

module hamming_testbench;
    reg [3:0] data;
    wire [6:0] encoded_data;
    reg [6:0] received_data;
    wire [3:0] decoded_data;
    wire [2:0] syndrome;
    wire error_detected;

    // Instantiate the encoder
    hamming_encoder encoder(.data(data), .encoded_data(encoded_data));

    // Instantiate the decoder
    hamming_decoder decoder(.received_data(received_data), .decoded_data(decoded_data), .syndrome(syndrome), .error_detected(error_detected));

    initial begin
        $dumpfile("hamming_simulation.vcd"); // Specify the output VCD file
        $dumpvars(0, hamming_testbench);     // Dump all variables in the testbench
        // Initialize data
        data = 4'b0000;
        received_data = 7'b0000000;

        // Apply test vectors
        #10 data = 4'b1010; // Change input data
        #10 received_data = encoded_data; // Simulate correct transmission
        #10 received_data = encoded_data ^ 7'b0000001; // Simulate error in bit 0
        #10 received_data = encoded_data ^ 7'b0000010; // Simulate error in bit 1
        #10 received_data = encoded_data ^ 7'b0000100; // Simulate error in bit 2
        // Add more test vectors as needed

        #10 $finish; // End the simulation
    end

    // Monitor changes and print to console
    initial begin
        $monitor("Time=%g data=%b encoded_data=%b received_data=%b decoded_data=%b syndrome=%b error_detected=%b",
                 $time, data, encoded_data, received_data, decoded_data, syndrome, error_detected);
    end
endmodule
