library(tidyverse)

library(read.dbc)

atend_ps$mes_atend = NULL
atend_ps$cid_3c = NULL

arq = list.files("D:/OneDrive - Senado Federal/Epidemiologia/dados_epidemiologicos/fonte - DATASUS")

setwd("D:/OneDrive - Senado Federal/Epidemiologia/dados_epidemiologicos/fonte - DATASUS")

cont = 1

for (i in arq) {
  
  if (cont == 0) {
    
    atend_ps = subset(read.dbc(i), select = c('UFMUN', 'DT_ATEND', 'CNS_PAC', 'IDADEPAC', 'SEXOPAC', 'RACACOR', 'CIDPRI', 'CIDASSOC', 'PERMANEN'))
    
  } 
  else {
    atend_ps = rbind(atend_ps, subset(read.dbc(i), select = c('UFMUN', 'DT_ATEND', 'CNS_PAC', 'IDADEPAC', 'SEXOPAC', 'RACACOR', 'CIDPRI', 'CIDASSOC', 'PERMANEN')))
    atend_ps = atend_ps[!is.na(atend_ps$PERMANEN),]
  }
  
  
  print(i)
  cont = cont+1
  print(cont)
  print(length(atend_ps$CNS_PAC))
}

