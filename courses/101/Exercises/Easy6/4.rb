# Write a method that takes an Array as an argument, and reverses its elements in place
# The return value should be the same Array object

def reverse!(arr)
  (arr.length/2).times do |index|
    reverse_index = (index + 1) * -1
    arr[index], arr[reverse_index] = arr[reverse_index], arr[index]
  end
  arr
end

list = [1,2,3,4]
result = reverse!(list) # => [4,3,2,1]
p list == [4, 3, 2, 1]
p list.object_id == result.object_id

list = %w(a b c d e)
reverse!(list) # => ["e", "d", "c", "b", "a"]
p list == ["e", "d", "c", "b", "a"]

list = ['abc']
reverse!(list) # => ["abc"]
p list == ["abc"]

list = []
reverse!(list) # => []
p list == []