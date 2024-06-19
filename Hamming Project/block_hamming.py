import random

def calculate_parity_bits(data):
    parity_bits = []
    for i in range(len(data)):
        if (i + 1) & i == 0:
            parity = 0
            for j in range(i, len(data), (i + 1) * 2):
                for k in range(i + 1):
                    if j + k < len(data):
                        parity ^= data[j + k]
            parity_bits.append(parity)
    return parity_bits

def hamming_encode_block(data_block):
    data_block = [int(bit) for bit in data_block]
    m = len(data_block)
    r = 0
    while 2**r < m + r + 1:
        r += 1
    encoded_data_block = [0] * (m + r)
    j = 0
    for i in range(m + r):
        if (i + 1) & i == 0:
            encoded_data_block[i] = 0
        else:
            encoded_data_block[i] = data_block[j]
            j += 1
    parity_bits = calculate_parity_bits(encoded_data_block)
    for i, bit in enumerate(parity_bits):
        encoded_data_block[(2**i) - 1] = bit
    return encoded_data_block

def hamming_decode_block(received_data_block):
    r = 0
    while 2**r < len(received_data_block):
        r += 1
    syndrome = 0
    for i in range(r):
        bit_sum = 0
        for j in range(len(received_data_block)):
            if (j + 1) & (2**i) != 0:
                bit_sum += received_data_block[j]
        syndrome += (bit_sum % 2) * (2**i)
    if syndrome != 0:
        received_data_block[syndrome - 1] ^= 1
    decoded_data_block = []
    for i in range(len(received_data_block)):
        if (i + 1) & i != 0:
            decoded_data_block.append(received_data_block[i])
    return decoded_data_block, syndrome

def simulate_transmission_error(encoded_block, block_index):
    if block_index % 2 == 0:
        error_position = len(encoded_block) - 1
    else:
        error_position = 0
    encoded_block[error_position] ^= 1
    return encoded_block

def reconstruct_message(decoded_blocks, block_size):
    final_message = ''
    max_block_length = max(len(block) for block in decoded_blocks)
    for i in range(max_block_length):
        for j in range(block_size):
            if i < len(decoded_blocks[j]):
                final_message += str(decoded_blocks[j][i])
    return final_message

def transmit_message(data, block_size):
    blocks = ['' for _ in range(block_size)]
    for i, bit in enumerate(data):
        blocks[i % block_size] += bit
    print("Original data:", data)

    encoded_blocks = []
    received_blocks = []
    decoded_blocks = []

    for i, block in enumerate(blocks):
        encoded_block = hamming_encode_block(block)
        encoded_blocks.append(encoded_block)
        print(f"Block {i+1} encoded: {encoded_block}")

        # Simulate transmission error
        received_block = simulate_transmission_error(encoded_block, i)
        received_blocks.append(received_block)
        print(f"Block {i+1} received with error: {received_block}")

    all_blocks_without_parity = ""
    for block in received_blocks:
        block_without_parity = [str(bit) for index, bit in enumerate(block) if (index + 1) & index != 0]
        all_blocks_without_parity += ''.join(block_without_parity)

    print("All blocks with simulated errors (without parity bits):", all_blocks_without_parity)
        # Print all blocks with simulated errors
    print("All blocks with simulated errors:", received_blocks)

    # Start decoding the blocks with errors
    for i, received_block in enumerate(received_blocks):
        decoded_block, syndrome = hamming_decode_block(received_block)
        decoded_blocks.append(decoded_block)
        print(f"Block {i+1} decoded: {decoded_block}")
        if syndrome != 0:
            print(f"Error corrected at position: {syndrome}")
        else:
            print("No error detected.")
        print()

    final_message = reconstruct_message(decoded_blocks, block_size)
    print("Final received message:", final_message)
    return final_message


# Example usage:

# Binary data to be transmitted
data = "1111101001010011"

# Block size for encoding and decoding
block_size = 4

# Transmit the message and receive the final message after error correction
final_message = transmit_message(data, block_size)

# Check if the final received message matches the original data
if final_message == data:
    print("Success! The final received message matches the original data.")
else:
    print("Error! The final received message does not match the original data.")