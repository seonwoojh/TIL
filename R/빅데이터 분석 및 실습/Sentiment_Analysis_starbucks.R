#??Ÿ???? ?????м?

library(twitteR)
library(twitteR)
library(plyr)
library(stringr)
source("../../../my_twitter_oauth.R")

tweets = searchTwitter("starbucks", n=1000, lang="en")
class(tweets)

head(tweets)                  

# get the text
tweets_txt = sapply(tweets, function(x) x$getText())
starbucks.score = score.sentiment(tweets_txt, pos.words,
                                  neg.words)

#score.sentiment ?Լ? ??????

table(starbucks.score$score)
mean(starbucks.score$score)
#install.packages("ggplot2")
library(ggplot2)
qplot(starbucks.score$score)