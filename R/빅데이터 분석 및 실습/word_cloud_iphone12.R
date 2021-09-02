# 사전준비

rm(list = ls())

# 라이브러리 임포트
library(RColorBrewer)
library(multilinguer)
library(KoNLP)
library(twitteR)
library(wordcloud)
library(SnowballC)
library(tm)
source("./my_twitter_oauth.R")

# iphone12관련 트윗 1000개를 정식출시일인 10월 23일부터 11월 05일까지 추출
keyword_en <- enc2utf8("iPhone12")
iPhone12 = searchTwitter(keyword_en, n=1000, lang = "en",since='2020-10-23', until='2020-11-05')

# 데이터 미리보기
head(iPhone12)
tail(iPhone12)
length(iPhone12)

# 데이터 프레임으로 만들기
df = twListToDF(iPhone12)

# Corpus 만들기
myCorpus <- Corpus(VectorSource(df$text))
inspect(myCorpus[1:6])

#해시태그 제거
removeComment <- function(x) gsub("#[[:alnum:]]*", "", x)
myCorpus <- tm_map(myCorpus, removeComment)
inspect(myCorpus[1:6])

# @ : 멘션 제거
removeAt <- function(x) gsub("@[[:alnum:]]*", "", x)
myCorpus <- tm_map(myCorpus, removeAt)
inspect(myCorpus[1:5])

# 구두점 제거
myCorpus <- tm_map(myCorpus, removePunctuation)
inspect(myCorpus[1:6])

# 구두점 제거 과정에서 ’가 제거되지 않아 개별적으로 제거
removeComment2 <-function(x) gsub("’[[:alnum:]]*", "", x) 
myCorpus <- tm_map(myCorpus, removeComment2)
inspect(myCorpus[1:6])

# 리트윗을 나타내는 "RT" 제거
removeComment3 <-function(x) gsub("RT[[:alnum:]]*", "", x) 
myCorpus <- tm_map(myCorpus, removeComment3)
inspect(myCorpus[1:6])

# http로 시작하는 URL 제거
removeURL <- function(x) gsub("http[[:alnum:]]*", "", x)
myCorpus <- tm_map(myCorpus, removeURL )
inspect(myCorpus)


# ...등 깨진글자 제거
ell_def <- rawToChar(as.raw(c('0xE2','0x80','0xA6')))
Encoding(ell_def) <- 'UTF-8'
removeChar <- function(x) gsub(ell_def, "", x)
myCorpus <- tm_map(myCorpus, removeChar)
inspect(myCorpus)


# iphone 제거
removeComment_iphone <-function(x) gsub("iPhone[[:alnum:]]*", "", x) 
myCorpus <- tm_map(myCorpus, removeComment_iphone)
inspect(myCorpus[1:6])

# 12 제거
removeComment_Num12 <-function(x) gsub("12[[:alnum:]]*", "", x) 
myCorpus <- tm_map(myCorpus, removeComment_Num12)
inspect(myCorpus[1:6])

# now 제거
removeComment_now <-function(x) gsub("now[[:alnum:]]*", "", x) 
myCorpus <- tm_map(myCorpus, removeComment_now)
inspect(myCorpus[1:6])

# get 제거
removeComment_get <-function(x) gsub("get[[:alnum:]]*", "", x) 
myCorpus <- tm_map(myCorpus, removeComment_get)
inspect(myCorpus[1:6])

# the 제거
removeComment_the <-function(x) gsub("the[[:alnum:]]*", "", x) 
myCorpus <- tm_map(myCorpus, removeComment_the)
inspect(myCorpus[1:6])

# 이모티콘 제거
removeComment_emo1 <-function(x) gsub("\u2b50[[:alnum:]]*", "", x) 
myCorpus <- tm_map(myCorpus, removeComment_emo1)
inspect(myCorpus[1:6])

removeComment_emo2 <-function(x) gsub("\U0001f606[[:alnum:]]*", "", x) 
myCorpus <- tm_map(myCorpus, removeComment_emo2)
inspect(myCorpus[1:6])

removeComment_emo3 <-function(x) gsub("\U0001f64c[[:alnum:]]*", "", x) 
myCorpus <- tm_map(myCorpus, removeComment_emo3)
inspect(myCorpus[1:6])

# 불용어 제거
myStopwords <- c(stopwords('english'),"today","new", "link","apple","buy","amp","want",
                 "say", "live", "make", "now", "get", "take", "keep",
                 "add", "will", "name", "just", "can", "one", "us", "time", "the",
                 "let","give","enter","mobile","win","which")
myCorpus <- tm_map(myCorpus, removeWords, myStopwords)
inspect(myCorpus[1:6])


# 소문자 변환
myCorpus <- tm_map(myCorpus, tolower)

# 어간 추출
myCorpusCopy <- myCorpus
myCorpus <- tm_map(myCorpus, stemDocument)
inspect(myCorpus[1:6])

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

# 폰트 색상 지정
display.brewer.all()
blue <- brewer.pal(6,"Blues")
wordcloud(words=names(wordFreq), freq=wordFreq,
          scale=c(4,.6), min.freq=40, random.order=F, colors = blue)

wordFreq[1:60]