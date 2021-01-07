# 집단 별로 데이터 요약하기
# 요약하기 - summarise
exam %>% summarise(mean_math=mean(math)) # group_by로 연동하기 위함
exam %>% 
  group_by(class) %>% 
  summarise(mean_math=mean(math))
# 여러 개
exam %>% 
  group_by(class) %>% 
  summarise(mean_math=mean(math),sum_math=sum(math),median_math=median(math),
            n=n()) # 학생 수, 행의 수

# summarise에 활용되는 요약통계량 함수
mean - 평균
sd - 표준편차
sum - 합계
median - 중앙값
min - 최소값
max - 최대값
n - 빈도

# 집단 별로 나누고 또 나누기 ( ex - 제조사별, 구동 방식)
mpg %>% 
  group_by(manufacturer,drv) %>% 
  summarise(mean_cty=mean(cty)) %>% 
  head(10)

#1 mpg 데이터의 class는 "suv","compact" 등 자동차를 특징에 따라 7종류로 분류한 변수다. 어떤 차종의 연비가 높은지 비교해보려고 한다. class 별 cty 평균을 구해라

mpg %>% 
  group_by(class) %>% 
  summarise(mean_cty=mean(cty))

#2 1번은 class의 알파벳 순으로 정렬되어 있는데 cty 평균 순으로 정렬해라

mpg %>% 
  group_by(class) %>% 
  summarise(mean_cty=mean(cty)) %>% 
  arrange(desc(mean_cty))

#3 어떤 회사의 hwy(고속도로 연비)가 가장 높은지 알아보려고 한다. hwy 평균이 가장 높은 회사 세 곳을 출력해라

mpg %>% 
  group_by(manufacturer) %>% 
  summarise(mean_hwy=mean(hwy)) %>% 
  head(3)

#4 어떤 회사에서 "compact"(경차) 차종을 가장 많이 생산하는지 알아보려고 한다. 각 회사별 "compact" 차종 수를 내림차순으로 정렬해 출력해라

mpg %>% 
  filter(class=="compact") %>% 
  group_by(manufacturer) %>% 
  summarise(n=n()) %>% 
  arrange(n)
