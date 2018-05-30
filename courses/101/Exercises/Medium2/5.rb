# https://launchschool.com/exercises/7fe5eaf8
# Write a method that takes the lengths of the 3 sides of a triangle as arguments, 
# and returns a symbol :equilateral, :isosceles, :scalene, or :invalid depending on whether 
# the triangle is equilateral, isosceles, scalene, or invalid.

def triangle(x,y,z)
  sides = [x, y, z].sort 
  return :invalid unless sides.all?{ |e| e.is_a?(Numeric) && e > 0 }
  return :invalid if sides[0] + sides[1] <= sides[2]
  # Now, since the sides are sorted, we can do the following:
  if sides[0] == sides[2]
    :equilateral
  elsif sides[0] == sides[1] || sides[1] == sides[2]
    :isosceles
  else
    :scalene
  end
end

p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid