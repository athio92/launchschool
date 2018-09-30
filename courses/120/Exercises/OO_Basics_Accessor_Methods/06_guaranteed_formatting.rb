class Person
  attr_reader :name
  def name=(input_name)
    @name = input_name.capitalize
  end
end

person1 = Person.new
person1.name = 'eLiZaBeTh'
puts person1.name