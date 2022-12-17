setwd("C:/Users/mutal/OneDrive - University of Iowa/Desktop/Analytical Programming")

library(readr)

finaldata1 <- read_csv("finaldata1.csv")
finaldata1

View(finaldata1)

library(dplyr)
library(tidyverse)

ggplot(data = finaldata1, 
       aes(x = BASE_NAME)) +
  geom_bar(fill = 'blue', width = 0.4) + 
  xlab("Base Dish") +
  ylab("Count") +
  ggtitle("Base Dish by Count")

ggplot(data = finaldata1, 
       aes(x = TYPE)) +
  geom_bar(fill = 'blue', width = 0.4) + 
  xlab("Order Type") +
  ylab("Count") +
  ggtitle("Order Type by Count")




ggplot(data = finaldata1, 
       aes(x = MAIN_NAME)) +
  geom_bar(fill = 'blue', width = 0.4) + 
  xlab("Main Dish") +
  ylab("Count") +
  ggtitle("Main Dish by Count")


ggplot(data = finaldata1, 
       aes(x = SIDE_1_NAME)) +
  geom_bar(fill = 'blue', width = 0.4) + 
  xlab("Side 1") +
  ylab("Count") +
  ggtitle("Side 1 by Count")
