import matplotlib.pyplot as plt
import random

# Function to calculate parity bits
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

# Function to encode a data block using Hamming code
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

# Function to decode a received data block using Hamming code
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
    if syndrome != 0 and syndrome <= len(received_data_block):
        received_data_block[syndrome - 1] ^= 1
    decoded_data_block = []
    for i in range(len(received_data_block)):
        if (i + 1) & i != 0:
            decoded_data_block.append(received_data_block[i])
    return decoded_data_block, syndrome

# Function to simulate transmission error based on error probability
def simulate_transmission_error(encoded_block, error_probability):
    received_block = encoded_block.copy()
    for i in range(len(received_block)):
        if random.random() < error_probability:
            received_block[i] ^= 1  # Flip the bit to simulate an error
    return received_block

# Function to simulate error probability for different block sizes
def simulate_error_probability(data, block_size, error_probability):
    blocks = ['' for _ in range(block_size)]
    for i, bit in enumerate(data):
        blocks[i % block_size] += bit

    encoded_blocks = []
    received_blocks = []
    decoded_blocks = []
    error_count = 0

    for block in blocks:
        encoded_block = hamming_encode_block(block)
        received_block = simulate_transmission_error(encoded_block, error_probability)
        received_blocks.append(received_block)
        decoded_block, syndrome = hamming_decode_block(received_block)
        decoded_blocks.append(decoded_block)
        if syndrome != 0:
            error_count += 1

    final_message = reconstruct_message(decoded_blocks, block_size)
    error_detected = final_message != data
    return error_detected, error_count

# Function to reconstruct the final message from decoded blocks
def reconstruct_message(decoded_blocks, block_size):
    final_message = ''
    max_block_length = max(len(block) for block in decoded_blocks)
    for i in range(max_block_length):
        for j in range(block_size):
            if i < len(decoded_blocks[j]):
                final_message += str(decoded_blocks[j][i])
    return final_message

# Simulation parameters
data = "1111101001010011" * 10  # Longer data for better simulation
error_probability = 0.01  # Bit error probability
block_sizes = range(1, 21)  # Simulate for block sizes 1 to 20
num_simulations = 1000  # Number of simulations to average the results

# Initialize list to store average error counts for each block size
average_error_counts = []

# Perform simulations for each block size
for block_size in block_sizes:
    total_errors = 0
    for _ in range(num_simulations):
        error_detected, error_count = simulate_error_probability(data, block_size, error_probability)
        total_errors += error_detected
    average_error_counts.append(total_errors / num_simulations)

# Plot the results
plt.plot(block_sizes, average_error_counts, label='Average error count')
plt.axhline(y=error_probability, color='r', linestyle='--', label='Bit error probability (p)')
plt.xlabel('Block Size (k)')
plt.ylabel('Average Error Count')
plt.title('Average Error Count vs. Block Size')
plt.legend()
plt.show()

