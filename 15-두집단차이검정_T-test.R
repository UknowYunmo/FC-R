rawN3<-read.csv("htest01.csv",header=TRUE)
groupA<-rawN3[rawN3$group=='A',1:2]
groupA
groupB<-rawN3[rawN3$group=='B',1:2]
mean(groupA[,2]) #170
mean(groupB[,2]) #181

T-test 조건
1. 분할표가 아님
2. 그룹 개수가 2개
3. 데이터의 개수가 30 이하
4. 대응 표본이 아님

T-test 과정

1. 가설 설정
그룹 A가 그룹 B보다 크다.

2. 데이터 정규성 검정
귀무가설 - 데이터셋이 정규분포를 따른다.
대립가설 - 데이터셋이 정규분포를 따르지 않는다.
이 경우 내 주장이 들어가지 않기 때문에
귀무가설과 대립가설에 좀 차이가 있다.

정규성을 검정하는 방법
(1)
shapiro.test(groupA[,2])
shapiro.test(groupB[,2])
p-value가 0.05보다 크기 때문에 귀무가설을 채택
-> 데이터 셋이 정규분포를 따른다
(2)
qqnorm(groupA[,2])
qqnorm(groupB[,2])
# 정규분포의 QQ plot을 그리는 함수
qqline(groupA[,2])
qqline(groupB[,2])
# QQ plot에서 1Q와 3Q를 지나는 선을 그리는 함수
###정규분포라면 직선이 된다###

3. 분산 동질성 검정
귀무가설 - 두 집단 간 분산이 동일하다
대립가설 - 두 집단 간 분산이 다르다
var.test(groupA[,2],groupB[,2])
0.05보다 크기 때문에 귀무가설을 채택
-> 두 집단 간 분산이 동일하다

4. T-test
분산이 같기 때문에 t 검정 중 합동분산을 사용한다.
분산이 다르면, 일반 T-test
t.test(groupA[,2],groupB[,2],alternative="less",var.equal=TRUE)
# alternative="less" : 대립가설에서 왼쪽값이 오른쪽값보다 작다는 뜻
# var.equal=TRUE 두 집단의 분산이 동일하다는 뜻

검정 결과 p 값 : 0.1154
0.05보다 크므로, 귀무가설을 채택한다.

5. 결론
A와 B 두 집단 간 평균 키의 차이는 없다.

#예제 2
rawN10<-read.csv("htest02.csv",header=TRUE)
groupA<-rawN10[rawN10$group=='A',1:2]
groupA
groupB<-rawN10[rawN10$group=='B',1:2]
mean(groupA[,2]) #170
mean(groupB[,2]) #181

shapiro.test(groupA[,2])
shapiro.test(groupB[,2])
qqnorm(groupA[,2])
qqnorm(groupB[,2])
qqline(groupA[,2])
qqline(groupB[,2])
var.test(groupA[,2],groupB[,2]) # p : 0.02
p값이 0.05보다 작으므로 귀무가설을 기각하고 대립가설을 채택
-> 두 집단 간 분산이 다르다
t.test(groupA[,2],groupB[,2],alternative="less",var.equal=FALSE) # p : 0.02
p값이 0.05보다 작으므로 귀무가설을 기각하고 대립가설을 채택
결론 : 그룹B의 평균 키가 그룹 A의 평균키보다 크다