# Importing the necessary libraries
import pandas as pd  # Data handling
import numpy as np  # Numerical operations
from sklearn.impute import SimpleImputer

# Load the dataset

dataset = pd.read_csv('pima-indians-diabetes.csv')
X = dataset.iloc[:, :-1].values
y = dataset.iloc[:, -1].values

#np.set_printoptions(threshold=np.inf) # to print all x and y material

print(X)
print(y)

# Identify missing data (assumes that missing data is represented as NaN)
fixeddataset = dataset.replace(0, np.nan) # 0 values as NaN
missing_data = fixeddataset.isna().sum()

# Print the number of missing entries in each column
print("Each column missing data numbers:")
print(missing_data)

# Configure an instance of the SimpleImputer class
from sklearn.impute import SimpleImputer
imputer = SimpleImputer(missing_values=np.nan, strategy='mean')

# Fit the imputer on the DataFrame
imputer.fit(X[:, 1:8])

# Apply the transform to the DataFrame
X[:, 1:8] = imputer.transform(X[:, 1:8])

#Print your updated matrix of features
print(X)

