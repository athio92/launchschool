# Write a method that takes one argument, a string,
# and returns the same string with the words in reverse order.

def reverse_sentence_v1(sentence)
  temp_arr =[]
  # use unshift to add each word into beginning of array
  sentence.split.each { |word| temp_arr.unshift(word) }
  temp_arr.join(" ")
end

def reverse_sentence_v2(sentence)
  sentence.split.reverse.join(" ")
end

puts reverse_sentence_v1("Reverse these words v1")
puts reverse_sentence_v2("Reverse these words v2")