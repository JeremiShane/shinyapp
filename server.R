
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyServer(function(input, output) {

        model1 <- lm(mpg ~ hp, data=mtcars)
                
        model1pred <- reactive({
                hpInput <- input$sliderHP
                predict(model1, newdata = data.frame(hp = hpInput))
        })
        
        output$plot1 <- renderPlot({
                hpInput <- input$sliderHP
                
                plot(mtcars$hp, mtcars$mpg, xlab = "Horsepower",
                     ylab = "Miles Per Gallon", bty = "n", pch = 16,
                     xlim = c(50, 350), ylim = c(10,50))
                abline(model1, col="red", lwd = 2)
                
                legend(25, 250, c("MPG Prediction"), pch=16, 
                       col = c("red", "blue"), bty = "n", cex = 1.2)
                points(hpInput, model1pred(), col="red", pch = 16, cex=2)
        })
                
        output$pred1 <- renderText({
                model1pred()
        })
        
})