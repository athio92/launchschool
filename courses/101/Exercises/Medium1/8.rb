# Create function to calculate nth fibonnaci number using recursion

def fibonacci(n)
  return 0 if n == 0
  return 1 if [1, 2].include?(n)
  fibonacci(n-1) + fibonacci(n-2)
end

p fibonacci(1) == 1
p fibonacci(2) == 1
p fibonacci(3) == 2
p fibonacci(4) == 3
p fibonacci(5) == 5
p fibonacci(12) == 144
p fibonacci(20) == 6765