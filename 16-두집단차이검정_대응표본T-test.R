대응표본 T-test 조건
1. 분할표가 아님
2. 그룹 개수가 2개
3. 데이터의 개수가 30 이하
4. 대응 표본임

대응 표본 : 조사 대상이 동일한 대상일 때
ex)광고 효과, 다이어트 약 효과 등
즉 대응 표본은 '변화'에 주목한다.
-> 데이터의 차이가 유의미한가 아닌가?
  
raw_d<-read.csv("htest02d.csv",header=TRUE)
raw_d
groupA<-raw_d[,1]
groupB<-raw_d[,2]
groupA
groupB
mean(groupA) #10500
mean(groupB) #23800

대응표본 t-test 과정
1. 가설 설정
귀무 가설 : 판매액이 변화하지 않았다.
대립 가설 : 그룹B의 판매액이 증가했다.
2. 데이터 정규성 검정 (차이에 대한 검정)
귀무가설:데이터셋이 정규분포를 따른다
대립가설:데이터셋이 정규분포를 따르지 않는다
d=groupA-groupB
d
shapiro.test(d) #0.16
0.05보다 크니 데이터 셋이 정규분포를 따른다.
qqnorm(d)
qqline(d)

##
대응표본 T-test는
A,B 두 집단 각각을 비교하는 것이 아니라
두 집단 차이로 파생된, A-B
즉 하나의 집단만 보기 때문에
비교할 대상도 없다.
그러니 분산 동질성 검정은 하지 않는다.
##

3. T-test
t.test(groupA,groupB,alternative="less",paried=TRUE)
# var.equal 대신 paired
# p : 0.04

4. 결론
p값이 0.05보다 작기 때문에
귀무가설을 기각할 수 있다.
따라서 마케팅을 통해 판매액이 증가했다.