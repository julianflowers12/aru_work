## species modelling 
library(tidyverse)
path <- here::here("data")

df <- read_csv(glue::glue(path, "/Poecile montanus.csv"), show_col_types = FALSE) %>%
  janitor::clean_names()

head(df)

#counts from 2000 - reasonably stable annual counts
plot_2000 <- df %>%
  count(start_date_year) %>%
  filter(start_date_year >= 2000) %>%
  ggplot(aes(start_date_year, n)) +
  geom_col()
