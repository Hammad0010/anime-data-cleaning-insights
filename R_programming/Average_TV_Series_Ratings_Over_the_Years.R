# Load required libraries
library(ggplot2)
library(dplyr)
library(readr)
library(patchwork)

# Load the dataset
anime_data <- read_csv("D:/Universty/R_assignment/tidied_anime_data.csv", show_col_types = FALSE)

# Prepare data for Movies
movie_ratings <- anime_data %>%
  filter(type == "Movie", !is.na(year), year > 0) %>%
  group_by(year) %>%
  summarise(avg_rating = mean(rating, na.rm = TRUE)) %>%
  ungroup()

# Prepare data for TV Series
tv_ratings <- anime_data %>%
  filter(type == "TV", !is.na(year), year > 0) %>%
  group_by(year) %>%
  summarise(avg_rating = mean(rating, na.rm = TRUE)) %>%
  ungroup()

# Determine the common x-axis range
x_min <- min(c(movie_ratings$year, tv_ratings$year))
x_max <- max(c(movie_ratings$year, tv_ratings$year))

# Set a common y-axis range
y_min <- min(c(movie_ratings$avg_rating, tv_ratings$avg_rating))
y_max <- max(c(movie_ratings$avg_rating, tv_ratings$avg_rating))

# Plot for Movie Ratings
movie_plot <- ggplot(movie_ratings, aes(x = year, y = avg_rating)) +
  geom_smooth(color = "blue", size = 1.5, se = FALSE) +  # Smooth line
  geom_point(color = "blue", size = 2, alpha = 0.6) +    # Points for data
  labs(
    title = "Average Movie Ratings Over the Years",
    subtitle = "Smooth trends for better readability",
    x = "Year",
    y = "Average Rating"
  ) +
  scale_x_continuous(limits = c(x_min, x_max), breaks = seq(x_min, x_max, by = 10)) +
  scale_y_continuous(limits = c(y_min, y_max)) +
  theme_minimal(base_size = 12) +
  theme(
    plot.title = element_text(face = "bold", size = 16),
    plot.subtitle = element_text(size = 12),
    axis.text.x = element_text(angle = 45, hjust = 1)
  )

# Plot for TV Series Ratings
tv_plot <- ggplot(tv_ratings, aes(x = year, y = avg_rating)) +
  geom_smooth(color = "green", size = 1.5, se = FALSE) +  # Smooth line
  geom_point(color = "green", size = 2, alpha = 0.6) +    # Points for data
  labs(
    title = "Average TV Series Ratings Over the Years",
    subtitle = "Smooth trends for better readability",
    x = "Year",
    y = "Average Rating"
  ) +
  scale_x_continuous(limits = c(x_min, x_max), breaks = seq(x_min, x_max, by = 10)) +
  scale_y_continuous(limits = c(y_min, y_max)) +
  theme_minimal(base_size = 12) +
  theme(
    plot.title = element_text(face = "bold", size = 16),
    plot.subtitle = element_text(size = 12),
    axis.text.x = element_text(angle = 45, hjust = 1)
  )

# Combine the two plots
combined_plot <- movie_plot + tv_plot

# Display the combined plot
print(combined_plot)
