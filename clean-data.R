#Clean-data.R

load("sample_data.RData")

#make it all lowercase
snews<-tolower(snews)

#remove numbers and punctuation
noNumbersOrPunctionation <-function (x) gsub("[^a-zA-Z\n\']", " ", x)

#to change the \" to ", just run it through cat(), may not need this if last line takes care of it
snews<-cat(sample_news)

#collapse multiple white spaces into one space
onespace<-function (x) gsub( "\\s+", " ", x, perl = TRUE )
snews <- onespace(snews)

#get rid of leading and trailing whitespace
trim <- function (x) gsub("^\\s+|\\s+$", "", x, perl=TRUE)
snews<-trim(snews)

#remove numbers and punctuation
noNumbersOrPunctionation <-function (x) gsub("[^a-zA-Z\n\']", " ", x)