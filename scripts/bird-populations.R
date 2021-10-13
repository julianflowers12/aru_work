## wild bird populations in the uk

library(readODS); library(tidyverse)

t <- tempfile()

curl::curl_download("https://assets.publishing.service.gov.uk/government/uploads/system/uploads/attachment_data/file/938271/All_species_index_species_trends_UK_1970_2018.ods", t)
summary_trend_data <- readODS::read_ods(t, skip = 17) %>%
  janitor::remove_empty() %>% 
  janitor::clean_names() %>%
  filter(!is.na(trend)) %>%
  filter(!is.na(species)) %>% #View()
  slice(-c(8, 21, 34, 60, 74, 79, 84, 91, 100, 105)) %>%
  mutate(notes = str_extract(long_term_percentage_change, "\\(.+\\)"), 
         long_term_percentage_change = str_remove(long_term_percentage_change, "\\(.+\\)")) %>%
  mutate_at(.vars = c(2:3, 6:5), as.numeric) 

summary_trend_data

temp <- tempfile()
data <- "https://assets.publishing.service.gov.uk/government/uploads/system/uploads/attachment_data/file/938264/Populations_wild_birds_UK_1970_2019.ods"
curl::curl_download(data, temp)
birds <- readr::read_csv("data/Populations_wild_birds_UK_1970_2019.csv")

colnames(birds) <- paste(colnames(birds), birds[2,], birds[1,])

birds %>%
  janitor::clean_names() %>%
  slice(-c(1,2)) %>%
  pivot_longer(names_to = "metric", values_to = "values", cols = 2:ncol(.)) %>%
  mutate(measure = str_extract(metric, "\\d.+smooth.*"),
         measure = str_remove(measure, "\\d{1,2}_"),
         measure = str_remove(measure, "_\\d{1,3}$"),
         smoothed = str_extract(measure, ".*smoothed"), 
         category = str_extract(measure, "data_.*$"), 
         ci = str_extract(measure, "\\d.*ci"), 
         values = as.numeric(values)) %>%
  select(-c(metric, measure)) %>%
  pivot_wider(names_from = c("smoothed", "ci"), values_from = "values") %>%
  View()
  head()

birds %>%
  janitor::clean_names()

a <- colnames(birds) %>%
  enframe()
b <- birds %>%
  pluck("")

data.frame(a, b)

birds1 <- birds %>%
  janitor::clean_names() %>%
  tidyr::fill(names(.), .direction = "downup") 

colnames(birds1) <- paste(colnames(birds1), birds1[2,])

birds1 %>%
  head()
  glimpse() %>%
  tibble() %>%
  head()
birds1 %>%
  pivot_longer(names_to = "metric", values_to = "value", 2:ncol(.)) %>%
  filter(str_detect(`x Year`, "[:digit:]")) %>%
  mutate(value = as.numeric(value), 
         m1 = metric, 
         m1 = str_replace(m1, "^x.*", "NA"), 
         m1 = str_replace_na(m1, replacement = NA)) %>%
  fill(m1, .direction = "down") %>%
  ggplot(aes(x, value, colour = metric, group = metric)) +
  geom_line(show.legend = FALSE)

  
