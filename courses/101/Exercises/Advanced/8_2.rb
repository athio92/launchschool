# Repeat exercise 8, but do so non-recursively

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

def merge_sort(arr) 
  # non-recursive version

  
end

p merge_sort([9, 5, 7, 1]) == [1, 5, 7, 9]
p merge_sort([5, 3]) == [3, 5]
p merge_sort([6, 2, 7, 1, 4]) == [1, 2, 4, 6, 7]
p merge_sort(%w(Sue Pete Alice Tyler Rachel Kim Bonnie)) == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
p merge_sort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]) == [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]


p merge_sort([9, 5, 8, 1])