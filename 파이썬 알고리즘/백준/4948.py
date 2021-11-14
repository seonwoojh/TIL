import math
import sys

def isPrime(num):
  if num == 1:
    return False

  n = int(math.sqrt(num))
  for i in range(2, n+1):
    if num % i == 0:
      return False
  return True


while True:
  N = int(sys.stdin.readline())
  num_list = []
  if N == 0:
    break
  for i in range(N + 1, ((2*N)) + 1):
    if isPrime(i):
      num_list.append(i)
  print(len(num_list))
