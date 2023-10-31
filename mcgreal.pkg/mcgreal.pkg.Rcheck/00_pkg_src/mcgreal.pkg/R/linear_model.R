#This statistical function will run a linear model to explore how accelerometer or gyroscope data (independent variables) may be associated with or predict behaviors (the dependent variable).
#The 3 independent variables represent the X, Y, and Z axes of either accelerometer or gyroscope data

runLinearModel <- function(data, dependent_var, independent_var1, independent_var2, independent_var3) {
  formula <- as.formula(paste(dependent_var, "~", independent_var1, "+", independent_var2, "+", independent_var3))
  model <- lm(formula, data = data)
  model_summary <- summary(model)
  return(model_summary)
}
