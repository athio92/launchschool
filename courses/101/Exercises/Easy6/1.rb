DEGREE_SYMBOL = "\xC2\xB0"

def dms(angle)
  angle = angle % 360
  degree = angle.floor
  long_minutes = angle % 1 * 60
  minutes = long_minutes.floor
  seconds = (long_minutes % 1 * 60).floor
  format(%(#{degree}#{DEGREE_SYMBOL}%02d'%02d"), minutes, seconds)
end

puts dms(76.73)
puts dms(254.6)
puts dms(93.034773)
puts dms(0)
puts dms(360)
puts dms(360+76.73)
puts dms(-76.73)
