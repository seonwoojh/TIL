# 자료 불러오기

setwd("C:/Users/ISO1/Desktop/5-1 과제/탐색적 자료분석/중간_조별과제")
data <- read.csv('1차조별과제-콜레스테롤.csv',header=TRUE)
View(data)
attach(data)

# 자료 요약정보

head(data)
str(data)
summary(data)

# 상관계수

cor <-cor(data)


data$성별코드

# EDA
# 히스토그램
dev.off()
par(mfrow=c(2,2))
hist(신장, main = '신장의 히스토그램',col='skyblue')
abline(v=mean(신장),col='skyblue',lwd=3)
quantile(신장)

par()
hist(subset(data,성별코드 == 1)$신장,col='skyblue')


hist(체중, main = '체중의 히스토그램')
abline(v=mean(체중),col='red',lwd=3)
quantile(체중)


par(mfrow=c(1,2))
hist(콜레스테롤, main = '콜레스테롤의 히스토그램')
abline(v=mean(콜레스테롤),col='red',lwd=3)
quantile(콜레스테롤)

hist(콜레스테롤, main = '콜레스테롤의 히스토그램')
mean(콜레스테롤)


hist(비만도, main = '비만도의 히스토그램')
abline(v=mean(비만도),col='red',lwd=3)


dev.off()
par(mfrow=c(1,2))
hist(체중, main = '체중의 히스토그램')
hist(log(체중), main='log 체중의 히스토그램',breaks=11)

par(mfrow=c(1,2))
hist(비만도, main = '비만도의 히스토그램')
hist(log(비만도), main = 'log 비만도의 히스토그램')
quantile(비만도)
