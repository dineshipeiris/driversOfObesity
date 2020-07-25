#install.packages('dplyr')
#install.packages('contrib')

library(dplyr) 

data_collection <- read.csv("E:/Code_Snippets/nz-health-survey-2016-17-regional-update-regc-prevalences.csv",stringsAsFactors=FALSE)

selected_variables <- select(data_collection,population,short.description,region,type,year,agegroup,sex,Ethnicity, nzdep_quin, Prevalence_Mean)

#Only selected data for analysis/observation
#!year %in% c("2011/12", "2012/13", "2013/14", "2014/15", "2015/16", "2016/17"), 

subset <- filter(data_collection, population == "adults", region != "New Zealand", type == "STD", !year %in% c("2011/12", "2012/13", "2013/14", "2014/15", "2015/16", "2016/17"), agegroup == "All", sex == "All", Ethnicity == "All", nzdep_quin == "All")

#select relevant columns for analysis
collection <- select(subset,short.description,region,year,Prevalence_Mean)

write.csv(collection,"E:/Code_Snippets/Data_Collection.csv")

#read the data_collection
data_collection <- read.csv("E:/Code_Snippets/Data_Collection.csv",stringsAsFactors=FALSE)

library(tidyr)

### combine the year columns into a single column 
collection <- unite(data_collection,year_region, year,region, sep = "-")

### download the new csv to your working directory
write.csv(collection,"E:/Code_Snippets/modified_collection.csv")

#filtered out relevant indicators for analysis - removed "Access to health care"
#remove other variables associated with obese
#self-rated health
# replace " " with "_" in short.description , "(" ")" ","

#modified data should be here for processing

#read the modified_collection
modified_collection <- read.csv("E:/Code_Snippets/modified_collection.csv",stringsAsFactors=FALSE)

#selected variables for analysis
data_collection <- select(modified_collection,short.description,year_region, Prevalence_Mean)

#transform rows to columns
trans_data_collection <- tidyr::spread(data_collection, short.description, Prevalence_Mean)

### download the new csv to your working directory
write.csv(trans_data_collection,"E:/Code_Snippets/trans_data_collection.csv")

#read the trans_data_collection
data_collection <- read.csv("E:/Code_Snippets/trans_data_collection.csv",stringsAsFactors=FALSE)

#scatter.smooth(x=data_collection$Physically_active, y=data_collection$Obese, main="Physically_active ~ Obese")  # scatterplot


#replace na valves with mean - calculate mean to replace na
for(i in 1:ncol(data_collection)){
  data_collection[is.na(data_collection[,i]), i] <- mean(data_collection[,i], na.rm = TRUE)
  
}

### Preprocessed data
write.csv(data_collection,"E:/Code_Snippets/pre_processed_data.csv")

#read the Preprocessed data
pre_processed_data <- read.csv("E:/Code_Snippets/pre_processed_data.csv",stringsAsFactors=FALSE)


### all_indicators
write.csv(pre_processed_data,"E:/Code_Snippets/all_indicators.csv")

