# 필요한 변수만 추출하기 - select
exam %>% select(english)
exam$english
exam %>% select(class,math,english)
exam %>% select(-math, -english)
# 1반인 학생들의 영어 점수만 출력
exam %>% filter(class==1) %>% select(english) 
# 가독성 있게 변경
exam %>%
  filter(class==1) %>% 
  select(english)
exam %>% 
  select(id,math) %>% 
  head(10)

#1 mpg 데이터에서 class, cty 변수만 추출해 새로운 데이터 만들고 확인하기
new_data<-mpg %>% select(class,cty)
head(new_data)

#2 class(자동차 종류)가 "suv"인 자동차와 "compact"인 자동차 중 어떤 자동차의 cty(도시 연비)가 더 높은지 확인하기
mean((mpg %>% filter(class=="suv"))$cty)
mean((mpg %>% filter(class=="compact"))$cty)
