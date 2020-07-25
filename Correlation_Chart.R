### all_indicators
all_indicators <- read.csv("E:/Code_Snippets/all_indicators.csv",stringsAsFactors=FALSE)

#selected_variables <- all_indicators[, c("Obese","High_blood_pressure_medicated", "Gout", "Rheumatoid_arthritis", "Daily_smokers", "Little_or_no_physical_activity", "Stroke", "Mostly_smoke_both_manufactured_and_roll.your_own_cigarettes","Raised_blood_pressure_measured", "Mood_and.or_anxiety_disorder","Fruit_intake")]    # correlation chart 

selected_variables <- all_indicators[, c("Obese","Current_smokers", "Vegetable_and_fruit_intake")]    # correlation chart 

library(dplyr) 

chart.Correlation(selected_variables, histogram=TRUE, pch=19)

library(corrplot)

corrplot_matrix <- cor(selected_variables,use = "pairwise.complete.obs")
library(corrplot)
corrplot(corrplot_matrix)



### all_indicators
all_indicators <- read.csv("E:/Code_Snippets/all_indicators.csv",stringsAsFactors=FALSE)

cor(all_indicators$Current_smokers, all_indicators$Obese)  # calculate correlation between Current_smokers and Obese 

cor(all_indicators$Vegetable_and_fruit_intake, all_indicators$Obese)  # calculate correlation between Vegetable_and_fruit_intake and Obese 
