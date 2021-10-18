numbers = list(range(1,10001))
non_self_num = []
for num in numbers:
	for i in str(num):
		num += int(i)
	if num <= 10000:
		non_self_num.append(num)
for remove_num in set(non_self_num):
	numbers.remove(remove_num)
for self_num in numbers:
	print(self_num)
