# Print all odd numbers from 1 to 99 inclusive

(1..99).each do |i|
  puts i unless i%2 == 0
end
