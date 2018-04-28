def plus_two(arr)
  arr2 = []
  arr.each do |e|
    arr2.push(e+2)
  end
  return arr2
end



arr = [1,2,3,4,5]
arr2 = plus_two(arr)

puts arr.to_s
puts arr2.to_s

