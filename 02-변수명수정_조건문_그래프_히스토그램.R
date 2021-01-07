# 파생 변수 만들기
df<-data.frame(var1=c(4,3,8),var2=c(2,6,1))
df
df$var_sum<-df$var1+df$var2
df
df$var_mean<-df$var_sum/2
df
mpg
mpg$total<-(mpg$cty+mpg$hwy)/2
head(mpg)
summary(mpg$total) # 요약 통계량
hist(mpg$total) # 히스토그램 생성

#조건문 활용
ifelse(mpg$total>=20,"pass","fail")
mpg$test<-ifelse(mpg$total>=20,"pass","fail")
head(mpg)

#빈도표
table(mpg$test)

#막대 그래프로 빈도 표현하기
qplot(mpg$test)

#중첩 조건문 활용하기
mpg$grade<-ifelse(mpg$total>=30, "A", ifelse(mpg$total>=20, "B","C"))
head(mpg,20)
table(mpg$grade)
qplot(mpg$grade)
hist(mpg$grade)

#데이터 파악하기
head(mpg) #데이터 앞부분
tail(mpg) #데이터 뒷부분
View(mpg) #데이터 뷰어 창
dim(mpg) #차원
str(mpg) #속성
summary(mpg)#요약 통계량
