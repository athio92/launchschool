# What's my bonus?
# Write a method that takes two arguments, a positive integer and a boolean, 
# and calculates the bonus for a given salary. If the boolean is true, 
# the bonus should be half of the salary. If the boolean is false, the bonus should be 0.

def calculate_bonus(int, bool)
  bool ? (int/2) : 0
end