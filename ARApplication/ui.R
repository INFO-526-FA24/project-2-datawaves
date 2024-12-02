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
                    "AR(1): a1 = 0.5" = "ar1_0.5",
                    "AR(1): a1 = -0.7" = "ar1_-0.7",
                    "AR(2): a1 = 0.5, a2 = -0.4" = "ar2_0.5_-0.4",
                    "AR(2): a1 = 0.2, a2 = -0.7" = "ar2_0.2_-0.7"
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
