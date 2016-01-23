
#Appication that forecasts the revenue for a company that has data for prior periods
#input data is a csv file that has revenue for prior period in months
#The data is converted to a time series and we are going to be using Holt Winters model to predict the revenue for future periods
#The input for the app would be the number of periods that we need to forecast the revenue based on historical data
#The output of the app is the total revenue for the forecasted period the revenue breakup by period for the forecast
#

library(shiny)

gddh<-read.csv("DHActuals.csv")
dh <- ts(gddh$DH,start = c(2010, 7), frequency = 12)




shinyServer(function(input, output) {
  
  #Create the model using HoltWinters algorithm
  dh.hw <- HoltWinters(dh)
   
  
  #Forecast the revenue based for the number of periods the user has chosen in the slider input
  dh.Pred <- reactive({predict(dh.hw,n.ahead=input$periods)})
  
  
  output$revFcstPlot <- renderPlot({
    
    #plot the timeseries data
    plot(dh,type="b", xlim = c(2010,2017),ylim = c(50000,300000 ), ylab = "Revuenue (USD)" )
    
    #draw the predictions based on the input slider
    lines(dh.Pred(),col=2, type="b")
  })

  output$oid1 <- renderPrint({
    sum(dh.Pred())
    })
  
  output$oid2 <- renderPrint({
    dh.Pred()
    })
  
    
})
