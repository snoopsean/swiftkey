#train.R

#make sure to rename the objects as they come in since they all have same name
load("ngram1table.rda") ; gram1table<-currentTable
load("ngram2table.rda") ; gram2table<-currentTable
load("ngram3table.rda") ; gram3table<-currentTable
load("ngram4table.rda") ; gram4table<-currentTable
#load("ngram5table.rda") ; gram5table<-currentTable
#load("ngram6table.rda") ; gram6table<-currentTable
rm(currentTable)

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

save(gram2tableOpt,file="gram2tableOpt.Rdata")
save(gram3tableOpt,file="gram3tableOpt.Rdata")