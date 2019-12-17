# Highest and Lowest Ranking Cards
# Update this class so you can use it to determine the lowest ranking and
# highest ranking cards in an Array of Card objects:
#
# class Card
#   attr_reader :rank, :suit
#
#   def initialize(rank, suit)
#     @rank = rank
#     @suit = suit
#   end
# end

# For this exercise, numeric cards are low cards, ordered from 2 through 10.
# Jacks are higher than 10s, Queens are higher than Jacks, Kings are higher
# than Queens, and Aces are higher than Kings. The suit plays no part in the
# relative ranking of cards.
#
# If you have two or more cards of the same rank in your list, your min and
# max methods should return one of the matching cards; it doesn't matter which
# one.
#
# Besides any methods needed to determine the lowest and highest cards, create
# a #to_s method that returns a String representation of the card, e.g.,
# "Jack of Diamonds", "4 of Clubs", etc.

# Examples:

# numbers in order < Jack (11) < Queen (12) < King (13) < Ace (14)

# convert face cards into numbers in order to evaluate them against others.

# suit order: Diamonds < Clubs < Hearts < Spades

class Card
  include Comparable
  attr_reader :rank, :suit

  CARDS = { 'Jack' => 11, 'Queen' => 12, 'King' => 13, 'Ace' => 14 }
  SUITS = { 'Diamonds' => 0, 'Clubs' => 1, 'Hearts' => 2, 'Spades' => 3 }

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def to_s
    "#{rank} of #{suit}"
  end

  def <=>(other_card)
    suit_value <=> other_card.suit_value if value == other_card.value
    value <=> other_card.value
  end

  def value
    CARDS.fetch(@rank, @rank)
  end

  def suit_value
    SUITS.fetch(@suit)
  end
end

cards = [Card.new(2, 'Hearts'),
         Card.new(10, 'Diamonds'),
         Card.new('Ace', 'Clubs')]

puts cards
puts cards.min == Card.new(2, 'Hearts')
puts cards.max == Card.new('Ace', 'Clubs')

cards = [Card.new('Jack', 'Clubs'),
         Card.new('Jack', 'Diamonds')]
puts cards.min == Card.new('Jack', 'Diamonds')
# puts cards.max.rank == 'Jack'
