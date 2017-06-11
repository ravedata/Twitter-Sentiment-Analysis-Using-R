## Convert the content of corpus into a dataframe

df_cleanedTweets <-  data.frame(text=get("content", tweets_clean), 
                                stringsAsFactors=F)
list_cleanedTweets = as.list(df_cleanedTweets$text)

##Stringr package is needed to do string manipulations
library(stringr)
## Trim  extra white spaces
list_cleanedTweets = lapply(list_cleanedTweets,function(x) gsub(pattern = "\\s+"," ",str_trim(x)))
## Split the sentence to separate words 
list_cleanedTweets = lapply(list_cleanedTweets,function(x) strsplit(x,split = " "))

## Convert the list to list of characters
unlist_CleanedTweets = sapply(list_cleanedTweets,unlist)

## give some meaningful name to variables

Kohlitweets = unlist_CleanedTweets

##Load Positive words and negative words here
getwd()
pos.words = scan("positive-words.txt",what = "character",comment.char = ";")
neg.words = scan("negative-words.txt",what = "character",comment.char = ";")
## let us try to get the positive scores

pos.scores = lapply(Kohlitweets,function(x){sum(!is.na(match(x,pos.words)))})
## let us try to get the negative scores
neg.scores = lapply(Kohlitweets,function(x){sum(!is.na(match(x,neg.words)))})
## let us try to get the net sentiment scores
net.scores = lapply(Kohlitweets,function(x){sum(!is.na(match(x,pos.words)))-sum(!is.na(match(x,neg.words)))})

## Lets unlist all the positive scores,negative scores and net scores

positive = unlist(pos.scores) ## This gives vector of integers
negative = unlist(neg.scores) ## This gives vector of integers
netSentiment = unlist(net.scores)## This gives vector of integers

## Let us name all tweets with postive , negative and Neutral
netSentiment[netSentiment>0]="Positive"
netSentiment[netSentiment<0]="Negative"
netSentiment = ifelse(netSentiment=="0","Neutral",netSentiment)
## Convert the net sentiment to factor variable
netSentiment = as.factor(netSentiment)
## See the percentage of sentiment using the following command
prop.table(table(netSentiment))

library(ggplot2)

ggp <- ggplot(data.frame(netSentiment),aes(x=netSentiment))
# counts
ggp = ggp +geom_bar(aes(fill= netSentiment,y=((..count..)/sum(..count..))*100))

ggp = ggp+ labs(title =" Twitter sentiment for Virat Kohli from 7th-11th June 2017", x = "Sentiments", y = "Sentiments in percentage") + theme(plot.title = element_text(hjust = 0.5))

red.bold.italic.text <- element_text(face = "bold.italic", color = "blue")

ggp + theme(title = red.bold.italic.text, axis.title = red.bold.italic.text)
# proportion
