# Write a method that takes an Array of numbers, 
# and returns an Array with the same number of elements, 
# and each element has the running total from the original Array.

def running_total1(original_arr)
  # return as-is if array is empty or only composed of 1 member
  return original_arr if original_arr.length <=1 
  # original_arr has more than 1 member, do logic
  result_arr = []
  original_arr.each_with_index do |x, i|
    i == 0 ? (result_arr << x) : (result_arr << x + result_arr[i-1])
  end
  result_arr
end

def running_total2(array)
  sum = 0
  array.map { |value| sum += value }
end

p running_total1([2, 5, 13])
p running_total1([14, 11, 7, 15, 20])
p running_total2([3])
p running_total2([])