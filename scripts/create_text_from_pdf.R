## create text fileas from pdfs



create_text_from_pdf <- function(path, pdf){
  
  library(here)
  library(readtext)
  library(readr)
  library(dplyr)

pdf <- readtext(pdf)
pdf %>%
  write_delim(paste0(path,"pdf.txt"))

}

file <-paste0(here::here("Bibliography/pdfs/"), "MOD002733-M_Ausden_R_Bradbury_A_Brown_M_Eaton_L_Lock-British_wildlife_the_magazine_for_the_modern_naturalist-Climate_change_and_Britains_birdlife_what_might_-pp161-174.pdf")

create_text_from_pdf(here::here("Bibliography/pdfs/"), file)
