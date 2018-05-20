require 'pry'
x = [1,2,3,4,5].reduce do |total,i| 
  (total + i) if i <3
end

binding.pry
puts x
