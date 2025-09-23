# Manual calculation of simulation with seed 123
set.seed(123)

# Get the exact sequence of coin flips
coin_flips <- rbinom(35, 1, 0.5)
print("Coin flips sequence:")
print(coin_flips)

# Calculate step by step
balance <- 1000
cat("Starting balance: $1000\n")

for (i in 1:35) {
  if (coin_flips[i] == 1) {
    balance <- balance * 1.5
    cat("Year", i, "- Heads: $", round(balance, 2), "\n", sep = "")
  } else {
    balance <- balance * 0.6
    cat("Year", i, "- Tails: $", round(balance, 2), "\n", sep = "")
  }
}

cat("\nFinal result: $", round(balance, 2), "\n", sep = "")
cat("Total return: ", round(((balance/1000) - 1) * 100, 2), "%\n", sep = "")
