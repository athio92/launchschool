module Towable
  def can_tow?(pounds)
    pounds < 2000 ? true : false
  end
end

class Vehicle
  @@number_of_vehicles = 0
  attr_accessor :current_speed
  def initialize(speed) 
    self.current_speed = speed
    @@number_of_vehicles += 1
  end

  def self.number_of_vehicles
    "This Vehicle class has created #{@@number_of_vehicles} vehicles"
  end

  def speed_up(number)
    @current_speed += number
    puts "#{name} speed increased by #{number}. It is now #{@current_speed}"
  end

  def brake(number)
    @current_speed -= number
    @current_speed = 0 if @current_speed < 0
    puts "#{name} speed decreased by #{number}. It is now #{@current_speed}"
  end

  def shut_off
    @current_speed = 0
    puts "#{name} is turned off. Speed is now #{@current_speed}"
  end

  def self.gas_mileage(gallons, miles)
    puts "#{miles/gallons} miles per gallon of gas."
  end
end

class MyTruck < Vehicle # inheritance
  include Towable
  NUMBER_OF_DOORS = 2
  attr_accessor :payload, :name
  
  def initialize(payload)
    self.payload = payload # pounds
    self.name = "Trucky McTruckface"
    super(0)
  end
end

class MyCar < Vehicle # inheritance
  attr_accessor :color, :year, :model, :name
  NUMBER_OF_DOORS = 4

  def initialize(y, c, m)
    self.year = y
    self.color = c
    self.model = m
    self.name = "#{color} #{model} #{year}"
    super(0)
  end

  def spray_paint(c)
    self.color = c
    puts "Your new #{color} paint looks great!"
  end

  def age
    "Your #{self.name} is #{years_old} years old"
  end

  def to_s
    "This is a #{color} #{model} #{year} car"
  end

  private

  def years_old
    Time.now.year - self.year
  end
end


car = MyCar.new(2000, "Red", "Toyota Camry")
car.speed_up(10)
car.brake(12)
car.current_speed = 1000
car.speed_up(10)
car.shut_off
puts car
car.spray_paint("Black")
puts car
MyCar.gas_mileage(10,100)

p car.color
p car.current_speed
p car.age


truck = MyTruck.new(1000)
truck.speed_up(50)
p truck
p truck.can_tow?(truck.payload)
p Vehicle.number_of_vehicles


