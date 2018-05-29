# Write a method that displays a 4-pointed diamond in an n x n grid, where n is an 
# odd integer that is supplied as an argument to the method. You may assume that 
# the argument will always be an odd integer.

def print_row(star_count, total_width)
  ("*"*star_count).center(total_width)
end

def diamond(n)
  return nil if n.even?
  # prints upper half
  1.upto(n/2+1) { |i| puts print_row( 2 * i - 1, n) }
  # prints lower half
  (n/2).downto(1) { |i| puts print_row( 2 * i - 1, n) }
end

diamond(21)