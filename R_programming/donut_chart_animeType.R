# Load necessary libraries
library(ggplot2)
library(readr)
anime_data <- read_csv("D:/Universty/R_assignment/tidied_anime_data.csv", show_col_types = FALSE)

# Create a summary table of anime types
anime_type_summary <- as.data.frame(table(anime_data$type))
colnames(anime_type_summary) <- c("Type", "Count")

# Sort the data by Count in descending order
anime_type_summary <- anime_type_summary[order(-anime_type_summary$Count), ]

# Add a proportion column for the labels
anime_type_summary$Proportion <- round((anime_type_summary$Count / sum(anime_type_summary$Count)) * 100, 1)

# Convert Type to a factor with levels in the sorted order
anime_type_summary$Type <- factor(anime_type_summary$Type, levels = anime_type_summary$Type)

# Create a donut chart
ggplot(anime_type_summary, aes(x = 2, y = Count, fill = Type)) +
  geom_bar(stat = "identity", width = 1, color = "white") +  # Use geom_bar for segments
  coord_polar(theta = "y") +  # Convert bar chart into a circular format
  geom_text(aes(label = paste0(Proportion, "%")), 
            position = position_stack(vjust = 0.5), color = "white") +  # Position labels at the center of each segment
  xlim(0.5, 2.5) +  # Adjust the x-axis for a donut effect
  labs(title = "Proportion of Anime Types in the Dataset") +
  theme_void() +  # Simplify chart design
  theme(legend.title = element_blank())  # Remove legend title
