# Write a method that changes every arithmetic operator (+, -, *, /)
# in a string to a '?' and returns the resulting string. Don't modify the original string.

def mystery_math(str)
  str.gsub(%r{[+\-*/]},"?")
end