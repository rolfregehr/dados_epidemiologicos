library(tidyverse)


aleatorio %>% 
    inner_join(br_uf_map) %>% {
      ggplot(.) +
        geom_map(aes(x = long, y = lat,
                     map_id = id, fill = valor),
                 color = 'gray30', map = ., data = .) + 
        theme_void() +
        coord_equal()
    }


cid_anomes$chave <- paste(cid_anomes$cidade, cid_anomes$anomes)
atend_ps$chave <- paste(atend_ps$UFMUN, atend_ps$DT_ATEND)
br_uf_map$uf = br_uf_map$id



atend_ps %>% filter(cid_3c %in% c("F10", "F11", "F12", "F13", "F14", "F15", "F16", "F17", "F18", "F19")) %>%
  group_by(UFMUN, DT_ATEND) %>%
  mutate(atendimentos = n()) %>%
  summarise(atendimentos) %>%
  distinct(UFMUN, DT_ATEND, atendimentos) %>%
  mutate(chave = paste(UFMUN, DT_ATEND)) %>%
  left_join(cidade_ano_mes_pop, by = "chave") %>%
  mutate(taxa =  atendimentos*100000/populacao) %>%
  group_by(uf)%>%
  mutate(taxa=mean(taxa))%>%
  distinct(uf, taxa) %>%
  filter(!is.na(uf))%>% 
  inner_join(br_uf_map) %>% {
    ggplot(.) +
      geom_map(aes(x = long, y = lat,
                   map_id = uf, fill = taxa),
               color = 'gray30', map = ., data = .) + 
      theme_void() +
      coord_equal()
  } +
  ggtitle("Taxa de atendimentos psicossociais por uso e abuso de drogas - F10 a F19") +
  scale_fill_continuous(name = "Taxa/100 mil hab.", low = 'blue', high = 'red')



atend_ps %>% filter(cid_3c %in% c("F32")) %>%
  group_by(UFMUN, DT_ATEND) %>%
  mutate(atendimentos = n()) %>%
  summarise(atendimentos) %>%
  distinct(UFMUN, DT_ATEND, atendimentos) %>%
  mutate(chave = paste(UFMUN, DT_ATEND)) %>%
  left_join(cidade_ano_mes_pop, by = "chave") %>%
  mutate(taxa =  atendimentos*100000/populacao) %>%
  group_by(uf)%>%
  mutate(taxa=mean(taxa))%>%
  distinct(uf, taxa) %>%
  filter(!is.na(uf))%>% 
  inner_join(br_uf_map) %>% {
    ggplot(.) +
      geom_map(aes(x = long, y = lat,
                   map_id = uf, fill = taxa),
               color = 'gray30', map = ., data = .) + 
      theme_void() +
      coord_equal()
  } +
  ggtitle("Taxa de atendimentos psicossociais por uso e abuso de drogas - F10 a F19") +
  scale_fill_continuous(name = "Taxa/100 mil hab.", low = 'blue', high = 'red')

