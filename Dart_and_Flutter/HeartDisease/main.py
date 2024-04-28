from model import predict, gradient_descent, compute_cost_reg, compute_gradient_reg
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import collections

columns=pd.read_csv('heart_disease_data.csv')
y=np.array(columns['target'])
X=np.array(columns.drop(['target'],axis = 1))

# data_y=collections.Counter(y)
# label=[0,1]
# plt.pie([data_y[0]/sum(data_y.values()),data_y[1]/sum(data_y.values())],labels=label)
# plt.show()

def train(X,y,iter=10000):
    print("Training Model:")
    np.random.seed(1)
    initial_w = np.random.rand(X.shape[1]) - 0.5
    initial_b = 0.5
    lambda_ = 0.01
    iterations = iter
    alpha = 0.0001

    w,b = gradient_descent(X ,y, initial_w, initial_b, 
                                    compute_cost_reg, compute_gradient_reg, alpha, iterations, lambda_)

    p = predict(X, w,b)
    print('\nTrain Accuracy: %f'%(np.mean(p == y) * 100))
    return w,b

def test(X,w,b):
    p = predict(X,w,b)
    print("\nPrediction on testing set:", p,end='\n\n')
    return p

w,b=train(X,y,10000)

test_columns = pd.read_csv('testing_data.csv')
test_X = np.array(test_columns.values)

prediction = test(test_X,w,b)

test_columns['predicted'] = prediction
test_columns.to_csv('output.csv',index=False)

print("File output.csv generated")
