import numpy as np
import pandas as pd
from sklearn.compose import ColumnTransformer
from sklearn.preprocessing import OneHotEncoder, LabelEncoder
from sklearn.impute import SimpleImputer

# 1. Ladataan datasetti
dataset = pd.read_csv('titanic.csv')

# 3. Määritellään kategoriset sarakkeet
categorical_features = ['Sex', 'Embarked', 'Pclass']  # Kategoriset muuttujat

# 4. Käytetään ColumnTransformeria käsittelemään kategoriset sarakkeet
ct = ColumnTransformer(
    transformers=[
        ('encoder', OneHotEncoder(), categorical_features)  # OneHotEncoding kategoriat
    ], 
    remainder='passthrough'  # Säilytetään kaikki muut sarakkeet ennallaan
)

# 5. Sovelletaan ColumnTransformer X:lle
X = ct.fit_transform(dataset)

# 6. Muutetaan X_transformed numpy-taulukoksi
X = np.array(X)

# 7. Tulostetaan muokattu X_transformed (näytetään vain ensimmäiset 5 riviä)
print("X  shape:", X.shape)
print(X)  # Näytetään vain ensimmäiset 5 riviä

# 8. Sovelletaan LabelEncoder 'Survived' (jos tarvitaan)
le = LabelEncoder()
y= le.fit_transform(dataset['Survived']) # Tämä ei ole tarpeen, koska 'Survived' on jo binäärinen

# 9. Tulostetaan y_encoded (näytetään vain ensimmäiset 5 arvoa)
print("y shape:", y.shape)
print(y)  # Näytetään vain ensimmäiset 5 arvoa
