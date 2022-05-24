## Elise Rust
## MDI
## Green For All Colorado Beta Testing
## Exploring districting shapefiles and merging with census variables
## May 2022

## Load necessary packages
library(tidyverse)
library(ggplot2)
#library(rgdal)
library(sf)
library(grid)
library(gridExtra)

## Load in data
co_2021_boundary <- st_read("Data/Colorado/co_cong_adopted_2021/2021_Approved_Congressional_Plan_w_Final_Adjustments.shp")
co_2020_boundary <- st_read("Data/Colorado/co_cvap_2020_cd/co_cvap_2020_cd.shp")
st_geometry_type(co_2021_boundary)
st_geometry_type(co_2020_boundary)

# Extract district number
co_2020_boundary$District = as.numeric(co_2020_boundary$GEOID20)%%10

## View shapefiles
map_2021 <- ggplot() +
  geom_sf(data = co_2021_boundary, size = 0.5, color = "black", fill = "#38761d", alpha = 0.5) +
  geom_sf_label(data = co_2021_boundary, aes(label = District, alpha = 0.5)) +
  ggtitle("Colorado Congressional Districts 2021") +
  coord_sf()

map_2020 <- ggplot() +
  geom_sf(data = co_2020_boundary, size = 0.5, color = "black", fill = "#38761d", alpha = 0.5) +
  geom_sf_label(data = co_2020_boundary, aes(label = District, alpha = 0.5)) +
  ggtitle("Colorado Congressional Districts 2020") +
  coord_sf()

# Compare redistricting between 2020 and 2021
grid.arrange(map_2020, map_2021, ncol = 2)


############ Merging with Census Data
## Just looking at 2021 because current representatives are the key demographic


