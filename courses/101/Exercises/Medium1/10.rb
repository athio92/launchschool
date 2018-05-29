def fibonacci_last(n)
  return 0 if n == 0
  return 1 if n == 1
  n_min_two = 0
  n_min_one = 1
  current = 1
  n %= 60 # fibonacci's last number cycles every 60 n
  (2..n).each do |i|
    current = (n_min_one + n_min_two) % 10
    n_min_two = n_min_one
    n_min_one = current
  end
  current
end


p fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
p fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
p fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
p fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
p fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
p fibonacci_last(123456789) # -> 4
p fibonacci_last(123456789987745) #-> 5