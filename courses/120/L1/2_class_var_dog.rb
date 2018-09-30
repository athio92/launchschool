class GoodDog
  DOG_YEARS = 7 
  @@number_of_dogs = 0

  attr_accessor(:name, :age)

  # This shows you can access class variables from within an instance method.
  # (initialize is an instance method).
  def initialize(n, a)
    self.name = n
    self.age = a * DOG_YEARS
    @@number_of_dogs += 1
  end

  def self.total_number_of_dogs
    @@number_of_dogs
  end

  # When you call `puts` on an instance of this class, this `to_s` is called.
  def to_s
    "This dog's name is #{name} and it is #{age} dog years old"
  end

  def inspect
    "You can't touch this! `p` calls inspect and it's overriden!"
  end
end

puts GoodDog.total_number_of_dogs
dog1 = GoodDog.new("doggy1",2)
dog2 = GoodDog.new("doggy2",4)
puts GoodDog.total_number_of_dogs

puts dog1.name
puts dog1.age
puts dog2.name
puts dog2.age

puts dog1
p dog2

p "#{dog1}"
