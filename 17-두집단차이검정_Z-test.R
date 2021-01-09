Z-검정 조건
1. 분할표가 아님
2. 그룹 개수가 2개
3. 데이터 개수가 30개 이상

rawN30<-read.csv("htest03.csv",header=TRUE)
rawN30
groupA<-rawN30[rawN30$group=='A',1:2]
groupA
groupB<-rawN30[rawN30$group=='B',1:2]
groupB
mean(groupA[,2]) #179.9
mean(groupB[,2]) #181.65

# z-test는 r 함수에 없기 때문에 별도로 생성
z.test <- function(x1, x2){
  n_x1 = length(x1)
  n_x2 = length(x2)
  mean_x1 = mean(x1)
  mean_x2 = mean(x2)
  cat("\n")
  cat("\tTwo Sample z-test\n")
  cat("\n")
  cat("mean of x1:", mean_x1, "\n")
  cat("mean of x2:", mean_x2, "\n")
  var_x1 = var(x1)
  var_x2 = var(x2)
  z = (mean_x1 - mean_x2)/sqrt((var_x1/n_x1)+(var_x2/n_x2))
  abs_z = abs(z)
  cat("z =", abs_z, "\n")
  p_value = 1-pnorm(abs_z)
  cat("p-value =", p_value)
}

z.test(groupA[,2],groupB[,2]) # 0.048
p값이 0.05보다 작기 때문에 귀무가설을 기각할 수 있다.
즉, 그룹 B의 평균 키는 그룹 A의 평균 키보다 크다.

그렇다면 만약 소표본일때 쓰는 t-test를 하면 어떻게 될까?

# 분산 동질성 검정
var.test(groupA[,2],groupB[,2]) # 0.09
-> 귀무가설을 기각할 수 없다 -> 두 집단 간 분산이 동일하다
t.test(groupA[,2],groupB[,2],alternative="less",var.equal=TRUE)
# p : 0.0513
p값이 0.05보다 크므로 귀무가설을 기각할 수 없다
-> 그룹 A와 그룹B 간의 평균 키 차이는 없다

결론 : Z-test를 써야하는데 T-test를 사용하게 되면
결과가 잘못 나올 수 있으니 명심하자.