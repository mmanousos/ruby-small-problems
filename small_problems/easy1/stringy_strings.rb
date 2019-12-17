require 'pry'
=begin
*assignment*
Stringy Strings
Write a method that takes one argument, a positive integer, and returns a string
of alternating 1s and 0s, always starting with 1. The length of the string
should match the given integer.

Examples:
  puts stringy(6) == '101010'
  puts stringy(9) == '101010101'
  puts stringy(4) == '1010'
  puts stringy(7) == '1010101'

The tests above should print true.

*problem*
  input: positive integer - do not need to account for alternate data types
  output: string of 1s and 0s of length to match provided integer, always
  starting with '1'
  assign integer as an upper limit
  create a counter, starting at 1
  if counter is odd, add a 1 to the string; if even, add a 0
  return the string

*examples / test cases*
see above

*data structures*
  input: integer
  output: string

*algorithm*
START
  method receives integer
  SET counter = 1
  SET string = ''
    WHILE integer > counter
      IF counter % 2 != 0
        string >> '1'
      ELSE
        string >> '0'
      end
    counter =+ 1
    end
  PRINT string
  end
END
=end


def stringy(int)
  counter = 1
  string = ''
  while counter <= int
    if counter % 2 != 0
      string << '1'
    else
      string << '0'
    end
    counter += 1
  end
  return string
end

puts stringy(2) == '10'
puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'


=begin
*course solution*

def stringy(size)
  numbers = []

  size.times do |index|
    number = index.even? ? 1 : 0
    numbers << number
  end

  numbers.join
end
=end

# Further Exploration
=begin
Modify stringy so it takes an optional argument that defaults to 1.
If the method is called with this argument set to 0, the method should return a
String of alternating 0s and 1s, but starting with 0 instead of 1.

def stringy(size, arg=1)
  numbers = []

  size.times do |index|
    if arg == 0
      number = index.even? ? 0 : 1
    else
      number = index.even? ? 1 : 0
    end
    numbers << number
  end

  numbers.join
end
puts stringy(2, 0) == '01'
=end
