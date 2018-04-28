class OrangeTree
  def initialize
    @height = 0
    @orange_count = 0
    @age = 0
  end

  def height
    @height
  end

  def count_the_oranges
    @orange_count
  end

  def pick_an_orange
    if @orange_count > 0
      @orange_count -= 1
      puts "The orange was delicious! You had #{@orange_count} remaining oranges."
    else
      puts "No more orange to pick!"
    end

  end

  def one_year_passes
    @age += 1
    puts "The tree is now #{@age} years old. #{@orange_count} oranges fell to the ground."
    @orange_count = 0
    #tree dies after x years
    if @age >7
      puts "The tree died after reaching #{@age} years."
      exit
    end
    #tree grows taller
    @height+=4
    #tree produces orange if age > y years. Older tree produces more.
    @orange_count += @age**2-@age
  end
end

tree = OrangeTree.new

while true
  puts "What do you want to do?"
  s = gets.chomp
  case s
  when "count height"
    puts "The tree height is #{tree.height}"
  when "count orange"
    puts "The tree contains #{tree.count_the_oranges} oranges"
  when "pick orange"
    tree.pick_an_orange
  when "pass time"
    puts "Time passes one year."
    tree.one_year_passes
  else
    puts "I didn't understand."
  end
end
