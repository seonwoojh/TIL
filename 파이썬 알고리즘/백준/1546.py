N = int(input())
score = list(map(int, input().split()))
M = max(score)
new_score = []
for i in range(N):
	new_score.append((score[i] / M) * 100)

print(sum(new_score) / N)
