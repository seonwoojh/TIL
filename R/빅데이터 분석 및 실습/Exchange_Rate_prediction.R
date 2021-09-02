# 원/달러 환율 예측 개괄



# 데이터 열기
head(mart)
names(mart)[c(1,2)] # 일자와 원 달러 환율(목표변수)
names(mart)[c(3:9)] # 국제 원자재 가격
names(mart)[c(10:16)] # 주요국 대미달러 환율
names(mart)[c(17:47)] # 주요국 정부 장단기 채권 금리
names(mart)[c(48:54)] # 주요국 주가지수
names(mart)[c(55)] # 달러지수
names(mart)[c(56:59)] # 주요국 대원화 환율
names(mart)[c(60:64)] # 우리나라 채권 금리 지수
names(mart)[c(65:73)] # 우리나라 산업별 주가 지수

## (2) 모델링
# (a) 데이터 분리
ind_mdl <- which(mart$Date >= "2011-01-01" & 
                   mart$Date <= "2013-12-31")
model_data <- mart[ind_mdl,]
set.seed(2020)
# sample(2, 10, replace = True) -> 1~2까지의 데이터를 10개 / 복원추출
ind <- sample(2, nrow(model_data), prob = c(0.7, 0.3), 
              replace = T)
train_data <- model_data[ind == 1,]
test_data <- model_data[ind == 2,]

# (b) 모델 생성 및 성능 확인(-1 = 1번째 컬럼의 변수 삭제(Date))
lm_fx <- lm(f_krw_usd ~ ., data = train_data[,-1])
summary(lm_fx)

# (c) 잔차의 확인 (1)
par(mfrow=c(2,2))
plot(lm_fx)
par(mfrow=c(1,1))
# (d) 잔차의 확인 (2)
train_pred <- predict(lm_fx, train_data)
test_pred <- predict(lm_fx,test_data)
train_res <- train_pred-train_data$f_krw_usd
test_res <- test_pred-test_data$f_krw_usd
summary(train_res)
summary(test_res)
par(mfrow=c(2,2))
plot(train_res,ylim=c(-15,15))
plot(test_res,ylim=c(-15,15))
brks <- seq(from=-20,to=20,by=2.5)
hist(train_res,breaks=brks,ylim=c(0,200))
hist(test_res,breaks=brks,ylim=c(0,100))
par(mfrow=c(1,1))

## (3) 주요변수 선택
lm_fx_bth <- step(lm_fx,direction = "both")
summary(lm_fx_bth)
