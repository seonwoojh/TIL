# <yield_krx_g : 11. KRX 채권 금리 데이터 중 KRX 국고채 프라임 지수>

# 사전준비
rm(list=ls())

# 라이브러리 임포트
library(xlsx)

# 2010~2014년 국고채 프라임지수(10년물)
yield_krx_g_2010<-read.xlsx("krx_g_bond_prc_2010.xls",1,colIndex=c(1,6),header=T
                            , encoding = "UTF-8")
yield_krx_g_2011<-read.xlsx("krx_g_bond_prc_2011.xls",1,colIndex=c(1,6),header=T
                            , encoding = "UTF-8")
yield_krx_g_2012<-read.xlsx("krx_g_bond_prc_2012.xls",1,colIndex=c(1,6),header=T
                            , encoding = "UTF-8")
yield_krx_g_2013<-read.xlsx("krx_g_bond_prc_2013.xls",1,colIndex=c(1,6),header=T
                            , encoding = "UTF-8")
yield_krx_g_2014<-read.xlsx("krx_g_bond_prc_2014.xls",1,colIndex=c(1,6),header=T
                            , encoding = "UTF-8")

# 2010~2014년 데이터를 병합하여 yield_krx_g 변수에 담기
yield_krx_g<-rbind(yield_krx_g_2010,yield_krx_g_2011,yield_krx_g_2012,
                   yield_krx_g_2013,yield_krx_g_2014)
str(yield_krx_g)

# colunms 값 변경
names(yield_krx_g)<-c("Date","y_krx_g_10yr")

# Date 컬럼을 날짜형태로 변환 후 오름차순 정렬하기
yield_krx_g$Date<-as.Date(yield_krx_g$Date)
yield_krx_g<-yield_krx_g[order(yield_krx_g$Date),]

# 데이터 확인
head(yield_krx_g,3);tail(yield_krx_g,3)
dim(yield_krx_g)

## <fx_krw_aud : 13. 해외 환율 데이터 중 원/호주달러 환율>

