=begin
*Assignment*
List of Digits
Write a method that takes one argument, a positive integer, and returns a list of the digits in the number.

Examples:
	puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
	puts digit_list(7) == [7]                     # => true
	puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
	puts digit_list(444) == [4, 4, 4]             # => true

*Problem*
	Input: single positive integer (of varying number of digits)
		So input can not be 0 or negative; assume do not need to verify to check for strings, etc.
	Output: list of digits in the number

*Examples / Tests
see above

*Data Structures*
	input: single integer
	output: array

*Algorithm*
method needs to accept one argument (to receive the integer)


convert integer to string
split new string at each digit into an array of single digits. = > but then each digit is represented as a string... loop through array to convert back?
	complicated!

use Integer method #digits => split integers into array by digit.
then reverse them because digits splits them in reverse order.

=end

# digits solution
def digit_list(num)
	arr = num.digits.reverse!
end


# to_s solution
=begin
def digit_list(num)
	num_string = num.to_s.split(//)
	arr = []
	num_string.each { |string|
		arr << string.to_i
	}
	return arr
end

or *course solution*
def digit_list(num)
	num.to_s.chars.map(&:to_i)
	# convert the number to a string, divide it at each character into an array of strings, then map that array into a new array but with each character converted back into an integer
end

or *Course Solution - brute force *

def digit_list(num)
  digits = [] # create empty array that will be returned
  loop do # loop through number
    num, remainder = num.divmod(10) # *I don't really understand this step* I think it means divide number by 10 to get the digit value in each place
    digits.unshift(remainder) # adds remainder after divmod to the front of the digits array
    break if num == 0 # stop loop if number is 0
  end
  digits # return new array
end
=end

puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]             # => true
