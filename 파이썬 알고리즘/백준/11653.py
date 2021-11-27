import math
import sys


# 소수를 신경쓰지 않고 iterator를 2부터 sqrt(N) 까지 증가시키며 나누어 떨어지는 경우에 출력하고 N은 몫으로 감소시킨다.

N = int(sys.stdin.readline())
M = math.ceil(math.sqrt(N))
i = 2

while True:
    if N == 1:
        break
    if N % i == 0:
        print(i)
        N /= i
    elif N % i != 0:
        i += 1
        pass
