N = int(input())
num_list = [x for x in map(int, input().split()) if x != 1]
for i in range(2,1001):
    for j in range(2, 1001):
       if (i * j) in num_list:
          num_list.remove(i * j)

print(len(num_list))
