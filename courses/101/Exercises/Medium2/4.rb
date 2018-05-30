# Write a method that takes a string as argument, and returns true if all parentheses 
# in the string are properly balanced, false otherwise. To be properly balanced, 
# parentheses must occur in matching '(' and ')' pairs.
# Note that balanced pairs must each start with a (, not a ).

def balanced?(str)
  parens = 0
  str.chars.each do |char|
    if char == "(" && parens >=0
      parens +=1
    end
    if char == ")"
      parens -=1
    end
  end
  parens == 0
end

p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false