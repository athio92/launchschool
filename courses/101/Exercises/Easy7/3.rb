# Write a method that takes a single String argument and returns a new string
# that contains the original value of the argument with the first character 
# of every word capitalized and all other letters lowercase

def word_cap(sentence)
  sentence.split.map(&:capitalize).join(" ")
end

p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'