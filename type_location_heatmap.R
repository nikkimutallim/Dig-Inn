summary(finaldata1)

structure(finaldata1)

setwd("C:/Users/mutal/OneDrive - University of Iowa/Desktop/Analytical Programming")

library(readr)

finaldata1 <- read_csv("finaldata1.csv")
finaldata1

typebyloc <- select(finaldata1, NAME, TYPE)

typebyloc_with_count <- typebyloc %>%
  group_by(NAME) %>%
  count(TYPE)

View(typebyloc_with_count)

pivoted_typebyloc_with_count <- typebyloc_with_count %>%
  pivot_wider(names_from = NAME, values_from = n)

pivoted_typebyloc_with_count


View(pivoted_typebyloc_with_count)

typeof(pivoted_typebyloc_with_count)

pivoted_typebyloc_with_count_df <- as.data.frame(pivoted_typebyloc_with_count)

pivoted_typebyloc_with_count_df

View(pivoted_typebyloc_with_count_df)

rownames(pivoted_typebyloc_with_count_df) <- pivoted_typebyloc_with_count_df$TYPE

pivoted_typebyloc_with_count_df

View(pivoted_typebyloc_with_count_df)

pivoted_typebyloc_with_count_df <- pivoted_typebyloc_with_count_df[,2:9]

pivoted_typebyloc_with_count_df

View(pivoted_typebyloc_with_count_df)

tblc_matrix <- as.matrix(pivoted_typebyloc_with_count_df)

tblc_matrix

View(tblc_matrix)

#Doesn't make much sense
heatmap(tblc_matrix, Colv = NA, Rowv = NA, scale="column", xlab = "Location")

transposed_tblc <- t(tblc_matrix)

transposed_tblc

#Does make sense. Helpful.
heatmap(transposed_tblc, scale="column", xlab = "Order Type",
        cexCol = 0.7)
