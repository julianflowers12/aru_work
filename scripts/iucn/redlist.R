## redlist data

install.packages(c("rredlist", "dplyr", "ritis"))
library(rredlist)
library(dplyr)
library(ritis)
install.packages("taxize", clean = TRUE)
library(taxize)
taxize::use_entrez()
library(tidyverse)
x <- comm2sci(get_uid("Eurasian Wryneck", modifier = "Common Name"))
sci2comm("Jynx torquila")
x$`37601`

enframe(x) %>%
  unnest()
rl_regions_()
rl_common_names(name = "Jynx torquila")
rl_search()
rl_habitats()
taxize::comm2sci(" quail", db  = "itis" )

rredlist::rl_use_iucn()

rl_search("Manacus manacus") %>%
  glimpse()

sp <- rl_sp_count()

rl_comp_groups('mammals')

rl_common_names('Loxodonta africana')


??ritis

itis_search("eurasian wryneck")
#> # A tibble: 10 x 25
#>    tsn   nameWInd nameWOInd unit1 usage credibilityRati… completenessRat…
#>    <chr> <chr>    <chr>     <chr> <chr> <chr>            <chr>           
#>  1 1526… Ornitho… Ornithoi… Orni… valid No review; untr… unknown         
#>  2 1526… Ornitho… Ornithoc… Orni… valid No review; untr… unknown         
#>  3 1526… Ornitho… Ornithom… Orni… valid No review; untr… unknown         
#>  4 1526… Pseudol… Pseudoly… Pseu… valid No review; untr… unknown         
#>  5 1527… Stilbom… Stilbome… Stil… valid No review; untr… unknown         
#>  6 1527… Nycteri… Nycterib… Nyct… valid No review; untr… unknown         
#>  7 1527… Nycteri… Nycterib… Nyct… inva… No review; untr… unknown         
#>  8 1527… Nycteri… Nycterib… Nyct… valid No review; untr… unknown         
#>  9 1527… Basilia  Basilia   Basi… valid No review; untr… unknown         
#> 10 1527… Strebli… Streblin… Stre… valid No review; untr… unknown         
#> # … with 18 more variables: currencyRating <chr>, kingdom <chr>,
#> #   parentTSN <chr>, rankID <chr>, rank <chr>, hierarchySoFar <chr>,
#> #   hierarchySoFarWRanks <chr>, hierarchyTSN <chr>, otherSource <chr>,
#> #   createDate <chr>, updateDate <chr>, hierarchicalSort <chr>,
#> #   `_version_` <dbl>, synonyms <chr>, synonymTSNs <chr>, vernacular <chr>,
#> #   unacceptReason <chr>, acceptedTSN <chr>