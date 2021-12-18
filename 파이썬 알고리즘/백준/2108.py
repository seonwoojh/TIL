'''
N은 홀수
1. 산술평균 첫재짜리 반올림
2. 중앙값
3.최빈값 여러개일경우 두번째로 작은값
4.범위(최대 - 최소)
'''

import sys
from collections import Counter
from typing import List


N = int(sys.stdin.readline())
num_list = []
for _ in range(N):
    num_list.append(int(sys.stdin.readline()))

# 퀵정렬 이용
def quick_sort(arr):
    if len(arr) <= 1:
        return arr
    pivot = arr[len(arr) // 2]
    lesser_arr, equal_arr, greater_arr = [], [], []
    for num in arr:
        if num < pivot:
            lesser_arr.append(num)
        elif num > pivot:
            greater_arr.append(num)
        else:
            equal_arr.append(num)
    return quick_sort(lesser_arr) + equal_arr + quick_sort(greater_arr)



def stat(list: List):
    mean = round(sum(list) / len(list),0) # 산술평균

    if len(list) == 1:
        median = list[0] # 중앙값
    else:
        idx = int((len(list) + 1) / 2)
        median = list[idx - 1]



    cnt = Counter(list).most_common(2)
    if len(list) > 1:
        if cnt[0][1] == cnt[1][1]:
            mod = cnt[1][0]
        else:
            mod = cnt[0][0]
    else:
        mod = cnt[0][0]
    rng = max(list) - min(list)
    return int(mean), int(median), int(mod), int(rng)

result = quick_sort(num_list)
print(*stat(result), sep='\n')
