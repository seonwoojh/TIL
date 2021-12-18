import sys

N = sys.stdin.readline().strip()

str_list = []
result = ''
for i in N:
    str_list.append(i)
    str_list.sort(reverse = True)

for s in str_list:
    result += s

print(result)
