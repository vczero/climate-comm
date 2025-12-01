library(ggplot2)
library(tidyr)
library(GGally)

data <- read.csv("../engagement.csv")

data_subset <- data[, c("old_like_num", "read_num", "share_num")]


ggpairs(data_subset,
        aes(color = "blue"),
        upper = list(continuous = "cor"),  
        lower = list(continuous = "points"),  
        diag = list(continuous = "density")) 

