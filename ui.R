library(shiny)

desc<-paste("A small (N=24) dataset from a 1974 Motor Trend US Magazine is used by this application to study",
            "variables that affect miles per gallon (MPG).  Select the variables used to fit a linear model
            for MPG on the left, and then click the Run Regression button to fit the model.")
        
shinyUI(
        pageWithSidebar(
                # Application title
                titlePanel("Miles Per Gallon Regression Application"),
                sidebarPanel(
                        checkboxGroupInput("checkGroup",
                                           label=h3("Regressors"),
                                           choices = list("Number of Cylinders"=2,
                                                          "Displacement"=3,
                                                          "Gross Horesepower"=4,
                                                          "Real axle ratio"=5,
                                                          "Vehicle Weight"=6,
                                                          "Quarter-Mile Time"=7,
                                                          "V/S"=8,
                                                          "Automatic Transmission"=9,
                                                          "Number of Forward Gears"=10,
                                                          "Number of Carburetors"=11),select=c(6,4)),
                        submitButton("Run Regression")
                ),
                mainPanel(
                        p("Alex Gascoigne"),
                        p("February 10th, 2016"),
                        hr(),
                        p(desc),
                        hr(),
                        tableOutput("table1"),
                        hr(),
                        plotOutput("plot1"),
                        plotOutput("plot2"),
                        plotOutput("plot3"),
                        plotOutput("plot4"),
                        hr(),
                        h4("mtcars dataset"),
                        tableOutput("table2")
                )
        )
)