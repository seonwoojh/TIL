# 사전준비

rm(list = ls())

library(base64enc)
#install.packages("base64enc")
library(KoNLP)
#install.packages("reshape")
library(NIADic)
#install.packages("RmecabKo")
library(RmecabKo)
library(reshape)
library(rtweet)
#install.packages("tidyverse")
library(tidyverse)
#install.packages("igraph")
library(igraph)
library(wordcloud)
library(twitteR)
library(RColorBrewer)
source("./my_twitter_oauth.R")
useNIADic()

# "아이폰12 관련 한글 트윗 1000개를 가져오기"
keyword_ko <- enc2utf8("아이폰12")
iPhone12_kor = searchTwitter(keyword_ko, n=1000, lang = "ko")

# 데이터 미리보기
head(iPhone12_kor)
tail(iPhone12_kor)
length(iPhone12_kor)
# 텍스트 파일 추출

iPhone12_ko_word <- sapply(iPhone12_kor,function(t) t$getText()) 

# 한글 - 품사별 처리

iPhone12_ko_words <- iPhone12_ko_word %>% SimplePos09()

# 데이터 셋 만들기

iPhone12_ko_words <- iPhone12_ko_words %>%   
  melt() %>%  
  as_tibble() %>% 
  select(3,1)    ## 3열과 1열 추출 


# 명사 추출

iphone12_ko_명사 <- iPhone12_ko_words %>%  
  mutate(명사=str_match(value,'([가-힣]+)/N')[,2]) %>%      ## "명사" variable을 만들고 한글만 저장                   
  
  na.omit() %>%                                      ## ([가-힣]+)/P') 한글 중 명사(N)만을 선택하는 정규표현식
  
  mutate(글자수=str_length(명사)) %>%   ## "글자수" variable을 만듭니다 
  
  filter(str_length(명사)>=2)                               ## 2글자 이상만 추려냅니다

# 용언 추출

iphone12_ko_용언 <- iPhone12_ko_words %>%  
  mutate(용언=str_match(value,'([가-힣]+)/P')[,2]) %>%   ## "용언" variable을 만들고 한글만 저장 
  na.omit() %>%                           ## ([가-힣]+)/P') 한글 중 용언(P)만을 선택하는 정규표현식
  
  mutate(글자수=str_length(용언)) %>%        ## "글자수" variable을 만듭니다 
  filter(str_length(용언)>=2)                         ##  2글자 이상만 추려냅니다

# 수식언 추출

iphone12_ko_수식언 <- iPhone12_ko_words %>%  
  mutate(수식언=str_match(value,'([가-힣]+)/M')[,2]) %>%    ## "수식언" variable을 만들고 한글만 저장
  na.omit() %>%                                ## ([가-힣]+)/M') 한글 중 수식언(M)만을 선택하는 정규표현식
  mutate(글자수=str_length(수식언)) %>%  ## "글자수" variable을 만듭니다 
  filter(str_length(수식언)>=2)                 ##  2글자 이상만 추려냅니다


#명사 전처리 

iphone12_ko.명사 <- iphone12_ko_명사$명사 
iphone12_ko.명사 <- iphone12_ko.명사 %>% unlist() 
iphone12_ko.명사 <- iphone12_ko.명사 %>% as.vector() 
iphone12_ko.명사 <- str_replace_all(iphone12_ko.명사, "[^[:alnum:][:blank:]+?&/\\-]","")          ## 특수문자를 처리합니다
iphone12_ko.명사 <- str_replace_all(iphone12_ko.명사, "^.{1}$","")         ## 혹시라도  들어갈 수 있는 한글자를 처리합니다
iphone12_ko.명사 <- str_replace_all(iphone12_ko.명사, "\\d+","") 
iphone12_ko.명사 <- iphone12_ko.명사 %>% as.list() 
iphone12_ko.명사[iphone12_ko.명사 ==""] <- NULL 
iphone12_ko.명사 <- iphone12_ko.명사 %>% unlist()                         ## 공백을 제거합니다
iphone12_ko.명사 <- iphone12_ko.명사 %>% as.data.frame()
head(iphone12_ko.명사, 10)

#용언 전처리

iphone12_ko.용언 <- iphone12_ko_용언$용언 
iphone12_ko.용언 <- iphone12_ko.용언 %>% unlist() 
iphone12_ko.용언 <- iphone12_ko.용언 %>% as.vector() 
iphone12_ko.용언 <- str_replace_all(iphone12_ko.용언, "[^[:alnum:][:blank:]+?&/\\-]","")          ## 특수문자를 처리합니다
iphone12_ko.용언 <- str_replace_all(iphone12_ko.용언, "^.{1}$","")      ## 혹시라도  들어갈 수 있는 한글자를 처리합니다
iphone12_ko.용언 <- iphone12_ko.용언 %>% as.list() 
iphone12_ko.용언[iphone12_ko.용언 ==""] <- NULL 
iphone12_ko.용언 <- iphone12_ko.용언 %>% unlist()                    ## 공백을 제거합니다
iphone12_ko.용언 <- iphone12_ko.용언 %>% as.data.frame() 
head(iphone12_ko.용언, 10)

#수식언 전처리

iphone12_ko.수식언 <- iphone12_ko_수식언$수식언 
iphone12_ko.수식언 <- iphone12_ko.수식언 %>% unlist() 
iphone12_ko.수식언 <- iphone12_ko.수식언 %>% as.vector() 
iphone12_ko.수식언 <- str_replace_all(iphone12_ko.수식언, "[^[:alnum:][:blank:]+?&/\\-]","")          ## 특수문자를 처리합니다
iphone12_ko.수식언 <- str_replace_all(iphone12_ko.수식언, "^.{1}$","")   ## 혹시라도  들어갈 수 있는 한글자를 처리합니다
iphone12_ko.수식언 <- iphone12_ko.수식언 %>% as.list() 
iphone12_ko.수식언[iphone12_ko.수식언 ==""] <- NULL 
iphone12_ko.수식언 <- iphone12_ko.수식언 %>% unlist()                ## 공백을 제거합니다
iphone12_ko.수식언 <- iphone12_ko.수식언 %>% as.data.frame()
head(iphone12_ko.수식언, 10)

#명사 용언 수식언을 묶어서 하나로 만듭니다

iphone12_ko <- bind_rows(iphone12_ko.명사,iphone12_ko.용언,iphone12_ko.수식언)
head(iphone12_ko,50)

iphone12_ko_count <- table(iphone12_ko)                       ## 객체별 빈도를 셉니다
iphone12_ko_count <- sort(iphone12_ko_count, decreasing = TRUE)         ##내림차순 정렬 합니다


# 워드클라우드 생성
green <- brewer.pal(6,"RdYlGn")

wordcloud(
  
  names(iphone12_ko_count),
  
  freq=iphone12_ko_count,
  
  scale=c(5,1),
  
  rot.per=0.5,
  
  min.freq=30,
  
  random.order=F,
  
  colors = green
)
iphone12_ko_count[1:60]
