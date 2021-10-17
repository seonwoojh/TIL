num_set = set
for i in range(0,10):
	A = int(input())
	num_set.add((A % 42))
print(len(num_set))
