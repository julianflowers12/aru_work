create_reading_list <- function(){
  
  require(tidyverse)
  options(scipen = 999)
  path <- here::here("data")
  files <- list.files(path, pattern = ".csv")
  files <- paste0(path, "/", files)[1:6]
  rl <- map(files, read_csv, col_types = "ccccdddcccc" ) %>%
    #map(., as.character(.$ISBN10)) %>%
    map_dfr(., tibble)
  
  rl
}

rl <- create_reading_list() %>%
  write_csv("full-list.csv")


