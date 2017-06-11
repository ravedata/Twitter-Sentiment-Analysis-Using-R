library(ROAuth)
consumerKey = "5pdz5NUS6JC6mbQROBe0f12bD"
consumerSecret = "ZuiaHYqQmwKjRFfjqNo3IPnrvQTBZDAPhkW4CJrOFtC6atLDQU"
accessToken = "181626111-0P6CUE2h4hgdGUIH9pgdAUDvJ14ubtOZ83wPouYA"
accessSecret = "OnZ1VlUqhpuCy6UYg2ZEaiSs14sD2xJfA7Av6w5rbLZ7X"

##download.file(url="http://curl.haxx.se/ca/cacert.pem", destfile="cacert.pem") #downloads the certificate

setup_twitter_oauth(consumerKey, consumerSecret, accessToken, accessSecret)

cred <- OAuthFactory$new(consumerKey=consumerKey, 
                         consumerSecret=consumerSecret,
                         requestURL='https://api.twitter.com/oauth/request_token',
                         accessURL='https://api.twitter.com/oauth/access_token',
                         authURL='https://api.twitter.com/oauth/authorize')

cred$handshake(cainfo="cacert.pem") ##4867698
