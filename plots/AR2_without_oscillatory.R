library(ggplot2)
set.seed(123)

# Generate AR(2) process without oscillatory behavior
ar2_oscillatory <- arima.sim(model = list(ar = c(0.4, 0.1)), n = 200)

# Create data frame for plotting
plot_data <- data.frame(Time = 1:200, AR_Oscillatory = ar2_oscillatory)

# Plot with line, "O" shaped points, and equation in the title
ggplot(plot_data, aes(x = Time, y = AR_Oscillatory)) + 
  geom_line(color = "purple") + 
  geom_point(color = "blue", size = 3, shape = 20) + 
  labs(
    title = expression("AR(2) with out oscillatory behavour: " ~ Y[t] == 0.4 * Y[t-1] + 0.1 * Y[t-2] + e[t]), 
    x = "Time", 
    y = "Value"
  ) +
  theme_minimal()
