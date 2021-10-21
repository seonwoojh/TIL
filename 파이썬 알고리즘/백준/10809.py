import sys

S = sys.stdin.readline()

alphabet = []
find_string = []

for x in range(97,123):
	alphabet.append(chr(x))

for i in range(len(alphabet)):
	if alphabet[i] in S:
		find_string.append(S.index(alphabet[i]))
	else:
		find_string.append(-1)

print(*find_string)
