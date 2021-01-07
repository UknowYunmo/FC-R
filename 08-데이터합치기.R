# 데이터 합치기
# 1. 가로로 합치기 (변수 추가)
# 2. 세로로 합치기 (행 추가)

test1<-data.frame(id=c(1,2,3,4,5),midterm=c(60,80,70,90,85))
test1
test2<-data.frame(id=c(1,2,3,4,5),final=c(70,83,65,95,80))
test2

total<-left_join(test1,test2,by="id") # 가로로 합치기
total

name<-data.frame(class=c(1,2,3,4,5),teacher=c("kim","lee","park","choi","jung"))
name

exam
class<-left_join(exam,name, by="class")
class

group_a<-data.frame(id=c(1,2,3,4,5),test=c(60,80,70,90,85))
group_b<-data.frame(id=c(6,7,8,9,10),test=c(70,83,65,95,80))

group_all<-bind_rows(group_a,group_b) # 세로로 합치기
group_all

fuel<-data.frame(fl=c("c","d","e","p","r"),price_fl=c(2.35,2.38,2.11,2.76,2.22),
                 stringsAsFactors=F) # 문자 데이터를 Factor 타입으로 변환하지 말어라
fuel

mpg<-left_join(mpg,fuel,by="fl")
mpg