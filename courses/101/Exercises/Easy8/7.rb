# Write a method that doubles all chars in a string

def repeater(str)
  result = ""
  str.chars{|ch| result << ch * 2}
  result
end

p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''