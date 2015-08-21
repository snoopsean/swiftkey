#Clean-data.R

load("sample_data.RData")

#join the samples into 1
sample_joined<-c(sample_news,sample_blogs,sample_twitter)

#clean memory
rm(sample_blogs,sample_news,sample_twitter)

#remove numbers and punctuation
noNumPunc <-function (x) gsub("[^a-zA-Z\n\']", " ", x)

#get rid of leading and trailing whitespace
trim <- function (x) gsub("^\\s+|\\s+$", "", x, perl=TRUE)

#collapse multiple white spaces into one space
onespace<-function (x) gsub( "\\s+", " ", x, perl = TRUE )

#run all three cleaning functions, and make it lowercase
sample_clean<-tolower(trim(onespace(noNumPunc(sample_joined))))

rm(sample_joined)

library(stylo)
#split the text into words so that make.ngrams can understand it
sample_clean<-txt.to.words(sample_clean)

#get our ngrams
gram1<-make.ngrams(sample_clean,1)
gram2<-make.ngrams(sample_clean,2)
gram3<-make.ngrams(sample_clean,3)
gram4<-make.ngrams(sample_clean,4)
gram5<-make.ngrams(sample_clean,5)

rm(sample_clean)

#make a table using the unigram frequencies
gram1table<-sort(table(gram1),decreasing=TRUE)
gram2table<-sort(table(gram2),decreasing=TRUE)
gram3table<-sort(table(gram3),decreasing=TRUE)
gram4table<-sort(table(gram4),decreasing=TRUE)
gram5table<-sort(table(gram5),decreasing=TRUE)

save(gram1,gram2,gram3,gram4,gram5,gram1table,gram2table,gram3table,gram4table,
     gram5table,file = "ngrams.Rdata")

rm(gram1,gram2,gram3,gram4,gram5,gram1table,gram2table,gram3table,gram4table,
   gram5table)

load("ngrams.Rdata")
