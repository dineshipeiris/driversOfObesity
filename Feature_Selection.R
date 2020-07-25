
### all_indicators
all_indicators <- read.csv("E:/Code_Snippets/all_indicators.csv",stringsAsFactors=FALSE)

#remove first four columns
all_indicators <- all_indicators[,-c(1,2:4)]

# calculate correlation with Obese 
correlation_list <- cor(all_indicators,use = "pairwise.complete.obs", all_indicators$Obese) 
print(correlation_list)

#Step-wise Regression
base.model <- lm(Obese ~ 1 , data= all_indicators)  # base intercept only model
full.model <- lm(Obese ~ . , data= all_indicators) # full model with all predictors
stepWiseAlgorithm <- step(base.model , scope = list(lower = base.model , upper = full.model), direction = "both", trace = 0, steps = 1000)  # perform step-wise algorithm
shortlistedFeatures <- names(unlist(stepWiseAlgorithm[[1]])) # get the shortlisted features
shortlistedFeatures <- shortlistedFeatures[!shortlistedFeatures %in% "(Intercept)"]  # remove intercept 
print(shortlistedFeatures)





