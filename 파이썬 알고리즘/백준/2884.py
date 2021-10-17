H, M = map(int, input().split())
time = 45

if M >= time:
    print(H, M-time)
elif (M < time) and (H > 0):
    print(H-1, M+15)
else:
    print(23, M+15)
