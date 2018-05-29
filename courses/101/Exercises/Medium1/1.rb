# Write a method that rotates an array by moving the first element to the end of the array. 
# The original array should not be modified.

def rotate_array(arr)
  arr[1..-1].push(arr[0])
end

x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]   # => true
p x == [1, 2, 3, 4]                 # => true


