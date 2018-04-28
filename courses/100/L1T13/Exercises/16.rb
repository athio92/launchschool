a = ['white snow', 'winter wonderland', 'melting ice',
  'slippery sidewalk', 'salted roads', 'white trees']

temp = a.map do |str|
  str.split
end

result = temp.flatten

puts temp.to_s
puts result.to_s