# https://launchschool.com/exercises/5f95d514
# Write two methods: one that takes a Rational number as an argument, and returns an Array 
# of the denominators that are part of an Egyptian Fraction representation of the number, and 
# another that takes an Array of numbers in the same format, and calculates the resulting 
# Rational number. You will need to use the Rational class provided by Ruby.

# brute-force calculation
def egyptian(rat_num)
  result= []
  current_denominator = 1
  remainder = rat_num
  loop do
    current_rat_num = Rational(1,current_denominator)
    if remainder >= current_rat_num
      result << current_denominator
      remainder -= current_rat_num
    end
    break if remainder == 0
    current_denominator +=1
  end

  result
end

def unegyptian(unit_fraction_denominators)
  result = 0.to_r
  unit_fraction_denominators.each{|d| result += Rational(1,d)}
  result
end

p egyptian(Rational(2, 1))    # -> [1, 2, 3, 6]
p egyptian(Rational(137, 60)) # -> [1, 2, 3, 4, 5]
p egyptian(Rational(3, 1))    # -> [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 15, 230, 57960]

p unegyptian(egyptian(Rational(1, 2))) == Rational(1, 2)
p unegyptian(egyptian(Rational(3, 4))) == Rational(3, 4)
p unegyptian(egyptian(Rational(39, 20))) == Rational(39, 20)
p unegyptian(egyptian(Rational(127, 130))) == Rational(127, 130)
p unegyptian(egyptian(Rational(5, 7))) == Rational(5, 7)
p unegyptian(egyptian(Rational(1, 1))) == Rational(1, 1)
p unegyptian(egyptian(Rational(2, 1))) == Rational(2, 1)
p unegyptian(egyptian(Rational(3, 1))) == Rational(3, 1)