# OOP version of 101/L6/twenty_one.rb
require 'pry'

module GameUtils
  def prompt(msg)
    puts "=> #{msg}"
  end

  def join_and(arr, delimiter = ", ", last_separator = "and")
    return arr[0].to_s if arr.length <= 1
    return "#{arr[0]} #{last_separator} #{arr[1]}" if arr.length == 2
    "#{arr[0..arr.length - 2].join(delimiter)}#{delimiter}#{last_separator} #{arr.last}"
  end

  def ask_user_input(msg,allowed_choices_array)
    loop do
      prompt(msg)
      allowed_choices = allowed_choices_array.map(&:downcase)
      user_input = gets.chomp.downcase  
      return user_input if allowed_choices.include?(user_input)
      prompt("Invalid choice.")
    end
  end
end

module SuitsAndValues
  CARD_SUITS = %w(Hearts Diamonds Clubs Spades)
  CARD_VALUES = %w(2 3 4 5 6 7 8 9 10 Jack Queen King Ace)
end


# Game: Knows (Deck, player & dealer's hand values and score, final winner). Responsible (start game, control flow of game)
class TwentyOneGame
  include GameUtils
  def initialize
    @player = Player.new
    @dealer = Dealer.new
    @deck = Deck.new
    @player_score = 0
    @dealer_score = 0
    @winner = nil
    shuffle_deck
  end

  def shuffle_deck
    @deck.shuffle!
  end

  def start
    #   Game Setup (initialize deck + shuffle)
    #   Deal 2 cards to each player & display cards (only 1 dealer card visible)
    #   Player turn: prompt to hit/stay. Multiple hits allowed. 
    #     (Loop until value = 21 / bust / stay)
    #   Dealer turn: hit until hand score at least 17
    #   Compare winner  
    deal_cards
    show_initial_cards
    player_turn
    # dealer_turn
    # show_result
  end

  def deal_cards
    @player.draw_cards_and_update_hand_value(@deck, 2)
    @dealer.draw_cards_and_update_hand_value(@deck, 2)
  end

  def show_initial_cards
    @player.show_hand
    @dealer.show_hand(true)
  end

  def player_turn
    user_input = ask_user_input("Input 'h' to hit, and 's' to stay",%w(h s))
    puts user_input
  end
end

# Deck contains Cards. Can Shuffle and Deal topmost card
class Deck  
  attr_reader :deck
  include SuitsAndValues

  def initialize
    @deck = []
    suits_values_product = SuitsAndValues::CARD_SUITS.product(SuitsAndValues::CARD_VALUES)
    suits_values_product.each do |suit_value_array|
      suit = suit_value_array[0]
      value = suit_value_array[1]
      @deck << Card.new(suit, value)
    end
  end

  def shuffle!
    @deck.shuffle!
  end

  def draw_top_card
    card = @deck.shift
  end

  def to_s
    @deck.each {|card| puts card}
  end
end

# Card: Knows its own suit and value
class Card
  include SuitsAndValues
  attr_reader :value, :suit
  
  def initialize(suit, value)
    value = value.to_s # prevent numerical integer
    raise "Invalid card value" unless SuitsAndValues::CARD_VALUES.include?(value)
    raise "Invalid card suit" unless SuitsAndValues::CARD_SUITS.include?(suit)
    @value = value
    @suit = suit
  end
  
  def to_s
    "#{@value} #{@suit}"
  end

  def inspect
    to_s
  end

end

# Participant: have a hand of cards, know hand value, can draw card from deck.
class Participant
  include GameUtils

  attr_reader :hand_cards, :hand_value
  def initialize(name = "Participant")
    @name = name
    @hand_cards = []
    @hand_value = 0
  end

  def draw_cards_and_update_hand_value(deck, n = 1)
    draw_cards(deck, n)
    update_hand_value
  end

  def show_hand
    prompt "#{@name} has: #{join_and(card_values_string)}. Total value: #{@hand_value}"
  end

  def calculate_hand_value
    total_value = 0
    ace_counter = 0
    card_values_string.each do |value_string|
      if value_string.to_i != 0 # (value is 2..10)
        total_value += value_string.to_i
      elsif %w(Jack Queen King).include?(value_string)
        total_value += 10
      elsif value_string == "Ace"
        total_value += 11
        ace_counter += 1
      end
    end

    # Correct for Aces
    while total_value > 21 && ace_counter > 0
      total_value -= 10
      ace_counter -= 1
    end
    total_value
  end

  def card_values_string
    # returns array containing card values (string, such as ["2","Ace" ])
    @hand_cards.map(&:value)
  end

  private

  def draw_cards(deck, n = 1)
    n.times{ @hand_cards << deck.draw_top_card}
  end

  def update_hand_value
    @hand_value = calculate_hand_value
  end
end

# Player has a name. Player can choose to hit/stay. Player can show cards
class Player < Participant
  def initialize(name = "Player")
    super
  end

  def choose_hit_or_stay
  end



end

# Dealer draws until score is at least 17
class Dealer < Participant
  def initialize(name = "Dealer")
    super
  end

  def draw_until_at_least_seventeen(deck)
    while @hand_value < 17
      draw_cards_and_update_hand_value(deck, 1)
    end
  end

  def show_hand(hide_first_card = false)
    if hide_first_card
      values_string = card_values_string
      values_string[0] = "Unknown card"
      prompt "#{@name} has: #{join_and(values_string)}"
    else
      super()
    end
  end

end

game = TwentyOneGame.new
game.start