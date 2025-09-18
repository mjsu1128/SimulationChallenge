# Test R code for Question 1
initial_balance <- 1000
heads_multiplier <- 1.5  # +50% gain
tails_multiplier <- 0.6  # -40% loss
probability_heads <- 0.5

# Calculate possible outcomes after 1 coin flip
heads_outcome <- initial_balance * heads_multiplier
tails_outcome <- initial_balance * tails_multiplier

# Calculate expected value
expected_value <- probability_heads * heads_outcome + (1 - probability_heads) * tails_outcome

# Display results
cat("Expected Value Analysis (1 coin flip):\n")
cat("=====================================\n")
cat("Initial balance: $", initial_balance, "\n", sep = "")
cat("Heads outcome (50% gain): $", heads_outcome, "\n", sep = "")
cat("Tails outcome (40% loss): $", tails_outcome, "\n", sep = "")
cat("Probability of heads: ", probability_heads, "\n", sep = "")
cat("Probability of tails: ", 1 - probability_heads, "\n", sep = "")
cat("\nExpected Value = P(Heads) × Heads_Outcome + P(Tails) × Tails_Outcome\n")
cat("Expected Value = ", probability_heads, " × $", heads_outcome, " + ", 1 - probability_heads, " × $", tails_outcome, "\n", sep = "")
cat("Expected Value = $", expected_value, "\n", sep = "")
cat("\nAnswer: The expected value after 1 coin flip is $", expected_value, "\n", sep = "")
