CURRENT_YEAR = Time.now.year

print "What is your age? "
current_age = gets.to_i
print "At what age would you like to retire? "
retirement_age = gets.to_i

difference = retirement_age - current_age

puts("")
puts "It's #{CURRENT_YEAR}. You will retire in #{CURRENT_YEAR + difference}."
puts "You have only #{difference} years of work to go!"
