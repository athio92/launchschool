def xor?(bool1,bool2)
  !bool1 == !bool2 ? false : true
end

puts xor?(5.even?, 4.even?)
puts xor?(5.odd?, 4.odd?)
puts xor?(5.odd?, 4.even?)
puts xor?(5.even?, 4.odd?)