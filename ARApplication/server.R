library(shiny)
library(ggplot2)

# Define server logic for AR(r) model visualization
function(input, output, session) {
  
  # Observe the selection of a predefined model
  observeEvent(input$preset, {
    if (input$preset == "custom") {
      updateTextInput(session, "coefficients", value = "")
    } else {
      # Set coefficients based on the selected preset
      coeff_values <- switch(input$preset,
                             "ar1_0.3" = "0.3",
                             "ar1_-0.3" = "-0.3",
                             "ar2_0.5_-0.4" = "0.5, -0.4",
                             "ar2_0.2_-0.7" = "0.2, -0.7",
                             "ar2_0.4_0.1" = "0.4, 0.1",
                             "ar2_0.7_0.29" = "0.2, 0.7",
                             "ar3_0.6_0.3_-0.2" = "0.6, 0.3, -0.2")
      updateTextInput(session, "coefficients", value = coeff_values)
      updateNumericInput(session, "order", value = length(strsplit(coeff_values, ",")[[1]]))
    }
  })
  
  # Check for stationarity
  is_stationary <- reactive({
    req(input$coefficients)
    coeffs <- as.numeric(unlist(strsplit(input$coefficients, ",")))
    if (length(coeffs) != input$order) return(FALSE)
    roots <- polyroot(c(1, -coeffs))
    modulus <- Mod(roots)
    all(modulus > 1)  # Stationary if all roots' modulus is > 1
  })
  
  # Reactive expression to simulate AR process
  ar_process <- reactive({
    req(is_stationary())  # Only simulate if stationary
    coeffs <- as.numeric(unlist(strsplit(input$coefficients, ",")))
    set.seed(123)  # For reproducibility
    arima.sim(model = list(ar = coeffs), n = input$n)
  })
  
  # Plot the AR process
  output$arPlot <- renderPlot({
    req(is_stationary())  # Plot only if the model is stationary
    ar_data <- ar_process()
    plot_data <- data.frame(Time = 1:length(ar_data), Value = ar_data)
    ggplot(plot_data, aes(x = Time, y = Value)) +
      geom_line(color = "purple") +
      geom_point(color = "blue", size = 1) +
      labs(
        title = paste("AR Process with Coefficients:", input$coefficients),
        x = "Time",
        y = "Value"
      ) +
      theme_minimal()
  })
  
  # Display stability information
  output$stability <- renderText({
    req(input$coefficients)  # Ensure coefficients are entered
    coeffs <- as.numeric(unlist(strsplit(input$coefficients, ",")))
    if (length(coeffs) != input$order) {
      return("Error: Number of coefficients does not match the specified order.")
    }
    if (is_stationary()) {
      "The process is stationary. Proceed to plot."
    } else {
      "The process is not stationary. Please adjust the coefficients."
    }
  })
}
