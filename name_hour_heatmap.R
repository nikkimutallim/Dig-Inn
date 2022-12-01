setwd("C:/Users/mutal/OneDrive - University of Iowa/Desktop/Analytical Programming")

library(readr)

finaldata <- read_csv("FINALDATA.csv")
finaldata

View(finaldata)

is.na(finaldata)

finaldata1 <- na.omit(finaldata)

View(finaldata1)

write.csv(finaldata1, "finaldata1.csv")

library(tidyverse)

futurematrix <- select(finaldata1, TIMEHOUR, MAIN_NAME)

futurematrix$TIMEHOUR <- as.integer(futurematrix$TIMEHOUR)

View(futurematrix)
futurematrix


corrected_future_matrix <- futurematrix %>%
  group_by(TIMEHOUR) %>%
  count(MAIN_NAME)

View(corrected_future_matrix)

corrected_future_matrix

pivoted_future_matrix <- corrected_future_matrix %>%
  pivot_wider(names_from = TIMEHOUR, values_from = n)

typeof(pivoted_future_matrix$`9`)

pivoted_future_matrix


pivoted_future_matrix[is.na(pivoted_future_matrix)] <- 0


View(pivoted_future_matrix)

summary(pivoted_future_matrix)

pivoted_future_matrix

pivoted_future_matrix[,2:16] <- sapply(pivoted_future_matrix[,2:16], as.numeric)

pivoted_future_matrix

pivoted_future_matrix[is.na(pivoted_future_matrix)] <- 0

View(pivoted_future_matrix)

pivoted_dataframe <- as.data.frame(pivoted_future_matrix)

pivoted_dataframe

rownames(pivoted_dataframe) <- pivoted_dataframe$MAIN_NAME

pivoted_dataframe

View(pivoted_dataframe)

pivoted_indexed_df <- pivoted_dataframe[,2:16]

pivoted_indexed_df

View(pivoted_indexed_df)

my_matrix <- as.matrix(pivoted_indexed_df)

my_matrix

View(my_matrix)

transposed_matrix <- t(my_matrix)

transposed_matrix

View(transposed_matrix)

heatmap(my_matrix, scale = "column", cex.lab = 0.2)

#the best
heatmap(my_matrix, Colv = NA, Rowv = NA, scale="column", xlab = "Hours of the Day")
#pivoted_indexed_df


#Trying correlation matrix

data <- cor(pivoted_indexed_df[sapply(pivoted_indexed_df, is.numeric)])

data1 <- melt(data)

head(data1)










ggplot(pivoted_future_matrix, aes(x = Var1,
                  y = Var2,
                  fill = value))+geom_tile()



library(reshape2)

data1<-melt(data)

head(data1)

ggplot(data1, aes(x = Var1,
                  y = Var2,
                  fill = value))+geom_tile()

ggplot(data1,aes(x = Var1, y = Var2, fill = value))+
  geom_tile()+scale_fill_gradient(high = "green", low = "white")


my_matrix <- as.matrix(pivoted_future_matrix)

summary(my_matrix)

my_matrix

numeric_matrix <- as.numeric(my_matrix)

head(numeric_matrix)

View(numeric_matrix)

summary(y)
