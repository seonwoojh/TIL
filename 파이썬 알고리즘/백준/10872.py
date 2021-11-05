N = int(input())

def Factorial(N: int) -> int:
	result = 1
	if N > 0:
		result = N * Factorial(N-1)
	
	return result

print(Factorial(N))
