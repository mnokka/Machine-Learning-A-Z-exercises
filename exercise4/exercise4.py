# Importing pandas for data manipulation
import pandas as pd

# Importing train_test_split for splitting the dataset
from sklearn.model_selection import train_test_split

# Importing StandardScaler for feature scaling
from sklearn.preprocessing import StandardScaler


dataset = pd.read_csv('iris.csv')

# Separate features and target
X = dataset.drop(columns=['target'])  # Piirteet, kaikki sarakkeet paitsi 'target'
y = dataset['target']  # Tulosarvo (target)

# Split the dataset into an 80-20 training-test set
from sklearn.model_selection import train_test_split
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

# Apply feature scaling on the training and test sets
scaler = StandardScaler()

X_train_scaled = scaler.fit_transform(X_train)
X_test_scaled = scaler.transform(X_test)

# Print the scaled training and test sets
print("Skaalatut koulutusjoukon piirteet (X_train_scaled):")
print(X_train_scaled)

print("Skaalatut testijoukon piirteet (X_test_scaled):")
print(X_test_scaled)