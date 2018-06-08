# Write a method that takes two sorted Arrays as arguments, and returns a new Array 
# that contains all elements from both arguments in sorted order.
# You may not provide any solution that requires you to sort the result array.
# You must build the result array one element at a time in the proper order.
def merge(arr1, arr2)
  arr1 = arr1.dup
  arr2 = arr2.dup  # duplicate to prevent mutation of original array
  result = []
  until arr1.empty? && arr2.empty?
    if arr1.empty?
      result << arr2.shift
    elsif arr2.empty?
      result << arr1.shift
    else
      if arr1[0] <arr2[0]
        result << arr1.shift
      else
        result << arr2.shift
      end
    end
  end
  result
end

p merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
p merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
p merge([], [1, 4, 5]) == [1, 4, 5]
p merge([1, 4, 5], []) == [1, 4, 5]