## biodiversity 2020 defra

library(tidyverse); library(readtext); library(pdftools)

url <- "https://webarchive.nationalarchives.gov.uk/ukgwa/20130404160104mp_/http://www.defra.gov.uk/publications/files/pb13583-biodiversity-strategy-2020-111111.pdf"

text <- pdf_text(url)

text <- str_squish(text)
text %>%
  enframe()
