# Given 2 strings, your job is to find out if there is a substring
# that appears in both strings. You will return true if you find a
# substring that appears in both strings, or false if you do not.
#  We only care about substrings that are longer than one letter long.

# p substring_test('Something', 'Fun') == false
# p substring_test('Something', 'Home') == true
# p substring_test('Something', 'Fun') == false
# p substring_test('Something', '') == false
# p substring_test('', 'Something') == false
# p substring_test('BANANA', 'banana') == true
# p substring_test('test', 'lllt') == false
# p substring_test('', '') == false
# p substring_test('1234567', '541265') == true
# p substring_test('supercalifragilisticexpialidocious', 'SoundOfItIsAtrociou') == true
=begin
input: two strings
output: boolean indicating if there is a substring of 2 or more letters that exists in both arguments

AL:
If either argument string is fewer than 2 characters, return false
loop through first argument breaking it into strings of 2 characters,
  iterating through from 0 index then to 1st index, etc.
check each of those 2-character strings against the second argument.
if any are true, return true
else return false.
=end

# def substring_test(str1, str2)
#   return false if str1.size < 2 || str2.size < 2
#
#   counter = 0
#   loop do
#     sub_str = str1[counter..counter+1].downcase
#
#     break if counter > str1.size || sub_str.size < 2
#
#     return true if str2.include?(sub_str)
#     counter += 1
#
#   end
#
#   return false
# end
#
# p substring_test('Something', 'Fun') == false
# p substring_test('Something', 'Home') == true
# p substring_test('Something', 'Fun') == false
# p substring_test('Something', '') == false
# p substring_test('', 'Something') == false
# p substring_test('BANANA', 'banana') == true
# p substring_test('test', 'lllt') == false
# p substring_test('', '') == false
# p substring_test('1234567', '541265') == true
# p substring_test('supercalifragilisticexpialidocious', 'SoundOfItIsAtrociou') == true


# If we list all the natural numbers below 10 that are multiples of 3 or 5,
#  we get 3, 5, 6 and 9. The sum of these multiples is 23.

# Finish the solution so that it returns the sum of all the multiples
# of 3 or 5 below the number passed in.

# Note: If the number is a multiple of both 3 and 5, only count it once.

# in: integer representing the upper bound of a range (exclusive)
# out: integer representing the sum of all the multiples of 3 or 5 in the range below the argument
#
# AL: create a range from 1 to the argument
# select all numbers within the range that are either divisible by 3 or 5 in a new array
# add the contents of the new array and return the value

# def sum_of_multiples(num)
#   multiples = *(1...num).select { |n| n % 3 == 0 || n % 5 == 0 }
#   multiples.sum
# end
#
# p sum_of_multiples(10) == 23
# p sum_of_multiples(20) == 78
# p sum_of_multiples(200) == 9168

# Write a method that returns an array of all of the substrings of two or more characters from a given string.

# in: string
# out: array of all substrings of 2  or more characters
#
# AL:
# iterate over the
# 0 ..1; 0..2; 0 ..3; ..; 0..-1
# range of numbers representing the size of the string
# iterate over the range to build our substrings.
#
# counter to increment over the string
# move to the 1st index position, etc.
#
# counter = 0
# arr = []
# iterate over the string
# ending when counter >= string.length
#
# generate and push all substrings from counter...-1


def all_strings(string)
  counter = 0
  arr = []
  while counter < string.size
    1.upto(string.size - 1) do |index|
      sub_str = string[counter..index]
      arr << sub_str if sub_str.size > 1
    end
      counter += 1
    end

  arr
end

p all_strings('hello') # == ['he', 'hel', 'hell', 'hello', 'el', 'ell', 'ello', 'll' , 'llo' 'lo']
