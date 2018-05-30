# Write a method that takes the 3 angles of a triangle as arguments, and returns a 
# symbol :right, :acute, :obtuse, or :invalid depending on whether the 
# triangle is a right, acute, obtuse, or invalid triangle.

def triangle(x,y,z)
  angles = [x, y, z].sort 
  return :invalid unless angles.all?{ |e| e.is_a?(Numeric) && e > 0 }
  return :invalid if angles.sum != 180
  if angles.any?{ |angle| angle == 90 }
    :right
  elsif angles.any?{|angle| angle >= 90}
    :obtuse
  else
    :acute
  end 
end

p triangle(60, 70, 50) == :acute
p triangle(30, 90, 60) == :right
p triangle(120, 50, 10) == :obtuse
p triangle(0, 90, 90) == :invalid
p triangle(50, 50, 50) == :invalid
