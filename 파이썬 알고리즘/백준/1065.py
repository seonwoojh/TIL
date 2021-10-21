N = int(input())
numbers = list(range(1, N + 1))
hansu_cnt = 0

for i in range(len(numbers)):
	num = str(numbers[i])
	if len(num) <= 2:
		hansu_cnt += 1
	else:
		if (int(num[0]) - int(num[1])) == (int(num[1]) - int(num[-1])):
			hansu_cnt +=1

print(hansu_cnt)
