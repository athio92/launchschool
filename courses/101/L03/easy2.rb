# Question 1
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
puts ages.include?("Spot")
puts ages.key?("Spot")
puts ages.member?("Spot")

# Question 2
munsters_description = "The Munsters are creepy in a good way."
puts munsters_description.capitalize!
puts munsters_description.swapcase!
puts munsters_description.downcase!
puts munsters_description.upcase!

# Question 3
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }
additional_ages = { "Marilyn" => 22, "Spot" => 237 }
puts ages.merge!(additional_ages)

# Question 4
advice = "Few things in life are as important as house training your pet dinosaur."
advice.match("Dino")

# Question 5 -7
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.push("Dino", "Hoppy")
p flintstones

# Question 8
advice = "Few things in life are as important as house training your pet dinosaur."
return_value = advice.slice!(0, advice.index("house"))
puts return_value

# Question 9
statement = "The Flintstones Rock!"
puts statement.count('t')

# Question 10
title = "Flintstone Family Members"
centered_title = title.center(40)
puts centered_title
