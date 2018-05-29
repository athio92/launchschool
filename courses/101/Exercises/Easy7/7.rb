def show_multiplicative_average(arr)
  arr.reduce(:*)/(arr.length.to_f)
end
p show_multiplicative_average([3, 5])
p show_multiplicative_average([6])
p show_multiplicative_average([2, 5, 7, 11, 13, 17])