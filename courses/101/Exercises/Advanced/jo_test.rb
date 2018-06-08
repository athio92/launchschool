# Array of integers (ex: [1, 2, 1, 3, 2, 0, 5, 1])
# output = print out all pairs of number that gives sum = 3

# Method: return [index1, index2] of pair that sums to target. Returns nil otherwise.
def find_pair_indexes_which_sums_to(arr, sum_target)
  arr_last_index = arr.length - 1
  arr.each_with_index do |v_outer, i_outer|
    break if i_outer == arr_last_index
    remaining_arr = arr[i_outer+1..arr_last_index]
    remaining_arr.each_with_index do |v_inner, i_inner|
      sum = v_outer + v_inner
      if sum == sum_target
        return [i_outer, (i_outer + i_inner + 1)] 
      end
    end
  end
  nil
end


# Method: return pairs of numbers that sums to target. Each number can be used only once.
def find_unique_pairs_which_sums_to(arr, sum_target)
  arr = arr.dup
  result = []

  loop do
    index1, index2 = find_pair_indexes_which_sums_to(arr, sum_target)
    break if index1 == nil || index2 == nil
    result << [arr[index1], arr[index2]]
    arr.delete_at(index1)
    arr.delete_at(index2 - 1) # need -1 since previous line deletes lower index
  end
  result
end

arr = [3, 5, 1, 3, 2, 7, 5, 1,0,3,2,1]
num = 3

p find_unique_pairs_which_sums_to(arr,num)