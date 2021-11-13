# 2부터 X-1까지 모두 나눠서 X가 소수인지 판별하는 문제 2

M = int(input())
N = int(input())

num_list = [x for x in range(M, N+1) if x != 1]
result = []
for i in num_list:
  for j in range(2, i):
    if i % j == 0:
      result.append(i)
      break
    else:
      continue

for i in result:
  if i in num_list:
    num_list.remove(i)

if len(num_list) == 0:
   print(-1)
else:
   print(sum(num_list))
   print(min(num_list))
