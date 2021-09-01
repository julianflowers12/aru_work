#' ---
#' params:
#'    search: "wildlife conservation"
#'  ---

## search Guardian for articles on wildlife conservation
## reads open data platform

library(guardianapi)
library(lubridate)
library(tidyverse)

guardianapi::gu_api_key()

last_month <- guardianapi::gu_content(params$search, from_date = today() - days(30), to_date = today())

glimpse(last_month)

last_month <- last_month %>%
  mutate(date = ymd(str_sub(web_publication_date, 1, 10))) %>%
  select(date, web_title, headline, body_text, short_url, section_name)

         