# Rock Paper Scissor game using OOP
# require 'pry'
class Move
  VALUES = ["rock", "paper", "scissors", "lizard", "spock"]
  WIN_HASH = {
    "rock" => ["lizard", "scissors"],
    "paper" => ["rock", "spock"],
    "scissors" => ["paper", "lizard"],
    "spock" => ["scissors", "rock"],
    "lizard" => ["spock", "paper"]
  }
  LOSE_HASH = {
    "rock" => ["paper", "spock"],
    "paper" => ["scissors", "lizard"],
    "scissors" => ["spock", "rock"],
    "spock" => ["lizard", "paper"],
    "lizard" => ["rock", "scissors"]
  }

  attr_reader :value

  def initialize(value)
    @value = value
  end

  def >(other_move)
    WIN_HASH[value].include?(other_move.value)
  end

  def <(other_move)
    LOSE_HASH[value].include?(other_move.value)
  end

  def to_s
    @value
  end

  # def scissors?
  #   @value == "scissors"
  # end

  # def rock?
  #   @value == "rock"
  # end

  # def paper?
  #   @value == "paper"
  # end

  # def lizard?
  #   @value == "lizard"
  # end

  # def spock?
  #   @value == "spock"
  # end

  # def >(other_move)
  #   (rock? && (other_move.scissors? || other_move.lizard?)   ||
  #     (paper? && (other_move.rock? || other_move.)    ||
  #     (scissors? && other_move.paper?)
  # end

  # def <(other_move)
  #   (rock? && other_move.paper?)        ||
  #     (paper? && other_move.scissors?)  ||
  #     (scissors? && other_move.rock?)
  # end
end

class Player
  attr_accessor :move, :name

  def initialize
    set_name
  end

  def human?
    @player_type == :human
  end
end

class Human < Player
  def set_name
    n = ""
    loop do
      puts "What's your name?"
      n = gets.chomp
      break unless n.empty?
      puts "Sorry, must enter a value."
    end
    self.name = n
  end

  def choose
    choice = nil
    loop do
      puts "Please choose rock, paper, scissors, lizard, or spock"
      choice = gets.chomp.downcase
      if Move::VALUES.include?(choice)
        self.move = Move.new(choice)
        break
      end
      puts "Sorry. Please choose rock, paper, scissors, lizard, or spock"
    end
  end
end

class Computer < Player
  def set_name
    self.name = %w(R2D2 Hal Chappie Sonny Futuro).sample
  end

  def choose
    self.move = Move.new(Move::VALUES.sample)
  end
end

class Move
end

class Rule
end

class RPSGame
  attr_reader :human, :computer, :human_score, :computer_score, :target_score

  def initialize(target_score = 2)
    @human = Human.new
    @computer = Computer.new
    @human_score = 0
    @computer_score = 0
    @target_score = target_score
  end

  def play
    display_welcome_message
    until human_score == target_score || computer_score == target_score
      human.choose
      computer.choose
      display_moves
      display_winner
      display_score
      # break unless play_again?
    end
    display_goodbye_message
  end

  private
  
  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissors, Lizard, Spock!!"
  end

  def display_moves
    puts "#{human.name} chose #{human.move}, #{computer.name} chose #{computer.move}"
  end

  def display_winner
    if human.move > computer.move
      puts "#{human.name} won!"
      @human_score += 1
    elsif human.move < computer.move
      puts "#{human.name} lost!"
      @computer_score += 1
    else
      puts "It's a tie!"
    end
  end

  def display_score
    puts "#{human.name}: #{human_score}, #{computer.name}: #{computer_score}"
  end

  # def play_again?
  #   answer = nil
  #   loop do
  #     puts "Would you like to play again? (y/n)"
  #     answer = gets.chomp
  #     break if %w(y n).include?(answer.downcase)
  #     puts "Sorry, must input 'y' or 'n'."
  #   end
  #   answer == 'y'
  # end


  def display_goodbye_message
    puts "Match ended. Thanks for playing!"
  end
end

RPSGame.new(10).play
