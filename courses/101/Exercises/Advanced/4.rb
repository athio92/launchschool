# In the previous exercise, you wrote a method to transpose a 3 x 3 matrix as represented
# by a ruby Array of Arrays. Matrix transposes aren't limited to 3 x 3 matrices, 
# or even square matrices. Any matrix can be transposed by simply switching columns
# with rows.

# Modify your transpose method from the previous exercise so it works with any 
# matrix with at least 1 row and 1 column.


def transpose(matrix)
  result = []
  r = matrix.length  #r = row
  c = matrix[0].length #c = column
  for i in 0..c-1
    temp_arr = []
    for j in 0..r-1
      temp_arr << matrix[j][i]
    end
    result << temp_arr
  end
  result
end


p transpose([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
p transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
p transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) ==
  [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
p transpose([[1]]) == [[1]]