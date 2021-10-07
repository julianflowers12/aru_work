## half earth

library(myScrapers); library(tidyverse)
url <- "https://thinkinglikeahuman.com/2018/08/09/a-tale-of-he-she-we-and-me/"

text <- get_page_text(url) %>%
  .[c(1, 3:6, 9, 12:13, 16:17, 28:29 )]

text %>%
  str_squish() %>%
  enframe() 
  
