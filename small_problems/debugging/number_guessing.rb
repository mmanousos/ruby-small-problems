=begin
#*assignment*
Number Guessing Game
A friend of yours wrote a number guessing game. The first version he shows you picks a random number between 1 and a provided maximum number and offers you a given number of attempts to guess it.

However, when you try it, you notice that it's not working as expected. Run the code and observe its behavior. Can you figure out what is wrong?

require 'pry'
def valid_integer?(string)
  string.to_i.to_s == string
end

def guess_number(max_number, max_attempts)
  winning_number = (1..max_number).to_a.sample
  binding.pry
  attempts = 0

  loop do
    attempts += 1
    break if attempts > max_attempts

    input = nil
    until valid_integer?(input)
      print 'Make a guess: '
      input = gets.chomp
    end

    guess = input.to_i

    if guess == winning_number
      binding.pry
      puts 'Yes! You win.'
    else
      binding.pry
      puts 'Nope. Too small.' if guess < winning_number
      puts 'Nope. Too big.'   if guess > winning_number

      # Try again:
      guess_number(max_number, max_attempts)
    end
  end
end

guess_number(10, 3)
=end
A few problems:
1) there appears to be no break condition so plays indefinitely.
2) it does not provide error messages if floats are used, just asks again for a number.
3) the target number changes. I guessed 10 (too big), then 2 and 5 (both too small).
Then 9 (also too big), so I started working my way down. 5 was still considered
too big on this pass, as was 4. Then 3 was too small, as was 2, but then 1 was
the winner. So either the target is changing or the comparison logic for
displaying the outputs is wrong.
* Looking over the code, as I suspected, the target number is changing!
* Also, on each pass, the number of attempts is reset to nil

Removing the recursive call to guess_number is important to prevent the target
number from changing and attempts being reset to 0.
Adding a break after the winning condition exits the game on a win.

def valid_integer?(string)
  string.to_i.to_s == string
end

def guess_number(max_number, max_attempts)
  winning_number = (1..max_number).to_a.sample
  attempts = 0

  while attempts < max_attempts
    attempts += 1

    input = nil
    until valid_integer?(input)
      print 'Make a guess: '
      input = gets.chomp
    end

    guess = input.to_i

    if guess == winning_number
      puts 'Yes! You win.'
      break
    else
      puts 'Nope. Too small.' if guess < winning_number
      puts 'Nope. Too big.'   if guess > winning_number
    end
  end
end

guess_number(10, 3)
