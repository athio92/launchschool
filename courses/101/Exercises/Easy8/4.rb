# substrings('abcde') == [
#  'a', 'ab', 'abc', 'abcd', 'abcde', 
#  'b', 'bc', 'bcd', 'bcde',
#  'c', 'cd', 'cde',
#  'd', 'de',
#  'e']

def substrings_at_start(str)
  result = []
  (0..str.length-1).each do  |i|
    result << str[0..i]
  end
  result
end

def substrings(str)
  result = []
  (0..str.length-1).each do |i|
    result << substrings_at_start(str[i..str.length-1])
  end
  result.flatten
end

p substrings("abcde")