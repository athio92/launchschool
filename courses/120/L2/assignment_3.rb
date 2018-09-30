class FourLeggedAnimal
  def run
    'running!'
  end

  def jump
    'jumping!'
  end
end

class Dog < FourLeggedAnimal  
  def speak
    'bark!'
  end

  def swim
    'swimming!'
  end

  def fetch
    'fetching!'
  end
end

class Bulldog < Dog
  def swim
    "can't swim!"
  end
end

class Cat < FourLeggedAnimal
  def speak
    "meow!"
  end
end

teddy = Bulldog.new
puts teddy.speak
puts teddy.swim

meowy = Cat.new
p meowy.run
