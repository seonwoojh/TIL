num_list = []
for _ in range(9):
    A = int(input())
    num_list.append(A)

print(max(num_list))
print(num_list.index(max(num_list))+1)
