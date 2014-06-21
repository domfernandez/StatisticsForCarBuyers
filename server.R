library(shiny)
library(datasets)
library(ggplot2)


mtcars$am <- factor(mtcars$am,levels=c(0,1),
                    labels=c("Automatic","Manual"))

data <- mtcars

dat <- mtcars



# Define server logic required to plot variables
shinyServer(function(input, output) {
  
  
  # Create a reactive text
  text <- reactive({
    paste(input$variable, 'versus', input$variable2)
  })
  
  # Return as text the selected variables
  output$caption <- renderText({
    text()
  })
  
  # Generate a plot of the requested variables
  output$plot <- renderPlot({
    p <- ggplot(data, aes_string(x=input$variable, y=input$variable2, colour="am")) + geom_point()
    p <- p + geom_smooth(aes(group=am), method="lm")
    print(p)
  })
  
  
  
  output$independent <- renderUI({
    checkboxGroupInput("independent", "Independent Variables:",names(dat)[!names(dat) %in% input$dependent],names(dat)[!names(dat) %in% input$dependent])
  })
  
  runRegression <- reactive({
    lm(as.formula(paste(input$dependent," ~ ",paste(input$independent,collapse="+"))),data=dat)
  })
  
  output$regTab <- renderTable({
    if(!is.null(input$independent)){
      summary(runRegression())$coefficients
    } else {
      print(data.frame(Warning="Please select Model Parameters."))
    }
  })  
})