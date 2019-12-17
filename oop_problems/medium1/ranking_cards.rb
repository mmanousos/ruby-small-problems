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
class Card
  include Comparable
  attr_reader :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def convert_face
    case self.rank
    when 'Jack' then 11
    when 'Queen' then 12
    when 'King' then 13
    when 'Ace' then 14
    end
  end

  def <=>(other)
    val1 = self.rank.to_i == 0 ? self.convert_face : self.rank
    val2 = other.rank.to_i == 0 ? other.convert_face : other.rank
    val1 <=> val2
  end

  # def min
  #   ranks = []
  #   self.each { |card| ranks << card.rank }
  #   ranks.min
  #   # or
  #   # self.sort_by do |card|
  #   #   card.rank.to_i == 0 ? card.convert_face : card.rank
  #   # end.first
  # end
  # #
  # def max
  #   ranks = []
  #   self.each { |card| ranks << card.rank }
  #   ranks.max
  #   # or
  #   # self.sort_by do |card|
  #   #   card.rank.to_i == 0 ? card.convert_face : card.rank
  #   # end.last
  # end

  def to_s
    "#{rank} of #{suit}"
  end
end

# class Card
#   attr_reader :rank, :suit
#   include Comparable
#
#   def initialize(rank, suit)
#     @rank = rank
#     @suit = suit
#   end
#
#   VALUES = { "Jack" => 11, "Queen" => 12, "King" => 13, "Ace" => 14 }
#
#   def to_s
#     "#{rank} of #{suit}"
#   end
#
#   def value
#     VALUES.fetch(@rank, @rank)
#   end
#
#   def <=>(other)
#     value <=> other.value
#   end
# end

cards = [Card.new(2, 'Hearts'),
         Card.new(10, 'Diamonds'),
         Card.new('Ace', 'Clubs')]

# puts cards
puts cards.min == Card.new(2, 'Hearts')
puts cards.max == Card.new('Ace', 'Clubs')
#
cards = [Card.new(5, 'Hearts')]
puts cards.min == Card.new(5, 'Hearts')
puts cards.max == Card.new(5, 'Hearts')

cards = [Card.new(4, 'Hearts'),
         Card.new(4, 'Diamonds'),
         Card.new(10, 'Clubs')]
puts cards.min.rank == 4
puts cards.max == Card.new(10, 'Clubs')

cards = [Card.new(7, 'Diamonds'),
         Card.new('Jack', 'Diamonds'),
         Card.new('Jack', 'Spades')]
puts cards.min == Card.new(7, 'Diamonds')
puts cards.max.rank == 'Jack'

cards = [Card.new(8, 'Diamonds'),
         Card.new(8, 'Clubs'),
         Card.new(8, 'Spades')]
puts cards.min.rank == 8
puts cards.max.rank == 8
# Output:
#
# 2 of Hearts
# 10 of Diamonds
# Ace of Clubs
# true
# true
# true
# true
# true
# true
# true
# true
# true
# true
