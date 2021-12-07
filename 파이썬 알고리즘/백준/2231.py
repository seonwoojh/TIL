# 자연수 N이 주어졌을 때, N의 가장 작은 생성자를 구해내는 프로그램을 작성하시오.
# 분해합 예시 : 256(=245+2+4+5) 일때 245는 256의 생성자
N = int(input())
result = set()

for i in range(1, N+1):
    num = sum(map(int, str(i)))
    if i + num == N:
        result.add(i)
    else:
        pass

if len(result) == 0:
    print(0)
else:
    print(min(result))
