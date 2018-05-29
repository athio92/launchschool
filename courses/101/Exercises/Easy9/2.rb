# Write a method that returns 2 times the number provided as an argument, unless the argument
# is a double number (number with an even number of digits whose left-side digits 
# are exactly the same as its right-side digits); double numbers should be returned as-is.

def twice(number)
  number_string = number.to_s
  length = number_string.length
  if length.even? && (number_string[0..length/2-1] == number_string[length/2..length])
    number
  else
    number * 2
  end
end

p twice(37) == 74
p twice(44) == 44
p twice(334433) == 668866
p twice(444) == 888
p twice(107) == 214
p twice(103103) == 103103
p twice(3333) == 3333
p twice(7676) == 7676
p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
p twice(5) == 10