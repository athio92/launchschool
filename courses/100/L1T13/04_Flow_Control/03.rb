def numrange(num)
  if num <0
    puts "You can't enter negative number"
    exit
  end

  if num >=0 && num <=50
    puts "Num is between 0 and 50"
  elsif num >=51 && num <=100
    puts "Num is between 51 and 100"
  else
    puts "num is above 100"
  end
end

def numrange_case(num)
  case
  when num < 0
    puts "No negative number."
  when num <=50
    puts "Number is between 0 and 50"
  when num <=100
    puts "Number is between 51 and 100"
  else
    puts "Number is above 100"
  end
end


numrange(50)
numrange(59)
numrange(199)
puts
numrange_case(50)
numrange_case(59)
numrange_case(199)