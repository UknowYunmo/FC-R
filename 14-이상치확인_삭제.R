# 이상치 정제
# 결측 처리는 어떻게?
1. 존재할 수 없는 값 -> 삭제
2. 극단적인 값 -> 정상범위 내 치환

# sex는 3, score는 6점이 나올 수가 없는데 있는 경우
outlier<-data.frame(sex=c(1,2,1,3,2,1),score=c(5,4,2,4,2,6))
outlier

# 이상치가 있는지 확인하는 팁 - table로 변수 수 count해보기
table(outlier$sex)
table(outlier$score)

# 결측치 처리
outlier$sex<-ifelse(outlier$sex==3,NA,outlier$sex)
table(outlier$sex)
outlier$score<-ifelse(outlier$score>5,NA,outlier$score)
table(outlier$score)

# 결측치 제외한 뒤 분석
outlier %>% 
  filter(!is.na(sex)&!is.na(score)) %>% 
  group_by(sex) %>% 
  summarise(mean_score=mean(score))

# 극단적인 값 처리하기
boxplot(mpg$hwy) #ggplot이 아닌 r에 내장되어 있는 함수
boxplot(mpg$hwy)$stats
mpg$hwy=ifelse(mpg$hwy<12|mpg$hwy>37,NA,mpg$hwy)
table(is.na(mpg$hwy))

# 극단치 제거하고 분석하기
mpg %>% 
  group_by(drv) %>% 
  summarise(mean_hwy=mean(hwy,na.rm=T))

#mpg 데이터를 불러와서 일부러 이상치를 만들어라
mpg[c(!0,14,58,93),"drv"]<-"k"
mpg[c(29,43,129,203),"cty"]<-c(3,4,39,42)
#이상치가 들어있는 mpg데이터에서 문제를 해결해라
구동방식별 도시 연비가 다른지 알아보아라.
1. drv에 이상치가 있는지 확인해라. 이상치를 결측 처리한 뒤, 이상치가 사라졌는지 확인해라.
table(mpg$drv)
- 확인결과 k가 4개 들어있다.
mpg$drv<-ifelse(mpg$drv=="k",NA,mpg$drv)
table(mpg$drv)
2. 상자 그림을 이용해서 cty에 이상치가 있는지 확인해라. 상자 그림의 통계치를 이용해 정상 범위를 벗어난 값을 결측처리한 후 다시 상자 그림을 만들어 이상치가 사라졌는지 확인해라
boxplot(mpg$cty)$stats
-비정상적으로 높은 결측치가 6개, 낮은 결측치 2개가 들어있다.
mpg$cty<-ifelse(mpg$cty>26,NA,ifelse(mpg$cty<9,NA,mpg$cty))
boxplot(mpg$cty)
3. 이상치를 제거한 두 변수로 분석을 진행해라.drv 별로 cty 평균이 어떻게 다른지 하나의 dplyr 구문으로 확인해라
mpg %>% 
  filter(!is.na(drv)&!is.na(cty)) %>% 
  group_by(drv) %>% 
  summarise(cty_mean=mean(cty,na.rm=T))
