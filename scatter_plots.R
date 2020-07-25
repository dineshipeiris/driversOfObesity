#scatter plot

library(ggplot2)

### all_indicators
all_indicators <- read.csv("E:/Code_Snippets/all_indicators.csv",stringsAsFactors=FALSE)

par(mfrow=c(1, 2))  # divide graph area in 2 columns

# Current_smokers vs Obese
scatter.smooth(x=all_indicators$Current_smokers, y=all_indicators$Obese, main="Current_smokers ~ Obese")  


# Vegetable_and_fruit_intake vs Obese 
scatter.smooth(x=all_indicators$Vegetable_and_fruit_intake, y=all_indicators$Obese, main="Vegetable_and_fruit_intake ~ Obese")  


