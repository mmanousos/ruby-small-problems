# Deck of Cards
# Using the Card class from the previous exercise, create a Deck class that
# contains all of the standard 52 playing cards.
# Use the following code to start your work:
#
# class Deck
#   RANKS = (2..10).to_a + %w(Jack Queen King Ace).freeze
#   SUITS = %w(Hearts Clubs Diamonds Spades).freeze
# end
#
# The Deck class should provide a #draw method to draw one card at random.
# If the deck runs out of cards, the deck should reset itself by generating a
# new set of 52 cards.
#
# Examples:

# deck = Deck.new
# drawn = []
# 52.times { drawn << deck.draw }
# drawn.count { |card| card.rank == 5 } == 4
# drawn.count { |card| card.suit == 'Hearts' } == 13
#
# drawn2 = []
# 52.times { drawn2 << deck.draw }
# drawn != drawn2 # Almost always.
#
# Note that the last line should almost always be true; if you shuffle the deck
# 1000 times a second, you will be very, very, very old before you see two
# consecutive shuffles produce the same results. If you get a false result, you
# almost certainly have something wrong.

class Card
  include Comparable
  attr_reader :rank, :suit

  CARDS = { 'Jack' => 11, 'Queen' => 12, 'King' => 13, 'Ace' => 14 }
  # SUITS = { 'Diamonds' => 0, 'Clubs' => 1, 'Hearts' => 2, 'Spades' => 3 }

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def to_s
    "#{rank} of #{suit}"
  end

  def <=>(other_card)
    # suit_value <=> other_card.suit_value if value == other_card.value
    value <=> other_card.value
  end

  def value
    CARDS.fetch(@rank, @rank)
  end

  # def suit_value
  #   SUITS.fetch(@suit)
  # end
end

class Deck
  RANKS = (2..10).to_a + %w(Jack Queen King Ace).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze

  def initialize
    @deck = { }
    new_deck
  end

  def new_deck # always in the same order
    SUITS.clone.each do |suit|
      @deck[suit] = RANKS.clone.each { |rank| [rank] }
    end
  end

  # check if all ranks in @deck are empty
  def deck_empty?
    @deck.values.all? { |ranks| ranks.empty? }
  end

  # draws randomly
  # removes cards from deck as they are drawn so they can not be repeated
  def draw
    new_deck if deck_empty?
    suit = ''
    rank = nil
    loop do
      suit = SUITS.sample
      rank = @deck[suit].sample
      break if rank != nil
    end
    @deck[suit].delete(rank)
    Card.new(rank, suit)
  end
end

deck = Deck.new
drawn = []
52.times { drawn << deck.draw }
p drawn.count { |card| card.rank == 5 } == 4
p drawn.count { |card| card.suit == 'Hearts' } == 13

drawn2 = []
52.times { drawn2 << deck.draw }
p drawn != drawn2 # Almost always.

# Course Solution
# class Deck
#   RANKS = (2..10).to_a + %w(Jack Queen King Ace).freeze
#   SUITS = %w(Hearts Clubs Diamonds Spades).freeze
#
#   def initialize
#     reset
#   end
#
#   def draw
#     reset if @deck.empty?
#     @deck.pop
#   end
#
#   private
#
#   def reset
#     @deck = RANKS.product(SUITS).map do |rank, suit|
#       Card.new(rank, suit)
#     end
#
#     @deck.shuffle!
#   end
# end
