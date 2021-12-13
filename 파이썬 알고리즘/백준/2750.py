# i번째, i+1번째 서로 마주한 숫자끼리 먼저 정렬한다. 이후 인덱스를 하나씩 증가시켜 맨 마지막에 큰수가 가게되면
# 맨 마지막의 수를 제외한 나머지 수를 정렬한다.

N = int(input())
num_list = []
for _ in range(N):
    num_list.append(int(input()))

def bubble_sort(list):
    for i in range(len(list) - 1, 0, -1):
        for j in range(i):
            if list[j] > list[j + 1]:
                list[j], list[j + 1] = list[j + 1], list[j]
    return list


print(*bubble_sort(num_list), sep='\n')
