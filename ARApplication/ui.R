library(shiny)

# Define UI for AR(r) model visualization
fluidPage(
  # Application title
  titlePanel("Interactive AR(r) Model Visualization"),
  
  # Sidebar layout for inputs and outputs
  sidebarLayout(
    sidebarPanel(
      selectInput("preset", 
                  "Select Predefined Model:", 
                  choices = list(
                    "Custom" = "custom",
                    "AR(1): a1 = 0.3" = "ar1_0.3",
                    "AR(1): a1 = -0.3" = "ar1_-0.3",
                    "AR(2): a1 = 0.5, a2 = -0.4" = "ar2_0.5_-0.4",
                    "AR(2): a1 = 0.2, a2 = -0.7" = "ar2_0.2_-0.7",
                    "AR(2): a1 = 0.4, a2 = 0.1" = "ar2_0.4_0.1",
                    "AR(2): a1 = 0.7, a2 = 0.29" = "ar2_0.7_0.29",
                    "AR(3): a1 = 0.6, a2 = 0.3, a3 = -0.2" = "ar3_0.6_0.3_-0.2"
                  )),
      
      numericInput("order", 
                   "Order of AR Model (r):", 
                   value = 1, 
                   min = 1, 
                   max = 10),
      
      textInput("coefficients", 
                "AR Coefficients (comma-separated):", 
                value = "0.5"),
      
      numericInput("n", 
                   "Number of Observations:", 
                   value = 200, 
                   min = 50, 
                   max = 1000)
    ),
    
    # Main panel for plots and stability message
    mainPanel(
      plotOutput("arPlot"),
      textOutput("stability")
    )
  )
)
