### all_indicators
all_indicators <- read.csv("E:/Code_Snippets/all_indicators.csv",stringsAsFactors=FALSE)

#Build multilinear MOdel
model <- Obese ~ Current_smokers + Vegetable_and_fruit_intake 
multiLinearModel <- lm(model, data=all_indicators)
 
summary(multiLinearModel)  # model summary

AIC(multiLinearModel)  # AIC => 419.1569
BIC(multiLinearModel)  # BIC => 424.8929

#::::Predicting Multi Linear Models:::::::::

#Create the training (development) and test (validation) data samples from original data.
# Create Training and Test data -
set.seed(100)  # setting seed to reproduce results of random sampling
trainingRowIndex <- sample(1:nrow(all_indicators), 0.8*nrow(all_indicators))  # row indices for training data
trainingData <- all_indicators[trainingRowIndex, ]  # model training data
testData  <- all_indicators[-trainingRowIndex, ]   # test data

#Develop the model on the training data and use it to predict the distance on test data
# Build the model on training data -
model <- Obese ~ Current_smokers + Vegetable_and_fruit_intake 
multiLinearModel <- lm(model, data=trainingData)  # build the model
distPred <- predict(multiLinearModel, testData)  # predict distance

#Review diagnostic measures.
summary (multiLinearModel)  # model summary

#Calculate prediction accuracy
actuals_preds <- data.frame(cbind(actuals=testData$Obese, predicteds=distPred))  # make actuals_predicteds dataframe.
correlation_accuracy <- cor(actuals_preds)  
head(actuals_preds)

print(correlation_accuracy)


#calculate the Min Max accuracy and MAPE:
min_max_accuracy <- mean(apply(actuals_preds, 1, min) / apply(actuals_preds, 1, max))  
# => 58.42%, min_max accuracy
mape <- mean(abs((actuals_preds$predicteds - actuals_preds$actuals))/actuals_preds$actuals)  
# => 48.38%, mean absolute percentage deviation

#k- Fold Cross validation
#install.packages('DAAG')
library(DAAG)
cvResults <- suppressWarnings(CVlm(data=all_indicators, form.lm=model, m=5, dots=FALSE, seed=29, legend.pos="topleft",  printit=FALSE, main="Small symbols are predicted values while bigger ones are actuals."));  # performs the CV
attr(cvResults, 'ms')  # => 251.2783 mean squared error

