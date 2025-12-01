library(ggplot2)

data <- read.csv("../city_gov_attention.csv", header = TRUE, stringsAsFactors = FALSE)

set.seed(1024)
top5_points <- data[order(-data$gov_attention), ][1:5, ]

p <- ggplot(data, aes(y = gov_attention)) +
  geom_boxplot(fill = "#FECD9E", color = "black", outlier.shape = NA) +
  geom_jitter(aes(x = 0), width = 0.1, color = "#FF9800", alpha = 0.5, size = 3) +

  labs(y = "Government Attention", x = NULL) +
  theme_minimal() +
  theme(
    axis.title.x = element_blank(),  
    axis.text.x = element_blank(),   
    axis.ticks.x = element_blank(),
    axis.title.y = element_text(size = 10)
  ) +
  scale_y_continuous(breaks = seq(0, max(data$gov_attention, na.rm = TRUE), by = 20)) 


print(p)

ggsave('gov_attention.pdf', plot = p, width = 2, height = 5)

