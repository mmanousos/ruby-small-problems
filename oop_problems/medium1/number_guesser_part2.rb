# Number Guesser Part 2
# In the previous exercise, you wrote a number guessing game that determines a
# secret number between 1 and 100, and gives the user 7 opportunities to guess
# the number.
#
# Update your solution to accept a low and high value when you create a
# GuessingGame object, and use those values to compute a secret number for the
# game. You should also change the number of guesses allowed so the user can
# always win if she uses a good strategy. You can compute the number of
# guesses with: Math.log2(size_of_range).to_i + 1

# in: upper and lower values for range
# Adjusted values for range
# Adjusted number of guesses to allow the user a reasonable chance to win.
# Math.log2(size_of_range).to_i + 1

class GuessingGame
  def initialize(lower, upper)
    @lower_bound = lower
    @upper_bound = upper
    @valid_numbers = [*@lower_bound..@upper_bound]
    @max_guesses = Math.log2(@valid_numbers.size).to_i + 1
  end

  def play # (game engine)
    new_game
    while guesses?
      start_round
      loop do
        break if valid_play?
        display_range_error
        ask_again
      end
      reduce_guesses
      compare_guess
      break if winner == true
    end
    end_game
  end

  protected
  attr_accessor :number, :guesses, :winner, :guess

  def new_game
    self.guesses = @max_guesses
    self.number = @valid_numbers.sample
    self.winner = false
  end

  def display_guesses
    "You have #{guesses} guesses remaining."
  end

  def display_range
    "Enter a number between #{@lower_bound} and #{@upper_bound}: "
  end

  def retrieve_guess
    self.guess = gets.to_i
  end

  def start_round
    puts
    puts display_guesses
    puts display_range
    retrieve_guess
  end

  def ask_again
    puts display_range
    retrieve_guess
  end

  def valid_play?
    @valid_numbers.cover?(guess)
  end

  def display_range_error
    print 'Invalid guess. '
  end

  def reduce_guesses
    self.guesses -= 1
  end

  def compare_guess
    if guess > number
      display_high
    elsif guess < number
      display_low
    else
      self.winner = true
    end
  end

  def guesses?
    guesses > 0
  end

  def display_high
    puts 'Your guess is too high.'
  end

  def display_low
    puts 'Your guess is too low.'
  end

  def end_game
    winner ? display_win : display_lose
  end

  def display_win
    puts 'You win!'
  end

  def display_lose
    puts 'You are out of guesses. You lose.'
  end
end


# Examples:
game = GuessingGame.new(501, 1500)
game.play

# You have 10 guesses remaining.
# Enter a number between 501 and 1500: 104
# Invalid guess. Enter a number between 501 and 1500: 1000
# Your guess is too low
#
# You have 9 guesses remaining.
# Enter a number between 501 and 1500: 1250
# Your guess is too low
#
# You have 8 guesses remaining.
# Enter a number between 501 and 1500: 1375
# Your guess is too high
#
# You have 7 guesses remaining.
# Enter a number between 501 and 1500: 80
# Invalid guess. Enter a number between 501 and 1500: 1312
# Your guess is too low
#
# You have 6 guesses remaining.
# Enter a number between 501 and 1500: 1343
# Your guess is too low
#
# You have 5 guesses remaining.
# Enter a number between 501 and 1500: 1359
# Your guess is too high
#
# You have 4 guesses remaining.
# Enter a number between 501 and 1500: 1351
# Your guess is too high
#
# You have 3 guesses remaining.
# Enter a number between 501 and 1500: 1355
# You win!

game.play
# You have 10 guesses remaining.
# Enter a number between 501 and 1500: 1000
# Your guess is too high
#
# You have 9 guesses remaining.
# Enter a number between 501 and 1500: 750
# Your guess is too low
#
# You have 8 guesses remaining.
# Enter a number between 501 and 1500: 875
# Your guess is too high
#
# You have 7 guesses remaining.
# Enter a number between 501 and 1500: 812
# Your guess is too low
#
# You have 6 guesses remaining.
# Enter a number between 501 and 1500: 843
# Your guess is too high
#
# You have 5 guesses remaining.
# Enter a number between 501 and 1500: 820
# Your guess is too low
#
# You have 4 guesses remaining.
# Enter a number between 501 and 1500: 830
# Your guess is too low
#
# You have 3 guesses remaining.
# Enter a number between 501 and 1500: 835
# Your guess is too low
#
# You have 2 guesses remaining.
# Enter a number between 501 and 1500: 836
# Your guess is too low
#
# You have 1 guesses remaining.
# Enter a number between 501 and 1500: 837
# Your guess is too low
#
# You are out of guesses. You lose.

# Note that a game object should start a new game with a new number to guess
# with each call to #play.
