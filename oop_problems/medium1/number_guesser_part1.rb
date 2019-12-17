# Number Guesser Part 1
# Create an object-oriented number guessing class for numbers in the range 1 to
# 100, with a limit of 7 guesses per game. The game should play like this:

class GuessingGame
  LOWER_BOUND = 1
  UPPER_BOUND = 100
  VALID_NUMBERS = [*LOWER_BOUND..UPPER_BOUND]
  GUESSES = 7

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
    self.guesses = GUESSES
    self.number = VALID_NUMBERS.sample
    self.winner = false
  end

  def display_guesses
    "You have #{guesses} guesses remaining."
  end

  def display_range
    "Enter a number between #{LOWER_BOUND} and #{UPPER_BOUND}: "
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
    VALID_NUMBERS.include?(guess)
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

game = GuessingGame.new
game.play

# You have 7 guesses remaining.
# Enter a number between 1 and 100: 104
# Invalid guess. Enter a number between 1 and 100: 50
# Your guess is too low
#
# You have 6 guesses remaining.
# Enter a number between 1 and 100: 75
# Your guess is too low
#
# You have 5 guesses remaining.
# Enter a number between 1 and 100: 85
# Your guess is too high
#
# You have 4 guesses remaining.
# Enter a number between 1 and 100: 0
# Invalid guess. Enter a number between 1 and 100: 80
#
# You have 3 guesses remaining.
# Enter a number between 1 and 100: 81
# You win!
#
game.play
#
# You have 7 guesses remaining.
# Enter a number between 1 and 100: 50
# Your guess is too high
#
# You have 6 guesses remaining.
# Enter a number between 1 and 100: 25
# Your guess is too low
#
# You have 5 guesses remaining.
# Enter a number between 1 and 100: 37
# Your guess is too high
#
# You have 4 guesses remaining.
# Enter a number between 1 and 100: 31
# Your guess is too low
#
# You have 3 guesses remaining.
# Enter a number between 1 and 100: 34
# Your guess is too high
#
# You have 2 guesses remaining.
# Enter a number between 1 and 100: 32
# Your guess is too low
#
# You have 1 guesses remaining.
# Enter a number between 1 and 100: 32
# Your guess is too low
# You are out of guesses. You lose.

# Note that a game object should start a new game with a new number to guess
# with each call to #play.

# Does this mean we should use a collaborator object to create a new game with
# each `play` call?
