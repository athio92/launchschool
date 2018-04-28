def factorial(num)
  exit if num < 0
  if (num == 0 || num == 1)
    return 1
  else
    return num * factorial(num-1)
  end
end


def take_proc(p)
  [1,2,3,4,5].each do |number|
    p.call(number)
  end
end


p = proc do |number|
  puts "#{number}. Proc is being called in the method!"
end

q = proc do |number|
  puts "The factorial of #{number} is #{factorial(number)}"
end



take_proc(p)
take_proc(q)