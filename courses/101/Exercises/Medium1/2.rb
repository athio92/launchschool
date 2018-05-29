# Write a method that can rotate the last n digits of a number.

def rotate_array(arr)
  arr[1..-1].push(arr[0])
end

def rotate_rightmost_digits(number, digits)
  number_string = number.to_s.chars
  number_string[-digits..-1] = rotate_array(number_string[-digits..-1])
  number_string.join.to_i
end

p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917