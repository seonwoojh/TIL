# 트위터 워드 클라우드 생성

# 준비 : 모든 객체 제거
rm(list = ls())

# 라이브러리 임포트

library(twitteR)

# 데이터 로드
load("rdmTweets.RData")

# 자료의 길이 확인
length(rdmTweets)

# 리스트의 개별 원소 탐색
rdmTweets[[1]]

#자료구조 확인
class(rdmTweets[[1]])

#
str(rdmTweets[[1]])

# 트윗 리스트를 데이터 프레임으로 변환하기
# twListToDF() 함수: twitteR 객체로 이루어진 리스트를 데이터 프레임으로 변환 

df <- twListToDF(rdmTweets)
head(df)

#Corpus 생성하기
library(tm)
myCorpus <- Corpus(VectorSource(df$text))

# 생성된 corpus에 대한 전처리 / tm패키지의 tm_map()을 사용하여 전체 데이터에 함수 적용시키기.

# 소문자 변환

myCorpus <- tm_map(myCorpus, tolower)

# 구두점 제거
myCorpus <- tm_map(myCorpus, removePunctuation)

# 숫자 제거
myCorpus <- tm_map(myCorpus, removeNumbers)

# 불용어 제거 
myCorpus <- tm_map(myCorpus, removeWords, stopwords('english'))

# http로 시작하는 URL 제거
removeURL <- function(x) gsub("http[[:alnum:]]*", "", x) 

myCorpus <- tm_map(myCorpus, removeURL)


# Corpus를 전처리하는 과정 중 단어들에서 어간 만을 추출
# tm_map()함수의 인수 FUN에 stemDocument 함수를 사용
install.packages("SnowballC")
myCorpus = tm_map(myCorpus, stemDocument)


tdm <- TermDocumentMatrix(myCorpus, control = list(stemming=TRUE, 
                                                   wordLengths=c(1,Inf)))
completed = stemCompletion(rownames(tdm), myCorpus)
rownames(tdm) <- completed

stemCompletion(rownames(tdm),
               dictionary = myCorpus)





# 단어-문서 간의 빈도 행렬 생성

tdm <- TermDocumentMatrix(myCorpus,
                          control = list(wordLengths=c(1,Inf)))

#inspect 함수로 내용확인
inspect(tdm[1:4, 1:5])
tdm                          


#단어 별 빈도 계산 및 워드 클라우드 생성

m <- as.matrix(tdm)
wordFreq <- sort(rowSums(m), decreasing = TRUE)

# reproducible
library(wordcloud)
set.seed(375)
wordcloud(words=names(wordFreq), freq=wordFreq,
          scale=c(8,.4), min.freq=2, random.order=F)


# 단어 교체하기

rownames(tdm) <- ifelse(rownames(tdm)=="miners","mining",row.names(tdm))

# Corpus에 포함된 단어 교체하기 / Corpus(문서꾸러미)에 작업을 위해 tm_map() 함수이용
# gsub함수를 이용하면 문서에 포함된 특정 단어/패턴을 다른 단어로 교체 가능
# 예:  gsub(pattern = "apple", replacement = "banana", "I like apple")

myCorpus <- tm_map(myCorpus, gsub, pattern = "miners", replacement = "mining")


# 단어 빈도수가 10이상 되는 단어들을 선택하고 도수분포표를 구하고 막대그래프를 그리시오.

# 단어별 빈도 합계를 구하기 - 행렬의 행(row)합계 
termFrequency <- rowSums(m)
# 단어 빈도수가 5 이상인 단어만 선택  조건문 만들기 
godfuf <-sort((termFrequency <- termFrequency[termFrequency >= 5]),decreasing=T)
barplot(termFrequency, las=2)

godfuf[1:20]


# 특정단어 "data"와 상관계수가 높은 단어 5개를 추출하시오. / findAssocs()

findAssocs(tdm, "data", 0.25)
