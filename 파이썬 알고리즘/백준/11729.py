N = int(input())

def hanoi(N, a, b, c):
	if N == 1:
		print(a,c)
	else:
		hanoi(N-1, a, c, b)
		print(a, c)
		hanoi(N-1, b, a, c)
cnt = 1
for _ in range(N-1):
	cnt = cnt * 2 + 1
print(cnt)
hanoi(N,1,2,3)
