##### Datas
atend_ps$mes_atend <- paste(substr(atend_ps$DT_ATEND, 1, 4), substr(atend_ps$DT_ATEND, 5, 6), "01", sep = "-")
atend_ps$mes_atend <- as.Date(atend_ps$mes_atend)

##### CID
atend_ps$cid_3c <- substr(atend_ps$CIDPRI, 1, 3)
