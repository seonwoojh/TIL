# 심근경색증 자료에 대한 생명표

install.packages("KMsurv")
library(KMsurv)
tis <- 0:10
ninit <- 146 # 연구 시작시 총 개체수
ncen <- c(3,10,10,3,3,11,5,8,1,6) # 각 구간에서 중도 절단수
nevent <- c(27,18,21,9,1,2,3,1,2,2) # 각 구간에서 사망수
A <- lifetab(tis,ninit,ncen,nevent)
A
par(mfrow=c(1,2))
plot(A$surv, type="S", xlab="Time(Year)", ylab="Survival probability")
plot(A$hazard, type="s", xlab="Time(Year)", ylab="Hazard rate")


# 생명표 결과 해석
## 심근경색 환자의 약 18.6%가 발병 후 1년 내 사망하며, 그 다음 해에 13%가 사망하는 것으로 추정된다
## 심근경색 발병 후 3년 이상 생존할 확률은 50.8%로 추정된다.
## 사망 위험률이 가장 높은 구간은 2~3년이었다.