# Write a method that takes two strings as arguments, 
# determines the longest of the two strings, and then returns the result of 
# concatenating the shorter string, the longer string, and the shorter string once again

def short_long_short( str1, str2 )
  str1.length < str2.length ? (short, long = str1, str2) : (short, long = str2, str1)
  puts (short + long + short)
end

short_long_short('abc', 'defgh')
short_long_short('abcde', 'fgh')
short_long_short('', 'xyz')
  