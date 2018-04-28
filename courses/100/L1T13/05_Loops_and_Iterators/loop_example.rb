i = 0

loop do
  i += 1
  next if (i == 2 || i == 3)
  puts i
  break if i >= 10
end
