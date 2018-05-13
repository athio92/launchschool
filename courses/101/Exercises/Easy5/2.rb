# Write a method that takes minutes (int) and returns string
# representing time of day (ex: 3 => "00:03", -3 => "23:57" ).
# You may not use Ruby's Date and Time classes.

def time_of_day(delta_minutes)
  # ensures time difference is in the range of 0 .. minutes per day.
  # ex: -5 % (24 * 60) = 1435.
  delta_minutes = delta_minutes % (24 * 60)
  hours, minutes = delta_minutes.divmod(60)
  puts format("%02d:%02d", hours, minutes)
end

time_of_day(-5)
time_of_day(5)
time_of_day(1000)