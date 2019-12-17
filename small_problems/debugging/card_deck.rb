=begin
*assignment*
Card Deck
We started working on a card game but got stuck. Check out why the code below
raises a TypeError.

Once you get the program to run and produce a sum, you might notice that the sum
is off: It's lower than it should be. Why is that?
=end

cards = [2, 3, 4, 5, 6, 7, 8, 9, 10, :jack, :queen, :king, :ace]

deck = { :hearts   => cards,
         :diamonds => cards,
         :clubs    => cards,
         :spades   => cards }

def score(card)
  case card
  when :ace   then 11
  when :king  then 10
  when :queen then 10
  when :jack  then 10
  else card
  end
end

# Pick one random card per suit

player_cards = []
deck.each_pair do |suit, cards|
  cards.shuffle!
  player_cards << cards.last
  deck[suit] = cards[0..-2]
end

# Determine the score of the remaining cards in the deck

sum = deck.reduce(0) do |sum, (_, cards)|
  cards = cards.map do |card|
    score(card)
  end

  sum += cards.sum
end

puts sum

=begin
The code as it is produces a TypeError, saying :queen can not be coerced
into an integer in the reassignment sum += cards.sum.
This leads me to believe that the score method defined on lines 17-25 is not
being invoked or the return value from that method is not being utilized.

The first error is that the mapped values of the cards array was not being
assigned to a new variable so the reassignment of sum to cards.sum was trying to
reduce the original cards array which still contained all of the symbols.
Assigning the return value of the Array#map method call to the cards variable
corrects for this.

The second error is that all of the arrays of cards are identical, which tells
me that the random selection of one card per suit that is supposed to be
happenging on lines 30-35 is not operating as intended.
On each iteration, all four suits are being shuffled and the last element from
every array is being removed instead of only the one for the suit in question.
I've replaced Hash#keys and Array#each with Hash#each_pair so I can access the
key and array value. Then replaced Array#pop method with Array#last to only
access the final element in the shuffled array to push its value into
player_cards. Then I reassign the shuffled array minus the final element to the
key in question using deck[suit] = cards[0..-2].
This also retains the shuffled suits for later. I don't know if that is
desirable for the remainder of gameplay.

I'm sure there's an easier way to correct for the deck shortening, but it's not
coming to me right now.
=end

# Course Solution
The course solution is to simply invoke #clone on each of the card arrays when
they are assigned to the values for each suit in the hash.
This is far more straight forward than my solution and explains why I could not
figure out why the looping methods I was checking were continuing to mutate all
of the arrays, not just the one being called.
