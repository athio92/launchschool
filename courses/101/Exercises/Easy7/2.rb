# Write a method that takes a string, and then returns a hash that contains 3 entries:
# one represents the number of characters in the string that are lowercase letters,
# one the number of characters that are uppercase letters, and
# one the number of characters that are neither.

def letter_case_count(str)
  lcase_counter = 0
  ucase_counter = 0
  neither_counter = 0

  str.chars.each do |char|
    if char.match?(/[a-z]/)
      lcase_counter += 1
    elsif char.match?(/[A-Z]/)
      ucase_counter += 1
    else
      neither_counter += 1
    end
  end
  { lowercase: lcase_counter, uppercase: ucase_counter, neither: neither_counter}
end


p letter_case_count('abCdef 123')
p letter_case_count('AbCd +Ef')
p letter_case_count('123')
p letter_case_count('')


p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }
