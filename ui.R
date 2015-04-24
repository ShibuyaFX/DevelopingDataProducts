library(shiny)

# Define UI for Central Limit Theorem application
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Central Limit Theorem Demonstration"),
  br(),
  p("This application aims to quickly demonstrate the basic idea of Central Limit Theorem using the exponential distribution. The CLT states that the distribution of averages becomes that of a standard normal as the sample size of the simulation increases and that the distribution will be centered at the population mean. Each sample in this application is the average of 40 exponentials. The lamda rate is 0.2. Population mean is 5, which is depicted by the Red line."),
  p("The idea here is to use the widget below to change the number of simulations so as to see the changes in the distribution plot and see how it converges to the population mean and taking the shape of a normal distribution."),
  br(),
  div("The number of simulations and colour of the histogram is configurable below. Note that the computation time increases when the number of simulation increases. Change in colour of the histogram would also require a re-computation.", style = "color:blue"),
  
  # Sidebar with a slider input for the number of simulations
  sidebarLayout(
    sidebarPanel(
      sliderInput("sim",
                  h3("Number of simulations:"),
                  min = 10,
                  max = 15000,
                  value =10),
    # A select dropdown box for the colour of the histogram  
      selectInput("Colours", label = h3("Colour of the histogram"), 
                  choices = list("Yellow" = 7, "Green" = 3, "Black" = 1), selected = 7)
  ),
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("CLTPlot")
    )
  )
))
