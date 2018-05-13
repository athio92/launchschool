# Write a method that searches for all multiples of 3 or 5 that lie  
# between 1 and some other number, and then computes the sum of those multiples. 
def multisum(int)
  arr = []
  (1..int).each {|i| arr << i if (i % 3 == 0) || ( i % 5 == 0) }
  arr.sum
end

puts multisum(3)
puts multisum(5)
puts multisum(10)
puts multisum(1000)