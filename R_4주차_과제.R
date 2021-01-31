library(caret)
library(tree)
set.seed(2020)
bcw<-read.csv("BCW.csv")
bcw<-bcw[,-1]

1-1 bcw의 diagnosis 변수를 facotr 형으로 변환
bcw$diagnosis<-as.factor(bcw$diagnosis)
str(bcw)

1-2 train 데이터와 test 데이터를 7:3의 비율로 저장
nrow(bcw)
datatotal<-sort(sample(nrow(bcw),nrow(bcw)*.7))
train<-bcw[datatotal,]
test<-bcw[-datatotal,]
nrow(train)
nrow(test)
train_x<-train[,1:13]
train_y<-train[,14]
test_x<-test[,1:13]
test_y<-test[,14]

1-3 traget 변수는 diagnosis이다. tree함수를 이용해서 train데이터를 결정나무에 적합시키기
treeRaw<-tree(diagnosis~.,data=bcw)
plot(treeRaw)
text(treeRaw)
cv_tree<-cv.tree(treeRaw,FUN=prune.misclass)
plot(cv_tree) # 7로 결정

1-4 size 7로 가지치기한 결정나무를 적합시키기
prune_tree<-prune.misclass(treeRaw,best=7)
plot(prune_tree)
text(prune_tree,pretty=0)

2-1 선형 SVM 적합시키기
ctrl<-trainControl(method="repeatedcv",repeats=3)
svm_linear_fit<-train(diagnosis~.,data=bcw,method="svmLinear",trControl=ctrl,preProcess=c("center","scale"),metric="Accuracy")
svm_linear_fit

2-2 test 데이터의 diagnosis 예측, 혼동행렬 작성
pred_test<-predict(svm_linear_fit,newdata=test)
confusionMatrix(pred_test,test$diagnosis)

3-1 2~31열을 pca
bcw.pca<-prcomp(bcw[2:31],center=T,scale. = T)

3-2 분산의 90% 이상을 설명하려면 몇 개의 주성분을 사용해야 하는가
summary(bcw.pca)
# 정답 : 7개

4 2번째 열부터 31번째 열을 이용해서 k-means clusering 실시, k=5로
install.packages("factoextra")
library(factoextra)
fviz_nbclust(bcw[,2:31],kmeans=,method="wss",k.max=5) + theme_minimal()+ggtitle("Elbow Method")

5-1 bcw.dist에 wards method 적용
bcw.dist<-dist(bcw[,2:31],method='euclidean')
bcw.dist
bcw.hclust.ward<-hclust(bcw.dist,method="ward.D2")

5-2 cutree 함수를 이용해 cluster 생성, 군집은 5개로
bcw.clusters<-cutree(bcw.hclust.ward,k=5)
table(bcw.clusters)
