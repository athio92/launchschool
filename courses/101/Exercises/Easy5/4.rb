# Given a string of words separated by spaces, 
# write a method that takes this string of words and 
# returns a string in which the first and last letters 
# of every word is swapped.

def swap_word(word)
  first_letter = word[0]
  word[0] = word[-1]
  word[-1] = first_letter
  word
end

def swap_sentence(str)
  (str.split.map {|word| swap_word(word)}).join(" ")
end

puts swap_sentence("Oh what a wonderful day it is")
puts swap_sentence("a")