# Installing a new package
#install.packages('caTools')

library(caTools) # For splitting data into Train and Test sets


# Data Pre-processing

# Importing the dataset
dataset = read.csv(file = 'Data.csv')

# Taking care of missing values
dataset$Age = ifelse(
                  is.na(dataset$Age), # check if value is NA
                  # if yes, then replace with mean
                  ave(dataset$Age, FUN = function(x) mean(x, na.rm = TRUE)),  
                  # if no, then return the existing age value
                  dataset$Age
                )

dataset$Salary = ifelse(
                  is.na(dataset$Salary), # check if value is NA
                  # if yes, then replace with mean
                  ave(dataset$Salary, FUN = function(x) mean(x, na.rm = TRUE)),
                  # if no, then return the existing salary value
                  dataset$Salary
                )

# Encoding categorical data

dataset$Country = factor(dataset$Country,
                         levels = c('France', 'Spain', 'Germany'),
                         labels = c(1, 2, 3)
                         )


dataset$Purchased = factor(dataset$Purchased,
                           levels = c('No', 'Yes'),
                           labels = c(0, 1)
                           )

set.seed(123) # for getting the same results everytime

# sample.split will return True or False for each observation
# True if it should be in the testing set and False otherwise.
split = sample.split(dataset$Purchased, SplitRatio = 0.8)

trainingSet = subset(dataset, split == TRUE)
testSet = subset(dataset, split == FALSE)

# Feature Scaling
trainingSet[, 2:3] = scale(trainingSet[, 2:3])
testSet[, 2:3] = scale(testSet[, 2:3])

