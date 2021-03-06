# This part is optional, as I already have the data set downloaded and unzipped. Its here for reference
# Note that it will download the http link, not https.
# It wont take any extra time since it only runs if the zip file or the folder are not there.

file1<-"Coursera-SwiftKey.zip"
folder1<-"final/en_US/"
filenames<-c("en_US.blogs.txt","en_US.news.txt","en_US.twitter.txt")
filepaths<-paste(folder1,filenames,sep="")
myUrl<-"http://d396qusza40orc.cloudfront.net/dsscapstone/dataset/Coursera-SwiftKey.zip"

#if the files we need are not here
if(sum(!file.exists(filepaths))==3)
{
  # we need to get them
  # if the zip file isnt here
  if(!file.exists(file1))
  {
    #we will download it
    download.file(myUrl,file1)
  }
  # now that the zip file is here, we extract only the files we need
  unzip(file1,filepaths)
}

# read in the data, and skipNul for the twitter data
blogs <- readLines(filepaths[1])
news <- readLines(filepaths[2])
twitter <- readLines(filepaths[3],skipNul=TRUE)

#take a sample of the objects. we will set it to 10 percent of the data
# you can always change the portion if you want a more accurate model
#this variable could be used to make this R script into a function
portion<-.1
#set the seed so this is replicatable
set.seed(1445)
sample_news <- news[1 == rbinom(length(news), 1, portion)]
sample_twitter <- twitter[1 == rbinom(length(twitter), 1, portion)]
sample_blogs <- blogs[1 == rbinom(length(blogs), 1, portion)]

# save the 3 objects into one .RData file
save(sample_blogs, sample_news, sample_twitter, file= "sample_data.RData")

# claim the memory back by removing all the temp objects
rm(list = ls())