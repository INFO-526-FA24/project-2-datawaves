# Using arima.sim to simulate ARIMA(0,1,0) (Random Walk)
library(ggplot2)
set.seed(123)
random_walk_arima <- arima.sim(model = list(order = c(0, 1, 0)), n = 200)

#Create a data frame
plot_data <- data.frame(Time = 1:201, Value = random_walk_arima)

# Plotting the random walk (ARIMA(0,1,0))
ggplot(plot_data, aes(x = Time, y = Value)) + 
  geom_line(color = "red") + 
  geom_point(color  = "red")+
  labs(title = "Simulated Random Walk using ARIMA(0,1,0)",
       subtitle = ~  Y[t] == Y[t-1] + e[t],
       x = "Time",
       y = "Value") + 
  theme_minimal()
