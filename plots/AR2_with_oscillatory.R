library(ggplot2)
set.seed(123)


# Function to plot AR(2) process
plot_ar2_process <- function(ar_coeffs, title_expression) {
  # Generate AR(2) process
  ar_process <- as.numeric(arima.sim(model = list(ar = ar_coeffs), n = 200))
  
  # Create data frame for plotting
  plot_data <- data.frame(Time = 1:200, AR_Oscillatory = ar_process)
  
  ggplot(plot_data, aes(x = Time, y = AR_Oscillatory)) + 
    geom_line(color = "red") + 
    geom_point(color = "blue", size = 3, shape = 20) + 
    labs(
      title = title_expression,
      x = "Time", 
      y = "Value"
    ) +
    theme_minimal()
}

# Example 1: AR(2) with coefficients (0.5, -0.4)
plot_ar2_process(
  ar_coeffs = c(0.5, -0.4),
  title_expression = expression("AR(2) With Oscillatory Behavior: " ~ 
                                  Y[t] == 0.5 * Y[t-1] - 0.4 * Y[t-2] + e[t])
)

# Example 2: AR(2) with coefficients (0.2, -0.7)
plot_ar2_process(
  ar_coeffs = c(0.2, -0.7),
  title_expression = expression("AR(2) With Oscillatory Behavior: " ~ 
                                  Y[t] == 0.2 * Y[t-1] - 0.7 * Y[t-2] + e[t])
)
