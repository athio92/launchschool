def factorial(num)
  if num < 0
    puts "number should be positive"
    exit
  end

  if num == 0 || num == 1 
    return 1
  else
    return num * factorial(num-1)
  end
end

puts factorial 5
puts factorial 6
puts factorial 7
puts factorial 8
