def stringy(size, start_char = 1)
  if size <= 0
    puts "Number must be larger than 0"
    exit
  end

  result = ""
  (1..size).each do |i|
    number =
      if start_char == 0
        i.odd? ? "0" : "1"
      else
        i.odd? ? "1" : "0"
      end

    result << number
  end

  result
end

puts stringy(5)
puts stringy(5,1)
puts stringy(5,0)