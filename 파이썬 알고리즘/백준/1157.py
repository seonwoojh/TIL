text = input().upper()
text_list = list(set(text))

cnt_list = []
for x in text_list:
	cnt_list.append((text.count(x)))

	
if cnt_list.count(max(cnt_list)) == 1:
	print(text_list[cnt_list.index(max(cnt_list))])

else:
	print("?")
