# Convert number (positive number or zero) to string
DIGITS = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']

def integer_to_string(int)
  return "0" if int == 0
  arr = []
  while int % 10 != 0
    arr.unshift(DIGITS[int % 10])
    int /= 10
  end
  arr.join
end

puts integer_to_string(12345)
puts integer_to_string(0)