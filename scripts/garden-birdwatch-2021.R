## garden birdwatch results 2021

here::here("data")

library(readr)
library(tidyverse)
library(janitor)

data <- read_csv(paste0(here::here("data"),"/full-2021-results-for-web.csv")) %>%
  clean_names()

data %>%
  count(species, sort = TRUE)

data |>
  select(species, contains("gardens"), -contains("change")) %>%
  pivot_longer(names_to = "metric", values_to = "percent_gardens", cols = c(c("percent_gardens_2021", "percent_gardens_2020"))) %>%
  mutate(year = str_extract(metric, "\\d.+")) %>%
  select(-metric) %>%
  group_by(species, year) %>%
  summarise(gardens = mean(percent_gardens)) %>%
  pivot_wider(names_from = "year", values_from = "gardens") %>%
  filter(str_detect(species, "finch"))
