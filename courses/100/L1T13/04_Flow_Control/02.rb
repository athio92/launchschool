def upper(str)
  str.length > 10 ? str.upcase : str
end

puts upper("abc")
puts upper("abcedefghijklmnopqrstuvwxyz")