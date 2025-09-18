# Calculate what the simulation with seed 123 would produce
set.seed(123)

# Simulate the coin flips
coin_flips <- rbinom(35, 1, 0.5)
print("First 10 coin flips (1=heads, 0=tails):")
print(coin_flips[1:10])

# Calculate balance progression
balance <- 1000
balance_history <- c(balance)

for (i in 1:35) {
  if (coin_flips[i] == 1) {
    balance <- balance * 1.5  # Heads: +50%
  } else {
    balance <- balance * 0.6  # Tails: -40%
  }
  balance_history <- c(balance_history, balance)
}

# Show results
cat("SIMULATION RESULTS:\n")
cat("==================\n")
cat("Initial balance: $1000\n")
cat("Final balance: $", round(balance, 2), "\n", sep = "")
cat("Total return: $", round(balance - 1000, 2), "\n", sep = "")
cat("Total return %: ", round(((balance / 1000) - 1) * 100, 2), "%\n", sep = "")
cat("Max balance: $", round(max(balance_history), 2), "\n", sep = "")
cat("Min balance: $", round(min(balance_history), 2), "\n", sep = "")

# Show first 10 years
cat("\nFirst 10 years:\n")
for (i in 1:11) {
  cat("Age", 19+i, ":", "$", round(balance_history[i], 2), "\n")
}
