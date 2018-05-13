# Letter Counter (Part 1)
# Write a method that takes a string with one or more space 
# separated words and returns a hash that shows the number of 
# words of different sizes.

def word_sizes(words)
  result_hash = Hash.new(0)
  words.split.each {|word| result_hash[word.length] += 1 }
  result_hash
end

puts word_sizes('Four score and seven.')
puts word_sizes('Hey diddle diddle, the cat and the fiddle!')
puts word_sizes("What's up doc?")
puts word_sizes('')
