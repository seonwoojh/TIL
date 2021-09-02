# 오바마 트위터 분석
# 오바마 전 미국대통령의 트윗들을 분석해본다.
# 오바마 트위터 URL : https://twitter.com/BarackObama

#방향성 : 오바마의 트윗들로부터 어떤 정보를 얻을 수 있을까?


# 사전작업
rm(list = ls())
library(twitteR)
library(wordcloud)
library(tm)
source("./my_twitter_oauth.R")

# API를 이용하여 오바마 전 대통령의 트윗 1000개 수집
obamaTweets <- userTimeline("BarackObama", n=1000)

# 데이터 요약정보 확인
head(obamaTweets)
tail(obamaTweets)

# 트위터 텍스트 마이닝 - 워드 클라우드 만들기
df <- twListToDF(obamaTweets)
head(df)

# Corpus 만들기
myCorpus <- Corpus(VectorSource(df$text))

# 해쉬태그 제거
removeComment <- function(x) gsub("#[[:alnum:]]*", "", x)
myCorpus <- tm_map(myCorpus, removeComment)

# 결과확인
inspect(myCorpus[1:5])

# @ : 특정인물 멘션 제거
removeAt <- function(x) gsub("@[[:alnum:]]*", "", x)
myCorpus <- tm_map(myCorpus, removeAt)
inspect(myCorpus[1:5])

# 모든 글자 소문자로 변경
myCorpus <- tm_map(myCorpus, tolower)

# 구두점 제거
myCorpus <- tm_map(myCorpus, removePunctuation)

# 구두점 제거 과정에서 ’가 제거되지 않아 개별적으로 제거
removeComment2 <-function(x) gsub("’[[:alnum:]]*", "", x) 
myCorpus <- tm_map(myCorpus, removeComment2)
inspect(myCorpus[1:6])


# 숫자 제거
myCorpus <- tm_map(myCorpus, removeNumbers)

# ...등 깨진글자 제거
ell_def <- rawToChar(as.raw(c('0xE2','0x80','0xA6')))
Encoding(ell_def) <- 'UTF-8'
removeChar <- function(x) gsub(ell_def, "", x)
myCorpus <- tm_map(myCorpus, removeChar)
inspect(myCorpus)


# 불용어
myStopwords <- c(stopwords('english'), "president",
                 "president","obama", "obamas", "watch", "americans",
                 "american", "live", "make", "now", "get", "take", "keep",
                 "add", "will", "name", "just", "can", "one", "us", "time", "th",
                 "let")
myCorpus <- tm_map(myCorpus, removeWords, myStopwords)

# 어간 추출
myCorpusCopy <- myCorpus
myCorpus <- tm_map(myCorpus, stemDocument)
inspect(myCorpus)

# http로 시작하는 URL 제거
removeURL <- function(x) gsub("http[[:alnum:]]*", "", x)
myCorpus <- tm_map(myCorpus, removeURL )
inspect(myCorpus)



# T-D matrix 생성
tdm <- TermDocumentMatrix(myCorpus,
                          control=list(wordLengths=c(2,Inf)))
rownames(tdm)
rownames(tdm) <- stemCompletion(rownames(tdm), myCorpusCopy)
rownames(tdm)
m <- as.matrix(tdm)
wordFreq <- sort(rowSums(m), decreasing=TRUE)


# 워드 클라우드 작성
set.seed(375) # to make it reproducible
wordcloud(words=names(wordFreq), freq=wordFreq,
          scale=c(4,.5), min.freq=10, random.order=F)