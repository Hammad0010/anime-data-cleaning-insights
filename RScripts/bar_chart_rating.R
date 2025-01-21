library(ggplot2)
library(dplyr)
library(readr)

# Load the dataset
anime_data <- read_csv("D:/Universty/R_assignment/tidied_anime_data.csv", show_col_types = FALSE)

# Filter for TV series and calculate average ratings for each genre, keeping only the top 15
top_genres <- anime_data %>%
  filter(type == "TV") %>%  # Focus on TV series only
  group_by(genre) %>%
  summarise(average_rating = mean(rating, na.rm = TRUE)) %>%
  arrange(desc(average_rating)) %>%
  slice_head(n = 15)  # Keep only the top 15 genres

# Plotting the top 15 genres by average rating
ggplot(top_genres, aes(x = reorder(genre, -average_rating), y = average_rating)) +  # Order in descending order
  geom_bar(stat = "identity", fill = "tomato", color = "black", width = 0.7) +  # Add borders for distinction
  geom_text(aes(label = round(average_rating, 2)), vjust = -0.5, size = 4) +   # Add labels above bars
  labs(title = "Top 15 Genres of TV Series by Average Rating",
       x = "Genre",
       y = "Average Rating") +
  theme_minimal() +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1, size = 10),  # Rotate and adjust x-axis labels
    axis.text.y = element_text(size = 10),
    plot.title = element_text(face = "bold", size = 14)
  ) +
  scale_y_continuous(limits = c(0, 10), breaks = seq(0, 10, by = 1))  # Integers on y-axis
