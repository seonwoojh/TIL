word = input()
text_list = ['c=', 'c-', 'dz=', 'd-', 'lj', 'nj', 's=', 'z=']

for k, v in enumerate(text_list):
    if v in word:
        word = word.replace(v, " ") # 해당 문자를 길이가 1인 공백문자로 치환

print(len(word))
