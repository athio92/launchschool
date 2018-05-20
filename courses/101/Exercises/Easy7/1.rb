# Combines two Arrays passed in as arguments, and returns a new Array that contains
# all elements from both Array arguments, with the elements taken in alternation.
# You may assume that both input Arrays are non-empty & have the same number of elements.

def interleave(arr1,arr2)
  return nil if arr1.length != arr2.length
  return nil if arr1.empty? || arr2.empty?
  result = []
  arr1.length.times do |i|
    result << arr1[i] << arr2[i]
  end
  result
end

def interleave2(arr1,arr2)
  arr1.zip(arr2).flatten
end

p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']
p interleave2([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']