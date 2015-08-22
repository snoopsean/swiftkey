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
#if i do it this way don't becomes don t, do i want that
# or do i want dont to be one gram? if so, ill change the noNumPunc
# to replace numbers and punctuation with a "" instead of " "
sample_clean<-tolower(trim(onespace(noNumPunc(sample_joined))))

rm(sample_joined)

library(stylo)
#split the text into words so that make.ngrams can understand it
sample_clean<-txt.to.words(sample_clean)

#get our ngrams
#could clean this up to do it through a loop, and remove things from ram during each loop
gram1<-make.ngrams(sample_clean,1)
gram2<-make.ngrams(sample_clean,2)
gram3<-make.ngrams(sample_clean,3)
gram4<-make.ngrams(sample_clean,4)
gram5<-make.ngrams(sample_clean,5)
gram6<-make.ngrams(sample_clean,6)

rm(sample_clean)

#make a table using the unigram frequencies
gram1table<-sort(table(gram1),decreasing=TRUE)
gram2table<-sort(table(gram2),decreasing=TRUE)
gram3table<-sort(table(gram3),decreasing=TRUE)
gram4table<-sort(table(gram4),decreasing=TRUE)
gram5table<-sort(table(gram5),decreasing=TRUE)
gram6table<-sort(table(gram6),decreasing=TRUE)

save(gram1,file="ngram1.Rdata") ; rm(gram1)
save(gram2,file="ngram2.Rdata") ; rm(gram2)
save(gram3,file="ngram3.Rdata") ; rm(gram3)
save(gram4,file="ngram4.Rdata") ; rm(gram4)
save(gram5,file="ngram5.Rdata") ; rm(gram5)
save(gram6,file="ngram6.Rdata") ; rm(gram6)

#save(gram1,gram2,gram3,gram4,gram5,gram6,file = "ngrams.Rdata")
#rm(gram1,gram2,gram3,gram4,gram5,gram6)

save(gram1table,file="ngram1table.Rdata") ; rm(gram1table)
save(gram2table,file="ngram2table.Rdata") ; rm(gram2table)
save(gram3table,file="ngram3table.Rdata") ; rm(gram3table)
save(gram4table,file="ngram4table.Rdata") ; rm(gram4table)
save(gram5table,file="ngram5table.Rdata") ; rm(gram5table)
save(gram6table,file="ngram6table.Rdata") ; rm(gram6table)
