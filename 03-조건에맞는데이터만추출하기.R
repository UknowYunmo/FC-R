# 데이터 전처리 기본 (dplyr 패키지)
filter() - 행 추출
select() - 열(변수)추출
arrange() - 정렬
mutate() - 변수 추가
summarise() - 통계치 산출
group_by() - 집단별로 나누기
left_join() - 데이터 합치기(열)
bind_rows() - 데이터 합치기(행)
exam<-read.csv("csv_exam.csv")
exam
# filter - 행 추출
exam%>%filter(class==1) #%>%(파이프 기호)는 컨트롤+쉬프트+M 으로 입력
exam%>% filter(class==2)
exam %>% filter(class!=1) #1반 제외 전체
exam %>% filter(math>50)
exam %>% filter(class==1 & math>50) # and 연산자 &
exam %>% filter(class==1 | math>50) # or 연산자 |
exam %>% filter(class %in% c(1,3,5)) # 1 or 3 or 5 연산자 %in%

head(mpg)
#1 displ(배기량)이 4이하인 자동차와 5이상인 자동차중
#어떤 자동차의 hwy(고속도로 연비)가 평균적으로 더 높은가
mean((mpg %>% filter(displ<=4))$hwy)
mean((mpg %>% filter(displ>=5))$hwy)

#2 audi와 toyota 중 어느 manufacturer(제조회사)의 cty(도시 연비)가 평균적으로 더 높은가
mean((mpg %>% filter(manufacturer=="audi"))$cty)
mean((mpg %>% filter(manufacturer=="toyota"))$cty)

#3 "cheverolet","ford","honda" 자동차의 고속도로 연비 평균을 알아보려고 한다.
#회사들의 자동차를 추출한 뒤 hwy 전체 평균을 구해라
mean((mpg %>% filter(manufacturer%in%c("honda","chevrolet","ford")))$hwy)