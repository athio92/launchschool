# Palindromic integer.
def palindromic_number(int)
  string = int.to_s
  string == string.reverse
end

puts palindromic_number(0034543)
puts palindromic_number(123210)
puts palindromic_number(22)
puts palindromic_number(5)