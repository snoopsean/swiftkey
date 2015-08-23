library(shiny)
library(datasets)

#declare some functions
#remove numbers and punctuation
noNumPunc <-function (x) gsub("[^a-zA-Z\n\']", " ", x)
#get rid of leading and trailing whitespace
trim <- function (x) gsub("^\\s+|\\s+$", "", x, perl=TRUE)
#collapse multiple white spaces into one space
onespace<-function (x) gsub( "\\s+", " ", x, perl = TRUE )

#load my bigram and trigram models
load(file = "gram2tableOpt.Rdata")
load(file = "gram3tableOpt.Rdata")

# Define server logic required to summarize and view the selected dataset
shinyServer(function(input, output) {
  
  output$lastword <- reactive({
    myData<-tolower(trim(onespace(noNumPunc(input$sentence))))
    #chop the input into words
    s <- unlist(strsplit(myData, " "))
    #get the last 2 words
    l<-length(s)
    tinput2<-paste(s[l-1],s[l],sep=" ")
    #get the last word
    tinput1<-s[l]
    # create a regular expression to pass into grep
    #could combine with previous 2 lines 
    t2<-paste("^",tinput2," ",sep="")
    t1<-paste("^",tinput1," ",sep="")
    
    fm<-unlist(strsplit(head(grep(t2,gram3tableOpt,value=TRUE),1)," "))[3]
    
    #if no match
    if(length(fm)==0)
    {
      fm<-unlist(strsplit(head(grep(t1,gram2tableOpt,value=TRUE),1)," "))[2]
    }
    
    # if still no match
    if(length(fm)==0)
    {
      #return "the"
      fm<-"the"
    }
    
    fm
  })
  
})
