word = input()

dial = {'ABC': 3, 'DEF': 4, 'GHI': 5, 'JKL': 6, 'MNO': 7, 'PQRS': 8, 'TUV': 9, 'WXYZ': 10}
time = 0

for key, value in dial.items():
   for i in range(len(word)):
      if word[i] in key:
        time += value

print(time)
