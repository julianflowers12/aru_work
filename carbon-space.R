## Carbon footprint data from carbon.place

library(data.table)
library(caret)
library(tidyverse)
library(rsample)
library(factoextra)
library(FactoMineR)
library(umap)
library(dbscan)


temp <- tempfile()
temp1 <- tempdir()

download.file("https://github.com/creds2/CarbonCalculator/releases/download/1.0/PBCC_LSOA_data.zip", destfile = temp)

unzip(temp, exdir = here::here("data"))

files <- list.files(here::here("data"), pattern = "csv")

data <- fread(paste0(here::here("data"), "/", files[4]))

## pca
### numeric only

num_data <- data %>%
  select_if(is.numeric)

num_data %>%
  map_dbl(., ~sum(is.na(.x)))
  summarise(across, ~(is.na(.x)))

num_data_no_gas <- num_data %>%
  select(-starts_with("gas")) %>%
  select(-starts_with("van"))

pca <- FactoMineR::PCA(num_data_no_gas)

factoextra::fviz_pca(pca)

pca$var

pca <- prcomp(num_data_no_gas)

pca$rotation
## Build multinomial classification
set.seed(123)
            
umap <- umap::umap(scale(num_data_no_gas))

tsne <- Rtsne::Rtsne(scale(num_data_no_gas))

umap$layout %>%
  data.frame() %>%
  ggplot(aes(X1, X2)) +
  geom_point(alpha = 0.5)

cluster <- umap$layout %>%
  hdbscan(minPts = 13)

data.frame(umap$layout, clust = cluster$cluster) %>%
  ggplot(aes(X1, X2, colour = factor(clust))) +
  geom_point(alpha = 0.5, show.legend = FALSE) 

cluster1 <- data.frame(tsne$Y) %>%
  hdbscan(minPts = 24)

data.frame(tsne$Y, clust = cluster1$cluster) %>%
  ggplot(aes(X1, X2, colour = factor(clust))) +
  geom_point(alpha = 0.5, show.legend = FALSE) 

