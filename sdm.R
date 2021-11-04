# https://jcoliver.github.io/learn-r/011-species-distribution-models.html

install.packages("dismo")
install.packages("maptools")
install.packages("rgdal")
install.packages("raster")
install.packages("sp")
install.packages("rgeos")

library("sp")
library("raster")
library("maptools")
library("rgdal")
library("dismo")
library(tidyverse)
library(rgeos)

bioclim.data <- getData(name = "worldclim",
                        var = "bio",
                        res = 2.5,
                        path = "data/")
path <- here::here("data")

species <- read_csv(glue::glue(path, "/Poecile montanus.csv"), show_col_types = TRUE) %>%
  janitor::clean_names()
glimpse(species)

species <- species %>%
  select(common_name, latitude = latitude_wgs84, 
         longitude = longitude_wgs84, start_date_year) %>%
  mutate(decade = start_date_year - start_date_year%%10)

species_df <- species[, 1:3]

n <- ceiling(max(species$latitude, na.rm = TRUE))
s <- floor(min(species$latitude, na.rm = TRUE))
e <- ceiling(max(species$longitude, na.rm = TRUE))
w <- floor(min(species$longitude, na.rm = TRUE))

extent <- extent(c(w, e, s, n))

data(wrld_simpl)

plot(wrld_simpl, 
     xlim = c(w, e),
     ylim = c(s, n),
     axes = TRUE, 
     col = "grey95")

points(x = species$longitude, 
       y = species$latitude, 
       col = "olivedrab", 
       pch = 20, 
       cex = 0.75)
# And draw a little box around the graph
box()

## crop raster
bioclim.data <- crop(x = bioclim.data, y = extent)

bc.model <- bioclim(x = bioclim.data, p = species_df[,3:2])

predict.presence <- dismo::predict(object = bc.model, 
                                   x = bioclim.data, 
                                   ext = extent)
plot(predict.presence, add = TRUE)
plot(wrld_simpl, add = TRUE, border = "grey5")

points(x = species$longitude, 
       y = species$latitude, 
       col = "olivedrab", 
       pch = 20, 
       cex = 0.1)

bil.files <- list.files(path = "data/wc2-5", 
                        pattern = "*.bil$", 
                        full.names = TRUE)

mask <- raster(bil.files[1])

# Set the seed for the random-number generator to ensure results are similar
set.seed(20210707)

# Randomly sample points (same number as our observed points)
background <- randomPoints(mask = mask,               # Provides resolution of sampling points
                           n = nrow(species_df),      # Number of random points
                           ext = extent,              # Spatially restricts sampling
                           extf = 1.25)               # Expands sampling a little bit

head(background)

plot(wrld_simpl, 
     xlim = c(w, e),
     ylim = c(s, n),
     axes = TRUE, 
     col = "grey95",
     main = "Presence and pseudo-absence points")

# Add the background points
points(background, col = "grey30", pch = 1, cex = 0.1)

# Add the observations
points(x = species$longitude, 
       y =species$latitude, 
       col = "olivedrab", 
       pch = 20, 
       cex = 0.1)

box()

testing.group <- 1

# Create vector of group memberships
group.presence <- kfold(x = species, k = 5) # kfold is in dismo package

table(group.presence)
presence.train <- species_df[group.presence != testing.group, ]
presence.test <- species_df[group.presence == testing.group, ]

# Repeat the process for pseudo-absence points
group.background <- kfold(x = background, k = 5)
background.train <- background[group.background != testing.group, ]
background.test <- background[group.background == testing.group, ]

bc.model <- bioclim(x = bioclim.data, p = presence.train[, 3:2])

# Predict presence from model (same as previously, but with the update model)
predict.presence <- dismo::predict(object = bc.model, 
                                   x = bioclim.data, 
                                   ext = extent)

bc.eval <- evaluate(p = presence.test[, 3:2],   # The presence testing data
                    a = background.test, # The absence testing data
                    model = bc.model,    # The model we are evaluating
                    x = bioclim.data)    # Climatic variables for use by model

# Determine minimum threshold for "presence"
bc.threshold <- threshold(x = bc.eval, stat = "spec_sens")

plot(wrld_simpl, 
     xlim = c(w, e),
     ylim = c(s, n),
     axes = TRUE, 
     col = "grey95")

# Only plot areas where probability of occurrence is greater than the threshold
plot(predict.presence > bc.threshold, 
     add = TRUE, 
     legend = FALSE, 
     col = "olivedrab")

# And add those observations
points(x = species$longitude, 
       y = species$latitude, 
       col = "black",
       pch = "+", 
       cex = 0.75)

# Redraw those country borders
plot(wrld_simpl, add = TRUE, border = "grey5")
box()

#############################
### https://rspatial.org/raster/sdm/index.html

library(dismo)
# get the file names
files <- list.files(path=paste(system.file(package="dismo"), '/ex',
                               sep=''),  pattern='grd',  full.names=TRUE )
# we use the first file to create a RasterLayer
mask <- raster(files[1])
# select 500 random points
# set seed to assure that the examples will always
# have the same random sample.
set.seed(1963)
bg <- randomPoints(mask, 500 )

par(mfrow=c(1,2))
plot(!is.na(mask), legend=FALSE)
points(bg, cex=0.5)
# now we repeat the sampling, but limit
# the area of sampling using a spatial extent
e <- extent(-80, -53, -39, -22)
bg2 <- randomPoints(mask, 50, ext=e)
plot(!is.na(mask), legend=FALSE)
plot(e, add=TRUE, col='red')
points(bg2, cex=0.5)

file <- paste(system.file(package="dismo"), '/ex/acaule.csv', sep='')
ac <- read.csv(file)

coordinates(ac) <- ~lon+lat
projection(ac) <- CRS('+proj=longlat +datum=WGS84')

x <- circles(ac, d=50000, lonlat=TRUE)
pol <- polygons(x)

samp1 <- spsample(pol, 250, type='random', iter=25)
## Warning in proj4string(obj): CRS object has comment, which is lost in output
# get unique cells
cells <- cellFromXY(mask, samp1)
length(cells)
## [1] 250
cells <- unique(cells)
length(cells)
## [1] 161
xy <- xyFromCell(mask, cells)


