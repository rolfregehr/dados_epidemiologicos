library(tidyverse)
library(lubridate)


atend_ps %>% mutate(mes = round_date(mes_atend, "month"), qtde = n()) %>%
  filter(cid_3c == "F19") %>%
  group_by(mes, SEXOPAC) %>%
  summarize(qtde = n())%>%
  ggplot(aes(mes, qtde, fill=SEXOPAC))+
  geom_point()+
  geom_smooth()
