# Write a program that reads the content of a text file and then prints the longest
# sentence in the file based on number of words. Sentences may end with periods (.),
# exclamation points (!), or question marks (?). Any sequence of characters that are 
# not spaces or sentence-ending characters should be treated as a word. You should also 
# print the number of words in the longest sentence.

def count_words(sentence)
  sentence.scan(/(\w+|-+)/).length
end

def longest_sentence(filepath)
  hsh = {}
  File.read("example_text.txt").split(/[.!?]/).each {|sntce| hsh[count_words(sntce)] = sntce }
  puts "Longest sentence has #{hsh.keys.max} words:"
  puts hsh[hsh.keys.max]

end

longest_sentence("example_text.txt")