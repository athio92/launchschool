# Write method that multiplies two arrays of same length containing integers.
# multiply_list([a,b,c],[d,e,f]) = [ad, be, cf]

def multiply_list(arr1,arr2)
  return nil if arr1.empty? || arr2.empty?
  return nil if arr1.length != arr2.length
  result = []
  arr1.length.times do |i|
    result << (arr1[i]*arr2[i])
  end
  result
end

def multiply_list2(arr1,arr2)
  arr1.zip(arr2).map{ |a,b| a * b }
end

p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]
p multiply_list2([3, 5, 7], [9, 10, 11]) == [27, 50, 77]