cT.tweets = searchTwitter('#CT17+ Kohli',n =1000,since = "2017-06-07",until = "2017-06-11",lang = "en",resultType = "recent")

## convert to dataframe
df = do.call("rbind",lapply(cT.tweets,as.data.frame))

## Use the TM package for cleaning the tweets
library(tm)
df_tweets = df$text
df_Corpus = Corpus(VectorSource(df_tweets))
