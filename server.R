#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  womensub <- reactive({
    npoints <- input$npoints
    women[sample(1:dim(women)[1], npoints),]
  })
  
  model <- reactive({
    set.seed(1)
    lm(weight ~ height, data = womensub())
  })
  
  pred <- reactive({
    height <- input$height
    predict(model(), newdata = data.frame(height = as.numeric(height)))   
  })
  
  output$weight <- renderText({
    pred()
  })
   
  output$distPlot <- renderPlot({
    height <- input$height
    plot(womensub()$height, womensub()$weight, xlim = range(women$height), ylim = range(women$weight), xlab= "height", ylab = "weight")
    if(input$modelline) {
      abline(model(), col = "red")
      points(height, pred(), col = "red", pch = "X")
    }
  })
})