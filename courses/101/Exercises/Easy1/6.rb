# Write a method that takes one argument, a string containing one or more words, and
# returns the given string with all five or more letter words reversed

def reverse_long_words(sentence)
  temp_array = []
  sentence.split.each do |word|
    word.length > 4 ? temp_array.push(word.reverse) : temp_array.push(word)
  end
  temp_array.join(" ")
end

puts reverse_long_words("I walk around the block ")
