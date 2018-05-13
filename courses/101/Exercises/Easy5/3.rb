# Write function opposite of previous exercise.
# "00:00" should return 0, etc

def convert_to_hours_minutes(time_string)
  hours = time_string[0..1].to_i
  minutes = time_string[3..4].to_i
  [hours,minutes]
end

def after_midnight(time_string)
  return 0 if %w(00:00 24:00).include?(time_string)
  hours, minutes = convert_to_hours_minutes(time_string)
  hours * 60 + minutes 
end

def before_midnight(time_string)
  return 0 if %w(00:00 24:00).include?(time_string)
  hours, minutes = convert_to_hours_minutes(time_string)
  (24 * 60) - (hours * 60 + minutes) 
end

puts after_midnight('00:00')
puts before_midnight('00:00')
puts after_midnight('12:34')
puts before_midnight('12:34')
puts after_midnight('24:00')
puts before_midnight('24:00')