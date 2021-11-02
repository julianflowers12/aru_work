## species modelling 
library(tidyverse); library(ggmap)
path <- here::here("data")

df <- read_csv(glue::glue(path, "/Poecile montanus.csv"), show_col_types = FALSE) %>%
  janitor::clean_names()

head(df)
options(scipen = 999)
willow_tit_decades <- df %>%
  select(latitude = latitude_wgs84, 
         longitude = longitude_wgs84, 
         scientific_name, 
         common_name, species_id_tvk, 
         year = start_date_year, error = coordinate_uncertainty_m) %>%
  mutate(decade = year - year%%10) %>%
  write_csv(glue::glue(path, "/willow_tit_decades.csv"))

#counts from 2000 - reasonably stable annual counts
plot_2000 <- df %>%
  count(start_date_year) %>%
  filter(start_date_year >= 2000) %>%
  ggplot(aes(start_date_year, n)) +
  geom_col()


df %>%
  filter(start_date_year >= 2000, start_date_year < 2020) %>%
  ggplot(aes(longitude_wgs84, latitude_wgs84, colour = factor(start_date_year))) +
  geom_point() +
  facet_wrap(~ start_date_year)

