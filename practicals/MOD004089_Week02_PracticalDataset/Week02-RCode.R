# MOD004089 GIS Tools for Biodiversity Mapping and Conservation
# Fabrizio Manco
# 2018, week 02 exercise


# You need to install those packages (Packages > Install Packages)
library(sp)
library(raster)
library(rgdal)
library(here)
library(magick)

# In addition to week1, you will need the following packages (Packages > Install Packages)
library(readxl) # To read an excel spreadsheet
library(rgeos) # For the buffer function

# This sets the working directory where your files are stored. You have to change that to target where your files are.
# (Note the "/" in the folder path which is different from the windows "\")
#("C:/Users/fm12/02_Teaching/MOD004089_GIS Tools for Biodiversity Mapping and Conservation/Week02/MOD004089_Week02_PracticalDataset")

here <- here::here("practicals/MOD004089_Week02_PracticalDataset")

############################################
# Read the data
# Read each worksheet of the Excel file
dT.ForagingObs<-read_excel(paste0(here,"/BirdsBotanicalGarden2008.xlsx"), sheet = "ForagingObs")
dT.Plants<-read_excel(paste0(here,"/BirdsBotanicalGarden2008.xlsx"), sheet = "Plants")
dT.BreedingCouples<- read_excel(paste0(here,"/BirdsBotanicalGarden2008.xlsx"), sheet = "BreedingCouples")


# Read the aerial image as a multi-band image (3 bands, one for each primary colour)
# We will discuss more about remote sensing images and multi-band rasters in week 9
rstAerial<-magick::image_read(paste0(here, "/CambridgeBotGarden.jpg"))

brick(paste0(here, "/CambridgeBotGarden.jpg"))
# Explore the properties of the raster stack
rstAerial1 <- brick(paste0(here, "/CambridgeBotGarden.jpg"))
# Plot the three bands with true colours
plotRGB(rstAerial1,r = 1, g = 2, b = 3)


############################################
# Convert a data frame into a spatial points data frame (see sp package manual)

# For the first argument (coords), we need to indicate which columns contain the coordinates of the points
# The second argument (data) specifies which data to incorporate into the attribute table (all, except the coordinates)
# Finally, the last argument (proj4string) indicates which coordinate reference system is used for this spatial data (see week 3),
# in this case, we just recycle the projection system from the raster stack...
dT.ForagingObs.sp<-SpatialPointsDataFrame(coords=dT.ForagingObs[,c("Easting","Northing")], data=dT.ForagingObs[,c(1:4,7:10)], proj4string = CRS(projection(rstAerial1)))

# Explore the new spatial object
dT.ForagingObs.sp
# Or explore the attribute table
str(dT.ForagingObs.sp@data)

# Plot the points on top of the aerial image
plot(dT.ForagingObs.sp, add=TRUE, pch=20, col="blue")


############################################
# Query and plot your data

# Use the "grep" function to query a string starting with a series of character
# Use the "subset" function to query with =, < or >

# Observations on species from the Acer genus (check the grep function)
dT.query<-dT.ForagingObs.sp[grep("Acer", dT.ForagingObs.sp$PlantSP),]
plotRGB(rstAerial1,r = 1, g = 2, b = 3)
plot(dT.query, add=TRUE, pch=20, col="red")

# Query on numerical: observations at higher heights
dT.query<-subset(dT.ForagingObs.sp, dT.ForagingObs.sp$HeightCode>3)
plotRGB(rstAerial1,r = 1, g = 2, b = 3)
plot(dT.query, add=TRUE, pch=20, col="red")

# Combine queries
dT.query<-dT.ForagingObs.sp[grep("Betula", dT.ForagingObs.sp$PlantSP),]
dT.query<-subset(dT.query, dT.query$Substrate=="Flower")
plotRGB(rstAerial1,r = 1, g = 2, b = 3)
plot(dT.query, add=TRUE, pch=20, col="red")


############################################
# Joining data

# The merge function is very powerful. If the common colum have the same name (ColourRing is that example), the function will automatically recognise it
dT.ForagingObs.sp<-merge(dT.ForagingObs.sp, dT.BreedingCouples)
# Check the attribute table with the added columns
str(dT.ForagingObs.sp@data)

