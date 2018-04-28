class Integer
  def to_eng
    if self ==5
      english='five'
    else
      english='not five'
    end
    return english
  end
end

class Die
  def initialize
    roll
  end
  
  def roll
    @number_showing = 1 + rand(6)
  end

  def cheat(num)
    num >= 1 && num <= 6 ? @number_showing=num : puts("Error")
  end

  def showing
    @number_showing
  end
end


puts 5.to_eng
puts 42.to_eng

die = Die.new
puts die.showing
die.cheat(7)
puts die.showing
# puts die.showing
# puts die.roll
# puts die.showing
# puts die.showing
# puts die.roll
# puts die.showing
# puts die.showing
