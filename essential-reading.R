#' # Essential reading

library(readtext); library(pdftools); library(quanteda); library(tidytext); library(tidyverse)

dir <- here::here("reading-lists")

texts <- list.files(dir, pattern = "pdf")

pdfs <- paste0(dir, "/", texts)

pdfs_text <- pdf_text(texts[2:15])

head(pdfs)


#' ## split into sentences

pdfs_sentences <- pdfs_text %>%
  unnest_tokens(sents, text, "sentences")

#' ## titles
pdfs_sentences %>%
  filter(str_detect(sents, "title:")) %>%
  mutate(sents = str_extract(sents, "title:.+"))

