library(dplyr)
library(tidyverse)
library(ggplot2)
library(gganimate)
library(ggrepel)

path <- dirname(rstudioapi::getActiveDocumentContext()$path)
print(path)

setwd(path)


movies <- read.csv("christmas_movies.csv", stringsAsFactors = FALSE)

#top 10 films
top10_movies <- movies[order(-movies$imdb_rating), ][1:10, ]

ggplot(top10_movies, aes(x = reorder(title, imdb_rating), y = imdb_rating)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  coord_flip() +  # Obrócenie wykresu
  labs(title = "Top 10 Najwyżej Ocenianych Filmów",
       x = "Tytuł Filmu",
       y = "Ocena IMDb") +
  theme_minimal()