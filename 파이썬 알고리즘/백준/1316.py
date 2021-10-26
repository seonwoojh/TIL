N = int(input())
cnt = 0

for _ in range(N):
    text = input()
    new_list = []
    n = ''
    for v in text:
        if v not in new_list:
            new_list.append(v)
    for i in range(len(new_list)):
        n += new_list[i] * text.count(new_list[i])
    if n == text:
        cnt +=1

print(cnt)
