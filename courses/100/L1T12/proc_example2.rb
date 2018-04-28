def do_until_false first_input, some_proc
  input = first_input
  output = first_input

  while output
    input = output
    output = some_proc.call input
  end

  input
end

build_array_of_squares = proc do |array|
  last_number = array.last
  if last_number <= 0
    false
  else
    # Take off last number, replace it with its square, followed by next smaller number
    array.pop
    array.push last_number**2
    array.push last_number-1
  end
end

always_false = proc do |just_ignore_me|
  false
end

puts do_until_false([5],build_array_of_squares).inspect

yum = "lemonade with a hint of orange blossom water"
puts do_until_false(yum,always_false)