# Find maximum rotation result https://launchschool.com/exercises/db673773

def rotate_array(arr)
  return arr if arr.length <= 1
  arr[1..-1].push(arr[0])
end

def rotate_rightmost_digits(number, digits)
  return number if digits <= 0
  number_string = number.to_s.chars
  number_string[-digits..-1] = rotate_array(number_string[-digits..-1])
  number_string.join.to_i
end

def max_rotation(int)
  length = int.to_s.length
  length.downto(1){ |i| int = rotate_rightmost_digits(int, i) }
  int
end

p max_rotation(735291)
p max_rotation(3)
p max_rotation(35)
p max_rotation(105)
p max_rotation(8_703_529_146)