class Card
  include Comparable
  attr_reader :rank, :suit
  RANK_VALUES = {
    "Jack" => 11,
    "Queen" => 12,
    "King" => 13,
    "Ace" => 14
  }
  SUIT_VALUES = {
    "Spades" => 0.8,
    "Hearts" => 0.6,
    "Clubs" => 0.4,
    "Diamonds" => 0.2
  }

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def to_s
    "#{@rank} of #{@suit}"
  end

  def value
    RANK_VALUES.fetch(@rank, @rank) 
    # + SUIT_VALUES[@suit]
  end

  def <=>(other_card)
    value <=> other_card.value
  end

end

# cards = [ Card.new(4, 'Hearts'),
#           Card.new(4, 'Spades'),
#           Card.new(5, 'Diamonds'),
#           Card.new(4, "Clubs"),
#           Card.new(4, "Diamonds")]
# p cards
# p cards.sort

# cards = [Card.new(2, 'Hearts'),
#          Card.new('Ace', 'Clubs'),
#          Card.new(10, 'Diamonds')]

# p cards.sort

# puts cards.min == Card.new(2, 'Hearts')
# puts cards.max == Card.new('Ace', 'Clubs')

# cards = [Card.new(5, 'Hearts')]
# puts cards.min == Card.new(5, 'Hearts')
# puts cards.max == Card.new(5, 'Hearts')

# cards = [Card.new(4, 'Hearts'),
#   Card.new(4, 'Diamonds'),
#   Card.new(10, 'Clubs')]
# puts cards.min.rank == 4
# puts cards.max == Card.new(10, 'Clubs')

# cards = [Card.new(7, 'Diamonds'),
#   Card.new('Jack', 'Diamonds'),
#   Card.new('Jack', 'Spades')]
# puts cards.min == Card.new(7, 'Diamonds')
# puts cards.max.rank == 'Jack'

# cards = [Card.new(8, 'Diamonds'),
#   Card.new(8, 'Clubs'),
#   Card.new(8, 'Spades')]
# puts cards.min.rank == 8
# puts cards.max.rank == 8
