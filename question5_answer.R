# Calculate Question 5 answer
set.seed(123)

# Parameters
initial_balance <- 1000
heads_multiplier <- 1.5
tails_multiplier <- 0.6
n_years <- 35
n_simulations <- 100

# Function to simulate one complete game
simulate_investment_game <- function(initial, years, heads_mult, tails_mult) {
  balance <- initial
  for (year in 1:years) {
    coin_flip <- rbinom(1, 1, 0.5)
    if (coin_flip == 1) {
      balance <- balance * heads_mult
    } else {
      balance <- balance * tails_mult
    }
  }
  return(balance)
}

# Run 100 simulations
final_balances <- replicate(n_simulations, 
  simulate_investment_game(initial_balance, n_years, heads_multiplier, tails_multiplier))

# Calculate probability that balance > $1,000
prob_above_1000 <- mean(final_balances > 1000)
count_above_1000 <- sum(final_balances > 1000)

# Calculate confidence interval
n_sims <- length(final_balances)
se <- sqrt(prob_above_1000 * (1 - prob_above_1000) / n_sims)
ci_lower <- prob_above_1000 - 1.96 * se
ci_upper <- prob_above_1000 + 1.96 * se

# Display answer
cat("QUESTION 5 ANSWER:\n")
cat("==================\n")
cat("Probability that balance > $1,000 at age 55:\n")
cat("  ", round(prob_above_1000 * 100, 1), "%\n", sep = "")
cat("  (", count_above_1000, " out of ", n_sims, " simulations)\n", sep = "")
cat("\n95% Confidence Interval: [", round(ci_lower * 100, 1), "%, ", round(ci_upper * 100, 1), "%]\n", sep = "")

# Additional context
cat("\nAdditional Information:\n")
cat("  Mean final balance: $", round(mean(final_balances), 2), "\n", sep = "")
cat("  Median final balance: $", round(median(final_balances), 2), "\n", sep = "")
cat("  Min final balance: $", round(min(final_balances), 2), "\n", sep = "")
cat("  Max final balance: $", round(max(final_balances), 2), "\n", sep = "")


