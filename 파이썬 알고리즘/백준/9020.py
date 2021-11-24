import sys


def prime_list(n):
    sieve = [True] * n

    m = int(n ** 0.5)
    for i in range(2, m + 1):
        if sieve[i] == True:
            for j in range(i+i, n, i):
                sieve[j] = False

    return [i for i in range(2, n) if sieve[i] == True]

T = int(sys.stdin.readline())

for _ in range(T):
  N = int(sys.stdin.readline()) # 목표 합
  num_list = prime_list(N)

  start, end = 0, len(num_list) - 1
  while start <= end:
    if num_list[start] + num_list[end] > N:
      end -= 1
    elif num_list[start] + num_list[end] < N:
      start += 1
    elif num_list[start] + num_list[end] == N:
      prime = ((num_list[start], num_list[end]))
      start += 1
      end -= 1
  print(prime[0], prime[1])
