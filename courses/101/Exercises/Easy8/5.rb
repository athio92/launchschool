# Write a method that returns a list of all substrings of a string that are palindromic

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

def palindromes(str)
  substrings(str).select{ |substr| substr == substr.reverse && substr.size > 1}
end

p palindromes('abcd')
p palindromes('madam')
p palindromes('hello-madam-did-madam-goodbye')
p palindromes('knitting cassettes')