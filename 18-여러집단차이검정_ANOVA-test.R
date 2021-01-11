ANOVA Test 조건
1. 검정표가 아님
2. 비교 집단이 3개 이상

setwd("c:/users/user/Desktop/RR/START-R")
rawN30<-read.csv("htest04.csv",header=TRUE)
rawN30
groupA4<-rawN30[rawN30$group=='A',1:2]
groupB4<-rawN30[rawN30$group=='B',1:2]
groupC4<-rawN30[rawN30$group=='C',1:2]
groupA4
mean(groupA4[,2])
mean(groupB4[,2])
mean(groupC4[,2])

ANOVA Test 과정
1. 가설 설정
귀무가설 : 세 집단 간 평균 차이가 없다
대립가설 : 세 집단 간 평균 차이가 있다
2. 정규성 검정
shapiro.test(groupA4[,2])
p value가 0.9로 0.05보다 크기 때문에 귀무가설을 채택
-> 데이터 셋이 정규분포를 따른다
qqnorm(groupA4[,2])
qqline(groupA4[,2])

shapiro.test(groupB4[,2])
qqnorm(groupB4[,2])
qqline(groupB4[,2])

shapiro.test(groupC4[,2])
qqnorm(groupC4[,2])
qqline(groupC4[,2])
3. 분산 동질성 검정
두 집단 간의 분산 동질성 검정은 var.test 였지만
세 집단 이상일 경우는 위 두 가지 검정을 사용한다.
(1) levene test
install.packages("lawstat")
library(lawstat)
levene.test(rawN30$height,rawN30$group)
p value가 0.3으로 0.05보다 크므로 귀무가설을 채택
-> 세 집단 간 분산이 동일하다
(2) bartlett test
bartlett.test(height~group,data=rawN30)
p value가 0.3으로 0.05보다 크므로 귀무가설을 채택
4. ANOVA 테스트
rawAnova<-aov(height~group,data=rawN30)
rawAnova
summary(rawAnova)
Sum Sq(group) : 총 그룹 간 오차, 자유도 : 2
Mean Sq(group) : 자유도로 나눈 값
Sum Sq(Residuals) : 총 그룹 내 오차 자유도 : 26
Mean Sq(Residuals) : 자유도로 나눈 값
F 통계량 =( (그룹 간 오차) / 그룹 간 자유도 ) / (그룹 내 오차 / 그룹 내 자유도 ) = Mean Sq(group) / Mean Sq(Residuals) = 18.2
5. 결론
F value 18.2보다 클 p value는 0.0001
0.05보다 작으므로 귀무가설을 기각할 수 있다.
즉 세 집단 간 키 평균 차이가 있다.