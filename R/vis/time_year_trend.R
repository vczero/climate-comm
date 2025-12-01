library(ggplot2)
library(dplyr)


data <- read.csv('../time_year_trend.csv')
data <- data %>% select(year, total)


p <- ggplot(data, aes(x = factor(year), y = total)) +
  geom_bar(stat = 'identity', fill = '#B0E1CB', width = 0.6) +
  geom_line(aes(group = 1), color = '#2B986E', size = 1) +
  geom_point(color = '#2B986E', size = 2) +
  geom_text(aes(label = sprintf("%.2f", total / 1000)), vjust = -0.5, size = 3.2) +
  scale_y_continuous(labels = function(x) x / 1000, expand = expansion(mult = c(0, 0.1))) +
  labs(
    x = "Year",
    y = "Public Attention (x 1000)"
  ) +
  theme_minimal() +
  theme(
    axis.text.x = element_text(angle = 0, hjust = 0.5, size = 10),
    axis.text.y = element_text(size = 10),  
    plot.margin = margin(t = 20, r = 10, b = 10, l = 10),
    axis.title.x = element_text(size = 10),                  
    axis.title.y = element_text(size = 10),                  
   
  )

print(p)
ggsave('time_year_trend.pdf', plot = p, width = 5.5, height = 3, limitsize = FALSE)
