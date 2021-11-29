# 첫째 줄에 M을 넘지 않으면서 M에 최대한 가까운 카드 3장의 합을 출력한다.
import sys
from itertools import combinations

N, M = map(int, sys.stdin.readline().split())
card_list = sorted([x for x in map(int, sys.stdin.readline().split())])

com_list = list(combinations(card_list, 3))
result = set()
for i in range(len(com_list)):
    if sum(com_list[i]) <= M:
        result.add(sum(com_list[i]))

print(max(result))
