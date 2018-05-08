def sum_to_int(int)
  sum = 0
  (1..int).each {|i| sum += i}
  sum
end

def recursive_factorial(int)
  if int == 0 || int == 1
    return 1
  else
    return int * recursive_factorial(int-1)
  end
end

puts ">> Please enter an integer greater than 0:"
int = gets.chomp.to_i
puts ">> Enter 's' to compute the sum, 'p' to compute the product."
option = gets.chomp

if option == "s"
  puts "The sum of integers between 1 and #{int} is #{sum_to_int(int)}"
elsif option == "p"
  puts "The product of integers between 1 and #{int} is #{recursive_factorial(int)}"
else
  puts "invalid option"
end
