# 1. x와 y가 모두 크면 크다.
# 2. X와 Y가 하나는 크고 하나는 작다면 비교 불가
# 3. 순위는 본인보다 덩치가 큰사람 명수 + 1

N = int(input())
num_list = []
for _ in range(N):
    x, y = map(int, input().split())
    num_list.append((x, y))

for i in num_list:
    result = 1
    for j in num_list:
        if i[0] < j[0] and i[1] < j[1]:
            result += 1
    print(result, end = " ")
