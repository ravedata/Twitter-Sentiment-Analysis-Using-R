## Remove emoticons

removeEmoticon = content_transformer(function(x) iconv(x, "latin1", "ASCII", sub=""))
tweets_clean = tm_map(df_Corpus,removeEmoticon)
##Remove Urls

removeURL <- content_transformer(function(x) gsub("https?:\\/\\/(.*?|\\/)(?=\\s|$)\\s?", "", x, perl=T))
tweets_clean = tm_map(tweets_clean,removeURL)

## Remove Punctuations
tweets_clean = tm_map(tweets_clean,removePunctuation)
## Convert tweets to lower case
tweets_clean = tm_map(tweets_clean,content_transformer(tolower))
## Remove the stopwords of English
tweets_clean = tm_map(tweets_clean,removeWords,stopwords("English"))

## Remove any white Space
tweets_clean = tm_map(tweets_clean,stripWhitespace)
## Further Cleaning 
tweets_clean = tm_map(tweets_clean,removeWords,c("#CT17","ct17","icc","Kohli","kohli","Virat","imvkohli","virat","rt","https"))
