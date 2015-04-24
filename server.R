library(shiny)
library(foreach)
library(doParallel)
library (grid)
library (gridExtra)
library(ggplot2)

# Define server logic required to compute exponential distribution and draw a histogram
shinyServer(function(input, output) {
  
  Cores <- detectCores()
  if(Cores >2) {Cores <- Cores-2}
  cl <- makeCluster(Cores)
  registerDoParallel(cl)
  #lambda <- 0.2
  #expo <- 40
  
  output$CLTPlot <- renderPlot({
    samp <- foreach(icount(input$sim), .combine = rbind) %dopar% round(mean(rexp(40,0.2)),2)
    colnames(samp) <- c("x")
    samp <- as.data.frame(samp)

    # drawing the histogram using ggplot
    g1 <- ggplot(samp, aes(x = x)) + geom_histogram(binwidth=.2, colour = "black", fill = input$Colours, aes(y = ..density..) )
    g1 <- g1 + geom_vline(xintercept =5, size=2, colour = "red") + stat_density(colour = "blue", geom = "line", position = "identity", size = 1.5)
    g1 <- g1 + labs( x = "Mean")
    g1
  })
})