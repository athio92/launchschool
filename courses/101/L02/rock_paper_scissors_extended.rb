##### CONSTANTS definition #######
VALID_CHOICES = %w(rock paper scissors lizard spock)

WIN_HASHES = {
  "rock" => ["lizard", "scissors"],
  "paper" => ["rock", "spock"],
  "scissors" => ["paper", "lizard"],
  "spock" => ["scissors", "rock"],
  "lizard" => ["spock", "paper"]
}

LOSE_HASHES = {
  "rock" => ["paper", "spock"],
  "paper" => ["scissors", "lizard"],
  "scissors" => ["spock", "rock"],
  "spock" => ["lizard", "paper"],
  "lizard" => ["rock", "scissors"]
}

WIN_REQUIRED = 5 # How many wins before program quits

##### Methods definition #####
def prompt(message)
  puts "=> #{message}"
end

def ask_player_choice
  player_choice = ""
  loop do
    prompt("Choose one: rock (r), paper (p), scissors (sc), lizard (l), spock (sp)")
    player_choice = resolve_player_choice(gets.chomp)
    break if VALID_CHOICES.include?(player_choice)
    prompt("Invalid choice, try again.")
  end
  player_choice
end

def resolve_player_choice(str)
  case str.downcase
  when "rock", "r"
    "rock"
  when "paper", "p"
    "paper"
  when "scissors", "sc"
    "scissors"
  when "lizard", "l"
    "lizard"
  when "spock", "sp"
    "spock"
  else
    "invalid choice"
  end
end

def evaluate_winner(player_choice, computer_choice)
  if player_choice == computer_choice
    "draw"
  elsif WIN_HASHES[player_choice].include?(computer_choice)
    "player"
  # explicitly define losing condition to guard against possible bug
  elsif LOSE_HASHES[player_choice].include?(computer_choice)
    "computer"
  else
    prompt("Error in determining result")
  end
end

def display_result(winner)
  case winner
  when "draw"
    prompt("It's a draw!")
  when "player"
    prompt("Player wins!")
  when "computer"
    prompt("Computer wins!")
  end
end

def match_ended?(player_score, computer_score)
  if player_score == WIN_REQUIRED
    prompt("Player has become grand champion!")
    return true
  end
  if computer_score == WIN_REQUIRED
    prompt("Computer has become grand champion!")
    return true
  end
  false
end


##### Main program flow #####
system("clear") || system("cls") # clear terminal for less clutter
player_choice = ''
player_score = 0
computer_score = 0
prompt("Welcome to RPSSL game! Win #{WIN_REQUIRED} matches to become grand champion!")
loop do
  player_choice = ask_player_choice()
  computer_choice = VALID_CHOICES.sample
  prompt("Computer chose: #{computer_choice}")
  winner = evaluate_winner(player_choice, computer_choice)
  display_result(winner)
  player_score += 1 if winner == "player"
  computer_score += 1 if winner == "computer"
  prompt("Player score: #{player_score}, Computer Score: #{computer_score}")
  break if match_ended?(player_score, computer_score)
end

prompt("Thank you for playing! Player score: #{player_score}, Computer Score: #{computer_score}")
