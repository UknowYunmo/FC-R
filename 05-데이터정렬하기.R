# 데이터 정렬하기 - arrange
exam %>% arrange(math) # 오름차순
exam %>% arrange(desc(math)) #내림차순
exam %>% arrange(class,math) # 클래스-> 수학 순서

#"audi"에서 생산한 자동차 중 어떤 자동차 모델의 hwy(고속도로 연비)가 높은지 알아보려고 한다. "audi"에서 생산한 자동차 중 hwy가 1~5위인 자동차의 데이터만 출력해라
head(mpg %>% arrange(desc(hwy)),5)
