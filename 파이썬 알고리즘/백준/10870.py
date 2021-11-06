# Fn = Fn-1 + Fn-2 (n ≥ 2)

n = int(input())

Fibonacci_list = [0,1]

def Fibonacci(n: int) -> int:
	if n == 0:
		del(Fibonacci_list[-1])
		
	elif len(Fibonacci_list) <= n:
		Fibonacci_list.append(Fibonacci_list[-2] + Fibonacci_list[-1])
		Fibonacci(n)

	return Fibonacci_list

print(Fibonacci(n)[-1])
