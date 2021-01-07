#1 popadults는 해당 지역의 성인 인구, poptotal은 전체 인구를 나타낸다. midwest 데이터에 '전체 인구 대비 미성년 인구 백분율' 변수를 추가해라, 또 가장 높은 상위 지역 5개를 뽑아라
midwest %>% 
  mutate(per_pop=(poptotal-popadults)/poptotal) %>% 
  arrange(desc(per_pop)) %>%
  select(county) %>% 
  head(5)

#2 분류표의 기준에 따라 미성년 비율 등급 변수를 추가하고, 각 등급에 몇 개의 지역이 있는지 출력해라
large : 40% 이상
middle : 30%~40% 미만
small : 30% 미만

midwest %>% 
  mutate(per_pop=(poptotal-popadults)/poptotal,
         per_rank=ifelse(per_pop>=0.4,"large",
                  ifelse(per_pop>=0.3,"middle","small"))) %>% 
  group_by(per_rank) %>% 
  summarise(cnt=n())

#3 popasian은 해당 지역의 아시아인 인구를 나타낸다. '전체 인구 대비 아시아인 인구 백분율' 변수를 추가하고, 하위 10개 지역의 state(주),county(지역명),아시아인 인구 백분율을 출력해라

midwest %>% 
  mutate(per_asian=popasian/poptotal) %>% 
  arrange(per_asian) %>% 
  head(10) %>% 
  select (state,county,per_asian)
