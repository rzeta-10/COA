import matplotlib.pyplot as plt

# Step 1: Set the bit error probability
p = 0.01  # Example error probability

# Step 2: Choose a range of block sizes to simulate
block_sizes = range(1, 101)  # Blocks of size 1 to 100

# Step 3: Choose the number of blocks to spread the data across
num_blocks = 10  # Example number of blocks

# Initialize lists to store probabilities
prob_no_error_single_block = []
prob_error_any_block = []

# Step 4-6: Calculate probabilities
for k in block_sizes:
    # Step 4: Probability of no error in a single block
    P_no_error_block = (1 - p)**k
    prob_no_error_single_block.append(P_no_error_block)
    
    # Step 5: Probability of no error in all blocks
    P_no_error_all_blocks = P_no_error_block**num_blocks
    
    # Step 6: Probability of at least one error in any block
    P_error_any_block = 1 - P_no_error_all_blocks
    prob_error_any_block.append(P_error_any_block)

# Step 7: Plot the results
plt.plot(block_sizes, prob_error_any_block, label='Probability of error in any block')
plt.axhline(y=p, color='r', linestyle='--', label='Bit error probability (p)')
plt.xlabel('Block Size (k)')
plt.ylabel('Error Probability')
plt.title('Error Probability vs. Block Size')
plt.legend()
plt.show()
