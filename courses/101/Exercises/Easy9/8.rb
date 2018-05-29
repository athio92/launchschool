# Create a method that takes two integers as arguments. The first argument is a count, and 
# the second is the first number of a sequence that your method will create. 
# The method should return an Array that contains the same number of elements 
# as the count argument, while the values of each element will be multiples of the starting number.

def sequence(count,start)
  (1..count).map{ |i| start*i}
end



p sequence(5, 1) == [1, 2, 3, 4, 5]
p sequence(4, -7) == [-7, -14, -21, -28]
p sequence(3, 0) == [0, 0, 0]
p sequence(0, 1000000) == []