### all_indicators
all_indicators <- read.csv("E:/Code_Snippets/all_indicators.csv",stringsAsFactors=FALSE)

#install.packages('e1071')

library(e1071)  # for skewness function

par(mfrow=c(1, 3))  # divide graph area in 3 columns

# density plot for 'Current_smokers'
plot(density(all_indicators$Current_smokers), main="Density Plot: Current_smokers", ylab="Value", sub=paste("Skewness:", round(e1071::skewness(all_indicators$Current_smokers), 2)))  

polygon(density(all_indicators$Current_smokers), col="red")


# density plot for 'Vegetable_and_fruit_intake'

plot(density(all_indicators$Vegetable_and_fruit_intake), main="Density Plot: Vegetable_and_fruit_intake", ylab="Value", sub=paste("Skewness:", round(e1071::skewness(all_indicators$Vegetable_and_fruit_intake), 2)))  

polygon(density(all_indicators$Vegetable_and_fruit_intake), col="green")


# density plot for 'Obese'

plot(density(all_indicators$Obese), main="Density Plot: Obese", ylab="Value", sub=paste("Skewness:", round(e1071::skewness(all_indicators$Obese), 2)))  

polygon(density(all_indicators$Obese), col="blue")








