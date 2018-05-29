# Write a method that takes an Array of numbers and then returns
# the sum of the sums of each leading subsequence for that Array.
# Assume the Array always contains at least one number

def sum_of_sums(arr)
  array_copy = arr.dup
  result = 0
  while !array_copy.empty?
    result += array_copy.sum
    array_copy.pop
  end
  result
end

p sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2)
p sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3)
p sum_of_sums([4]) == 4
p sum_of_sums([1, 2, 3, 4, 5]) == 35