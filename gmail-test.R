install.packages("gmailr")
library(gmailr)

t <- use_secret_file("gmailr-tutorial.json")

gmail_auth(secret_file = "gmailr-tutorial.json")

jt <- jsonlite::fromJSON("gmailr-tutorial.json")

jt$installed$token_uri$

test_email <-
  gm_mime() %>%
  gm_to("julian.flowers12@gmail.com") %>%
  gm_from("julian.flowers13@gmail.com") %>%
  gm_subject("this is just a gmailr test") %>%
  gm_text_body("Can you hear me now?")

gm_send_message(test_email)

gm_create_draft(test_email)

gm_auth_configure(here::here(), "gmailr-tutorial.json")
