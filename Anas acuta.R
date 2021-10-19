## pintail Anas acuta

library(tidyverse); library(lubridate)
path <- here::here("assignments")

pintail <- read_csv(paste0(path, "/Anas acuta.csv"))

dim(pintail)

pintail %>%
  count(year = lubridate::year(`Start date`)) %>%
  filter(year >= 1990) %>%
  ggplot(aes(year, n)) +
  geom_col()
