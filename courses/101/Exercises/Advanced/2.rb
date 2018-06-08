# Write a method that displays an 8-pointed star in an nxn grid, where n is an 
# odd integer that is supplied as an argument to the method. The smallest such 
# star you need to handle is a 7x7 grid.

def three_star_line(inner_spaces, total_width)
  inner_stars = "*" + " "*inner_spaces + "*" + " "*inner_spaces + "*"
  inner_stars.center(total_width)
end

def star(n)
  return nil if n.even? || n < 7
  half_index = (n-1)/2
  (-half_index..half_index).each do |i|
    i = i.abs
    if i == 0
      puts "*" * n
    else
      puts three_star_line(i-1,n)
    end
  end
end

star(7)
star(9)
star(11)