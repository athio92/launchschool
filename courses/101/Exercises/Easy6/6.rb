# Write a method that takes two Arrays as arguments, and returns an Array that
# contains all of the UNIQUE values (no duplicate) from the argument Arrays

def merge(arr1, arr2)
  result = []
  arr1.each {|i| result << i if !result.include?(i)}
  arr2.each {|i| result << i if !result.include?(i)}
  result
end

p merge([1, 3, 5], [3, 6, 9])

