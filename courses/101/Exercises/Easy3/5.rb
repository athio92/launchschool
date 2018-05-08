def multiply(x,y)
  x * y
end

def power_of_n(x,n)
  raise ArgumentError, "Only positive power accepted" if n < 0
  n == 0 ? 1 : multiply(x,power_of_n(x,n-1))
end

p power_of_n(9,2)
p power_of_n(2,8)
p power_of_n(3,3)