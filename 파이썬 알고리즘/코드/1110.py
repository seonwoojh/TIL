# 백준 더하기 사이클

N = int(input())
number = N
count = 0

while True:
	n = (number // 10 ) + (number % 10)
	number = (number % 10) * 10 + (n % 10)
	count += 1
	if N == number:
		break
print(count)
