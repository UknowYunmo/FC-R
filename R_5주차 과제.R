library(caret)
library(dplyr)
train <- read.csv("구윤모 - titanic_train.csv")
ctrl <- trainControl(method = "repeatedcv", number = 5, repeats = 2)

# (5점) 1. train와 데이터의 타겟변수 Survived를 범주형 데이터로 변경해주세요. 
# hint. as.factor함수 이용
str(train)
train$Survived<-as.factor(train$Survived)
str(train)

# (5점) 2. Pclass는 Ticket 등급을 나타내는 변수입니다. 변수의 고유한 값을 확인할 수 있도록 코드를 작성해주세요. 
# hint. unique함수 이용 
unique(train$Pclass)

# (5점) 3. Pclass, Age, Fare 변수들의 히스토그램을 한 눈에 볼 수 있도록 시각화 해주세요 (1x3)
# hint. par, hist함수 이용 
par(mfrow=c(1,3))
hist(train$Pclass,main='Pclass 히스토그램')
hist(train$Age,main='Age 히스토그램')
hist(train$Fare,main='Fare 히스토그램')

# (5점) 4. train 전체 데이터에 대해 변수산점도를 그려주세요.
# hint. plot함수 이용  
plot(train)

# (5점) 5. Age, Fare 변수들을 표준화해주세요.
summary(train)
colSums(is.na(train))
train<-na.omit(train) # 6번

normalize <- function(x) {
  return ( (x-min(x)) / (max(x) - min(x) ) )
}
train$Age<-normalize(train$Age)
train$Fare<-normalize(train$Fare)

summary(train)
# (5점) 6. train에서 na가 포함된 row는 모두 제거해주세요
# hint. na.omit함수 이용 
- 5번 과정에서 같이 했습니다 (na가 있는 상태에서 표준화했더니 다 Na 처리가 되어버려서)

## 아래부터는 6번에서 생성한 데이터를 활용하여 머신러닝 모델을 만들고 해석하는 부분입니다. 
# (5점) 7. k를 1~5까지 정의하여 kNN 모델을 생성해주세요. (preProcess 불필요, metric = "Accuracy")
customGrid<-expand.grid(k=1:5)
knnFit<-train(Survived~.,data=train,method='knn',trControl=ctrl,tuneGrid=customGrid,metric='Accuracy')
knnFit

# (5점) 8. 7번 모델에 대한 실행 결과를 해석해주세요.
# k가 (  1  )일 때 Accuracy가 (  55.95%  )%로 가장 높습니다. 


# (5점) 9. Boosted Logistic Regression 모델을 생성해주세요. (preProcess 불필요, metric = "Accuracy")
LogFit<-train(Survived~.,data=train,method='LogitBoost',trControl=ctrl,metric='Accuracy')
LogFit


# (5점) 10. 9번 모델에 대한 실행 결과를 해석해주세요.
# nIter가 (  31  )일 때 Accuracy가 (  79.8  )%로 가장 높습니다. 



# (5점) 11. Naive Bayes 모델을 생성해주세요. (preProcess 불필요, metric = "Accuracy")
NavFit<-train(Survived~.,data=train,method='naive_bayes',trControl=ctrl,metric='Accuracy')
NavFit


# (5점) 12. 11번 모델에 대한 실행 결과를 해석해주세요.
# useKernel이 (  TRUE  )일 때 Accuracy가 (  59.4  )%로 가장 높습니다. 