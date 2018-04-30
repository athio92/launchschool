VALID_CHOICES = %w(rock paper scissors)

def display_result(player_choice, computer_choice)
  choices_hash = {}
  choices_hash[player_choice] = "Player"
  choices_hash[computer_choice] = "Computer"

  if choices_hash["rock"] && choices_hash["paper"]
    prompt("#{choices_hash['paper']} wins!")
  elsif choices_hash["rock"] && choices_hash["scissors"]
    prompt("#{choices_hash['rock']} wins!")
  elsif choices_hash["paper"] && choices_hash["scissors"]
    prompt("#{choices_hash['scissors']} wins!")
  else
    prompt("It's a draw!")
  end
end

def prompt(message)
  puts "=> #{message}"
end

# Main flow
player_choice = ''
loop do
  loop do
    prompt("Choose one: rock, paper, scissors")
    player_choice = gets.chomp
    break if VALID_CHOICES.include?(player_choice)
    prompt("Invalid choice")
  end

  computer_choice = VALID_CHOICES.sample

  prompt("Computer chose: #{computer_choice}")

  display_result(player_choice, computer_choice)

  prompt("Play again? (y/n)")
  break unless gets.chomp.downcase == "y"
end
