# Transpose a 3x3 matrix.

matrix = [
  [1, 5, 8],
  [4, 7 ,2],
  [3, 9, 6]
]

def transpose(matrix)
  result = []
  n = matrix.length
  for i in 0..n-1
    temp_arr = []
    for j in 0..n-1
      temp_arr << matrix[j][i]
    end
    result << temp_arr
  end
  result
end

new_matrix = transpose(matrix)

p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]