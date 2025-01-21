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
    episodes > 50 ~ "Long (51+)",
    TRUE ~ "Unknown"
  ))

# Summarize average members for each category
episode_popularity <- anime_data %>%
  filter(!is.na(episode_category)) %>%  # Remove rows with missing categories
  group_by(episode_category) %>%
  summarise(
    avg_members = mean(members, na.rm = TRUE),
    total_members = sum(members, na.rm = TRUE)
  ) %>%
  arrange(desc(avg_members))

# Plot the average members for each category
ggplot(episode_popularity, aes(x = reorder(episode_category, -avg_members), y = avg_members)) +
  geom_bar(stat = "identity", fill = "steelblue", color = "black", width = 0.7) +
  geom_text(aes(label = scales::comma(round(avg_members))), vjust = -0.5, size = 4) +  # Add labels
  labs(
    title = "Popularity of TV Series by Episode Length",
    subtitle = "Average members for short, medium, and long episodic TV series",
    x = "Episode Length Category",
    y = "Average Number of Members"
  ) +
  theme_minimal(base_size = 12) +
  theme(
    plot.title = element_text(face = "bold", size = 16),
    plot.subtitle = element_text(size = 12),
    axis.text.x = element_text(angle = 45, hjust = 1)
  )
