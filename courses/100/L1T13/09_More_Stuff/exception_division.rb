def divide(number,divisor)
  begin
    answer = number / divisor
  rescue ZeroDivisionError, TypeError => e
    puts e.message
  end
end

puts divide(16, 4)
puts divide(4, 0)
puts divide(12, 'b')
puts divide(11, 2)

