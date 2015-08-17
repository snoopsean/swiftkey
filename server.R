library(shiny)
library(datasets)

# Define server logic required to summarize and view the selected dataset
shinyServer(function(input, output) {
    
    output$lastword <- reactive({
    myData<-input$sentence
    s <- strsplit(myData, " ")[[1]]
    paste(substring(s,1,1))
    })
    
})