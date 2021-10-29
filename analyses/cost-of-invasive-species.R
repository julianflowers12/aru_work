## invasive species - `invacost`

install.packages("invacost")
library(invacost)

library(tidyverse)
library(skimr)
library(scales)
options()
data(invacost)
dim(invacost)


glimpse(invacost)



uk <- invacost %>%
  filter( Official_country == "United Kingdom")

skim(uk) %>%
  gt::gt()


  
uk <- uk %>%
  add_count(Species, Common_name)

dim(uk)


uk %>%
  group_by(Genus, Common_name) %>%
  summarise(mean_cost = mean(Cost_estimate_per_year_local_currency, na.rm = TRUE)) %>%
  arrange(-mean_cost) %>%
  mutate(mean_cost = scales::dollar_format(prefix = "£")(mean_cost)) %>%
  #ungroup() %>%
  mutate(mean = parse_number(mean_cost)) %>%
  top_n(20) %>%
  ggplot(aes(reorder(Genus, mean), mean)) +
  geom_col() +
  coord_flip() +
  scale_y_continuous(labels = scales::label_dollar(prefix = "£"))
