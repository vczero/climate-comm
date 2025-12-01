library(readr)
library(ggplot2)
library(dplyr) 
library(scales)

data <- read_csv("../../QGIS/nationwide_total_count.csv")
data <- data %>%
  arrange(desc(count)) %>%  
  mutate(rank = row_number())  


p<-ggplot(data, aes(x = rank, y = count)) +
  geom_line(color = "blue", size = 1) + 
  geom_point(data = data %>% filter(rank <= 10),  
             aes(x = rank, y = count),
             color = "red", size = 3, alpha = 0.7) + 
  scale_y_continuous(
    breaks = seq(100000, 700000, by = 200000),  
    labels = function(x) paste0(x / 1000, "")  
  ) +
  theme_minimal() +
  labs(
    x = "Rank",
    y = "Count (x 1000)"
  ) +
  theme(
    axis.text.x = element_text(size = 12), 
    axis.text.y = element_text(size = 12)  
  )


print(p)
ggsave('total_count_rank.pdf', plot = p, width = 6, height = 3)
