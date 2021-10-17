A = int(input())
B = int(input())
C = int(input())
cnt = range(0,10)

number = str(A*B*C)
num_list = []

for i in range(len(number)):
	num_list.append(number[i])
for j in cnt:
	print(num_list.count(str(cnt[j])))
