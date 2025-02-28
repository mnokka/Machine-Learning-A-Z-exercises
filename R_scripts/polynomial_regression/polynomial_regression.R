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

# Fitting Linear Regression to the dataset
# . on ota Level
# lineaarisessa oli training täss ei, koko setti käytössä, on pieni datasetti
# konsolissa:   summary(lin_reg)
lin_reg=lm(formula = Salary ~.,
           data=dataset)


# Fitting Polynomial Regression to the dataset
# lisätäänd dataa dataframeen
dataset$Level2 = dataset$Level^2 # kaikkien arvojen neliöt
dataset$Level3 = dataset$Level^3 # kaikkien arvojen x^3
dataset$Level4 = dataset$Level^4 # kaiikien arvojen x⁴
poly_reg = lm(formula = Salary ~ .,
              data = dataset)

# Visualising the Linear Regression results
# katso packages ja instaalloi jos tarvitsee;: install.packages('ggplot2')
library(ggplot2)
ggplot() +
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             colour = 'red') +
  geom_line(aes(x = dataset$Level, y = predict(lin_reg, newdata = dataset)),
            colour = 'blue') +
  ggtitle('Truth or Bluff (Linear Regression)') +
  xlab('Level') +
  ylab('Salary')

# Visualising the Polynomial Regression results
# install.packages('ggplot2')
library(ggplot2)
ggplot() +
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             colour = 'red') +
  geom_line(aes(x = dataset$Level, y = predict(poly_reg, newdata = dataset)),
            colour = 'blue') +
  ggtitle('xxx Truth or Bluff (Polynomial Regression)') +
  xlab('Level') +
  ylab('Salary')

# Visualising the Regression Model results (for higher resolution and smoother curve)
# install.packages('ggplot2')
library(ggplot2)
x_grid = seq(min(dataset$Level), max(dataset$Level), 0.1)
ggplot() +
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             colour = 'red') +
  geom_line(aes(x = x_grid, y = predict(poly_reg,
                                        newdata = data.frame(Level = x_grid,
                                                             Level2 = x_grid^2,
                                                             Level3 = x_grid^3,
                                                             Level4 = x_grid^4))),
            colour = 'blue') +
  ggtitle('level 4 Truth or Bluff (Polynomial Regression)') +
  xlab('Level') +
  ylab('Salary')

# Predicting a new result with Linear Regression
# tehdään uusi dataset jossa vain yksi dataframe, palkka kysytyllö tasolla
y_pred=predict(lin_reg, data.frame(Level = 6.5))
# --> 330378.8 

# Predicting a new result with Polynomial Regression
# sama idea, lisätään arvon potenssit columnit dataan polyregressiota varten
y_red2=predict(poly_reg, data.frame(Level = 6.5,
                             Level2 = 6.5^2,
                             Level3 = 6.5^3,
                             Level4 = 6.5^4))

# --> 158862.5 