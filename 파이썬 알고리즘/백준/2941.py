word = input()
text_list = ['c=', 'c-', 'dz=', 'd-', 'lj', 'nj', 's=', 'z=']
cnt = 0

for k, v in enumerate(text_list):
    if v in word:
        cnt += 1
        word = word.replace(v, " ") # 해당 문자열을 길이 1인 공백문자로 치환

print(len(word))
