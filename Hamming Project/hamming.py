def calculate_parity_bits(data):
    parity_bits = []

    # Calculate parity bits
    for i in range(len(data)):
        if (i + 2) & (i + 1) == 0:  # Check if the position is a power of 2
            parity = 0
            for j in range(i, len(data), (i + 1) * 2):
                parity ^= int(data[j])
            parity_bits.append(parity)
    
    return parity_bits

def hamming_encode(data):
    # Calculate the number of parity bits needed
    m = len(data)
    r = 0
    while 2**r < m + r + 1:
        r += 1

    # Insert parity bits placeholders
    encoded_data = [None] * (m + r)
    j = 0
    for i in range(1, m + r + 1):
        if i & (i - 1) == 0:  # Check if the position is a power of 2
            encoded_data[i - 1] = 0
        else:
            encoded_data[i - 1] = int(data[j])
            j += 1
    
    # Calculate parity bits
    parity_bits = calculate_parity_bits(encoded_data)

    # Insert parity bits into correct positions
    for i, bit in enumerate(parity_bits):
        encoded_data[2**i - 1] = bit
    
    return encoded_data

def hamming_decode(received_data):
    # Calculate the number of parity bits
    r = 0
    while 2**r < len(received_data):
        r += 1

    # Calculate syndrome
    syndrome = 0
    for i in range(r):
        bit_sum = 0
        for j in range(len(received_data)):
            if (j + 1) & (2**i) != 0:  # Check if jth bit should be used for this parity
                bit_sum += received_data[j]
        syndrome += (bit_sum % 2) * (2**i)
    print(syndrome-1)
    # Check if there's an error
    if syndrome != 0:
        # Correct the error
        received_data[syndrome - 1] ^= 1

    # Remove parity bits
    decoded_data = []
    for i in range(len(received_data)):
        if (i + 1) & (i + 1 - 1) != 0:  # Check if the position is not a power of 2
            decoded_data.append(received_data[i])

    return decoded_data

# Example usage:
data = "1010"  
print("data:",data)# Example data
encoded_data = hamming_encode(data)
print("Encoded data:", encoded_data)

# Simulate a single-bit error
encoded_data[5] ^= 1
print("Received data with error:", encoded_data)

decoded_data = hamming_decode(encoded_data)
print("Decoded data:", decoded_data)