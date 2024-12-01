library(ggplot2)
set.seed(123)

# Using arima.sim to simulate ARIMA(0,1,0) (Random Walk)
random_walk_arima <- arima.sim(model = list(order = c(0, 1, 0)), n = 199)

# Using arima.sim to simulate AR(1)
ar1_process<- arima.sim(model = list(ar = 0.6), n = 200)

#plotting
df <- data.frame(
  Time = rep(1:200, 2),
  Value = c(random_walk_arima, ar1_process),
  Process = rep(c("Random Walk", "AR(1) Process"), each = 200)
)

ggplot(df, aes(x = Time, y = Value, color = Process)) + 
  geom_line() + 
  labs(title = "Random Walk vs. AR(1) Process",
       x = "Time",
       y = "Value",
       color = "Process") +  
  theme_minimal()+
  theme(
    legend.text = element_text(size = 6),  
    legend.title = element_text(size = 7), 
    legend.key.size = unit(0.5, "cm"))