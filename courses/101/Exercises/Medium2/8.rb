# Write a method that takes a single integer as an argument, 
# and returns the next featured number that is greater than the argument. 
# Issue an error message if there is no next featured number.
# note: featured = odd number, multiples of 7, digits occur exactly once

def featured(n)
  # The next 2 lines guarantees we start with odd multiples of 7 that is higher than n
  n += 1
  n += 1 until n.odd? && n % 7 == 0

  while n < 9_876_543_201
    return n if featured?(n)
    n += 14 # this hastens the loop - we only iterate odd multiples of 7
  end
  raise StandardError, "No more featured number available"
end

def featured?(n)
  if n.odd? && n % 7 == 0
    digits = n.to_s.chars 
    if digits == digits.uniq
      return true
    end
  end
  false
end


p featured(12) == 21
p featured(20) == 21
p featured(21) == 35
p featured(997) == 1029
p featured(1029) == 1043
p featured(999_999) == 1_023_547
p featured(999_999_987) == 1_023_456_987

p featured(9_999_999_999)