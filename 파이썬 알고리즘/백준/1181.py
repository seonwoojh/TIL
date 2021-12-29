N = int(input())
word_list = set()

for _ in range(N):
    word_list.add(input())


result = sorted(word_list, key = lambda x : (len(x), x))

print(*result, sep = '\n')
