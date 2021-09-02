# 시계열 실습

# 패키지 설치
install.packages("TSA")
library(TSA)

data(co2)
head(co2)

# 순차도표
plot(co2, ylab="CO2", main="Carbon Dioxide Levels with Monthly Symbols")

# 표본 ACF 그림
acf(as.vector(co2),lag.max=36)

# 차분과 계절차분한 시계열 그림
par(mfrow=c(2,1))
plot(diff(co2), ylab="First Difference of CO2", xlab="Time")
plot(diff(diff(co2),lag=12), ylab="First and Seasonal Difference of CO2",
     xlab="Time")

# 모형식별
par(mfrow=c(2,1))
acf(as.vector(diff(diff(co2),lag=12)), lag.max=36)
pacf(as.vector(diff(diff(co2),lag=12)),lag.max=36)

# 모형적합
# epsilon ~ i.i.d. N(0, 0.5446)
# (1-B)(1-B^12)Yt = (1-0.5792B)(1-0.8206B^12)et
fit <- arima(co2, order=c(0, 1, 1), seasonal = list(order=c(0,1,1), period=12))
fit
AIC(fit)

# 진단
rs <- residuals(fit)

# 잔차 그림
plot(rs, main="Residuals of ARIMA(0,1,1)*(0,1,1)_12 fitting")
abline(h=0, col="blue")

# 잔차들의 ACF그림
acf(rs, main="ACF of Residuals", lag.max = 36)

# 예측(적합한 모형을 이용하여 다음 5개의 미래값 예측하기)
predict(fit, n.ahead = 5)

# 관측값과 예측값의 그림
plot(fit, n.ahead = 24, xlab= "Time", ylab="CO2 Levels", type="o")
plot(fit, n1=c(2003,1), n.ahead = 24, xlab= "Time", ylab="CO2 Levels", type="o")
