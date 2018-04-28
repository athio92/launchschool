# Using methods that return procs

def compose(proc1, proc2)
  return proc do |x|
    proc2.call(proc1.call(x))
  end
end

square_it = proc do |x|
  x**2
end

double_it = proc do |x|
  x*2
end

# These are all new procs.
double_then_square = compose(double_it, square_it)
square_then_double = compose(square_it, double_it)

puts double_then_square.call(5)
puts square_then_double.call(5)