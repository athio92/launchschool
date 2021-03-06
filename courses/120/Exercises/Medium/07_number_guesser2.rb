class GuessingGameRuntimeError < RuntimeError; end

class GuessingGame

  def initialize(lowerbound, upperbound)
    @lower_bound = lowerbound
    @upper_bound = upperbound
    @answer = nil
    @guess_limit = Math.log2(upperbound - lowerbound).to_i + 1
    @player_wins = false
  end

  def play
    reset
    while @guess_limit > 0 && !@player_wins
      display_guesses_remaining
      player_guess = obtain_one_guess
      evaluate_guess(player_guess)
      @guess_limit -= 1
    end
    puts "You are out of guesses. You lost." if !@player_wins
  end

  private
  
  def reset
    @answer = rand(@lower_bound..@upper_bound)
  end

  def display_guesses_remaining
    puts "You have #{@guess_limit} guess#{@guess_limit > 1 ? "es" : ""} remaining"
  end

  def obtain_one_guess
    loop do
      print "Enter a number between #{@lower_bound} and #{@upper_bound}: "
      player_guess = gets.chomp.to_i
      return player_guess if (@lower_bound..@upper_bound).cover?(player_guess)
      print "Invalid guess. "
    end
  end

  def evaluate_guess(player_guess)
    if player_guess < @answer
      puts "Your guess is too low"
    elsif player_guess > @answer
      puts "Your guess is too high"
    elsif player_guess == @answer
      puts "You win!"
      @player_wins = true
    else
      raise GuessingGameRuntimeError, "Failed to process player's guess against answer"
    end
  end
  
end

game = GuessingGame.new(501,1500)
game.play
