=begin
*assignment*
fizzbuzz
Write a method that takes two arguments: the first is the starting number, and
the second is the ending number. Print out all numbers between the two numbers,
except if a number is divisible by 3, print "Fizz", if a number is divisible by
5, print "Buzz", and finally if a number is divisible by 3 and 5, print
"FizzBuzz".

Example:
fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz

*problem*
input: two integers
output: printed numbers incrementing up by 1 starting at the first integer and
ending at the second integer. Any values divisible by 3 replaced with 'Fizz';
values divisible by 5 replaced with 'Buzz', and values divisible by both
replaced with 'FizzBuzz'.

*examples / test cases *
See above

*data structures*
integers, array

*algorithm*
BEGIN
  declare a method that takes two integers as arguments
    SET arr = empty array to hold output
    SET counter = int1
    WHILE counter < int2
      IF counter % 3 == 0 && counter % 5 == 0
        arr << 'FizzBuzz'
      ELSEIF counter % 5 == 0
        arr << 'Buzz'
      ELSEIF counter % 3 == 0
        arr << 'Fizz'
      ELSE
        arr << counter
      end
      counter += 1
    end
    puts arr.join(', ')
END
=end

def fizzbuzz(int1, int2)
  arr = []
  counter = int1
  while counter <= int2
    if counter % 3 == 0 && counter % 5 == 0
      arr << 'FizzBuzz'
    elsif counter % 5 == 0
      arr << 'Buzz'
    elsif counter % 3 == 0
      arr << 'Fizz'
    else
      arr << counter
    end
    counter += 1
  end
  puts arr.join(', ')
end

# using Integer#upto
def fizzbuzz(int1, int2)
  arr = []
int1.upto(int2) do |num|
    if num % 3 == 0 && num % 5 == 0
      arr << 'FizzBuzz'
    elsif num % 5 == 0
      arr << 'Buzz'
    elsif num % 3 == 0
      arr << 'Fizz'
    else
      arr << num
    end
  end
  puts arr.join(', ')
end

# Course Solution - uses a helper method with a case statement avoiding my
# redundant 'arr <<' commands
def fizzbuzz(starting_number, ending_number)
  result = []
  starting_number.upto(ending_number) do |number|
    result << fizzbuzz_value(number)
  end
  puts result.join(', ')
end

def fizzbuzz_value(number)
  case
  when number % 3 == 0 && number % 5 == 0
    'FizzBuzz'
  when number % 5 == 0
    'Buzz'
  when number % 3 == 0
    'Fizz'
  else
    number
  end
end

fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz
fizzbuzz(9, 25) # -> Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz, 16, 17, Fizz, 19, Buzz, Fizz, 22, 23, Fizz, Buzz
