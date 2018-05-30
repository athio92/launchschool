def sum_square_difference(n)
  square_of_sum = ((1..n).to_a.sum)**2
  sum_of_squares = (1..n).map{|i| i**2}.sum
  square_of_sum - sum_of_squares
end

p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150