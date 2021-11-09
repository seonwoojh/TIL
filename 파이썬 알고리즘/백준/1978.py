N = int(input())
num_list = [x for x in map(int, input().split()) if x != 1]
for i in num_list:
	 for j in range(2, num_list[-1] + 1):
		 if (i * j) in num_list:
			 num_list.remove(i * j)

print(num_list)
