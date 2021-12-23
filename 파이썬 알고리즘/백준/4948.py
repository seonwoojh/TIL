N = 123456 * 2 + 1
sieve = [True] * N
for i in range(2, int(N**0.5)+1):
    if sieve[i]:
        for j in range(2*i, N, i):
            sieve[j] = False

def prime_cnt(val):
    cnt = 0
    for i in range(val + 1, val * 2 + 1):
        if sieve[i]:
            cnt += 1
    print(cnt)

while True:
    val = int(input())
    if val == 0:
        break
    prime_cnt(val)
