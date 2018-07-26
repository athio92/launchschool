# def find_primes(start_int,end_int)
#   (start_int..end_int).select{|i| prime_number?(i)}
# end

# def prime_number?(num)
#   (2...num).each do |i|
#     return false if num % i == 0
#   end
#   true
# end

# p find_primes(3,111)
def substring(str,start_pos,end_pos = start_pos)
  start_pos = 0 if start_pos < 0
  end_pos = (str.length - 1) if end_pos > (str.length - 1)
  str[start_pos..end_pos]
end

def substrings(str)
  # First call substr(str,0,1), substr(str,0,2) .. substr(str,0,str.length-1)
  # then call substr(str,1,2) , substr(str,1,3) .. substr(str,1,str.length-1)
  # then call substr(str,2,3)... substr(str,2,str.length-1)
  # ...
  # finally  call substr(str,str.length-2, str.length-1)
  result_array = []
  (0..str.length-2).each do |start_pos|
    (start_pos+1..str.length-1).each do |end_pos|
      result_array << substring(str,start_pos,end_pos)
    end
  end
  result_array.uniq
end

def palindromes(str)
  substrings(str).select{|substr| substr == substr.reverse}
end

# def is_palindrome?(str)
#   # If str is odd, midpoint index is str.length/2 (ex: abcdefg. length = 7, midpoint index = 3)
#   # If str is even, midpoint index is (str.length/2)-1(ex: "abcdef". length = 6, midpoint index between 2-3)
#   # Palindrome is true if first half of str == (second half of str).reverse
#   if str.length.odd?
#     midpoint_index = str.length/2
#     return (substring(str,0,midpoint_index - 1) == substring(str,midpoint_index + 1,str.length - 1).reverse)
#   else
#     # str.length is even
#     midpoint_index = str.length/2 - 1
#     return (substring(str,0,midpoint_index) == substring(str,midpoint_index + 1, str.length - 1).reverse)
#   end
# end

p palindromes("ppop")
