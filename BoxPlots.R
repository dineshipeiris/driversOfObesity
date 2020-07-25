### all_indicators
all_indicators <- read.csv("E:/Code_Snippets/all_indicators.csv",stringsAsFactors=FALSE)

par(mfrow=c(1, 3))  # divide graph area in 3 columns

boxplot(all_indicators$Current_smokers, main="Current_smokers")  # box plot for 'Current_smokers'

boxplot(all_indicators$Vegetable_and_fruit_intake, main="Vegetable_and_fruit_intake")  # box plot for 'Vegetable_and_fruit_intake'

boxplot(all_indicators$Obese, main="Obese")  # box plot for 'Obese'







