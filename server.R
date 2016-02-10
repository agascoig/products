library(shiny)

require(datasets)
data(mtcars)
mydata<-mtcars
mydata$am<-as.factor(mydata$am)

shinyServer(
        function(input, output, session) {
                fit1<-reactive({
                        lm(as.formula(paste(colnames(mydata)[1], "~",
                                            paste(colnames(mydata)[as.integer(input$checkGroup)], collapse = "+"),
                                            sep = "")),data=mydata)
                })
                output$table1 <- renderTable({summary(fit1())})
                output$plot1 <- renderPlot({plot(fit1(),which=1)})
                output$plot2 <- renderPlot({plot(fit1(),which=2)})
                output$plot3 <- renderPlot({plot(fit1(),which=3)})
                output$plot4 <- renderPlot({plot(fit1(),which=4)})
                output$table2 <- renderTable({mtcars})
        }
)
