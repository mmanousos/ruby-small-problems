=begin
*assignment*
Convert a Signed Number to a String!
In the previous exercise, you developed a method that converts non-negative
numbers to strings. In this exercise, you're going to extend that method by
adding the ability to represent negative numbers as well.

Write a method that takes an integer, and converts it to a string
representation.

You may not use any of the standard conversion methods available in Ruby, such
as Integer#to_s, String(), Kernel#format, etc. You may, however, use
integer_to_string from the previous exercise.

Examples
signed_integer_to_string(4321) == '+4321'
signed_integer_to_string(-123) == '-123'
signed_integer_to_string(0) == '0'

*problem*
input: positive or negative integer
output: string representing a positive or negative integer

if int < 0, prepend '-'
if int > 0, prepend '+'

*examples / test cases *
see above

*data structures*
integer to string

*algorithm*
START
  declare method that accepts single integer as argument
    IF integer < 0
      SET negative = to first character of integer
      delete first character from integer
    end
    string = integer_to_string(int)

    IF negative
      prepend '-' to string
    ELSEIF integer > 0
      prepend '+' to string
    end

    PRINT string
END
=end
DIGITS = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']

def integer_to_string(int)
    int.digits.reverse.map { |num| DIGITS[num] }.inject(:+)
end

def signed_integer_to_string(int)
  if int < 0
    negative = true
    int = int.abs
  end

  string = integer_to_string(int)

  if negative
    string.prepend('-')
  elsif string == '0'
    string
  else
    string.prepend('+')
  end

  string
end

# course solution
=begin
def signed_integer_to_string(number)
  case number <=> 0
  when -1 then "-#{integer_to_string(-number)}"
  when +1 then "+#{integer_to_string(number)}"
  else         integer_to_string(number)
  end
end
=end

# Further Exploration
# Refactor our solution to reduce the 3 integer_to_string calls to just one.

def signed_integer_to_string(number)
  string = integer_to_string(number.abs) # pass the absolute value of the integer to the integer_to_string method (leaves original number unchanged so its value relative to 0 can be evaluated by the case expression)
  case number <=> 0
  when -1 then "-#{string}"
  when +1 then "+#{string}"
  else         string
  end
end

p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'