# Use some style to colour code your points
plotRGB(rstAerial1,r = 1, g = 2, b = 3)
plot(dT.ForagingObs.sp, add=TRUE, pch=20, col=c("blue","red")[dT.ForagingObs.sp$Species]) # Blue tits in blue, great tit in red

dT.ForagingObs.sp@data %>%
  filter(PlantSP == "Quercus robur")
# How many foraging observations of male blue tit on Quercus robur?
nrow(subset(dT.ForagingObs.sp, dT.ForagingObs.sp$Species=="blue tit" & dT.ForagingObs.sp$Sex=="Male" & dT.ForagingObs.sp$PlantSP=="Quercus robur"))

# Add the plant information
dT.ForagingObs.sp<-merge(dT.ForagingObs.sp, dT.Plants)

# Clutch size on plants foraging on native versus non-native plants species
# The aggregate function is a very powerful function that uses the R formula system ( Y ~ X + Z...)
# Average clutch size:
meanClutchSize<-aggregate(ClutchSize~Native, data=dT.ForagingObs.sp, FUN=mean)
meanClutchSize

# Plot the data as boxplot
boxplot(ClutchSize~Native, data=dT.ForagingObs.sp)

# It the difference significant? (parametric test)
t.test(ClutchSize~Native, data=dT.ForagingObs.sp)



############################################
# Spatial query

# Read the road shapefile
vctRoads<-readOGR(paste0(here, "/Roads.shp", sep=""))

# 75m buffer area around the roads
buffer75<-gBuffer(vctRoads, width=75, byid = FALSE)

# Plot the map
plotRGB(rstAerial1,r = 1, g = 2, b = 3)
plot(buffer75, add=TRUE, lwd=2)

# Points in polygon
dT.ForagingObs.sp$inBuffer<-over(dT.ForagingObs.sp, buffer75) # Returns 1 for points in polygon and NA for others
dT.ForagingObs.sp$inBuffer[which(is.na(dT.ForagingObs.sp$inBuffer))]<-0 # Replaces NA with 0
dT.ForagingObs.sp$inBuffer<-as.factor(dT.ForagingObs.sp$inBuffer) # Converts to a factor

plot(dT.ForagingObs.sp, add=TRUE, pch=20, col=c("blue","red")[dT.ForagingObs.sp$inBuffer])

# Plot a boxplot
boxplot(ClutchSize~inBuffer, data=dT.ForagingObs.sp)

# Calculate the means
aggregate(ClutchSize~inBuffer, data=dT.ForagingObs.sp, FUN=mean)


# Is there a significant difference in clutch size between birds foraging within 75m from the road and birds foraging more than 75m from the road?
t.test(ClutchSize~inBuffer, data=dT.ForagingObs.sp)


# regression model for clutch size

library(broom); library(glmnet); library(ggfortify)

df <- dT.ForagingObs.sp@data %>%
  na.omit()

glimpse(df)

df_selection <- df %>%
  dplyr::select(ClutchSize, Type, Native, Species, inBuffer, Genus) %>%
  mutate(Genus = fct_lump(Genus, 5)) 

df_selection %>%
  janitor::tabyl(inBuffer, Native) %>%
  janitor::adorn_percentages()

native_breeding_success <- df_selection %>%
  group_by(Native, inBuffer) %>%
  summarise(meancs = mean(ClutchSize))

df_selection %>%
  group_by(Genus, inBuffer, Native, Species) %>%
  summarise(meanClutchSize = mean(ClutchSize)) %>%
  pivot_wider(names_from = c(Native, "inBuffer"), values_from = meanClutchSize, values_fill = 0)

lm <-  lm(data = df_selection, ClutchSize ~ .)

autoplot(lm)

tidy(lm) 
glance(lm)

df_selection <- augment(lm, df_selection)

library(ranger)

df %>%
  ggplot(aes(ClutchSize, .fitted)) +
  geom_point() +
  geom_smooth(method = "lm")

df
set.seed(1234)
rf <- ranger::ranger(ClutchSize ~ . , data = df_selection, importance = "permutation")

ranger::importance(rf)

y <- df_selection$ClutchSize %>% na.omit()
x <- df_selection %>% dplyr::select(Type:Genus) %>% na.omit()


glm <- glmnet(x = x, y)
summary(glm)
