import sys

String = sys.stdin.readline().strip().split(" ")
String_list = []

for i in range(len(String)):
	if String[i] == '':
		pass
	else:
		String_list.append(String[i])

print(len(String_list))
