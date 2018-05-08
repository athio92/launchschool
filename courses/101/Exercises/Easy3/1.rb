# Write a program that solicits 6 numbers from the user, then prints a message that describes 
# whether or not the 6th number appears amongst the first 5 numbers.

arr = []

(1..5).each do |i|
  puts "==> Enter number #{i}"
  arr << gets.chomp.to_i
end
puts "==> Enter last number"
last_num = gets.chomp.to_i

puts "The number #{last_num} #{arr.include?(last_num) ? "appears" : "does not appear"} in #{arr}"
