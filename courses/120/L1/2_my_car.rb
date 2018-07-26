class MyCar
  attr_accessor :color
  attr_reader :year

  def initialize(y, c, m)
    @year = y
    @color = c
    @model = m
    @current_speed = 0
  end

  def speed_up(number)
    @current_speed += number
    puts "Car speed increased by #{number}. It is now #{@current_speed}"
  end

  def brake(number)
    @current_speed -= number
    @current_speed = 0 if @current_speed < 0
    puts "Car speed decreased by #{number}. It is now #{@current_speed}"
  end

  def shut_off
    @current_speed = 0
    puts "Car is turned off. Speed is now #{@current_speed}"
  end

  def spray_paint(c)
    self.color = c
    puts "Your new #{color} paint looks great!"
  end
end


car = MyCar.new(2000, "Red", "Toyota")

car.speed_up(10)
car.brake(6)
car.brake(6)
car.speed_up(60)
car.shut_off

puts car.color
car.spray_paint("Black")
puts car.color
puts car.year
