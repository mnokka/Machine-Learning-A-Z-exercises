# Importing libraries
import pandas as pd  # Data handling
import numpy as np  # Numerical operations
from sklearn.model_selection import train_test_split # Dataset splitting


# Importing the dataset
dataset = pd.read_csv('iris.csv')

# Creating the matrix of features (X) and the dependent variable vector (y)
X = dataset.iloc[:, :-1].values
y = dataset.iloc[:, -1].values
print(X)
print(y)
