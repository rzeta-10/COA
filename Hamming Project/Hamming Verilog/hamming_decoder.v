module hamming_decoder(input [6:0] received_data, output [3:0] decoded_data, output [2:0] syndrome, output error_detected);
    // Calculate syndrome
    assign syndrome[0] = received_data[0] ^ received_data[2] ^ received_data[4] ^ received_data[6];
    assign syndrome[1] = received_data[1] ^ received_data[2] ^ received_data[5] ^ received_data[6];
    assign syndrome[2] = received_data[3] ^ received_data[4] ^ received_data[5] ^ received_data[6];
    assign error_detected = |syndrome;  // Error detected if syndrome is non-zero

    // Correct the error if detected (simple example for a single-bit error)
    wire [6:0] corrected_data = syndrome ? received_data ^ (1 << (syndrome - 1)) : received_data;

    // Extract original data
    assign decoded_data[0] = corrected_data[2];
    assign decoded_data[1] = corrected_data[4];
    assign decoded_data[2] = corrected_data[5];
    assign decoded_data[3] = corrected_data[6];
endmodule
