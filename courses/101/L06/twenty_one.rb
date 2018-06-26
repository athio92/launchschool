### Utility methods ###
def prompt(msg)
  puts "=> #{msg}"
end

def joinor(arr, delimiter = ", ", last_separator = "and" )
  return arr[0].to_s if arr.length <= 1
  return "#{arr[0]} #{last_separator} #{arr[1]}" if arr.length == 2
  "#{arr[0..arr.length - 2].join(delimiter)}#{delimiter}#{last_separator} #{arr.last}"
end

### Game Methods ###
def initialize_deck
  card_values = %w(2 3 4 5 6 7 8 9 10 Jack Queen King Ace)
  [
    ["Hearts", card_values.dup.shuffle],
    ["Diamonds",card_values.dup.shuffle],
    ["Clubs",card_values.dup.shuffle],
    ["Spades",card_values.dup.shuffle],
  ]
end

def pick_card_from_deck!(deck)
  # future todo: if we allow multiple rounds without reinitializing deck,
  # we need to filter out suites with no leftover cards in it.
  suite_values_pair = deck.sample
  suite = suite_values_pair[0]
  card_value = suite_values_pair[1].pop
  [suite, card_value]
end

def add_card_to_hand!(hand, deck, cards_to_add = 1)
  cards_to_add.times{ |_| hand << pick_card_from_deck!(deck)}
end

def filter_values_only(hand)
  hand.map{|suite_value_pair| suite_value_pair[1]}
end

def count_hand_value(hand)
  result = 0
  ace_counter = 0
  hand_values = filter_values_only(hand)
  hand_values.each do |value_string|
    if value_string.to_i != 0
      # value is 2..10
      result += value_string.to_i
    elsif %w(Jack Queen King).include?(value_string)
      result += 10
    elsif value_string == "Ace"
      result += 11
      ace_counter += 1
    end
  end
  # Correct for Aces
  while result > 21 && ace_counter > 0
    result -= 10
    ace_counter -= 1
  end
  result
end

def display_player_and_dealer_hands(player_hand, dealer_hand, hide_dealer_first_card = true)
  display_player_hand(player_hand)
  display_dealer_hand(dealer_hand, hide_dealer_first_card)  
end

def display_player_hand(player_hand)
  player_hand_values = filter_values_only(player_hand)
  prompt "You have: #{joinor(player_hand_values)}. Total value: #{count_hand_value(player_hand)}"
end

def display_dealer_hand(dealer_hand, hide_dealer_first_card = true)
  dealer_hand_values = filter_values_only(dealer_hand)
  if hide_dealer_first_card
    dealer_hand_values[0] = "unknown card"
    prompt "Dealer have: #{joinor(dealer_hand_values)}." 
  else
    prompt "Dealer have: #{joinor(dealer_hand_values)}. Total value: #{count_hand_value(dealer_hand)}"
  end
end

def ask_player_to_hit_or_stay()
  loop do 
    prompt("Choose to Hit (h) or Stay (s)")
    user_input = gets.chomp
    return :hit if user_input.match?(/h[it]*/i)
    return :stay if user_input.match?(/s[tay]*/i)
    prompt("Invalid input")
  end
end

def busted?(hand)
  count_hand_value(hand) > 21
end

def detect_result(player_hand, dealer_hand)
  # :tie, :dealer, :player, :dealer_busted, :player_busted
  player_hand_value = count_hand_value(player_hand)
  dealer_hand_value = count_hand_value(dealer_hand)

  if player_hand_value > 21
    :player_busted
  elsif dealer_hand_value > 21
    :dealer_busted
  elsif dealer_hand_value < player_hand_value
    :player
  elsif dealer_hand_value > player_hand_value
    :dealer
  elsif dealer_hand_value == player_hand_value
    :tie
  else
    :error
  end
end

def display_result(player_hand, dealer_hand)
  result = detect_result(player_hand, dealer_hand)
  case result
  when :player_busted then prompt "You busted! Dealer wins!"
  when :dealer_busted then prompt "Dealer busted! You win!"
  when :player then prompt "You win!"
  when :dealer then prompt "Dealer wins!!"
  when :tie then prompt "It's a tie!"
  else prompt "Unknown result. Error occured."
  end
end

def play_again?
  puts "--------------------"
  loop do
    prompt "Do you want to play again? (y/n)"
    answer = gets.chomp
    if answer.match?(/y[es]*/i)
      return true
    elsif answer.match?(/n[o]*/i)
      return false
    else
      prompt "Invalid answer. Please try again"
    end
  end
end


##### Main Game Flow #####
loop do
  # Initialization
  system('clear')
  prompt("Welcome to Twenty-One! Please check the cards drawn!")
  deck = initialize_deck
  player_hand = []
  dealer_hand = []

  # Deal 2 Cards to Player and Dealer each.
  add_card_to_hand!(player_hand, deck, 2)
  add_card_to_hand!(dealer_hand, deck, 2)
  display_player_and_dealer_hands(player_hand, dealer_hand)

  # Player turn: Prompt player to either Hit or Stay. Player can do multiple Hits.
  while count_hand_value(player_hand) < 21
    player_choice = ask_player_to_hit_or_stay
    if player_choice == :hit
      add_card_to_hand!(player_hand, deck)
      prompt("You drew #{player_hand[-1][1]}")
      display_player_hand(player_hand)
      display_dealer_hand(dealer_hand) if count_hand_value(player_hand) < 21
    elsif player_choice == :stay
      prompt "You chose to stay."
      break
    end
  end

  prompt "Your hand value reached 21! Moving to dealer's turn..." if count_hand_value(player_hand) == 21

  # checks if player busted
  if busted?(player_hand)
    display_result(player_hand, dealer_hand)
    play_again? ? next : break
  end

  # Dealer turn: Dealer hits until total is at least 17. If dealer busts, player wins
  prompt "Dealer revealing card..."
  display_dealer_hand(dealer_hand, false)
  while count_hand_value(dealer_hand) < 17
    add_card_to_hand!(dealer_hand, deck)
    prompt("Dealer drew #{dealer_hand[-1][1]}")
    display_dealer_hand(dealer_hand, false)
  end

  # Check if dealer busted.
  if busted?(dealer_hand)
    display_result(player_hand, dealer_hand)
    play_again? ? next : break
  else
    puts "=============="
    prompt("No one busted. Comparing result:")
    display_player_and_dealer_hands(player_hand, dealer_hand, false)
    puts "=============="
    display_result(player_hand, dealer_hand)
  end

  break unless play_again?
end

prompt "Thank you for playing!"