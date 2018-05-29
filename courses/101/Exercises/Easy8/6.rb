# Write a method that takes two arguments: the first is the starting number, and 
# the second is the ending number. Print out all numbers between the two numbers, 
# except if a number is divisible by 3, print "Fizz", if a number is divisible by 5,
# print "Buzz", and finally if a number is divisible by 3 and 5, print "FizzBuzz".

def fizzbuz(start_i, end_i)
  result = []
  (start_i..end_i).each do |i|
    if i % 15 == 0
      result << "FizzBuzz"
    elsif i % 5 == 0
      result << "Buzz"
    elsif i % 3 == 0
      result << "Fizz"
    else
      result << i
    end
  end
  puts result.join(", ")
end

fizzbuz(1, 15)