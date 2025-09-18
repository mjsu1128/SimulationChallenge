# Get exact simulation results
set.seed(123)

# Simulate the exact same way as the Quarto document
initial_balance <- 1000
heads_multiplier <- 1.5
tails_multiplier <- 0.6
n_years <- 35

balance <- initial_balance
balance_history <- c(balance)

for (year in 1:n_years) {
  coin_flip <- rbinom(1, 1, 0.5)
  if (coin_flip == 1) {
    balance <- balance * heads_multiplier
  } else {
    balance <- balance * tails_multiplier
  }
  balance_history <- c(balance_history, balance)
}

# Show key results
cat("SIMULATION RESULTS:\n")
cat("Final balance: $", round(balance, 2), "\n", sep = "")
cat("Total return: ", round(((balance/1000) - 1) * 100, 2), "%\n", sep = "")
cat("Max balance: $", round(max(balance_history), 2), "\n", sep = "")
cat("Min balance: $", round(min(balance_history), 2), "\n", sep = "")

# Show if above or below initial
if (balance > 1000) {
  cat("Result: ABOVE initial investment\n")
} else {
  cat("Result: BELOW initial investment\n")
}
