# Write a method that takes a string, and then returns a hash that contains 3 entries: 
# one represents the percentage of characters in the string that are lowercase letters, 
# one the percentage of characters that are uppercase letters, and 
# one the percentage of characters that are neither.

def letter_percentages(str)
  hsh = { lowercase: 0, uppercase: 0, neither: 0 }
  lowercase_count = str.count("a-z")
  uppercase_count = str.count("A-Z")
  neither_count = str.count("^a-zA-Z")
  total = lowercase_count + uppercase_count + neither_count

  hsh[:lowercase] = lowercase_count * 100.0 / total 
  hsh[:uppercase] = uppercase_count * 100.0 / total 
  hsh[:neither] = neither_count * 100.0 / total 
  hsh

end

p letter_percentages('abCdef 123')
p letter_percentages('AbCd +Ef')
p letter_percentages('123')