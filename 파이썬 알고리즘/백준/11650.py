import sys

N = int(sys.stdin.readline())
loc_list = []
for _ in range(N):
    x, y = map(int, sys.stdin.readline().split())
    loc_list.append((x, y))
loc_list = sorted(loc_list)

for i in range(N):
    print(loc_list[i][0], loc_list[i][1])
