library(tidyverse); library(ggmap)

path <- here::here("data/")

df <- read_csv(paste0(path, "Paridae 2010-2020.csv")) %>%
  janitor::clean_names()

df %>%
  add_count(scientific_name)

df %>% 
  ggplot(aes(x = longitude_wgs84, 
             y = latitude_wgs84, 
             colour = common_name)) +
  geom_point() + 
  facet_wrap(~start_date_year)
