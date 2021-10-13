
library(myScrapers)

## get report
url <- "https://jncc.gov.uk/our-work/uk-biodiversity-indicators-2020/"

pages <- get_page_links(url)

indicators <- pages %>%
  .[grepl("ukbi", .)] %>%
  enframe() %>%
  mutate(link = paste0("https://jncc.gov.uk", value), 
         text = map(link, get_page_text)) %>%
  unnest("text")

indicators %>%
  head(20)

## summary table

summary_table <- read_html("https://jncc.gov.uk/our-work/ukbi-overview-of-trends-2020/") %>%
  html_table() %>%
  .[2] 

names <- as_vector(summary_table[[1]][1,])

names <- names %>%
  janitor::make_clean_names()

summary_table <- set_names(summary_table[[1]], names) 

summary_table <- summary_table %>%
  .[-1,] 

summary_table %>%
  gt::gt()
