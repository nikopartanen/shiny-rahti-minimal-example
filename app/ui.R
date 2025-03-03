# Define UI
ui <- fluidPage(
  titlePanel("Minimal Shiny App for Rahti"),
  
  sidebarLayout(
    sidebarPanel(
      sliderInput("bins",
                  "Number of bins:",
                  min = 1,
                  max = 50,
                  value = 30)
    ),
    
    mainPanel(
      plotOutput("distPlot"),
      hr(),
      h4("Server Information:"),
      verbatimTextOutput("serverInfo")
    )
  )
)
