## Elise Rust
## MDI
## Green For All Nevada Beta Testing
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
nv_2021_boundary <- st_read("Data/Nevada/nv_cong_2021/nv_cong_2021.shp")
nv_2020_boundary <- st_read("Data/Nevada/nv_cvap_2020_cd/nv_cvap_2020_cd.shp")
st_geometry_type(nv_2021_boundary)
st_geometry_type(nv_2020_boundary)

# Extract district number
nv_2020_boundary$District = as.numeric(nv_2020_boundary$GEOID20)%%10

## View shapefiles
map_2021 <- ggplot() +
  geom_sf(data = nv_2021_boundary, size = 0.5, color = "black", fill = "#38761d", alpha = 0.5) +
  geom_sf_label(data = nv_2021_boundary, aes(label = DISTRICTNO, alpha = 0.5)) +
  ggtitle("Nevada Congressional Districts 2021") +
  coord_sf()

map_2020 <- ggplot() +
  geom_sf(data = nv_2020_boundary, size = 0.5, color = "black", fill = "#38761d", alpha = 0.5) +
  geom_sf_label(data = nv_2020_boundary, aes(label = District, alpha = 0.5)) +
  ggtitle("Nevada Congressional Districts 2020") +
  coord_sf()

# Compare redistricting between 2020 and 2021
grid.arrange(map_2020, map_2021, ncol = 2)


############ Merging with Census Data
## Just looking at 2021 because current representatives are the key demographic


