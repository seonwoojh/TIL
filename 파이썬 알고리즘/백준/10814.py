import sys

N = int(sys.stdin.readline())

word_list = []
for _ in range(N):
    num, name = sys.stdin.readline().split()
    word_list.append((int(num), name))

result = sorted(word_list, key = lambda x: x[0])

for i in range(N):
    print(result[i][0], result[i][1])
