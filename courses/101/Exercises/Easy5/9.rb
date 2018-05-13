# Write your own String#squeeze method 
# (remove consecutive duplicate chars)

def crunch(str)
  result = ""
  previous_char = ""
  str.each_char do |c|
    result << c if c != previous_char
    previous_char = c
  end
  result
end

puts crunch('ddaaiillyy ddoouubbllee') == 'daily double'
puts crunch('4444abcabccba') == '4abcabcba'
puts crunch('ggggggggggggggg') == 'g'
puts crunch('a') == 'a'
puts crunch('') == ''