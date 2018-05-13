# Problem 1
flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
hash_problem1 = {}
flintstones.each_with_index {|item, index| hash_problem1[item] = index}
p hash_problem1

# Problem 2: Add up all the ages
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
sum_of_ages = ages.values.sum
p sum_of_ages

# Problem 3: Throw out people age 100 or older
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
ages.delete_if { |_, value| value >= 100 }
p ages

# Problem 4: pick out the minimum age from Hash
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
p ages.values.min

# Problem 5: find index of the first name that starts with "Be"
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
i = flintstones.index { |name| name.start_with?("Be") }
p i

# Problem 6: Amend this array so that the names are all shortened to just the first three characters
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.map! { |name| name[0..2] }
p flintstones

# Problem 7: Create a hash that expresses the frequency with which each letter occurs in a string
statement = "The Flintstones Rock"
hash_problem7 = Hash.new(0)
statement.chars.each {|c| hash_problem7[c] +=1}
p hash_problem7

# Problem 9: capitalize long string of words separated by space
words = "the flintstones rock"
def titleize(sentence)
  sentence.split.map(&:capitalize).join(" ")
end
p titleize(words)


# Problem 10: Modify the hash such that each member of the Munster family 
# has an additional "age_group" key (kid = 0-17, adult = 18-64, senior = 65+)
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"},
  "Monster" => { "age" => -9, "gender" => "female"}
}

munsters.each do |_, inner_hash|
  age_group_category =
    case inner_hash["age"]
    when (0..17) then "kid"
    when (18..64) then "adult"
    else
      age_number >= 65 ? "senior" : "mystery"
    end
  inner_hash["age_group"] = age_group_category
end

p munsters
