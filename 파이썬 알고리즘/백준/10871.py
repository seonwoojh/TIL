N, x = map(int, input().split())
A = list(input().split())
for i in range(N):
	if int(A[i]) < x:
		print(A[i], end=" ")
