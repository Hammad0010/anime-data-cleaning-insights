library(dplyr)
library(ggplot2)
install.packages("babynames")
library(babynames)
babynames
View(babynames) 
babynames_20th_century_male <- babynames %>%
  filter(year >= 1900, year <= 1999, sex == "M")



# Filter for male names in the 20th century (1900-1999)
babynames_20th_century_male <- babynames %>%
  filter(year >= 1900, year <= 1999, sex == "M")

# Find the three most popular male names by summing up their occurrences over the 20th century
top_male_names_20th_century <- babynames_20th_century_male %>%
  group_by(name) %>%
  summarise(total = sum(n)) %>%
  arrange(desc(total)) %>%
  slice(1:3) %>%
  pull(name)

# Filter original data to only include these top names
top_male_names_data <- babynames_20th_century_male %>%
  filter(name %in% top_male_names_20th_century)

# Plot the popularity trends of the top 3 male names over the 20th century
ggplot(top_male_names_data, aes(x = year, y = prop, color = name)) +
  geom_line() +
  labs(title = "Popularity of the Three Most Popular Male Names (1900-1999)",
       x = "Year", y = "Proportion") +
  theme_minimal()
