# 감성분석하기
rm(list = ls())
#라이브러리 임포트
library(twitteR)
library(plyr)
library(stringr)

# 긍정적 단어와 부정적 단어 목록 파일 불러오기
pos.words = scan('positive-words.txt', what='character',
                 comment.char=';')
neg.words = scan('negative-words.txt', what='character',
                 comment.char=';')


# score.sentiment() 함수 정의하기 <- (반복된) 감성 점수 계산 자동화
# 입력 : sentences, pos.words, neg.words
# 출력 : text와 score로 구성된 data.frame
## sentences – 문서들로 구성된 문자열벡터
## pos.words, neg.words – 단어들로 구성된 문자열벡터


score.sentiment = function(sentences, pos.words, neg.words) {
  scores = laply(sentences,
                 function(sentence, pos.words, neg.words) {
                   # 구두점 제거
                   sentence = gsub("[[:punct:]]", "", sentence)
                   
                   # 제어문자 제거
                   sentence = gsub("[[:cntrl:]]", "", sentence)
                   
                   # 숫자 제거
                   sentence = gsub('\\d+', '', sentence)
                   
                   # 소문자로 변환
                   # define error handling function when trying tolower
                   tryTolower = function(x)
                   {
                     # create missing value
                     y = NA
                     # tryCatch error
                     try_error = tryCatch(tolower(x), error=function(e) e)
                     # if not an error
                     if (!inherits(try_error, "error"))
                       y = tolower(x)
                     # result
                     return(y)
                   }
                   # use tryTolower with sapply 
                   sentence = sapply(sentence, tryTolower)
                   
                   # 단어추출
                   # split sentence into words with str_split (stringr package)
                   word.list = str_split(sentence, "\\s+")
                   words = unlist(word.list)
                   
                   # 감성점수 계산하기
                   # compare words to the dictionaries of positive & negative terms
                   pos.matches = match(words, pos.words)
                   neg.matches = match(words, neg.words)
                   
                   # get the position of the matched term or NA
                   # we just want a TRUE/FALSE
                   pos.matches = !is.na(pos.matches)
                   neg.matches = !is.na(neg.matches)
                   
                   # final score
                   score = sum(pos.matches) - sum(neg.matches)
                   return(score)
                 }, pos.words, neg.words)
  
  # data frame with scores for each sentence
  scores.df = data.frame(text=sentences, score=scores)
  return(scores.df)
}

sample = c("You're awesome and I love you",
           "I hate and hate and hate. So angry. Die!",
           "Impressed and amazed: you are peerless in your achievement of unparalleled mediocrity",
           "Oh how I love being ignored",
           "Absolutely adore it when my bus is late.")

result = score.sentiment(sample, pos.words, neg.words)

# 감성 점수 확인
print(result)

# 문장 별로 감성 점수 계산하기
library(ggplot2)
qplot(result$score)
