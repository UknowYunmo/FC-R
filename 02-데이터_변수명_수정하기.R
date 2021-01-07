install.packages("dplyr")
library(dplyr)
df_raw<-data.frame(var1=c(1,2,1),var2=c(2,3,2))
df_raw
# 데이터 프레임 복사본 만들기
df_new<-df_raw
df_new
# 변수명 바꾸기
df_new<-rename(df_new, v2=var2) # var2를 v2로 수정할게
df_new

#! ggplot2 패키지의 mpg 데이터를 사용할 수 있도록 불러온 뒤 복사본 만들기
mpg<-as.data.frame(ggplot2::mpg)
mpg_new<-mpg
mpg_new
#2 복사본 데이터를 이용해서 cty는 city로, hwy는 highway로 변수명을 수정하기
mpg_new=rename(mpg_new, city=cty)
mpg_new=rename(mpg_new, highway=hwy)
mpg_new
#3 일부만 출력해서 확인하기
head(mpg_new)
