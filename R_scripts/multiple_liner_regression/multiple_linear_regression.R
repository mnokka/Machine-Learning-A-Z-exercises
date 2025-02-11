# Multiple Linear Regression

# Importing the dataset
dataset = read.csv('50_Startups.csv')

# Encoding categorical data
dataset$State = factor(dataset$State,
                       levels = c('New York', 'California', 'Florida'),
                       labels = c(1, 2, 3))

# Splitting the dataset into the Training set and Test set
# install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Profit, SplitRatio = 0.8)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# Feature Scaling NOT NEEDED, USED FUNCTION DOES IT
# training_set = scale(training_set)
# test_set = scale(test_set)

# Fitting Multiple Linear Regression to the Training set
# . takes all independet varaibles, no need to write them
regressor = lm(formula = Profit ~ .,
               data = training_set)

# Predicting the Test set results
y_pred = predict(regressor, newdata = test_set)

# in console execute summary(regressor) !!!
# for predictions i cosole: y__pred

#Building optimal model using backward elimination
regressor = lm(formula = Profit ~ R.D.Spend+Administration+Marketing.Spend+State,
               data = dataset)
summary(regressor)

# look *** those inependet varaibles are more powerfuls...
# the smaller , the better independet, here it is RD Spend
# remove State2, State3 variables, no tsignificatnt statiscally

regressor = lm(formula = Profit ~ R.D.Spend+Administration+Marketing.Spend,
               data = dataset)
summary(regressor)

# remove next weak varaible; ADministration
regressor = lm(formula = Profit ~ R.D.Spend+Marketing.Spend,
               data = dataset)
summary(regressor)

# now MArketing Spend has hiked up... 0.06
# removing it

regressor = lm(formula = Profit ~ R.D.Spend,
               data = dataset)
summary(regressor)

# RD spned is the most powerful one, backward elimintation done!


