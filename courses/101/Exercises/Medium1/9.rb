# create function to calculate fibonacci number, but using procedural method

def fibonacci(n)
  return 0 if n == 0
  return 1 if n == 1
  n_min_two = 0
  n_min_one = 1
  current = 1
  (2..n).each do |i|
    current = n_min_one + n_min_two
    n_min_two = n_min_one
    n_min_one = current
  end
  current
end

p fibonacci(100001)