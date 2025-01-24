# Importing pandas for data manipulation
import pandas as pd

# Importing train_test_split for splitting the dataframe
from sklearn.model_selection import train_test_split

# Importing StandardScaler for feature scaling
from sklearn.preprocessing import StandardScaler


dataframe = pd.read_csv('winequality-red.csv', delimiter=';')

# Separate features and target
X = dataframe.drop(columns=['quality'])# Piirteet, kaikki sarakkeet paitsi 'target'
y = dataframe['quality']  # Tulosarvo (target)

# Split the dataframe into an 80-20 training-test set
from sklearn.model_selection import train_test_split
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

# Apply feature scaling on the training and test sets
scaler = StandardScaler()

X_train= scaler.fit_transform(X_train)
X_test= scaler.transform(X_test)

# Print scaled training and test sets
print("Scaled Training Set:")
print(X_train)
print("\nScaled Test Set:")
print(X_test)