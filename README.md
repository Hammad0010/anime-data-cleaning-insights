Project Overview
This project focuses on the cleaning, transformation, and analysis of a comprehensive anime dataset obtained from Kaggle. The goal is to uncover insightful trends and patterns that can inform anime recommendations, ratings analysis, and viewer preferences studies. This repository contains all the scripts, documentation, and output files used in the analysis.

Motivation
The motivation behind this project is to explore the rich and diverse world of anime to understand what factors contribute to their success and popularity. By analyzing viewer ratings and metadata, we can identify trends that help predict future successes and understand viewer demographics better.

Dataset Description
The dataset includes several fields such as anime titles, genres, viewer ratings, and more, which are used to perform a thorough analysis. This data was sourced from Kaggle, and due care has been taken to ensure compliance with data usage policies.

Note: Due to the data usage agreement on Kaggle, the raw data files are not included in this repository. Users wishing to replicate the analysis are advised to download the data directly from Kaggle.

Files and Directories
/data: This folder is intended for storing cleaned datasets ready for analysis. (Note: Due to privacy and compliance reasons, raw data files are not included.)
/scripts: Contains all R scripts used for data cleaning, manipulation, and analysis.
/docs: Includes project documentation and any reports generated from the analysis.
/outputs: Stores output files such as processed data sets and visualizations.
Technologies Used
R: Used for all data cleaning and analysis tasks.
Kaggle: Source of the dataset.
Power BI (Optional): For creating advanced visualizations and dashboards if part of the analysis.
How to Use This Repository
Clone the Repository: git clone https://github.com/Hammad0010/anime-data-cleaning-insights.git
Set Up Your Environment: Install R and necessary libraries listed in the requirements.txt.
Run the Scripts: Navigate to the /scripts directory and execute scripts in the order documented.
View Results: Check the /outputs directory for results and visualizations.
Contributing
We welcome contributions to this project! If you have suggestions for improvements or new analyses, please fork the repository and submit a pull request, or open an issue to discuss your ideas.

License
This project is licensed under the MIT License - see the LICENSE file for details.

Acknowledgments
Thanks to Kaggle for providing a rich dataset to work with.
Contributions made by community members are greatly appreciated.
## Visualizations from the Analysis

Here are some of the key visualizations derived from the anime dataset, highlighting various insights into anime ratings, popularity, and trends:

### Donut Chart - Distribution of Anime Genres
This donut chart illustrates the distribution of different genres within the dataset, providing a clear visual representation of the most to least common genres in anime. This helps in understanding the genre diversity and prevalent themes.
![Donut Chart](https://github.com/Hammad0010/anime-data-cleaning-insights/blob/master/graphs/DonutChart.png?raw=true)

### Line Chart of User Engagement - Monthly Active Users
The line chart tracks user engagement over time, showing the number of active users per month. This visualization is crucial for identifying trends in viewer activity, such as spikes or declines, which could correlate with seasonal releases or particular events.
![Line Chart of User Engagement](https://github.com/Hammad0010/anime-data-cleaning-insights/blob/master/graphs/Line_user_engage.png?raw=true)

### Part 1 Analysis - Overview of Anime Ratings
This graph provides an overview of the average ratings for anime, segmented by various criteria established in Part 1 of our analysis. It sets the stage for deeper exploratory data analysis and hypothesis testing regarding what factors influence anime ratings.
![Part 1 Analysis](https://github.com/Hammad0010/anime-data-cleaning-insights/blob/master/graphs/Part1.png?raw=true)

### Popularity of Episodes - Viewership Trends
This visualization shows the popularity of different anime episodes, highlighting the episodes with the highest viewership. This insight can be useful for networks and creators to understand which episodes captivated the audience most.
![Popularity of Episodes](https://github.com/Hammad0010/anime-data-cleaning-insights/blob/master/graphs/Pop_ep_tv.png?raw=true)

### Popularity of TV Shows vs. Movies - Comparative Analysis
This chart compares the popularity and viewership trends between TV shows and movies, providing insights into audience preferences between these two formats.
![Popularity of TV Shows vs. Movies](https://github.com/Hammad0010/anime-data-cleaning-insights/blob/master/graphs/Pop_tv_mov.png?raw=true)

### Trends in Anime Production - Yearly Analysis
This plot reveals the trends in anime production over the years, showing the number of anime titles produced each year. This helps understand the growth or decline in anime production and potential market saturation.
![Trends in Anime Production](https://github.com/Hammad0010/anime-data-cleaning-insights/blob/master/graphs/Produce_trends.png?raw=true)

### Average TV Ratings by Year - Temporal Trends
This graph displays the average TV ratings for anime by year, allowing us to observe changes in quality or popularity over time and identify any potential patterns in audience reception.
![Average TV Ratings by Year](https://github.com/Hammad0010/anime-data-cleaning-insights/blob/master/graphs/avg_tv_rate_year.png?raw=true)
