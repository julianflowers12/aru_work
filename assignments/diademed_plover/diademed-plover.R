## diademed sandpiper

library(myScrapers)
library(rredlist)
library(rgbif)
library(spocc)

ds <- get_ss_data(search = "diademed sandpiper")
ds$data$title

habitats <- rredlist::rl_habitats("Phegornis mitchellii")

threats <- rredlist::rl_threats("Phegornis mitchellii")

history <- rredlist::rl_history("Phegornis mitchellii")  

protection <- rredlist::rl_measures("Phegornis mitchellii")

narrative <- rredlist::rl_narrative("Phegornis mitchellii")

country <- rredlist::rl_occ_country("Phegornis mitchellii")


rredlist::rl_search("Phegornis mitchellii")

citation <- rredlist::rl_sp_citation("Phegornis mitchellii")

common_names <- rredlist::rl_common_names("Phegornis mitchellii")

country_assessment <- "http://datazone.birdlife.org/country/chile"

species_assessment <- "http://datazone.birdlife.org/species/factsheet/diademed-plover-phegornis-mitchellii"

images <- "https://search.macaulaylibrary.org/catalog?taxonCode=diaplo1"

occ <- spocc::occ("Phegornis mitchellii", limit = 2000)

glimpse(occ)

occ$gbif$data
