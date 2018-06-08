arr = [-5, 1, -3, 2,-8, 20, -3, 10, -13, 6, -99, 1200]
accumulator = 0
arr2 = arr.map do |i|
  accumulator += i
  accumulator
end

p arr2