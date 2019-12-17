=begin
*assignment*
Convert a String to a Signed Number!
In the previous exercise, you developed a method that converts simple numeric
strings to Integers. In this exercise, you're going to extend that method to
work with signed numbers.

Write a method that takes a String of digits, and returns the appropriate number
as an integer. The String may have a leading + or - sign; if the first character
is a +, your method should return a positive number; if it is a -, your method
should return a negative number. If no sign is given, you should return a
positive number.

You may assume the string will always contain a valid number.

You may not use any of the standard conversion methods available in Ruby, such
as String#to_i, Integer(), etc. You may, however, use the string_to_integer
method from the previous lesson.

Examples
string_to_signed_integer('4321') == 4321
string_to_signed_integer('-570') == -570
string_to_signed_integer('+100') == 100

*problem*
input: string representation of a positive or negative integer
output: positive or negative integer

capture first character of the string. If it is '-', save it to a variable and
multiply the final value by -1.

*examples / test cases *
see above

*data structures*
string to integer

*algorithm*
START
  SET conversion values to a hash { '0' = 0, '1' = 1, etc. }
  declare a method that takes a single string as an argument
    check first character of the string (string[0])
      IF string[0] == '-'
        SET negative = true and delete it from the string (string = string.delete('-'))
    SET digits = split the string into individual characters and map them to the hash values

    value = 0
    WHILE digits remain to check
      access each element of digits and set value to 10 * value + element
    end

    IF negative
      value *= -1
    end
    value
  end
END


DIGITS = { '1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6, '7' => 7,
           '8' => 8, '9' => 9, '0' => 0}

def string_to_signed_integer(string)
  if ('-+').include?string[0]
    if string[0] == '-'
      negative = true
    end
    string = string.delete('-+')
  end

  digits = string.chars.map { |char| DIGITS[char] }
  value = 0
  digits.each { |num| value = 10 * value + num }

  if negative
    value *= -1
  end

  value
end
=end
# Further Exploration
=begin In our solution, we call string[1..-1] twice, and call string_to_integer
three times. This is somewhat repetitive. Refactor our solution so it only makes
these two calls once each.

# course solution
def string_to_signed_integer(string)
  case string[0]
  when '-' then -string_to_integer(string[1..-1])
  when '+' then string_to_integer(string[1..-1])
  else          string_to_integer(string)
  end
end
=end

DIGITS = { '1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9, '0' => 0}
def string_to_integer(str)
  numbers = str.chars.map {|val| DIGITS[val]}

  value = 0
  numbers.each do |num|
    value = 10 * value + num
  end
  value
end

# doesn't quite meet criteria (includes method call 2x)
def string_to_signed_integer(string)
  if ('+-').include?string[0]
    first_char = string[0]
    string = string.delete('+-')
  end

  if first_char == '-'
    -(string_to_integer(string))
  else
    string_to_integer(string)
  end
end

# better - only calls method once
def string_to_signed_integer(string)
  if ('+-').include?string[0]
    first_char = string[0]
    string = string.delete('+-')
  end

  value = string_to_integer(string)
  if first_char == '-'
    return -value
  end
  value
end

p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100
