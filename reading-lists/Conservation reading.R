
#' # ARU conservation course reading list


#' Combines lists from various modules
#+ echo = FALSE, message = FALSE
library(myScrapers)
library(tidyverse)


reading_list <- read_csv("https://github.com/julianflowers12/aru_work/blob/main/full-list.csv?raw=TRUE")

rl <- reading_list |>
  janitor::clean_names() |>
  mutate(link = paste("<a href=", item_link, ">Link</a>")) %>%
  select(date_added, title, type, importance, note_for_student, link) |>
  DT::datatable(escape = FALSE, filter = "top")

#' ## Reading list

rl %>%
  filter(Type == "Journal")
  count(Type)


