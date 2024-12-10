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


#plot - top 10 Christmas Films

ggplot(top10_movies, aes(x = reorder(title, imdb_rating), y = imdb_rating)) +
  geom_bar(stat = "identity", fill = "#2E8B57", color = "#8B0000", width = 0.7) +  
  coord_flip() + 
  labs(
    title = "Top 10 Highest Rated Christmas Movies",  
    x = "Movie Title",  
    y = "IMDb Rating"  
  ) +
  theme_minimal(base_family = "Comic Sans MS") + 
  theme(
    plot.title = element_text(hjust = 0.5, size = 18, color = "#8B0000", face = "bold"), 
    axis.text.x = element_text(color = "#8B0000"), 
    axis.text.y = element_text(color = "#8B0000"),  
    axis.title.x = element_text(color = "#8B0000", face = "bold"),  
    axis.title.y = element_text(color = "#8B0000", face = "bold")   
  ) +
  geom_text(aes(label = round(imdb_rating, 1)), hjust = -0.3, color = "#8B0000", size = 5)  



