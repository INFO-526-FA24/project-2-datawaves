# AR(3) model with complex cycle
library(ggplot2)
set.seed(123)

#Example 1: AR(3) with complex coefficients (0.7, 0.2, -0.4)
ar3_complex <- arima.sim(model = list(ar = c(0.7, 0.2, -0.4)), n = 200)

plot_data <- data.frame(Time = 1:200, AR_Complex = ar3_complex)
ggplot(plot_data, aes(x = Time, y = AR_Complex)) + 
  geom_line(color = "red") +
  geom_point(color = "blue", size = 3, shape = 20)+
  labs(title = "AR(3) Process with Complex Cycles: "~ 
         Y[t] == 0.7 * Y[t-1] + 0.2 * Y[t-2] - 0.4 * Y[t-3] + e[t], y = "Value")+
  theme_minimal()

#Example 2: AR(3) with complex coefficients (0.8, 0.3, -0.8)
ar3_complex <- arima.sim(model = list(ar = c(0.8, 0.3, -0.8)), n = 200)

plot_data <- data.frame(Time = 1:200, AR_Complex = ar3_complex)
ggplot(plot_data, aes(x = Time, y = AR_Complex)) + 
  geom_line(color = "red") +
  geom_point(color = "blue", size = 3, shape = 20)+
  labs(title = "AR(3) Process with Complex Cycles:" ~ 
         Y[t] == 0.8 * Y[t-1] + 0.3 * Y[t-2] - 0.8 * Y[t-3] + e[t], y = "Value")+
  theme_minimal()