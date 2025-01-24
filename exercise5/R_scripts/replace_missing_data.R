dataset=read.csv('Data.csv')

# replace missing age with mean of the age columns
dataset$Age = ifelse(is.na(dataset$Age),
  ave(dataset$Age,FUN=function(x) mean(x,na.rm=TRUE)),
  dataset$Age)

#replace missing salary with mean of the salaries
dataset$Salary = ifelse(is.na(dataset$Salary),
                     ave(dataset$Salary,FUN=function(x) mean(x,na.rm=TRUE)),
                     dataset$Age)