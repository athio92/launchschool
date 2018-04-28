arr = ['snow', 'winter', 'ice', 'slippery', 'salted roads', 'white trees']
arr.delete_if{|str| str.start_with?("s")}
puts arr.to_s
arr = ['snow', 'winter', 'ice', 'slippery', 'salted roads', 'white trees']
arr.delete_if{|str| str.start_with?("s","w")}
puts arr.to_s

