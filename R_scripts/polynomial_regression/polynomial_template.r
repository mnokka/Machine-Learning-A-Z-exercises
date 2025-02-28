# Polynomial Regression

# Importing the dataset
dataset = read.csv('Position_Salaries.csv')
dataset = dataset[2:3] # pidä nämä , indeksi alkaa 1, pidetään 2 ja 3

# käytetään kok  datasettiä, ei training jakoa
# ei feature scalianiga tässä mallissa tarvita, on exponentit

# Splitting the dataset into the Training set and Test set
# # install.packages('caTools')
# library(caTools)
# set.seed(123)
# split = sample.split(dataset$Salary, SplitRatio = 2/3)
# training_set = subset(dataset, split == TRUE)
# test_set = subset(dataset, split == FALSE)

# Feature Scaling
# training_set = scale(training_set)
# test_set = scale(test_set)



# Fitting Polynomial Regression to the dataset
# luodaan agressor

# Predicting a new result 
# sama idea, lisätään arvon potenssit columnit dataan polyregressiota varten
y_red2=predict(regresor, data.frame(Level = 6.5))

# Visualising the Regression Model results
# install.packages('ggplot2')
library(ggplot2)
ggplot() +
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             colour = 'red') +
  geom_line(aes(x = dataset$Level, y = predict(regressor, newdata = dataset)),
            colour = 'blue') +
  ggtitle('xxx Truth or Bluff (Polynomial Regression)') +
  xlab('Level') +
  ylab('Salary')


# lisää data stepeillä 0.1 että on paljon dataa kuviossa
# Visualising the Regression Model results for higher resoltuion
# install.packages('ggplot2')
library(ggplot2)
x_grid=seq(min(dataset$Level),max(dataset$Level), 0.1)
ggplot() +
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             colour = 'red') +
  geom_line(aes(x = xgrid, y = predict(regressor, newdata = data.frame(Level = x_grid))),
            colour = 'blue') +
  ggtitle('xxx Truth or Bluff (Polynomial Regression)') +
  xlab('Level') +
  ylab('Salary')



