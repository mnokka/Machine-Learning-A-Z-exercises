dataset=read.csv('Data.csv')


# fix missing data
dataset$Age = ifelse(is.na(dataset$Age),
  ave(dataset$Age,FUN=function(x) mean(x,na.rm=TRUE)),
  dataset$Age)

dataset$Salary = ifelse(is.na(dataset$Salary),
                     ave(dataset$Salary,FUN=function(x) mean(x,na.rm=TRUE)),
                     dataset$Age)

# encode categorical data
dataset$Country = factor(dataset$Country,
                         levels=c('France','Spain','Germany'),
                         labels=c(1,2,3))

dataset$Purchased = factor(dataset$Purchased,
                         levels=c('No','Yes'),
                         labels=c(0,1))