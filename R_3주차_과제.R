library(dplyr)
library(caret)
kc_house<-read.csv("kc_house_data.csv", header=TRUE)
titanic<-read.csv("titanic_train.csv", header=TRUE)
titanic$Survived <- as.factor(titanic$Survived)
install.packages("ISLR")
library(ISLR)
# 1. 훈련, 테스트 데이터 생성
nrow(kc_house)
smp_siz=floor(0.8*nrow(kc_house))
smp_siz
set.seed(2021)
train_ind = sample(seq_len(nrow(kc_house)),size = smp_siz)
train =kc_house[train_ind,]
test=kc_house[-train_ind,]
nrow(train)
nrow(test)
# 2. sqft 관련 변수 5개를 사용하여 Price 예측하는 다중선형회귀분석 모델을 만든 뒤 결과를 출력
(sqft_living, sqft_lot, sqft_above, sqft_living15, sqft_lot15)
train_2<-as.data.frame(train[,c("price","sqft_living", "sqft_lot", "sqft_above", "sqft_living15", "sqft_lot15")])
head(train_2)
fit<-lm(price~.,data=train_2)
fit
summary(fit)
# 3. sqft_living 1개 컬럼에 대해 min-max 스케일링을 적용한 신규 컬럼 생성
normalize <- function(x) {
  return((x-min(x))/(max(x)-min(x)))
}
train_3<-train_2 %>% mutate(minmax_sqft_living=normalize(train_2$sqft_living))
head(train_3)
# 4. 2번에서 생성한 train 데이터 모델을 활용하여 test 데이터를 예측
predict(fit)
# 5. 다음 조건을 바탕으로 생존여부(Survived)를 측정하는 Rogistic Regression 모델을 생성
## 1) Cross Validation : 5-fold
library(caret)
set.seed(123)
train.control<-trainControl(method="cv",number = 5)
fit<-lm(Survived~Pclass+Age+SibSp+Parch+Fare,data=titanic)
fit
summary(fit)
## 2) Cross Validation Repeat : 5
set.seed(123)
train.control<-trainControl(method="repeatedcv",number = 5,repeats=5)
fit<-lm(Survived~Pclass+Age+SibSp+Parch+Fare,data=titanic)
fit
summary(fit)
## 3) Boosting 기법이 적용된 Regression Method 사용
set.seed(123)
train.control<-trainControl(method="boot")
fit<-lm(Survived~Pclass+Age+SibSp+Parch+Fare,data=titanic)
fit
summary(fit)
# 6 null이 존재하는 모든 row를 삭제하는 방식으로 5번 모델링을 재실행
View(titanic)
titanic[is.na(titanic$Age),]
titanic[!complete.cases(titanic)]  
re_titanic<-na.omit(titanic);new
re_titanic
head(re_titanic)

## 1) Cross Validation : 5-fold
set.seed(123)
train.control<-trainControl(method="cv",number = 5)
fit1<-lm(Survived~Pclass+Age+SibSp+Parch+Fare,data=re_titanic)
fit1
summary(fit1)
## 2) Cross Validation Repeat : 5
set.seed(123)
train.control<-trainControl(method="repeatedcv",number = 5,repeats=5)
fit2<-lm(Survived~Pclass+Age+SibSp+Parch+Fare,data=re_titanic)
fit2
summary(fit2)
## 3) Boosting 기법이 적용된 Regression Method 사용
set.seed(123)
train.control<-trainControl(method="boot")
fit3<-lm(Survived~Pclass+Age+SibSp+Parch+Fare,data=re_titanic)
fit3
summary(fit3)
head(titanic)
# 7 해석
5개의 feature를 사용하여 생존 여부를 예측하였음 ( 연속형 데이터만 사용 )
predict(fit1)
predict(fit2)
predict(fit3)
5번의 반복이 정확도가 가장 높음