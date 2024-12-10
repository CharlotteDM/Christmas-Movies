library(dplyr)
library(tidyverse)
library(ggplot2)
library(gganimate)
library(ggrepel)
library(fontawesome)
library(showtext)

path <- dirname(rstudioapi::getActiveDocumentContext()$path)
print(path)

setwd(path)


movies <- read.csv("christmas_movies.csv", stringsAsFactors = FALSE)

#top 10 films
top10_movies <- movies[order(-movies$imdb_rating), ][1:10, ]



ggplot(top10_movies, aes(x = reorder(title, imdb_rating), y = imdb_rating)) +
  geom_bar(stat = "identity", fill = "#2E8B57", color = "#8B0000", width = 0.7) +  # Zielony i czerwony
  coord_flip() +  # Obrót wykresu
  labs(
    title = "Top 10 Highest Rated Christmas Movies",  # Tytuł wykresu w języku angielskim
    x = "Movie Title",  # Etykieta osi X po angielsku
    y = "IMDb Rating"  # Etykieta osi Y po angielsku
  ) +
  theme_minimal(base_family = "Comic Sans MS") +  # Lekko zabawny styl
  theme(
    plot.title = element_text(hjust = 0.5, size = 18, color = "#8B0000", face = "bold"),  # Tytuł na środku, kolor i pogrubienie
    axis.text.x = element_text(color = "#8B0000"),  # Kolor tytułu osi X na czerwono
    axis.text.y = element_text(color = "#8B0000"),  # Kolor tytułu osi Y na czerwono
    axis.title.x = element_text(color = "#8B0000", face = "bold"),  # Kolor i pogrubienie tytułu osi X
    axis.title.y = element_text(color = "#8B0000", face = "bold")   # Kolor i pogrubienie tytułu osi Y
  ) +
  # Dodanie ocen na końcu słupków
  geom_text(aes(label = round(imdb_rating, 1)), hjust = -0.3, color = "#8B0000", size = 5)  # Ocenę IMDb na końcu słupków



