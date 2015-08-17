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