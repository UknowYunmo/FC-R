# 파생변수 추가하기 - mutate
exam %>% mutate (total=math+english+science)
exam # 원본 데이터가 변하지 않았다, 그리구 변수 쓸 때 일일이 $ 붙이는 노가다를 안해도 됨
# 쉼표만으로 한 번에 여러가지 파생변수를 추가하는 것도 가능
exam %>% mutate (total=math+english+science,mean=(math+english+science)/3)
exam %>% mutate(test=ifelse(science>=60,"pass","fail")) %>% head
# %>%  뒤에 바로 원래 있던 변수였던것마냥 사용도 가능
exam %>% 
  mutate(total=math+english) %>% 
  arrange(total) %>% 
  head
#1 mpg 복사본을 만들고, cty와 hwy를 더한 '합산 연비 변수'를 추가하기
new_mpg<-mpg %>% mutate('합산 연비 변수'=cty+hwy)
head(new_mpg)

#2 앞에서 만든 '합산 연비 변수'를 2로 나눠 '평균 연비 변수'를 추가하기
new_mpg$'평균 연비 변수'<-new_mpg$'합산 연비 변수'/2
head(new_mpg)

#3 평균 연비 변수가 가장 높은 자동차 3종의 데이터를 출력
head(new_mpg %>% arrange(desc('평균 연비 변수')),3)

#4 1~3을 하나의 연결된 dplyr 구문으로 출력, 대신 복사본 없이 mpg 원본으로
head(mpg)
mpg %>%
  mutate(total=cty+hwy,mean=total/2) %>% 
  arrange(desc(mean)) %>% 
  head(3)
