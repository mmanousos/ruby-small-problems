=begin
*assignment*
Palindromic Numbers
Write a method that returns true if its integer argument is palindromic, false
otherwise. A palindromic number reads the same forwards and backwards.

Examples:
palindromic_number?(34543) == true
palindromic_number?(123210) == false
palindromic_number?(22) == true
palindromic_number?(5) == true

*problem*
input: integer
output: boolean
#reverse method does not work on numbers, so converting to a different datatype
will be required. Can use either string or array.

*examples / test cases *
see above

*data structures*
number to array

*algorithm*
START
  declare method that takes one integer as an argument
    convert the integer to a string
    true if string.reverse == string
END
=end

def palindromic_number?(int)
  int_as_string = int.to_s
  int_as_string == int_as_string.reverse
end

p palindromic_number?(34543) == true
p palindromic_number?(123210) == false
p palindromic_number?(22) == true
p palindromic_number?(5) == true

# Further Exploration
# Suppose your number begins with one or more 0s. Will your method still work?
# Why or why not? Is there any way to address this?

=begin
guess - the zeros will be dropped from the number on conversion.
instead of converting to a string, convert to an array?
use a loop to pass each value into an array, then check if the
array == array.reverse
not sure how to access the 0 value



def palindromic_number?(int)
  if int =~ /[^0$]/
    puts 'starts with zero'
  end
  int_as_array = int.digits
  int_as_array == int_as_array.reverse
end

p palindromic_number?(34543) == true
p palindromic_number?(123210) == false
p palindromic_number?(22) == true
p palindromic_number?(5) == true
p palindromic_number?(005) == false

=end
