puts "How old are you?"
age = gets.chomp.to_i

(10..40).step(10) do |i|
  puts "In #{i} years you will be #{i+age} years old."
end
