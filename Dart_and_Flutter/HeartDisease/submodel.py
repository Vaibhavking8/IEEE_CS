import pandas as pd
import numpy as np
from sklearn.linear_model import LogisticRegression

columns=pd.read_csv('heart_disease_data.csv')
y=columns['target']
X=columns.drop(['target'],axis = 1)


def train(X,y,iter=10000):
    lr_model = LogisticRegression(max_iter=iter)
    lr_model.fit(X, y)
    print("Accuracy on training set:", lr_model.score(X, y),end='\n\n')
    return lr_model

def test(X,test_model):
    y_pred = test_model.predict(X)
    print("Prediction on testing set:", y_pred,end='\n\n')
    return y_pred

model = train(X,y,100000)
test_X = pd.read_csv('testing_data.csv')

prediction = test(test_X,model)

test_X['predicted'] = prediction
test_X.to_csv('output.csv')

print("File output.csv generated")
