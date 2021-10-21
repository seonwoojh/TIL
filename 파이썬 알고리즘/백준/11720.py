import sys

N = int(input())
n = sys.stdin.readline()

list = []
for i in range(len(n)-1):
	list.append(int(n[i]))

print(sum(list))
