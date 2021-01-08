# 막대 그래프
- 집단 간 차이를 표현할 때 주로 사용
ex) 성별 간 소득 차이

# 평균 막대 그래프를 만드려면 일단 그 데이터만 추려서 그룹화해야함
library(dplyr)
df_mpg<-mpg %>% 
  group_by(drv) %>% 
  summarise(mean_hwy=mean(hwy))
df_mpg

ggplot(data=df_mpg,aes(x=drv,y=mean_hwy)) + geom_col() # 컬럼의 값을 표현한다는 의미에서 col

#근데 이렇게 출력하면 출력되는 순서는 x축의 알파벳 순임

# 데이터 크기 순으로 정렬하기 reorder()
ggplot(data=df_mpg,aes(x=reorder(drv,-mean_hwy),y=mean_hwy)) + geom_col()
-> drv로 x축을 짜는데, mean_hwy가 감소하는 순으로 정렬하겠다

# 빈도 막대 그래프 - 값의 개수를 알아서 세서 비교
ggplot(data=mpg,aes(x=drv))+geom_bar()
-> 여기선 원본을 세면 되니까 mpg 로 하고, geom_bar를 쓴다.

ggplot(data=mpg,aes(x=hwy))+geom_bar()

#1 어떤 회사에서 생산한 "suv"의 차종의 도시 연비가 높은지 알아보려고 한다. 
"suv" 차종을 대상으로 평균 cty(도시 연비)가 가장 높은 회사 다섯 곳을 막대 그래프로 표현해라. 막대는 연비가 높은 순으로 정렬해라

df_mpg<-mpg %>%
  filter(class=="suv") %>% 
  group_by(manufacturer) %>% 
  summarise(mean_cty=mean(cty)) %>% 
  arrange(desc(mean_cty)) %>% 
  head(5)
ggplot(data=df_mpg,aes(x=reorder(manufacturer,-mean_cty),y=mean_cty))+geom_col()

#2 자동차 중에서 어떤 class(자동차 종류)가 가장 많은지 알아보려고 한다.
자동차 종류별 빈도를 표현한 막대 그래프를 만들어라

ggplot(data=mpg,aes(x=class))+geom_bar()