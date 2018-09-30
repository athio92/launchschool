class GoodDog
  DOG_YEARS = 7
  attr_accessor :name, :age

  def initialize(n, a)
    self.name = n
    self.age = a
  end

  def public_disclosure
    # You can call human_years here, but you cannot use self.human_years
    # Using self.human_years is the same as calling sparky.human_years,
    # which is not allowed for private method
    "#{self.name} in human years is #{human_years}"
  end
  
  def a_public_method
    "Will this work? " + self.a_protected_method
  end

  protected
  # All methods below this line will be protected (until there's public / private word)
  
  def a_protected_method
    "Yes, I'm protected!"
  end

  private
  # All methods below this line will be private (until there's public / protected word)

  def human_years
    age * DOG_YEARS
  end

end

sparky = GoodDog.new("Sparky", 4)
p sparky.public_disclosure # -> "Sparky in human years is 28"
p sparky.a_public_method # => Will this work? Yes, I'm protected!
p sparky.a_protected_method # => NoMethodError: protected method `a_protected_method`..
p sparky.human_years # => NoMethodError: private method `human_years' called...