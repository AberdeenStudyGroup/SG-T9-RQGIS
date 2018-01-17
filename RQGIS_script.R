################################################
# Script for tutorial on RQGIS
# Authors: Francesca Mancini
# 
# 
# 
# Date created: 2018-01-17
# Date modefied:
################################################

install.packages("RQGIS")
library(RQGIS)
library(raster)
library(rgdal)

# before we start we need to specify the paths
# necessary to run the QGIS-API

set_env("C:/Program Files/QGIS 2.18")

# downloading UK administrative areas
getData("ISO3")

UK <- getData(name = "GADM", country = "GBR", level = 2, path = "../RQGIS")

plot(UK)

# search for QGIS functions
find_algorithms(search_term = "([Pp]olygon)(centroid)")

# find out how to use the function
get_usage(alg = "qgis:polygoncentroids")

# two ways to specify parameters for the function
# 1
params <- get_args_man(alg = "qgis:polygoncentroids")

params$INPUT_LAYER <- UK
params$OUTPUT_LAYER <- "C:/Users/User/Documents/Study Group tutorials/RQGIS/UK_coords.shp"

centroids <- run_qgis(alg = "qgis:polygoncentroids",
                      params = params,
                      load_output = TRUE)

# spits out an error msg but the function ran fine

# 2
centroids <- run_qgis(alg = "qgis:polygoncentroids",
                      INPUT_LAYER = UK,
                      OUTPUT_LAYER = "C:/Users/User/Documents/Study Group tutorials/RQGIS/UK_coords.shp",
                      load_output = TRUE)

# plot
plot(UK)
plot(centroids$geometry, pch = 21, add = TRUE, bg = "lightblue", col = "black")


