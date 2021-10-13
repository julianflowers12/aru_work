#' # Essential reading

library(readtext); library(pdftools); library(quanteda); library(tidytext); library(tidyverse)

dir <- here::here("reading-lists/pdfs")

texts <- list.files(dir, pattern = "pdf")

pdfs <- paste0(dir, "/", texts)


pdf_text(pdfs[2])
pdfs_text <- map(pdfs[2:13], pdf_data) %>%
  map_dfr(., enframe) %>%
  unnest("value") 

## id column edges
cols <- pdfs_text %>%
  data_frame() %>%
  filter(name == 4) %>% 
  mutate(
         col = ifelse(between(x, 55, 61), "first", 
                      ifelse(between(x, 304, 306), "second", NA))
         ) %>%
  group_by(col) %>%
  mutate(id = row_number(),
         para_no = ifelse(col %in% c("first", "second"), paste0(col, "_", id), NA)) %>%
  ungroup() %>%
  tidyr::fill(para_no, .direction = "down")

cols %>%
  group_by(para_no) %>%
  summarise(para = paste(text, collapse = " ")) %>%
  mutate(id = as.numeric(str_extract(para_no, "\\d+")), 
         col_no = str_extract(para_no, "[:alpha:]")) %>%
  #group_by(col_no) %>%
  arrange(col_no, id)


pdfs_text %>%
  filter(name == 3) %>%
  slice(300:nrow(.)) %>%
  head(20)

#' ## split into sentences

pdfs_sentences <- pdfs_text %>%
  unnest_tokens(sent, value, "sentences") %>%
  mutate(sent = str_squish(sent))

#' ## titles
pdfs_sentences %>%
  filter(str_detect(sent, "title:")) %>%
  mutate(sents = str_extract(sent, "title:.+")) %>%
  reactable::reactable()

