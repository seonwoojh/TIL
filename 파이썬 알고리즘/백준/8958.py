N = int(input())
for i in range(N):
    OX_str = input()
    OX_list = list(OX_str)
    sum = 0
    cnt = 1
    for j in OX_list:
        if j == 'O':
            sum += cnt
            cnt += 1
        else:
            cnt = 1
    print(sum)
