require_relative("09_deck_of_cards.rb")

class PokerHand
  def initialize(deck)
    @cards = []
    5.times{ @cards << deck.draw }
    @cards.sort!
  end

  def print
    @cards.each{|card| p card}
  end

  def suits
    @cards.map(&:suit)
  end

  def values
    @cards.map(&:value)
  end

  def evaluate
    case
    when royal_flush?     then 'Royal flush'
    when straight_flush?  then 'Straight flush'
    when four_of_a_kind?  then 'Four of a kind'
    when full_house?      then 'Full house'
    when flush?           then 'Flush'
    when straight?        then 'Straight'
    when three_of_a_kind? then 'Three of a kind'
    when two_pair?        then 'Two pair'
    when pair?            then 'Pair'
    else                       'High card'
    end
  end

  private

  def duplication_pattern_array
    # Counts number of duplicates in @cards, saves in array, and
    # returns the sorted array.
    # Possible values: [1,1,1,1,1], [1,1,1,2], [1,1,3], [1,4] , [1,2,2], [2,3]
    result = []
    values.uniq.each do |uniq_card_value|
      result << values.count(uniq_card_value)
    end
    result.sort!
  end
  
  def royal_flush?
    values.min == 10 && straight_flush?
  end

  def straight_flush?
    straight? && flush?
  end

  def four_of_a_kind?
    return true if duplication_pattern_array == [1,4]
    false
  end

  def full_house?
    return true if duplication_pattern_array == [2, 3]
    false
  end

  def flush?
    suits.uniq.length == 1
  end

  def straight?
    card_values = values
    (1..4).each do |i|
      return false if (card_values[i] - card_values[i-1]) != 1
    end
    true
  end

  def three_of_a_kind?
    return true if duplication_pattern_array == [1, 1, 3]
    false
  end

  def two_pair?
    return true if duplication_pattern_array == [1, 2, 2]
    false
  end

  def pair?
    return true if duplication_pattern_array == [1, 1, 1, 2]
    false
  end
end

# Danger danger danger: monkey
# patching for testing purposes.
class Array
  alias_method :draw, :pop
end

hand = PokerHand.new([
  Card.new(10,      'Hearts'),
  Card.new('Ace',   'Hearts'),
  Card.new('Queen', 'Hearts'),
  Card.new('King',  'Hearts'),
  Card.new('Jack',  'Hearts')
])
puts hand.evaluate # 'Royal flush'

hand = PokerHand.new([
  Card.new(8,       'Clubs'),
  Card.new(9,       'Clubs'),
  Card.new('Queen', 'Clubs'),
  Card.new(10,      'Clubs'),
  Card.new('Jack',  'Clubs')
])
puts hand.evaluate # Straight Flush

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(3, 'Diamonds')
])
puts hand.evaluate # 'Four of a kind'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(5, 'Hearts')
])
puts hand.evaluate # 'Full house'





hand = PokerHand.new(
  [Card.new(10,'Hearts'),
   Card.new('Ace', 'Hearts'),
   Card.new(2, 'Hearts'),
   Card.new('King', 'Hearts'),
   Card.new(3, 'Hearts')] )
puts hand.evaluate  # Flush

hand = PokerHand.new([
  Card.new(8,      'Clubs'),
  Card.new(9,      'Diamonds'),
  Card.new(10,     'Clubs'),
  Card.new(7,      'Hearts'),
  Card.new('Jack', 'Clubs')
])
puts hand.evaluate  # Straight

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(6, 'Diamonds')
])
puts hand.evaluate # 'Three of a kind'

hand = PokerHand.new([
  Card.new(9, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(8, 'Spades'),
  Card.new(5, 'Hearts')
])
puts hand.evaluate # 'Two pair'

hand = PokerHand.new([
  Card.new(2, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(9, 'Spades'),
  Card.new(3, 'Diamonds')
])
puts hand.evaluate # 'Pair'

hand = PokerHand.new([
  Card.new(2,      'Hearts'),
  Card.new('King', 'Clubs'),
  Card.new(5,      'Diamonds'),
  Card.new(9,      'Spades'),
  Card.new(3,      'Diamonds')
])
puts hand.evaluate # 'High card'