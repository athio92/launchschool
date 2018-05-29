# Write a method that takes a string, and returns a new string in which 
# every consonant character is doubled. 
# Vowels (a,e,i,o,u), digits, punctuation, and whitespace should not be doubled.

def double_consonants(str)
  result = ""
  str.chars.each do |ch|
    result << if ch.downcase.match?(/[a-z&&[^aeiou]]/)
                ch * 2
              else
                ch
              end
  end
  result
end

p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""