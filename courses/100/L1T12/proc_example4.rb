class Array
  # Let's define a method that takes a block.
  # In the context of a method definition, putting an ampersand in front of the last parameter
  # indicates that a method may take a block and gives us a name to refer to this block
  # within the method body. The ampersand essentially converts the block into a proc.
  
  def each_even_index(&block)
    #Arrays start with index 0, which is even
    is_even = true

    self.each do |object|
      block.call object if is_even
      is_even=!is_even
    end
  end
  
end

fruits = ["Apple", "Banana", "Cherry", "Durian"]

fruits.each_even_index {|fruit| puts "Yum! I love #{fruit}!"}

puts "-----------"

fruits.each_even_index do |fruit|
  puts "Yum! I love #{fruit}!"
end
