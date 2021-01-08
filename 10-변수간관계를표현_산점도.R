# R로 만들 수 있는 그래프의 종류
2차원,3차원 그래프
지도 그래프
네트워크 그래프
모션 차트
인터랙티브 그래프

# 쉽게 만들 수 있는 ggplot2 패키지

ggplot2는 레이어 구조로 이루어져있다.

1단계 : 배경설정(축)
2단계 : 그래프추가(점,막대,선) -> 2까지만 해도 그래프는 완성된다
3단계 : 설정추가(축 범위,색,표식)

# 산점도
- 데이터를 x축과 y축에 점으로 표현한 그래프
연속 값으로 된 두 변수의 관계를 표현할 때 사용 (나이-소득)

library(ggplot2)
mpg
ggplot(data=mpg,aes(x=displ,y=hwy)) # 배경 설정
ggplot(data=mpg,aes(x=displ,y=hwy)) + geom_point() # 배경에 산점도 추가
ggplot(data=mpg,aes(x=displ,y=hwy)) + geom_point()+
  xlim(3,6) + ylim(10,30) # xlimit,ylimit : x끝,y끝 설정

# ggplot(데이터,축) + 그래프 종류 + 세부 설정

# ggplot()과 qplot()의 차이
qplot() 은 quick plot의 약자로, 전처리 단계 데이터 간단히 확인하는 용도
ggplot()은 최종 보고용, 세부 조작 가능

ggplot(data=mpg,aes(x=cty,y=hwy))+geom_point()
ggplot(data=midwest,aes(x=poptotal,y=popasian))+geom_point()+
  xlim(0,500000)+ylim(0,10000)
