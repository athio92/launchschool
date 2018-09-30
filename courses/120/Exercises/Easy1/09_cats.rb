class Pet
  def initialize(name, age)
    @name = name
    @age = age
  end

  def to_s
    "My cat #{@name} is #{@age} years old"
  end
end

class Cat < Pet
  def initialize(name,age,fur_type)
    super(name,age)
    @fur_type = fur_type
  end

  def to_s
    super + " and has #{@fur_type} fur"
  end
end

pudding = Cat.new('Pudding', 7, 'black and white')
butterscotch = Cat.new('Butterscotch', 10, 'tan and white')
puts pudding, butterscotch

