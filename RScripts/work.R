###################
type_popularity <- anime_data %>%
  group_by(type) %>%
  summarise(avg_members = mean(members, na.rm = TRUE)) %>%
  arrange(desc(avg_members))

# Plot average members by anime type
ggplot(type_popularity, aes(x = reorder(type, avg_members), y = avg_members)) +
  geom_bar(stat = "identity", fill = "dodgerblue") +
  coord_flip() +
  labs(title = "Average Members by Anime Type",
       x = "Anime Type", y = "Average Members") +
  theme_minimal(base_size = 14)
##########################