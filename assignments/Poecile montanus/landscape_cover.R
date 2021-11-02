#willow tit landcover

library(tidyverse)

path <- here::here("assignments/Poecile montanus")

wt <- read_csv(glue::glue(path, "/landcover-stats.csv"))
codebook <- read_csv(glue::glue(path, "/landcover-codebook.csv")) %>%
  janitor::clean_names()
glimpse(codebook)

wt %>% 
  left_join(codebook,by = c("SAMPLE_1" = "lc_identifier")) %>%
  group_by(ukceh_land_cover_calss, decade) %>%
  filter(decade >= 1960, decade < 2020) %>%
  summarise(sum = sum(count)) %>%
  ungroup() %>%
  pivot_wider(names_from = "decade", values_from = "sum", values_fill = 0)

decadal_obs <- wt %>% 
  left_join(codebook,by = c("SAMPLE_1" = "lc_identifier")) %>%
  group_by(decade) %>%
  filter(decade >= 1960, decade < 2020) %>%
  mutate(sum = sum(count), prop = 100 * count / sum) %>%
  fill(ukceh_aggregate_class, .direction = "downup") 

decadal_obs %>%
  ggplot(aes(decade,count , fill = ukceh_aggregate_class)) +
  geom_col(position = "fill") + 
  viridis::scale_fill_viridis(discrete = TRUE, option = "mako", direction = -1) +
  theme_minimal()



decadal_obs %>%
  janitor::tabyl(decade, ukceh)
