n = int(input())
cnt = 1
cnt_six = 6
count = 1

while n > cnt:
	count += 1
	cnt += cnt_six
	cnt_six += 6
print(count)
