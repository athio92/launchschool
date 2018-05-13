# Write a method that takes an Array of Integers between 0 and 19, 
# and returns an Array of those Integers sorted based on the 
# English words for each number

NUMBER_WORDS =
  %w(zero one two three four
     five six seven eight nine
     ten eleven twelve thirteen fourteen
     fifteen sixteen seventeen eighteen nineteen
)

def alphabetic_number_sort(numbers)
  numbers.sort_by {|number| NUMBER_WORDS[number]}
end

def alphabetic_number_sort2(numbers)
  numbers.sort { |x, y| NUMBER_WORDS[x] <=> NUMBER_WORDS[y]}
end

puts alphabetic_number_sort((0..19).to_a) == alphabetic_number_sort2((0..19).to_a)
