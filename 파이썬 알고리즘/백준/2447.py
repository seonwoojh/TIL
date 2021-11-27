import sys

sys.setrecursionlimit(10 ** 6)

def draw_star(n):
    if n == 1:
        return['*']

    Stars = draw_star(n // 3)
    Stars_map = []

    for S in Stars:
        Stars_map.append(S * 3)
    for S in Stars:
        Stars_map.append(S + ' ' * (n // 3) + S)
    for S in Stars:
        Stars_map.append(S*3)

    return Stars_map

N = int(sys.stdin.readline())
print('\n'.join(draw_star(N)))
