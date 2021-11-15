while True:
  leg_list = list(map(int, input().split()))
  max_leg = max(leg_list)
  leg_list.remove(max_leg)

  if 0 in leg_list:
    break
  elif leg_list[0] ** 2 + leg_list[1] ** 2 == max_leg ** 2:
    print('right')
  else:
    print('wrong')
