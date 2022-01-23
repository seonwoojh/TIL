import sys

N = int(sys.stdin.readline())
code_list = list(map(int, sys.stdin.readline().split()))

arr1 = sorted(set(code_list))

result = {arr1[i]: i for i in range(len(arr1))}

for i in code_list:
    print(result[i], end = " ")
