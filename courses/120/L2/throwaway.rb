require 'pry'

module Describable
  def describe_shape
    binding.pry
    "I am a #{self.class} and have #{SIDES} sides."
  end
end

class Shape
  include Describable

  def self.sides
    p self
    self::SIDES
  end
end

class Quadrilateral < Shape
  SIDES = 4

  def sides
    SIDES
  end
end

class Square < Quadrilateral
end

p Square.sides # => 4
p Square.new.sides # => 4
Square.new.describe_shape # => "I am a Square and have 4 sides."