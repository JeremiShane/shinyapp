
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(
        
        # Application title
        titlePanel("Predict MPG from Horsepower"),
        
        # Sidebar with a slider input for number of bins
        sidebarLayout(
                sidebarPanel(
                        sliderInput("sliderHP", "Use the slider to select the horsepower of your car of interest, and see the predicted MPG below.",
                                    50, 350, value = 120),
                       h3("Predicted MPG:"),
                       textOutput("pred1")
                ),
                
                # Show the plot
                mainPanel(
                        plotOutput("plot1")
                     
                )
        )
))