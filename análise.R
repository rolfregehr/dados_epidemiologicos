library(tidyverse)
library(lubridate)


atend_ps %>% mutate(mes = round_date(mes_atend, "month"), qtde = n()) %>%
  group_by(mes, SEXOPAC) %>%
  summarize(qtde = n())%>%
  ggplot(aes(mes, qtde, fill=SEXOPAC))+
  geom_point()+
  geom_smooth()



atend_ps %>% mutate(mes = round_date(mes_atend, "month"), qtde = n()) %>%
  group_by(mes, IDADEPAC) %>%
  summarize(qtde)%>%
  ggplot(aes(IDADEPAC, qtde))+
  geom_boxpl()+
  geom_smooth()
