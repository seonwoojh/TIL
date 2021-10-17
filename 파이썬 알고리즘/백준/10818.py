N = int(input())
A = list(map(int, input().split()))
A.sort()
print(A[0], A[-1], sep=" ")
