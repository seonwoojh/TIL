A, B = input().split()

A = int(''.join(reversed(A)))
B = int(''.join(reversed(B)))

if A > B:
	print(A)
else:
	print(B)

# 숏코딩 [::-1] 활용
print(max(input()[::-1].split()))
