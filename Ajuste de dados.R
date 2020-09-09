##### Datas
atend_ps$mes_atend <- paste(substr(atend_ps$DT_ATEND, 1, 4), substr(atend_ps$DT_ATEND, 5, 6), "01", sep = "-")
atend_ps$mes_atend <- as.Date(atend_ps$mes_atend)

##### CID
atend_ps$cid_3c <- substr(atend_ps$CIDPRI, 1, 3)

atend_ps$PERMANEN = as.numeric(atend_ps$PERMANEN)

library(tidyverse)
cidade_ano_mes_pop<-cidade_ano_mes_pop %>% rename(nome_cidade=`nome_cid]`)
cidade_ano_mes_pop<-cidade_ano_mes_pop %>% rename(regiao=Região)

atend_psicossociais <- atend_psicossociais %>%
  group_by(UFMUN, DT_ATEND, IDADEPAC, SEXOPAC, RACACOR, cid_3c, PERMANEN, nome_cidade, estado, regiao, populacao) %>%
  mutate(atendimentos = n()) %>%
  summarise(atendimentos) %>%
  distinct(UFMUN, DT_ATEND, IDADEPAC, SEXOPAC, RACACOR, cid_3c, PERMANEN, nome_cidade, estado, regiao, populacao, atendimentos)

sum(atend_psicossociais$atendimentos) - 16434750



atend_ps <- left_join(atend_ps, cidade_ano_mes_pop, by="chave")
