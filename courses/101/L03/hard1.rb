# # Question 3 A
# def mess_with_vars1(one, two, three)
#   one = two
#   two = three
#   three = one

#   puts "one is: #{one}"  # "two"
#   puts "two is: #{two}" # "three"
#   puts "three is: #{three}" # "one"

# end

# one = "one"
# two = "two"
# three = "three"

# mess_with_vars1(one, two, three)

# puts "one is: #{one}"  # "two"
# puts "two is: #{two}" # "three"
# puts "three is: #{three}" # "one"


# # Question 3 B
# def mess_with_vars2(one, two, three)
#   one = "two"
#   two = "three"
#   three = "one"
#   puts "one is: #{one}"  # "two"
#   puts "two is: #{two}" # "three"
#   puts "three is: #{three}" # "one"
  
# end

# one = "one"
# two = "two"
# three = "three"

# mess_with_vars2(one, two, three)

# puts "one is: #{one}"  # "two"
# puts "two is: #{two}" # "three"
# puts "three is: #{three}" # "one"

#  Question 3 C
def mess_with_vars3(one, two, three)
  one.gsub!("one","two")
  two.gsub!("two","three")
  three.gsub!("three","one")
end

one = "one"
two = "two"
three = "three"

mess_with_vars3(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"