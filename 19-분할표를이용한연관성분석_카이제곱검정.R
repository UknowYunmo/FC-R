# 분할표를 이용한 연관성 분석 - 카이제곱 검정
# 분할표
두 변수가 모두 범주형에 속할 때, 도수 분포표를 2차원으로 확장한 형태

분할표를 통해 '차이'에 초점을 두기보다 '연관성'에 초점
귀무가설 : 흡연 여부와 폐암 유무는 연관성이 없다.
대립가설 : 흡연 여부와 폐암 유무는 연관성이 있다.
raw_chisq<-read.csv("htest05.csv",header=TRUE)
raw_chisq
rawTable<-table(raw_chisq)
rawTable
chisq.test(rawTable,correct=FALSE)
# 셀 기대도수>5 : correct=FALSE
# 셀 기대도수<=5 : correct=TRUE (피셔의 정확한 검정, 예이츠 보정 사용)
-> 지금은 모든 데이터 셋이 6 이상이므로 FALSE (보정이 필요없다)
p value = 0.02
0.05보다 크므로 귀무가설을 기각할 수 있다
-> 흡연 여부와 폐암 유무는 연관성이 있다

