#train.R

load("ngram1table.Rdata")
load("ngram2table.Rdata")
load("ngram3table.Rdata")
load("ngram4table.Rdata")

# at this point, should I remove anything with a frequency of 1?
# that would shorten my model, but make it less predictable
# since the RAM limit for shiny apps is 1 gig, Ill need to do that

#even just using 2,3,4 tables, I still have about 1.42 gigs of ram used

# here is the code to remove anything with a low probability (for instance, one occurence)

# so I want to take the input, and search for the first occurance in the gram4table
# that is the most likely match. if nothng found, go to 3table, then 2table

#its already sorted, so i need the extract the actual text strings
gram1tableOpt<-rownames(gram1table) #; rm(gram1table)
gram2tableOpt<-rownames(gram2table) #; rm(gram2table)
gram3tableOpt<-rownames(gram3table) #; rm(gram3table)

# we would get inputbigram, inputunigram. if its smaller, then we set to null
# next step is to take the last 2 words input by user, and search my trigrams for a match
# I will find the first match (since its sorted), and return the last word of that trigram
# if no match is found, take the last word input by user, and search my bigrams
# return the last word of the bigram with a match
# if no match is found, return the most common word (in this case "the")
# i will later change it to look at other parts of the sentence, but for now Ill keep it at that

#input from user, sample for now
tinput2<-"i dasdasuaksnd"
tinput1<-"like"
# create a regular expression to pass into grep
t2<-paste("^",tinput2," ",sep="")
t1<-paste("^",tinput1," ",sep="")

#return the first match
fm<-head(grep(t2,gram3tableOpt,value=TRUE),1)

#if no match
if(length(fm)==0)
{
  fm<-head(grep(t1,gram2tableOpt,value=TRUE),1)
}

# if still no match
if(length(fm)==0)
{
  #return "the"
fm<-"the"
}

save(gram2tableOpt,file="gram2tableOpt.Rdata")
save(gram3tableOpt,file="gram3tableOpt.Rdata")