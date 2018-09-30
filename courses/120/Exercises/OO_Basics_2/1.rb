class Cat
  @@number_of_cats = 0
  COLOR = "purple"
  attr_reader :name

  def initialize(name)
    @name = name
    @@number_of_cats += 1
  end

  def self.total
    @@number_of_cats
  end

  def self.generic_greeting
    puts "Hello! I'm a cat!"
  end

  def greet
    puts "Hello! My name is #{name} and I'm a #{self.class::COLOR} cat!"
  end

  def to_s
    "I'm #{name}!"
  end

end

kitty = Cat.new('Sophie')
kitty.greet
puts kitty