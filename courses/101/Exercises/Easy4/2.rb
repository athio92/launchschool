# 1901 - 2000 = 20th century, and so on
def century(int_year)
  century_number = (int_year % 100 == 0) ? (int_year / 100) : (int_year / 100 + 1)
  century_number.to_s + suffix(century_number)
end

def suffix(century_number)
  return "th" if [11, 12, 13].include?(century_number % 100)
  case century_number.to_s[-1]
  when "1" then "st"
  when "2" then "nd"
  when "3" then "rd"
  else "th"
  end
end


puts century(1240)
puts century(224)
puts century(1002)
puts century(1901)
puts century(1900)
puts century(2100)
puts century(2104)
puts century(2204)
puts century(11201)