# Load required libraries
library(ggplot2)
library(dplyr)
library(readr)

# Load the dataset
anime_data <- read_csv("D:/Universty/R_assignment/tidied_anime_data.csv", show_col_types = FALSE)

# Prepare the data for user engagement over time
user_engagement <- anime_data %>%
  filter(!is.na(year), year > 0) %>%  # Ensure valid years
  group_by(year) %>%
  summarise(total_members = sum(members, na.rm = TRUE)) %>%  # Sum members for each year
  ungroup()

# Plot user engagement over time
ggplot(user_engagement, aes(x = year, y = total_members)) +
  geom_line(color = "darkorange", size = 1.5) +  # Line for user engagement
  geom_point(color = "darkorange", size = 2, alpha = 0.8) +  # Points for individual years
  labs(
    title = "User Engagement Over Time",
    subtitle = "Total number of members interacting with anime per year",
    x = "Year",
    y = "Total Members"
  ) +
  scale_y_continuous(labels = scales::comma) +  # Add commas for large numbers
  scale_x_continuous(
    breaks = seq(min(user_engagement$year), max(user_engagement$year), by = 10),  # Breaks every 10 years
    labels = seq(min(user_engagement$year), max(user_engagement$year), by = 10)  # Label every 10 years
  ) +
  theme_minimal(base_size = 12) +
  theme(
    plot.title = element_text(face = "bold", size = 16),
    plot.subtitle = element_text(size = 12),
    axis.text.x = element_text(angle = 45, hjust = 1, vjust = 1, size = 10),  # Angled labels
    axis.text.y = element_text(size = 10),
    axis.title.x = element_text(size = 12, face = "bold"),
    axis.title.y = element_text(size = 12, face = "bold")
  )
