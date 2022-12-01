setwd("C:/Users/mutal/OneDrive - University of Iowa/Desktop/Analytical Programming")

library(readr)

finaldata <- read_csv("finaldata1.csv")
finaldata

tbh <- select(finaldata1, TIMEHOUR, TYPE)

tbh_with_count <- tbh %>%
  group_by(TIMEHOUR) %>%
  count(TYPE)

View(tbh_with_count)

pivoted_tbh_withcount <- tbh_with_count %>%
  pivot_wider(names_from = TIMEHOUR, values_from = n)

pivoted_tbh_withcount

pivoted_tbh_withcount[is.na(pivoted_tbh_withcount)] <- 0

pivoted_tbh_withcount

View(pivoted_tbh_withcount)

typeof(pivoted_tbh_withcount)

pivoted_tbhc_df <- as.data.frame(pivoted_tbh_withcount)

pivoted_tbhc_df

View(pivoted_tbhc_df)

rownames(pivoted_tbhc_df) <- pivoted_tbhc_df$TYPE

pivoted_tbhc_df

View(pivoted_tbhc_df)

pivoted_tbhc_df <- pivoted_tbhc_df[,2:16]

pivoted_tbhc_df

View(pivoted_tbhc_df)

tbhc_matrix <- as.matrix(pivoted_tbhc_df)

tbhc_matrix

View(tbhc_matrix)

#Doesn't make much sense
heatmap(tbhc_matrix, Colv = NA, Rowv = NA, scale="column", xlab = "Hours of the Day")

transposed_tbhc <- t(tbhc_matrix)

transposed_tbhc

#Does make sense. Helpful.
heatmap(transposed_tbhc, Colv = NA, Rowv = NA, scale="column", xlab = "Type of Purchase", ylab = "Hours of the Day",
        cexCol = 0.7)


