# The String may have a leading + or - sign; 
# if the first character is a +, your method should return a positive
# number; if it is a -, your method should return a negative number.
# If no sign is given, you should return a positive number.
DIGITS = {
  "0" => 0, "1" => 1, "2" => 2, "3" => 3, "4" => 4, "5" => 5,
  "6" => 6, "7" => 7, "8" => 8, "9" => 9,"10" => 10
}
HEX_DIGITS = {
  "0" => 0, "1" => 1, "2" => 2, "3" => 3, "4" => 4, "5" => 5,
  "6" => 6, "7" => 7, "8" => 8, "9" => 9, "A" => 10,
  "B" => 11, "C" => 12, "D" => 13, "E" => 14, "F" => 15 
}
def string_to_integer(str, hex = false)
  result = 0
  first_char = str[0]
  # remove + or - sign from str if exist
  str[0] = '' if %w(+ -).include?(first_char)
  (1..str.length).each do |index|
    if hex == true
      str = str.upcase
      result += HEX_DIGITS[str[-index]] * 16**(index-1)
    else
      result += DIGITS[str[-index]] * 10**(index-1)
    end
  end
  first_char == '-' ? result * -1 : result
end

puts string_to_integer("+4321")
puts string_to_integer("570")
puts string_to_integer("4D9f", true)
puts string_to_integer("-4321")
puts string_to_integer("-570")
puts string_to_integer("-4D9f", true)