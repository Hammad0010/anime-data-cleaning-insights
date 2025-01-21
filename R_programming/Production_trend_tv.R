# Load required libraries
library(ggplot2)
library(dplyr)
library(readr)

# Load the dataset
anime_data <- read_csv("D:/Universty/R_assignment/tidied_anime_data.csv", show_col_types = FALSE)

# Filter for TV series only and categorize by episode length
anime_data <- anime_data %>%
  filter(type == "TV") %>%  # Include only TV series
  mutate(episode_category = case_when(
    episodes <= 13 ~ "Short (1-13)",
    episodes <= 50 ~ "Medium (14-50)",
    episodes > 50 ~ "Long (51+)"
  ))  # Removed "Unknown" category

# Count the number of TV series produced for each category per year
anime_production_trends <- anime_data %>%
  filter(!is.na(year), year > 0, !is.na(episode_category)) %>%  # Ensure valid years and categories
  group_by(year, episode_category) %>%
  summarise(count = n(), .groups = "drop")  # Count the number of TV series per category

# Plot production trends for short, medium, and long episodic TV series
ggplot(anime_production_trends, aes(x = year, y = count, color = episode_category, group = episode_category)) +
  geom_line(size = 1.5) +  # Line for trends
  geom_point(size = 2, alpha = 0.8) +  # Points for individual years
  labs(
    title = "TV Series Production Trends by Episode Length",
    subtitle = "Short, Medium, and Long episodic TV series trends over the years",
    x = "Year",
    y = "Number of TV Series Produced",
    color = "Episode Category"
  ) +
  scale_color_manual(values = c("Short (1-13)" = "blue", "Medium (14-50)" = "green", "Long (51+)" = "red")) +
  scale_x_continuous(
    breaks = seq(1961, max(anime_production_trends$year), by = 10),  # Start from 1961 with 10-year intervals
    limits = c(1961, max(anime_production_trends$year))  # Ensure the x-axis starts at 1961
  ) +
  theme_minimal(base_size = 12) +
  theme(
    plot.title = element_text(face = "bold", size = 16),
    plot.subtitle = element_text(size = 12),
    axis.text.x = element_text(angle = 45, hjust = 1),
    legend.title = element_text(size = 12, face = "bold"),
    legend.text = element_text(size = 10)
  )
