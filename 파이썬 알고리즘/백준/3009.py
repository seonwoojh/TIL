X = []
Y = []

for _ in range(3):
 x, y = map(int, input().split())
 X.append(x); Y.append(y)

for i in range(len(X)):
  if X.count(X[i]) == 1:
    result_x = X[i]
  elif Y.count(Y[i]) == 1:
    result_y = Y[i]

print(result_x, result_y)
