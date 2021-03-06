module Speak
  def speak(sound)
    puts "#{sound}"
  end
end


class GoodDog
  def initialize(name)
    # use @ for instance variable
    @name = name
  end
  
  def speak
    "#{@name} says Arf!!"
  end

  def name
    @name
  end
  def name=(n)
    @name = n
  end

  include Speak
end

class Human
  include Speak
end

# puts "---GoodDog Ancestors---"
# p GoodDog.ancestors
# puts ""
# puts "---Human Ancestors"
# p Human.ancestors
sparky = GoodDog.new("Sparky")

p sparky.speak
fido = GoodDog.new("Fido")
p fido.speak

sparky.name=("Thunderbolt")
p sparky.speak
sparky.name = "Thunderbolt 2"
p sparky.speak




bob = Human.new
bob.speak("Boom")
