N, M = map(int, input().split())
visited = [False] * N  # 탐사여부 체크
out = [] # 출력 내용

def Solve(depth, N, M):
    if depth == M:  # 탈출 조건
        print(' '.join(map(str, out))) # 리스트를 str으로 합쳐 출력하기
        return
    for i in range(len(visited)):   # 탐사 check
        if not visited[i]:  # 탐사 x
            visited[i] = True   # 탐사 시작 (중복 제거)
            out.append(i + 1) # 탐사 내용
            Solve(depth + 1, N, M) # DFS
            visited[i] = False  # 깊이 탐사 완료
            out.pop()   # 탐사 내용 제거


Solve(0,N,M)
