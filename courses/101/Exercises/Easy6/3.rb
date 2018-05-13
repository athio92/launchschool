# def fibonacci_quick(n)
#   return 0 if n <= 0
#   return 1 if [1, 2].include?(n)
#   # Fast Doubling Algorithm:
#   if n.even?
#     k = n/2
#     return fibonacci_quick(k) * ( 2 * fibonacci_quick(k + 1) - fibonacci_quick(k) )
#   else
#     k = (n - 1)/2
#     return fibonacci_quick(k+1)**2 + fibonacci_quick(k)**2
#   end
# end

def find_fibonacci_index_by_length(target_length)
  first = 1
  second = 1
  index = 2

  loop do
    index += 1
    fibonacci = first + second
    break if fibonacci.to_s.size >= target_length
    first = second
    second = fibonacci
  end
  index
end

puts find_fibonacci_index_by_length(2)
puts find_fibonacci_index_by_length(10)
puts find_fibonacci_index_by_length(100)
puts find_fibonacci_index_by_length(1000)
puts find_fibonacci_index_by_length(10000)