# Load necessary library
library(readr)
library(tidyverse)
library(ggplot2)
# Load the dataset from your local file path
anime_data <- read_csv("D:/Universty/R_assignment/cleaned_anime_data.csv", show_col_types = FALSE)

# Display the first few rows
head(anime_data)

# Convert 'episodes' to numeric, setting non-numeric entries to NA
anime_data <- anime_data %>%
  mutate(episodes = as.numeric(episodes))

# Separate rows in the genre column
anime_data <- anime_data %>%
  separate_rows(genre, sep = ", ")  # Splits genres into separate rows

# Replace missing ratings with the mean rating
anime_data <- anime_data %>%
  mutate(rating = ifelse(is.na(rating), mean(rating, na.rm = TRUE), rating))

# Convert 'members' to numeric if needed
anime_data <- anime_data %>%
  mutate(members = as.numeric(members))

# Example of renaming columns
#anime_data <- anime_data %>%
 # rename(title = name)  # Renames 'name' column to 'title' if 'name' exists

head(anime_data)
write_csv(anime_data, "D:/Universty/R_assignment/tidied_anime_data.csv")



# Define what counts as a "long series" (e.g., 50 or more episodes)
anime_data <- anime_data %>%
  mutate(long_series = ifelse(episodes >= 50, TRUE, FALSE))

# Calculate the proportion of long series by year
long_series_trend <- anime_data %>%
  group_by(year) %>%
  summarise(proportion_long = mean(long_series, na.rm = TRUE))

# Plot the trend over time
ggplot(long_series_trend, aes(x = year, y = proportion_long)) +
  geom_line(color = "blue") +
  labs(title = "Yearly Trend of Long Episodic Anime (50+ Episodes)",
       x = "Year", y = "Proportion of Long Series") +
  theme_minimal() +
  ylim(0, 1)

#Calculate average episodes per year
length_trend <- anime_data %>%
  group_by(year) %>%
  summarise(avg_episodes = mean(episodes, na.rm = TRUE))

# Plot
ggplot(length_trend, aes(x = year, y = avg_episodes)) +
  geom_line(color = "blue") +
  labs(title = "Trend of Average Anime Episodes Over Time",
       x = "Year", y = "Average Episodes") +
  theme_minimal()
#code
# Separate genres and calculate average members per genre per year
genre_trend <- anime_data %>%
  separate_rows(genre, sep = ", ") %>% # Separate genres if multiple genres per row
  group_by(year, genre) %>%
  summarise(avg_members = mean(members, na.rm = TRUE))

# Plot
ggplot(genre_trend, aes(x = year, y = avg_members, color = genre)) +
  geom_line() +
  labs(title = "Popularity of Anime Genres Over Time",
       x = "Year", y = "Average Members") +
  theme_minimal()

#plot 2

ggplot(genre_trend, aes(x = year, y = avg_members, fill = genre)) +
  geom_area(position = "stack") +
  labs(title = "Popularity of Anime Genres Over Time (Stacked)",
       x = "Year", y = "Average Members") +
  theme_minimal()

#plot#3
# Filter for top genres by average members
# Filter for top 3 genres by average members
top_genres <- genre_trend %>%
  group_by(genre) %>%
  summarise(total_members = sum(avg_members, na.rm = TRUE)) %>%
  top_n(3, total_members) %>%  # Select top 3 genres
  pull(genre)

# Plot for the top 3 genres
ggplot(genre_trend %>% filter(genre %in% top_genres), aes(x = year, y = avg_members, color = genre)) +
  geom_line(size = 1.5) +  # Increase line thickness with size
  labs(title = "Popularity of Top 3 Anime Genres Over Time",
       x = "Year", y = "Average Members") +
  theme_minimal()

