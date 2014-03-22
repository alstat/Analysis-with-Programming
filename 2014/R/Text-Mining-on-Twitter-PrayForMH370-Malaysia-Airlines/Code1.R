library(RCurl)
# Set SSL certs globally
options(RCurlOptions = list(cainfo = system.file("CurlSSL", "cacert.pem", package = "RCurl")))

library(twitteR)
reqURL <- "https://api.twitter.com/oauth/request_token"
accessURL <- "https://api.twitter.com/oauth/access_token"
authURL <- "https://api.twitter.com/oauth/authorize"
apiKey <-  "xxxxxxxxxxxxxxxxxxxxxx"
apiSecret <- "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"

twitCred <- OAuthFactory$new(
  consumerKey = apiKey, 
  consumerSecret = apiSecret,
  requestURL = reqURL,
  accessURL = accessURL, 
  authURL = authURL
  )

twitCred$handshake(
  cainfo = system.file("CurlSSL", "cacert.pem", package = "RCurl")
  )

registerTwitterOAuth(twitCred)
