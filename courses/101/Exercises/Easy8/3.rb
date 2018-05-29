# Write a method that returns a list of all substrings of a string that start 
# at the beginning of the original string. The return value should be arrangeddef
# in order from shortest to longest substring.

def substrings_at_start(str)
  result = []
  0.upto(str.length - 1) do |i|
    result << str[0..i]
  end
  result
end

p substrings_at_start('abc') == ['a', 'ab', 'abc']
p substrings_at_start('a') == ['a']
p substrings_at_start('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']