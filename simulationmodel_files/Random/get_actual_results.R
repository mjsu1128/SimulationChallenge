# Get the actual simulation results with seed 123
set.seed(123)

# Parameters
initial_balance <- 1000
heads_multiplier <- 1.5
tails_multiplier <- 0.6
n_years <- 35

# Simulate the game
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

# Calculate key metrics
final_balance <- balance
total_return <- final_balance - initial_balance
total_return_percent <- ((final_balance / initial_balance) - 1) * 100
max_balance <- max(balance_history)
min_balance <- min(balance_history)

# Show results
cat("ACTUAL SIMULATION RESULTS:\n")
cat("==========================\n")
cat("Initial balance: $", initial_balance, "\n", sep = "")
cat("Final balance: $", round(final_balance, 2), "\n", sep = "")
cat("Total return: $", round(total_return, 2), "\n", sep = "")
cat("Total return %: ", round(total_return_percent, 2), "%\n", sep = "")
cat("Max balance: $", round(max_balance, 2), "\n", sep = "")
cat("Min balance: $", round(min_balance, 2), "\n", sep = "")

# Show the pattern
cat("\nFirst 10 years of balance:\n")
for (i in 1:11) {
  cat("Age", 19+i, ":", "$", round(balance_history[i], 2), "\n")
}

# Count heads vs tails
coin_flips <- rbinom(35, 1, 0.5)
heads_count <- sum(coin_flips)
tails_count <- 35 - heads_count
cat("\nCoin flip summary:\n")
cat("Heads:", heads_count, "Tails:", tails_count, "\n")
cat("Heads %:", round((heads_count/35)*100, 1), "%\n")
