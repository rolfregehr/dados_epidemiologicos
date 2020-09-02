library(tidyverse)

library(read.dbc)


arq = list.files("D:/Dados epidemiológicos/PS/")

setwd("D:/Dados epidemiológicos/PS/")

cont = 0

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

teste <- read.dbc("PSRO1903.DBC")

left_join()