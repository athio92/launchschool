# Write a method that takes an Array as an argument, and reverses its elements in place
# The return value should be a NEW Array object

def reverse(arr)
  arr.map.with_index {|_, i| arr[(i+1)*-1]}
end

list = [1, 2, 3]                      # => [1, 2, 3]
new_list = reverse(list)              # => [3, 2, 1]
p list.object_id != new_list.object_id  # => true
p list == [1, 2, 3]                     # => true
p new_list == [3, 2, 1]                 # => true