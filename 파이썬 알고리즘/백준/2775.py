import sys

T = int(sys.stdin.readline())



for _ in range(T):
	k = int(sys.stdin.readline())
	n = int(sys.stdin.readline())
	k_0 = [x for x in range(1, n+1)]
	for _ in range(k):
		for i in range(1, n):
			k_0[i] += k_0[i-1]
	print(k_0[-1])
