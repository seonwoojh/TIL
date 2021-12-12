N, M = map(int, input().split())
board = []
result = []

for _ in range(N):
    board.append(input())
for row in range(N - 7):
    for col in range(M - 7):
        idx1 = 0
        idx2 = 0
        for i in range(row, row + 8):
            for j in range(col, col + 8):
                if (j + i) % 2 == 0:
                    if board[i][j] != 'W': idx1 += 1
                    if board[i][j] != 'B': idx2 += 1
                else:
                    if board[i][j] != 'B': idx1 += 1
                    if board[i][j] != 'W': idx2 += 1
        result.append(idx1)
        result.append(idx2)
print(min(result))
