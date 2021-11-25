import math
import sys


def prime_list(n):
    sieve = [True] * n

    m = int(n ** 0.5)
    for i in range(2, m + 1):
        if sieve[i] == True:
            for j in range(i+i, n, i):
                sieve[j] = False


    return [i for i in range(2, n) if sieve[i] == True]


N = int(sys.stdin.readline())
div_list = prime_list(N)
result = []
div_N = N
while True:
  if N == 1:
    break
  elif N == 2 or N == 3:
    print(math.trunc(N))
    break
  for div in div_list:
    if div_N % div == 0:
      div_N /= div
      result.append(div)
    else:
      pass
  if div_N == 1:
    print(*sorted(result), sep = '\n')
    break
