library(ggplot2)
library(dplyr)
library(readr)

# Load the dataset
anime_data <- read_csv("D:/Universty/R_assignment/tidied_anime_data.csv", show_col_types = FALSE)

# Data preparation: Create a decade column and calculate averages
anime_data <- anime_data %>%
  mutate(
    year = as.integer(year),             # Ensure year is an integer
    decade = (year %/% 10) * 10          # Create the decade column
  ) %>%
  group_by(decade) %>%
  summarise(
    rating = mean(rating, na.rm = TRUE)  # Calculate the average rating per decade
  )

# Check if the decade column was created successfully
print(head(anime_data))

# Plotting the data
ggplot(anime_data, aes(x = as.factor(decade), y = rating)) +
  geom_line(aes(group = 1), color = "blue", size = 1.2) +
  geom_point(color = "red", size = 3, shape = 21, fill = "white") +
  labs(title = "Average Ratings of Anime by Decade",
       subtitle = "Visualizing how anime ratings have evolved over the decades.",
       x = "Decade",
       y = "Average Rating") +
  theme_minimal() +
  theme(
    text = element_text(size = 12),
    axis.text.x = element_text(angle = 45, hjust = 1, vjust = 1),
    plot.title = element_text(face = "bold", size = 14),
    plot.subtitle = element_text(face = "italic"),
    legend.position = "none"  # Hide legend if not needed
  ) +
  scale_y_continuous(limits = c(0, 10), breaks = 0:10)  # Set y-axis range and integer ticks
