=begin
*assignment*
Convert a String to a Number!
The String#to_i method converts a string of numeric characters (including an
optional plus or minus sign) to an Integer. String#to_i and the Integer
constructor (Integer()) behave similarly. In this exercise, you will create a
method that does the same thing.

Write a method that takes a String of digits, and returns the appropriate number
as an integer. You may not use any of the methods mentioned above.

For now, do not worry about leading + or - signs, nor should you worry about
invalid characters; assume all characters will be numeric.

You may not use any of the standard conversion methods available in Ruby, such
as String#to_i, Integer(), etc. Your method should do this the old-fashioned way
and calculate the result by analyzing the characters in the string.

Examples
string_to_integer('4321') == 4321
string_to_integer('570') == 570

*problem*
input: string
output: integer
assume string contains only positive numbers, no letters or other characters

reverse string & split into characters

map all possible values to a hash for reference ('1' => 1) or
check each character using case statement (when '1' then 1)

use a loop + multiplier where multiplier = digits place
  first number = 1s place
  second number = 10s place
  third number = 100s place
  etc.
  10 ** multiplier
each match => number * 10 ** multiplier
keep running total
return total

*examples / test cases *
see above

*data structures*
string
integer

*algorithm*
START
  declare method that takes one string as an argument
  digits = { '1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9}
  SET array_of_characters = reverse string and break it into characters
  SET counter = 0
  SET multiplier = counter + 1
  SET number = nil
  WHILE array.length > counter
    SET value = digits[array_of_characters[counter]]
    number += value * 10 ** multiplier
    counter += 1
  end
END
=end
def string_to_integer(str)
  DIGITS = { '1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9, '0' => 0}
  arr_of_char = str.reverse.chars # split the string into characters reversed so the ones position is first, tens is second, etc.
  counter = 0 # counter to access the first element of the array
  number = 0 # number is the output we're looking for (the string converted to a number)

  while arr_of_char.length > counter # loop while the counter is less than the length of the array of string characters
    multiplier = counter + 1 # a multiplier to calculate where the values should fall within the number.
    value = DIGITS[arr_of_char[counter]] # access the correct number from the hash
    number += (value * (10 ** multiplier)) # multiply the value by a power of 10 to position it correctly in the return value
    counter += 1 # increment the counter
  end
  number / 10 # divide the number by 10 to remove the trailing 0.
end

p string_to_integer('4321') == 4321
p string_to_integer('570') == 570

# using #map and #each per course solution.
require 'pry'
DIGITS = { '1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9, '0' => 0}
def string_to_integer(str)
  numbers = str.chars.map {|val| DIGITS[val]} # converts string to an array of strings, then converts each element (string) to its corresponding hash number

  value = 0 # placeholder for final value
  numbers.each do |num|
    binding.pry
    value = 10 * value + num  # cycle through each number in the mapped array, multiply 10 by the current value to shift its place, and then add the current number
  end
  value
end

p string_to_integer('4321') == 4321
p string_to_integer('570') == 570

# Further Exploration
=begin
Write a hexadecimal_to_integer method that converts a string representing a hexadecimal number to its integer value.

Example:
hexadecimal_to_integer('4D9f') == 19871
=end

https://www.rapidtables.com/convert/number/hex-to-decimal.html

4D9F = (4 × 16³) + (13 × 16²) + (9 × 16¹) + (15 × 16⁰) = 19871

4 * 4096 = 16384 +
13 * 256 =  3328 +
9 * 16   =   144 +
15 * 1        15 =
                  19871

START
  map each character from string to integer in array corresponding to hex values
  multiply each integer by 16^n where n represents that digit in the number
    (calculate n by counting down length of string)
  add each resulting integer together for the total return value
  PRINT total return value
END

HEX_VALUES = { '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5,
               '6' => 6, '7' => 7, '8' => 8, '9' => 9, 'a' => 10, 'b' => 11,
               'c' => 12, 'd' => 13, 'e' => 14, 'f' => 15 }

def hexadecimal_to_integer(string)
  values = string.downcase.chars.map { |char| HEX_VALUES[char] }
  multiplier = string.length - 1
  final = 0
  values.each do |value|
    final += value * 16**multiplier
    multiplier -= 1
  end
  final
end

hexadecimal_to_integer('4D9f') #== 19871
