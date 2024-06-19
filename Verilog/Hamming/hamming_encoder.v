module hamming_encoder(input [3:0] data, output [6:0] encoded_data);
    // Calculate parity bits
    assign encoded_data[0] = data[0] ^ data[1] ^ data[3];
    assign encoded_data[1] = data[0] ^ data[2] ^ data[3];
    assign encoded_data[2] = data[0];
    assign encoded_data[3] = data[1] ^ data[2] ^ data[3];
    assign encoded_data[4] = data[1];
    assign encoded_data[5] = data[2];
    assign encoded_data[6] = data[3];
endmodule
