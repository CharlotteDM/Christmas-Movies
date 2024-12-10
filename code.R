library(dplyr)
library(tidyverse)
library(ggplot2)
library(gganimate)
library(ggrepel)

path <- dirname(rstudioapi::getActiveDocumentContext()$path)
print(path)

setwd(path)


movies <- read.csv("christmas_movies.csv", stringsAsFactors = FALSE)
