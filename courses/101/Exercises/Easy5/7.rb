# Letter Counter (Part 2)
# Modify the word_sizes method from the previous exercise to exclude non-letters when determining word size.
# For instance, the length of "it's" is 3, not 4

def word_sizes(words)
  result_hash = Hash.new(0)
  words.split.each do |word| 
    word = word.gsub(/[^a-z]/i,"")
    result_hash[word.length] += 1
  end
  result_hash
end

puts word_sizes('Four score and seven.')
puts word_sizes('Hey diddle diddle, the cat and the fiddle!')
puts word_sizes("What's up doc?")
puts word_sizes('')
