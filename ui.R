library(shiny)

# Define UI for dataset viewer application
shinyUI(fluidPage(
  
  # Application title
  headerPanel("Next word prediction"),
  
  # Show a summary of the dataset and an HTML table with the requested
  # number of observations
  mainPanel(
    textInput("sentence","Type your sentence here:","Hello my name is"),
    textOutput("lastword")
  )
))