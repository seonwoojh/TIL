year = int(input())

# 4의 배수 and 100배수가 아닐때, 400의 배수
if ((year % 4 == 0) and (year % 100 != 0)) or (year % 400 == 0):
    print(1)
else:
    print(0)
