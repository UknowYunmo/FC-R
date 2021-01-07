# 엑셀 불러오고, 저장하기
library(readxl)
df_finalexam<-read_excel("finalexam.xlsx",sheet=1,col_names=T)
df_finalexam
mean(df_finalexam$math)
read.csv("csv_exam.csv",header=T)
write.csv(df_finalexam,file="output_newdata.csv")
