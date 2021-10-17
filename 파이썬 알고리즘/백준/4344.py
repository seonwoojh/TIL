N = int(input())

for _ in range(N):
	score_list = list(map(int, input().split()))
	avg = sum(score_list[1:]) / score_list[0]
	cnt = 0
	for i in score_list[1:]:
		if i > avg:
			cnt += 1
	rate = cnt / score_list[0] * 100
	print(f'{rate:.3f}%')
