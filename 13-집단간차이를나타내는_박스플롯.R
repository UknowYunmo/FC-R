# 집단간 분포 차이를 표현하는 박스 플롯
library(ggplot2)
library(dplyr)
ggplot(data=mpg,aes(x=drv,y=hwy)) + geom_boxplot()

집단 간 차이를 확인할 수 있다.
가운데 줄은 중위값이다.
박스는 1~3사분위인데, 이는 하위 25%에서 상위 25%까지만 나타낸다.
점들은 이상치를 뜻하는데 정확한 값은
IQR(3사분위-1사분위)에 1.5를 곱한 값을 각각 1,3사분위에서 빼거나 더한 값보다
더 작거나 큰 범위에 있는 데이터를 뜻한다.

# class(자동차 종류)가 "compact","subcompact","suv"인 자동차의 cty(도시 연비)가 어떻게 다른지 상자 그림으로 표시해라
cp_mpg<-mpg %>% 
  filter(class %in% c("compact","subcompact","suv"))
ggplot(data=cp_mpg,aes(x=class,y=cty))+geom_boxplot()
