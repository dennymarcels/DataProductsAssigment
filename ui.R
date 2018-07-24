#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Predicting a Woman's Weight from her Height"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
       sliderInput("npoints",
                   "Select the number of points to be included in the regression model:",
                   min = 2,
                   max = 15,
                   value = 2),
       checkboxInput("modelline", "Show the regression line?", value = TRUE),
       textInput("height", "Enter height to predict weight: ", placeholder = "Number from 58 to 72")
    ),
      
    
    # Show a plot of the generated distribution
    mainPanel(
       h4("Are you tired of being called insensitive when your curiosity demands that you ask for women's weight? I am the ultimate solution! Ask her height instead! This awesome app will predict her weight based on her height! As a bonus, you can choose how many datapoints to include in the prediction model, so that you can check how the prediction depends on the number chosen."),
       div(),
       h3("Plot showing the number of points you chose. If you want to also see the regression line of the model, check the box at my left!"),
       plotOutput("distPlot"),
       h3("Predicted weight: "),
       textOutput("weight")
    )
  )
))
