puts "Enter 4 digit number:"
num = gets.chomp.to_i

puts "Thousands = #{num / 1000}"
puts "Hundreds = #{num % 1000 / 100}"
puts "Tens = #{num % 100 / 10}"
puts "Ones = #{num % 10}"

