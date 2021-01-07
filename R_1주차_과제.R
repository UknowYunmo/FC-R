library(dplyr)
library(ggplot2)
#1 head 함수를 활용하여 "mpg" 상위 데이터 10개를 출력
head(mpg,10)
#2 seq 함수를 활용하여 1~50까지 숫자 중 5의 배수를 출력
seq(5,50,by=5)
#3 paste 함수를 활용하여 "2021-05-06"이라는 문자열을 출력
year<-"2021"
month<-"05"
day<-"06"
paste(year,month,day,sep="-")
#4 1~50까지의 숫자가 있을 때, 각 숫자에 3을 곱한 결과를 출력
seq(3,150,by=3)
#5~7 ggplot2 패키지의 "diamonds" 활용
#5 데이터의 크기 확인
dim(diamonds)
#6 변수들의 속성 확인
str(diamonds)
#7 요약 통계량 확인
summary(diamonds)
