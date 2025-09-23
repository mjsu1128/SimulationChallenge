# Run the simulation to get actual results
set.seed(123)

# Parameters
initial_balance <- 1000
heads_multiplier <- 1.5  # +50% gain
tails_multiplier <- 0.6  # -40% loss
n_years <- 35  # Assuming you start at age 20, play until 55

# Function to simulate one complete game
simulate_investment_game <- function(initial, years, heads_mult, tails_mult) {
  balance <- initial
  balance_history <- numeric(years + 1)
  balance_history[1] <- initial
  
  for (year in 1:years) {
    # Flip coin (1 = heads, 0 = tails)
    coin_flip <- rbinom(1, 1, 0.5)
    
    if (coin_flip == 1) {
      # Heads: gain 50%
      balance <- balance * heads_mult
    } else {
      # Tails: lose 40%
      balance <- balance * tails_mult
    }
    
    balance_history[year + 1] <- balance
  }
  
  return(balance_history)
}

# Run single simulation
simulation_result <- simulate_investment_game(initial_balance, n_years, heads_multiplier, tails_multiplier)

# Calculate key metrics
final_balance <- simulation_result[length(simulation_result)]
total_return <- final_balance - initial_balance
total_return_percent <- ((final_balance / initial_balance) - 1) * 100
max_balance <- max(simulation_result)
min_balance <- min(simulation_result)

# Display results
cat("SIMULATION RESULTS:\n")
cat("==================\n")
cat("Initial balance (age 20): $", initial_balance, "\n", sep = "")
cat("Final balance (age 55): $", round(final_balance, 2), "\n", sep = "")
cat("Total return: $", round(total_return, 2), "\n", sep = "")
cat("Total return %: ", round(total_return_percent, 2), "%\n", sep = "")
cat("Maximum balance reached: $", round(max_balance, 2), "\n", sep = "")
cat("Minimum balance reached: $", round(min_balance, 2), "\n", sep = "")

# Show the sequence of coin flips for first 10 years
cat("\nFirst 10 coin flips (1=heads, 0=tails):\n")
for (i in 1:10) {
  coin_flip <- rbinom(1, 1, 0.5)
  cat("Year", i, ":", coin_flip, "\n")
}

# Show balance progression for first 10 years
cat("\nBalance progression (first 10 years):\n")
for (i in 1:11) {
  cat("Age", 19+i, ":", "$", round(simulation_result[i], 2), "\n")
}
