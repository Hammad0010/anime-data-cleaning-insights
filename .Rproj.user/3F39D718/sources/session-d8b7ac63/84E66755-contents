# Load required libraries
library(ggplot2)
library(dplyr)

# Load your data
anime_data <- read_csv("D:/Universty/R_assignment/tidied_anime_data.csv", show_col_types = FALSE)

# Clean and filter the data for Movies and TV Series only
anime_data <- anime_data %>%
  filter(!is.na(year), year > 0, type %in% c("Movie", "TV"))

# Calculate the number of releases by year and type
type_trend <- anime_data %>%
  group_by(year, type) %>%
  summarize(releases = n()) %>%
  ungroup()

# Plotting the number of releases for Movies and TV Series
plot1 <- ggplot(type_trend, aes(x = year, y = releases, color = type, group = type)) +
  geom_line(size = 1) +
  geom_point(size = 2) +
  labs(
    title = "Popularity of Movies and TV Series Over Time",
    x = "Year",
    y = "Number of Releases",
    color = "Anime Type"
  ) +
  theme_minimal()

# Display the plot
print(plot1)
