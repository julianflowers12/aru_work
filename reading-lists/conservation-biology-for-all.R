### Conservation biology for all - get chapters

library(myScrapers)
library(readtext)
library(tidyverse)
library(tabulizer)

url <- "<https://conbio.org/images/content_publications/free-textbook>"
docs <- get_page_docs("https://conbio.org/publications/free-textbook/")

doc_urls <- purrr::map(docs, ~(paste0("https://conbio.org", .x)))

cb_4a <- purrr::map_dfr(doc_urls, readtext::readtext)


summary(cb_4a)                             

head(cb_4a)

## check 
cb_4a[5, ]$text %>%
  str_split(., "\\n") %>%
  enframe() %>%
  unnest("value") %>%
  View()

## get tables test

test_table <- tabulizer::extract_tables(doc_urls[[5]])[[7]] %>%
  as.data.frame() 

test_table %>%
  set_names(c("  ", "Amphibians", "Reptiles", "Birds", "Mammals")) %>%
  slice(-1) %>%
  gt::gt()
  flextable::flextable() 
