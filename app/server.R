# Define server logic
server <- function(input, output, session) {
  
  # Generate a histogram plot based on the input
  output$distPlot <- renderPlot({
    # Generate random data
    x <- rnorm(500)
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    
    # Draw the histogram
    hist(x, breaks = bins, col = 'darkgray', border = 'white',
         main = "Histogram of Normal Distribution",
         xlab = "Value")
  })
  
  # Display some server information
  output$serverInfo <- renderPrint({
    info <- list(
      "R Version" = R.version.string,
      "Shiny Version" = packageVersion("shiny"),
      "Current Date" = Sys.time(),
      "Running Directory" = getwd(),
      "Session ID" = session$token
    )
    info
  })
}
