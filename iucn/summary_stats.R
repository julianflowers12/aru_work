# extract red list summary stats

library(myScrapers)
library(rJava)
library(tabulizer)

url <- "https://www.iucnredlist.org/resources/summary-statistics#Summary%20Tables"

find_data <- get_page_docs(url)

get_pdfs <- map(find_data, readtext::readtext)

tabs <- map(find_data, tabulizer::extract_tables)

tabs[1] %>%
  data.frame()

get_pdfs[2]$text


### spsatial data

spatial <- "https://www.iucnredlist.org/resources/spatial-data-download"
  
resources <- "https://www.iucnredlist.org/resources/spatialtoolsanddata"