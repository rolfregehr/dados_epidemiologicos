dataset <- 
constroi_mapa_tematico <- function(dataset){
  dataset %>% 
    inner_join(br_uf_map) %>% {
      ggplot(.) +
        geom_map(aes(x = long, y = lat,
                     map_id = id, fill = variavel),
                 color = 'gray30', map = ., data = .) + 
        theme_void() +
        coord_equal()
    }
}

