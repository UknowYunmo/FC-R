# 선 그래프 - 시간에 따라 달라지는 데이터
시계열 데이터
- 일정 시간 간격을 두고 나열된 시계열 데이터를 선으로 표현한 그래프.
환율, 주가지수 등 경제 지표가 시간에 따라 어떻게 변하는지 표현할 때 사용

economics
ggplot(data=economics,aes(x=date,y=unemploy))+geom_line()

# psavert(개인 저축률)가 시간에 따라서 어떻게 변해왔는지 확인하고 한다.
시간에 따른 개인 저축률의 변화를 시계열 그래프로 나타내라.

ggplot(data=economics,aes(x=date,y=psavert))+geom_line()
