1-1
데이터 불러오기
setwd("c:/Users/user/Desktop/RR")
getwd()
data<-read.csv("kc_house_data.csv",header=T)

1-2
데이터 검토하기
dim(data)
str(data)
head(data)
summary(data)
View(data)

2
floors 변수의 각 층별 빈도
table(data$floors)

3
floors 변수가 1이면 'low', 1보다 크면 'high'로 구분하는 'floors_level' 만들기
library(dplyr)
data<-data %>% mutate(floors_level=ifelse(floors==1,'low','high'))
head(data$floors_level)

4
3에서 생성한 floors_level에 따른 평균 집 값을 출력하는 함수를 생성
mean((data %>% filter(floors_level=='low'))$price)
mean((data %>% filter(floors_level=='high'))$price)

5
grade가 4인 집과 13인 집의 평균 집 값 비교하려 한다.
grade가 4인 집은 group1, 13인 집은 group2라는 새로운 데이터 프레임을 생성하기
이 때 변수는 grade와 price만 추출
data2<-data %>%
  filter(grade==4 | grade==13) %>% 
  select(grade,price)
data2$grade<-ifelse(data2$grade==4,'group1','group2')
data2

6-1
5에서 생성한 데이터 프레임으로 집 가격 차이에 대한 검정
(정규성과 등분산성을 만족한다고 가정)
mean((data2 %>% filter(grade=='group1'))[,2])
mean((data2 %>% filter(grade=='group2'))[,2])
t.test((data2 %>% filter(grade=='group1'))[,2],(data2 %>% filter(grade=='group2'))[,2],alternative="less",var.equal=TRUE)

6-2 결과 해석
p-value가 4.698e-13으로 유의수준 0.05보다 작으므로 귀무가설을 기각한다.

7-1
월별로 평균 집 값에 차이가 있는지 검증
(정규성과 등분산성을 만족한다고 가정)
data$month<-substr(data$date,5,6)
table(data$month)
data3<-data %>% 
  select(month,price)
head(data3)

data_aov<-aov(month~price,data=data3)
data_aov

7-2 결과 확인, 해석
summary(data_aov)

p-value가 0.138로 유의수준 0.05보다 크므로 귀무가설을 채택한다.