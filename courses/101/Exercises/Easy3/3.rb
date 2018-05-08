print "Please write word or multiple words: "
str = gets.chomp
puts "There are #{str.delete(' ').length} characters in #{str}"
