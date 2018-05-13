# Prior to 1752, leap years occur in any year that is evenly divisible by 4

def leap_year?(int_year)
  return (int_year % 4 == 0) if int_year < 1752
  (int_year % 400 == 0) || (int_year % 4 == 0 && int_year % 100 != 0)
end

puts leap_year?(2016)
puts leap_year?(2015)
puts leap_year?(2100)
puts leap_year?(2400)
puts leap_year?(240000)
puts leap_year?(240001)
puts leap_year?(2000)
puts leap_year?(1900)
puts leap_year?(1752)
puts leap_year?(1700)
puts leap_year?(1)
puts leap_year?(100)
puts leap_year?(400)

