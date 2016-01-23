
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/
#

library(shiny)

shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("Company Revenue Forecast using Holt Winters model"),
  
  # Sidebar with a slider input for number of bins
  sidebarPanel(
    sliderInput("periods",
                "Number of periods to Forecast:",
                min = 1,
                max = 12,
                value = 3)
  ),
  
  # Show a plot of the generated distribution
  mainPanel(
    plotOutput("revFcstPlot"),
  
    h4("Revenue breakup"),
    verbatimTextOutput("oid2"),
    
    h4('Total revenue for the forecasted periods'),
    verbatimTextOutput("oid1")
    
  
  )
  
 
))
