import math


M, N = map(int, input().split())

def isPrime(num):
  if num == 1:
    return False

  n = int(math.sqrt(num))
  for i in range(2, n+1):
    if num % i == 0:
      return False
  return True

for j in range(M, N+1):
  if isPrime(j):
    print(j)
